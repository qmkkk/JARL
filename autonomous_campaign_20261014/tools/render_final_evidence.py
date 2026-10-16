from pathlib import Path
import sys,json,numpy as np,matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
R=Path(__file__).resolve().parents[1];rn=int(sys.argv[1]);assert rn in [18,19];Q=R/f'round{rn}';load=lambda p:json.loads(p.read_text());a=load(Q/'state/analysis.json');assert len(a['rows'])==18 and len(a['integration'])==9
names=[c['name']for c in load(Q/'configs/plan.json')['cases']];methods=['seed','quadol_wce','static_full','state_const5','state_exact','state_window'];labels=['Arithmetic seed','QUADOL-WCE','Static full relation','Constant I5','Exact output','Proposed'];colors=['#aab2bb','#4d78ac','#d3ae67','#a984b3','#cb8d84','#14856e'];x=np.arange(3)
fig,axs=plt.subplots(1,3,figsize=(15,4.7),constrained_layout=True)
for mi,m in enumerate(methods):
 rr=[next(r for r in a['rows']if r['case']==n and r['method']==m)for n in names]
 for ai,key in enumerate(['LUT','WCE','MAE']):
  vals=[r[key]if key=='LUT'else r[key]/r['budget']for r in rr];bars=axs[ai].bar(x+(mi-2.5)*.145,vals,.14,label=labels[mi],color=colors[mi]);axs[ai].bar_label(bars,labels=[str(int(v))if key=='LUT'else f'{v:.2f}'for v in vals],rotation=90 if key!='LUT'else 0,fontsize=6,padding=2)
for ax in axs:ax.set_xticks(x,['8x8 + 8','9x9 + 6','10x10 + 4']);ax.spines[['right','top']].set_visible(False);ax.grid(axis='y',alpha=.2);ax.set_axisbelow(True)
axs[0].set_ylim(0,max(r['LUT']for r in a['rows'])*1.5);axs[0].set_ylabel('Routed LUT sites');axs[0].legend(fontsize=7,ncol=2,frameon=False);axs[1].set_ylim(0,1.35);axs[1].set_ylabel('Worst error / bound');axs[1].axhline(1,color='gray',ls='--',lw=.8);axs[2].set_ylim(0,1);axs[2].set_ylabel('Mean absolute error / bound');fig.suptitle(f'Round {rn}: fixed main model, strong baseline and controlled ablations');fig.savefig(Q/'reports/CORE_EVIDENCE.png',dpi=160);fig.savefig(Q/'reports/CORE_EVIDENCE.svg');plt.close(fig)
fig,axs=plt.subplots(1,3,figsize=(13.5,4.5),constrained_layout=True)
for mi,m in enumerate(['seed','quadol_wce','state_window']):
 rr=[next(r for r in a['integration']if r['case']==n and r['method']==m)for n in names]
 for ai,key in enumerate(['LUT','FF','WNS_ns']):
  vals=[r[key]for r in rr];bars=axs[ai].bar(x+(mi-1)*.27,vals,.25,color=[colors[0],colors[1],colors[5]][mi],label=['Arithmetic seed','QUADOL-WCE','Proposed'][mi]);axs[ai].bar_label(bars,labels=[str(int(v))if key!='WNS_ns'else f'{v:.2f}'for v in vals],fontsize=8,padding=3)
for ax in axs:ax.set_xticks(x,['8-bit','9-bit','10-bit']);ax.spines[['right','top']].set_visible(False);ax.grid(axis='y',alpha=.2);ax.set_axisbelow(True)
axs[0].set_ylabel('Routed LUT including controller/accumulator');axs[0].set_ylim(0,max(r['LUT']for r in a['integration'])*1.35);axs[0].legend(fontsize=8,frameon=False);axs[1].set_ylabel('Flip-flops');axs[1].set_ylim(0,max(r['FF']for r in a['integration'])*1.2);axs[2].set_ylabel('WNS (ns), fixed 15 ns clock');axs[2].axhline(0,color='gray',lw=.8);fig.suptitle(f'Round {rn}: same 16-product streaming work and interface');fig.savefig(Q/'reports/INTEGRATED_EVIDENCE.png',dpi=160);fig.savefig(Q/'reports/INTEGRATED_EVIDENCE.svg');plt.close(fig)
apps=load(Q/'state/application_results.json')['rows'];fig,axs=plt.subplots(1,2,figsize=(11.5,4.5),constrained_layout=True)
for ai,task in enumerate(['alpha_blend','binomial16']):
 for mi,m in enumerate(['seed','quadol_wce','state_window']):
  pts=[]
  for n in names:
   ar=[r for r in apps if r['case']==n and r['method']==m and r['task']==task];mse=np.mean([r['RMSE']**2 for r in ar]);psnr=10*np.log10(255**2/mse)if mse else 99;lut=next(r['LUT']for r in a['integration']if r['case']==n and r['method']==m);pts.append((lut,psnr))
  axs[ai].scatter(*zip(*pts),color=[colors[0],colors[1],colors[5]][mi],label=['Arithmetic seed','QUADOL-WCE','Proposed'][mi],marker=['o','s','^'][mi],s=65)
  for wi,(lx,py)in enumerate(pts):axs[ai].annotate(str(wi+8)+'b',(lx,py),xytext=(4,4),textcoords='offset points',fontsize=8)
 axs[ai].set_title(task.replace('_',' '));axs[ai].set_xlabel('Integrated LUT (16-term core)');axs[ai].set_ylabel('Pooled PSNR on 3 fixed images (dB)');axs[ai].grid(alpha=.2);axs[ai].spines[['top','right']].set_visible(False)
axs[0].legend(fontsize=8,frameon=False);fig.suptitle('Quality/resource tradeoff; software outputs, no end-to-end speed claim');fig.savefig(Q/'reports/APPLICATION_TRADEOFF.png',dpi=160);fig.savefig(Q/'reports/APPLICATION_TRADEOFF.svg');plt.close(fig)
print('Rendered complete evidence',rn)
