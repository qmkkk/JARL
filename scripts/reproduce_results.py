"""Read-only, standard-library verification of the released evidence; no new experiments."""
from pathlib import Path
import argparse,array,csv,hashlib,json,math,sys
ROOT=Path(__file__).resolve().parents[1]

def load(p):return json.loads(p.read_text(encoding='utf-8-sig'))
def sha(p):
    h=hashlib.sha256()
    with p.open('rb') as f:
        for b in iter(lambda:f.read(2**20),b''):h.update(b)
    return h.hexdigest()
def signedhex(p,bits):
    return [n-(1<<bits) if n>=(1<<(bits-1)) else n for n in (int(s,16) for s in p.read_text().split())]
def verify():
    m=load(ROOT/'MANIFEST.json')
    for x in m['files']:
        p=ROOT/x['path'];assert p.stat().st_size==x['bytes'] and sha(p)==x['sha256'],x['path']
    return dict(status='PASS',payload_files=len(m['files']))
def review():
    q=ROOT;quality=load(q/'results/fir/system_quality.json');phys=load(q/'results/fir/physical_results.json')
    assert len(quality)==72 and len(phys)==24
    checked=0
    for e in load(q/'rtl/fir/design_manifest.json'):
        w=e['width'];n=1<<w;top=e['top']
        coeff=signedhex(q/f'benchmarks/fir/w{w}_coeff.hex',w);samples=signedhex(q/f'benchmarks/fir/w{w}_samples.hex',w)
        gold=signedhex(q/f'benchmarks/fir/{top}_gold.hex',40)
        tab=array.array('I');tab.frombytes((q/f'results/fir/{top}_unsigned.u32').read_bytes())
        if sys.byteorder!='little':tab.byteswap()
        assert len(tab)==n*n and len(coeff)==96 and len(samples)==len(gold)==6144
        for block in range(6):
            c=coeff[block*16:(block+1)*16];s=samples[block*1024:(block+1)*1024]
            ref=[];yy=[]
            for i in range(1024):
                exact=approx=0
                for t,b in enumerate(c):
                    a=s[i-t] if i>=t else 0
                    exact+=a*b
                    approx+=(-1 if (a<0) != (b<0) else 1)*tab[abs(b)*n+abs(a)]
                ref.append(exact);yy.append(approx)
            assert yy==gold[block*1024:(block+1)*1024],(top,block,'golden mismatch')
            err=[a-b for a,b in zip(yy,ref)];sse=sum(x*x for x in err);energy=sum(x*x for x in ref)
            row=next(r for r in quality if (r['width'],r['method'],r['block'])==(w,e['method'],block))
            assert sse==row['SSE'] and energy==row['reference_energy']
            assert max(map(abs,err))==row['max_error']
            for key,value in [('RMSE',math.sqrt(sse/1024)),('MAE',sum(map(abs,err))/1024),('bias',sum(err)/1024)]:
                assert math.isclose(row[key],value,rel_tol=1e-12,abs_tol=1e-12),(top,block,key)
            checked+=1024
    aggregate=list(csv.DictReader((q/'results/fir/quality_aggregate.csv').open(encoding='utf-8-sig')))
    for a in aggregate:
        rr=[r for r in quality if r['width']==int(a['width']) and r['method']==a['method']]
        assert sum(r['SSE'] for r in rr)==int(a['SSE'])
        assert math.isclose(math.sqrt(sum(r['SSE'] for r in rr)/sum(r['samples'] for r in rr)),float(a['RMSE']),rel_tol=1e-12)
    pairs=[]
    for r in phys:
        assert r['timing_pass']
        if r['method']=='quality_window':
            bases=[b for b in phys if b['part']==r['part'] and b['width']==r['width'] and b['method'] in ['quadol_wce','serial_then_quadol']]
            best=min(b['route_LUT'] for b in bases);assert r['route_LUT']<best
            pairs.append(dict(part=r['part'],width=r['width'],baseline_LUT=best,main_LUT=r['route_LUT']))
    return dict(status='PASS',quality_rows=len(quality),recomputed_golden_outputs=checked,physical_records=len(phys),all_timing_pass=True,resource_pairs=pairs,note='Reanalysis of saved tables and inputs; not a new HDL/PPA run or independent proof of the tables themselves.')
if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('command',choices=['verify','review','all']);args=ap.parse_args();out={}
    if args.command in ['verify','all']:out['integrity']=verify()
    if args.command in ['review','all']:out['analysis']=review()
    print(json.dumps(out,ensure_ascii=False,indent=2))
