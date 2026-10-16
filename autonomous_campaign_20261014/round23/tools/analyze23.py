from pathlib import Path
import json,csv,math,hashlib,collections
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
Q=Path(__file__).resolve().parents[1]
def load(p):return json.loads(p.read_text(encoding='utf-8'))
def dump(p,x):p.write_text(json.dumps(x,indent=2,ensure_ascii=False),encoding='utf-8')
def csvout(p,rows):
 with p.open('w',newline='',encoding='utf-8-sig')as f:
  wr=csv.DictWriter(f,fieldnames=list(rows[0]));wr.writeheader();wr.writerows(rows)
def main():
 done=load(Q/'state/execution_complete.json');assert done['physical_endpoints']==24
 phys=load(Q/'results/physical_results.json');quality=load(Q/'results/system_quality.json');manifest=load(Q/'rtl/design_manifest.json');plan=load(Q/'configs/plan.json')
 assert len(phys)==24 and len(quality)==72 and len(manifest)==12
 for e in manifest:
  for k in ['rtl','tb','gold','source']:assert hashlib.sha256(Path(e[k]).read_bytes()).hexdigest()==e[k+'_sha256']
 methods=plan['methods'];aggregate=[];perfilter=[]
 for w in [8,9,10]:
  for m in methods:
   for f in [None,*plan['system']['filters']]:
    rr=[r for r in quality if r['width']==w and r['method']==m and(f is None or r['filter']==f)];samples=sum(r['samples']for r in rr);sse=sum(r['SSE']for r in rr);energy=sum(r['reference_energy']for r in rr)
    row=dict(width=w,method=m,filter=f or 'ALL_FIXED_WORKLOADS',samples=samples,RMSE=math.sqrt(sse/samples),SNR_dB=10*math.log10(energy/sse)if sse else None,MAE=sum(r['MAE']*r['samples']for r in rr)/samples,bias=sum(r['bias']*r['samples']for r in rr)/samples,max_error=max(r['max_error']for r in rr),SSE=sse,reference_energy=energy)
    (aggregate if f is None else perfilter).append(row)
 csvout(Q/'results/system_quality.csv',quality);csvout(Q/'results/quality_aggregate.csv',aggregate);csvout(Q/'results/quality_per_filter.csv',perfilter)
 augmented=[]
 for r in phys:
  p=Path(r['power_report']);text=p.read_text();mt=__import__('re').search(r'Design Nets Matched\s*\|\s*(\d+)%\s*\((\d+)/(\d+)\)',text);assert mt,str(p)
  row=dict(r,SAIF_matched=int(mt[2]),SAIF_design_nets=int(mt[3]),SAIF_match_percent=100*int(mt[2])/int(mt[3]),throughput_Msamples_s=1000/(r['clock_ns']*r['II']),latency_ns=r['clock_ns']*r['latency'])
  augmented.append(row)
 dump(Q/'results/physical_results_annotated.json',augmented)
 flat=[{k:v for k,v in r.items()if not isinstance(v,(dict,list))}for r in augmented];csvout(Q/'results/physical_results.csv',flat)
 pairs=[];front=[]
 for r in augmented:
  if r['method']!='quality_window':continue
  for baseline in plan['baselines']:
   b=next(v for v in augmented if(v['part'],v['width'],v['method'])==(r['part'],r['width'],baseline))
   pairs.append(dict(part=r['part'],width=r['width'],baseline=baseline,baseline_LUT=b['route_LUT'],main_LUT=r['route_LUT'],LUT_gain_percent=100*(b['route_LUT']-r['route_LUT'])/b['route_LUT'],baseline_FF=b['route_FF'],main_FF=r['route_FF'],baseline_carry=b['route_CARRY4'],main_carry=r['route_CARRY4'],both_timing_pass=b['timing_pass']and r['timing_pass'],baseline_dynamic_W=b['dynamic_W'],main_dynamic_W=r['dynamic_W']))
  for q in [v for v in quality if(v['width'],v['method'])==(r['width'],'quality_window')]:
   dom=[]
   for baseline in plan['baselines']:
    b=next(v for v in augmented if(v['part'],v['width'],v['method'])==(r['part'],r['width'],baseline));bq=next(v for v in quality if(v['width'],v['method'],v['block'])==(r['width'],baseline,q['block']))
    if b['timing_pass']and b['route_LUT']<=r['route_LUT']and bq['SSE']<=q['SSE']and(b['route_LUT']<r['route_LUT']or bq['SSE']<q['SSE']):dom.append(baseline)
   front.append(dict(part=r['part'],width=r['width'],block=q['block'],filter=q['filter'],signal=q['signal'],timing_pass=r['timing_pass'],dominated_by=';'.join(dom),RMSE=q['RMSE'],LUT=r['route_LUT']))
 csvout(Q/'results/baseline_comparison.csv',pairs);csvout(Q/'results/resource_quality_front.csv',front)
 quality_pairs=[]
 for q in [v for v in quality if v['method']=='quality_window']:
  for baseline in ['quadol_wce','serial_then_quadol','state_window']:
   b=next(v for v in quality if(v['width'],v['method'],v['block'])==(q['width'],baseline,q['block']))
   quality_pairs.append(dict(width=q['width'],block=q['block'],filter=q['filter'],signal=q['signal'],baseline=baseline,baseline_RMSE=b['RMSE'],main_RMSE=q['RMSE'],RMSE_reduction_percent=100*(b['RMSE']-q['RMSE'])/b['RMSE']if b['RMSE']else None,baseline_SNR_dB=b['SNR_dB'],main_SNR_dB=q['SNR_dB'],SNR_gain_dB=q['SNR_dB']-b['SNR_dB']if q['SNR_dB']is not None and b['SNR_dB']is not None else None,main_quality_win=q['SSE']<b['SSE']))
 csvout(Q/'results/workload_quality_comparison.csv',quality_pairs)
 # Descriptive analysis of already saved tables and inputs; no candidate changes.
 zero=[]
 for e in manifest:
  w=e['width'];top=e['top'];tab=np.fromfile(Q/f'results/{top}_unsigned.u32',dtype='<u4').reshape(1<<w,1<<w).astype(np.int64)
  def signedhex(path,bits):
   a=np.asarray([int(s,16)for s in path.read_text().split()],dtype=np.int64);return np.where(a>=(1<<(bits-1)),a-(1<<bits),a)
  cc=signedhex(Q/f'inputs/w{w}_coeff.hex',w).reshape(6,16);ss=signedhex(Q/f'inputs/w{w}_samples.hex',w).reshape(6,1024)
  for block,(c,s)in enumerate(zip(cc,ss)):
   z=np.zeros(1024,dtype=np.int64)
   for t in range(16):
    a=np.r_[np.zeros(t,dtype=np.int64),s[:1024-t]];sg=np.where((a<0)^(c[t]<0),-1,1);mask=(a==0)|(c[t]==0);z+=np.where(mask,sg*tab[abs(c[t]),np.abs(a)],0)
   zero.append(dict(width=w,method=e['method'],block=block,zero_coeff_taps=int((c==0).sum()),zero_product_contribution_bias=float(z.mean()),zero_product_contribution_RMSE=float(np.sqrt(np.mean(z.astype(float)**2))),zero_product_contribution_max=int(np.abs(z).max()),note='Descriptive component; its SSE is not additive because cross terms exist.'))
 csvout(Q/'results/zero_operand_error_component.csv',zero)
 summary=dict(status='FULL_MATRIX_ANALYZED',rtl_checks=done['rtl_checks'],routed_checks=done['routed_checks'],physical_endpoints=24,timing_pass=sum(r['timing_pass']for r in augmented),saif_match_range=[min(r['SAIF_match_percent']for r in augmented),max(r['SAIF_match_percent']for r in augmented)],main_LUT_pairs=pairs,quality_aggregate=aggregate,quality_per_filter=perfilter,main_resource_quality_points=len(front),main_dominated_points=sum(bool(r['dominated_by'])for r in front),power_resolution_W=.001,power_kind='functional SAIF estimate, unmatched nodes propagated',source_integrity='PASS')
 dump(Q/'results/analysis_summary.json',summary)
 colors=['#7a8491','#d8872c','#8c6bb1','#087e8b'];labels=['QUADOL-WCE','Serial + QUADOL','State ablation','Quality completion']
 fig,axes=plt.subplots(1,2,figsize=(11,4.2),layout='constrained')
 for ax,part in zip(axes,plan['devices']):
  for i,m in enumerate(methods):ax.bar(np.arange(3)+(i-1.5)*.19,[next(r['route_LUT']for r in augmented if(r['part'],r['width'],r['method'])==(part,w,m))for w in [8,9,10]],width=.18,color=colors[i],label=labels[i])
  ax.set(xticks=range(3),xticklabels=['8 bit','9 bit','10 bit'],ylabel='Routed Slice LUTs',title=part);ax.grid(axis='y',alpha=.2);ax.set_axisbelow(True)
 fig.legend(*axes[0].get_legend_handles_labels(),loc='outside lower center',ncol=4,fontsize=8);fig.suptitle('Complete programmable 16-tap FIR | same 15 ns clock, II=20');fig.savefig(Q/'reports/fir_resources.png',dpi=200);plt.close(fig)
 fig,axes=plt.subplots(1,3,figsize=(12,3.8),layout='constrained')
 for ax,w in zip(axes,[8,9,10]):
  for i,m in enumerate(methods):ax.plot(range(6),[next(r['SNR_dB']for r in quality if(r['width'],r['method'],r['block'])==(w,m,b))for b in range(6)],marker='o',color=colors[i],label=labels[i])
  ax.set(title=f'{w}-bit signed FIR',xticks=range(6),xticklabels=['LP-M','LP-C','LP-N','BP-M','BP-C','BP-N'],ylabel='SNR versus exact quantized FIR (dB)');ax.tick_params(axis='x',labelsize=8);ax.grid(alpha=.2)
 axes[0].legend(fontsize=7);fig.savefig(Q/'reports/fir_quality.png',dpi=200);plt.close(fig)
 print(json.dumps(summary,ensure_ascii=False,indent=2))
if __name__=='__main__':main()
