"""Fixed public-image workloads and exact per-operator composition tables."""
from model18 import Q,R,load,dump,models,METHODS,base_code,emit_ops,unpack_method,native,scalar
import numpy as np,csv,hashlib,time
from PIL import Image
from skimage.metrics import structural_similarity
def generate_tables(c):
 n=c['name'];mm=models(c);s=base_code(c,mm['seed'][0])[0];old=mm['seed'][-1];nn=max(v[-1]for v in mm.values());s=[x.replace(f'constexpr int NN={old},',f'constexpr int NN={nn},')for x in s]
 for m,(g,ops,co,ins,nets)in mm.items():s += [emit_ops(ops,co,'eval_'+m),unpack_method(g,m)]
 s.append('int main(int argc,char**argv){if(argc!=2)return 9;std::string root=argv[1];U v[NN];uint32_t out[64];')
 for m in METHODS:s.append('{std::ofstream f(root+"/'+n+'_'+m+'.bin",std::ios::binary);if(!f)return 8;for(U x=0;x<(U(1)<<'+str(2*c['width'])+');x+=64){inputs(v,x);eval_'+m+'(v);unpack_'+m+'(v,out);f.write(reinterpret_cast<char*>(out),sizeof(out));}}')
 s.append('return 0;}');src=Q/f'src/{n}_product_tables.cpp';src.write_text('\n'.join(s));out=Q/'results/product_tables';out.mkdir(exist_ok=True)
 from core import linux
 native(src,[linux(out)],Q/f'logs/{n}_product_tables.log');rows=[];tables={};w=c['width'];sz=1<<w;a=np.arange(sz,dtype=np.int64)[None,:];b=np.arange(sz,dtype=np.int64)[:,None];ref=a*b
 for m in METHODS:
  p=out/f'{n}_{m}.bin';v=np.fromfile(p,dtype='<u4');assert len(v)==sz*sz;t=v.reshape(sz,sz);tables[m]=t;e=t.astype(np.int64)-ref;assert np.max(np.abs(e))<=c['budget']
  rng=np.random.default_rng(20261018);indices=[0,1,sz*sz-1,*rng.integers(0,sz*sz,64).tolist()]
  for x in indices:assert int(v[x])==scalar(*mm[m],x&(sz-1),x>>w)
  rows.append(dict(case=n,method=m,width=w,inputs=len(v),WCE=int(np.max(np.abs(e))),MAE=float(np.mean(np.abs(e))),RMSE=float(np.sqrt(np.mean(e.astype(float)**2))),bias=float(np.mean(e)),zero_a_max=int(np.max(np.abs(e[:,0]))),zero_b_max=int(np.max(np.abs(e[0,:]))),scalar_checks=len(indices),sha256=hashlib.sha256(p.read_bytes()).hexdigest(),path=str(p)))
 return tables,rows

def main():
 plan=load(Q/'configs/plan.json');images={x['name']:np.asarray(Image.fromarray(np.load(x['path'])).resize((256,256),Image.Resampling.BILINEAR))for x in plan['images']};rows=[];table_rows=[];out=Q/'results/application';out.mkdir(exist_ok=True);st=time.perf_counter()
 for c in plan['cases']:
  dump(Q/'state/progress.json',dict(phase='APPLICATION_ALL_FIXED_INPUTS',case=c['name']));tables,tt=generate_tables(c);table_rows+=tt;s=c['width']-8;scale=1<<s
  for name,im in images.items():
   alpha=np.broadcast_to(np.arange(256,dtype=np.int64),(256,256));x=im.astype(np.int64);y=images['camera'].astype(np.int64);ref_blend=(x*alpha+y*(255-alpha)+127)//255
   padded=np.pad(x,((1,2),(1,2)),mode='reflect');weights=4*np.outer([1,3,3,1],[1,3,3,1]);ref_filter=sum(int(weights[i,j])*padded[i:i+256,j:j+256]for i in range(4)for j in range(4));ref_filter=(ref_filter+128)//256
   for m,t in tables.items():
    blend=t[alpha*scale,x*scale].astype(np.int64)+t[(255-alpha)*scale,y*scale].astype(np.int64);den=255*scale*scale;blend=(blend+den//2)//den
    filt=sum(t[int(weights[i,j])*scale,padded[i:i+256,j:j+256]*scale].astype(np.int64)for i in range(4)for j in range(4));den=256*scale*scale;filt=(filt+den//2)//den
    for task,pred,ref in [('alpha_blend',blend,ref_blend),('binomial16',filt,ref_filter)]:
     unclipped=pred.copy();pred=np.clip(pred,0,255).astype(np.uint8);ref=ref.astype(np.uint8);e=pred.astype(float)-ref.astype(float);mse=float(np.mean(e*e));png=out/f'{c["name"]}_{name}_{task}_{m}.png';Image.fromarray(pred).save(png)
     rows.append(dict(case=c['name'],width=c['width'],image=name,task=task,method=m,pixels=pred.size,MAE=float(np.mean(np.abs(e))),RMSE=float(np.sqrt(mse)),PSNR_dB=None if mse==0 else float(10*np.log10(255**2/mse)),exact_output=bool(mse==0),SSIM=float(structural_similarity(ref,pred,data_range=255)),max_error=int(np.max(np.abs(e))),bias=float(np.mean(e)),clipped_pixels=int(np.sum(unclipped!=pred)),output=str(png),sha256=hashlib.sha256(png.read_bytes()).hexdigest()))
     rp=out/f'{name}_{task}_reference.png'
     if not rp.exists():Image.fromarray(ref).save(rp)
 dump(Q/'state/product_tables.json',table_rows);dump(Q/'state/application_results.json',dict(status='COMPLETE',rows=rows,wall_s=time.perf_counter()-st,policy='Allfixed3images x2tasks x3widths x6methods; fixed256x256bilinear input preprocessing; no outcomebasedselection. NullPSNR means exactmatch. Software quality and streaminghardware reported separately.'))
 assert len(rows)==108
 with(Q/'reports/APPLICATION_RESULTS.csv').open('w',newline='')as f:w=csv.DictWriter(f,fieldnames=list(rows[0]));w.writeheader();w.writerows(rows)
 print('APPLICATION_COMPLETE',len(rows),flush=True)
if __name__=='__main__':main()
