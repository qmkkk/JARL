"""Exhaustive fixed-topology LUT6_2 configuration preflight.
Local-HD surrogate, strong fixed-cofactor oracle and exact contextual minimax
use the SAME hardware topology menu and the SAME full-input error signatures.
This is not an execution/reproduction of the complete QUADOL author tool.
"""
import itertools,json,csv,pathlib,sys,numpy as np
from fractions import Fraction
# Group size <=4: all positive scalar weight regimes for two-output local HD.
BREAKS=sorted(set(Fraction(a,b) for a in range(1,5) for b in range(1,5)))
WEIGHTS=sorted(set(BREAKS+[BREAKS[0]/2,BREAKS[-1]*2]+[(a+b)/2 for a,b in zip(BREAKS,BREAKS[1:])]))

def truth(init,ins,support,rows):
    ix=np.zeros(len(rows),dtype=np.int64)
    for b,n in enumerate(ins):ix|=((rows>>support.index(n))&1)<<b
    return ((np.uint64(init)>>ix.astype(np.uint64))&1).astype(np.int64)

def solve(pair,filename):
    support=pair['support'];k=len(support);S=1<<k;rows=np.arange(S,dtype=np.int64)
    f=truth(pair['a_init'],pair['a_ins'],support,rows);g=truth(pair['b_init'],pair['b_ins'],support,rows)
    lo=np.zeros((S,4),dtype=np.int64);hi=lo.copy();count=np.zeros(S,dtype=np.int64)
    with open(filename) as fp:
        for d in csv.DictReader(fp):
            r,q=int(d['row']),int(d['q']);lo[r,q]=int(d['error_lo']);hi[r,q]=int(d['error_hi']);count[r]=int(d['count'])
    cost=np.maximum(np.abs(lo),np.abs(hi));cost[count==0]=0
    # Explicit integer conversion prevents numpy boolean addition semantics.
    hd=np.stack([((q&1)!=f).astype(int)+(((q>>1)&1)!=g).astype(int) for q in range(4)],axis=1)
    shared=sorted(set(pair['a_ins'])&set(pair['b_ins']))
    best={key:None for key in ['strict_hd','hd_global','weighted_hd','cofactor','minimax']}
    meta={};bestvec={}
    def update(key,wce,hds,values,desc):
        score=(hds,wce) if key=='strict_hd' else (wce,hds)
        if best[key] is None or score<best[key]:
            best[key]=score;meta[key]=dict(desc,wce=int(wce),local_hd=int(hds));bestvec[key]=values.copy()
    for sh in itertools.combinations(shared,5):
        sh=list(sh);idx=np.zeros(S,dtype=np.int64)
        for b,n in enumerate(sh):idx|=((rows>>support.index(n))&1)<<b
        groups=[np.flatnonzero(idx==r) for r in range(32)]
        # Whole-cofactor sources, not arbitrary row-wise functions.
        cfs=[];unique=[]
        for which,ins,init in [('f',pair['a_ins'],pair['a_init']),('g',pair['b_ins'],pair['b_init'])]:
            rest=sorted(set(ins)-set(sh));assert len(rest)<=1
            for val in ([0,1] if rest else [0]):
                full=np.zeros(32,dtype=np.int64)
                for b,n in enumerate(sh):full|=((np.arange(32)>>b)&1)<<support.index(n)
                if rest:full|=val<<support.index(rest[0])
                cf=truth(init,ins,support,full)
                if cf.tolist() not in unique:cfs.append((which+str(val),cf));unique.append(cf.tolist())
        # No free pin/output inversions are assumed; those may cost extra logic
        # when carry-chain or FF sinks cannot absorb polarity changes.
        for sel in [None]+sorted(set(support)-set(sh)):
            sbit=np.ones(S,dtype=np.int64) if sel is None else ((rows>>support.index(sel))&1)
            for mode in ['f6','g6','clone6']:
                qtab=[]
                for ab in range(4):
                    A=ab&1;B=(ab>>1)&1;O6=np.where(sbit,A,B);O5=np.full(S,B)
                    q=(O6+2*O5) if mode=='f6' else ((O5+2*O6) if mode=='g6' else 3*O6)
                    qtab.append(q)
                qtab=np.stack(qtab,axis=1)
                rowcost=np.zeros((32,4),dtype=np.int64);rowhd=rowcost.copy()
                for r,sg in enumerate(groups):
                    for ab in range(4):
                        q=qtab[sg,ab];rowcost[r,ab]=cost[sg,q].max();rowhd[r,ab]=hd[sg,q].sum()
                hdchoices=np.array([min(range(4),key=lambda a:(rowhd[r,a],rowcost[r,a],a)) for r in range(32)])
                mmchoices=np.array([min(range(4),key=lambda a:(rowcost[r,a],rowhd[r,a],a)) for r in range(32)])
                desc=dict(shared=sh,select=sel,mode=mode)
                for key,choices in [('strict_hd',hdchoices),('hd_global',hdchoices),('minimax',mmchoices)]:
                    vec=qtab[np.arange(S),choices[idx]]
                    w=cost[rows,vec].max();h=hd[rows,vec].sum()
                    initA=sum(int(choices[r]&1)<<r for r in range(32));initB=sum(int((choices[r]>>1)&1)<<r for r in range(32))
                    update(key,w,h,vec,dict(desc,initA=f'{initA:08x}',initB=f'{initB:08x}'))
                # Strong scalar-output-weighted local HD, oracle tie breaking and
                # oracle selection of weights/topology. Not the author QUADOL flow.
                rowA=np.zeros((32,4),dtype=np.int64);rowB=rowA.copy()
                for r,sg in enumerate(groups):
                    for ab in range(4):
                        q=qtab[sg,ab]
                        rowA[r,ab]=((q&1)!=f[sg]).sum()
                        rowB[r,ab]=((q>>1)!=g[sg]).sum()
                for ratio in WEIGHTS:
                    score=rowA*ratio.numerator+rowB*ratio.denominator
                    choices=np.where(score==score.min(axis=1)[:,None],rowcost,np.int64(1)<<60).argmin(axis=1)
                    vec=qtab[rows,choices[idx]]
                    ia=sum(int(choices[r]&1)<<r for r in range(32));ib=sum(int((choices[r]>>1)&1)<<r for r in range(32))
                    update('weighted_hd',cost[rows,vec].max(),hd[rows,vec].sum(),vec,dict(desc,weight_ratio=str(ratio),initA=f'{ia:08x}',initB=f'{ib:08x}'))
                for (na,ca),(nb,cb) in itertools.product(cfs,repeat=2):
                    choices=ca+2*cb;vec=qtab[rows,choices[idx]]
                    update('cofactor',cost[rows,vec].max(),hd[rows,vec].sum(),vec,dict(desc,A_source=na,B_source=nb,initA=f'{sum(int(ca[r])<<r for r in range(32)):08x}',initB=f'{sum(int(cb[r])<<r for r in range(32)):08x}'))
    assert meta['minimax']['wce']<=min(meta[x]['wce'] for x in ['strict_hd','hd_global','cofactor'])
    return dict(a=pair['a'],b=pair['b'],reachable_contexts=int((count>0).sum()),local_contexts=S,effective_input_pairs=int(count.sum()),methods=meta,selected_functions={k:list(map(int,v)) for k,v in bestvec.items()})

if __name__=='__main__':
    root=pathlib.Path(sys.argv[1]);records=[]
    for t in [6,5,4]:
        pairs=json.loads((root/f'code/trunc{t}_scan.cpp.pairs.json').read_text())
        for pi,pair in enumerate(pairs):
            f=root/f'results/t{t}_pair{pi}.csv'
            if not f.exists():continue
            rec=solve(pair,f);rec.update(t=t,pair=pi);records.append(rec)
        part=[r for r in records if r['t']==t]
        print('t',t,'n',len(part),'mm_better_cofactor',sum(r['methods']['minimax']['wce']<r['methods']['cofactor']['wce'] for r in part),'mm_better_hd',sum(r['methods']['minimax']['wce']<r['methods']['hd_global']['wce'] for r in part),flush=True)
    (root/'results/table_optimization.json').write_text(json.dumps(records,indent=2))
    fields=['t','pair','a','b','reachable_contexts','local_contexts','effective_input_pairs']+[k+'_WCE' for k in ['strict_hd','hd_global','weighted_hd','cofactor','minimax']]
    with (root/'results/table_summary.csv').open('w') as f:
        w=csv.DictWriter(f,fields);w.writeheader()
        for r in records:w.writerow({**{k:r[k] for k in fields if k in r},**{k+'_WCE':r['methods'][k]['wce'] for k in ['strict_hd','hd_global','weighted_hd','cofactor','minimax']}})
