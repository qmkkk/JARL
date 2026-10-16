from pathlib import Path
import json,numpy as np,matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
R=Path(__file__).resolve().parents[1];Q=R/'round16';a=json.loads((Q/'state/analysis.json').read_text());assert len(a['rows'])==9
assert json.loads((Q/'state/progress.json').read_text())['phase']=='ALL_CORE_EXPERIMENTS_COMPLETE'
names=[s['case']for s in a['cases']];x=np.arange(len(names));methods=['midpoint','numeric_window','state_window'];colors=['#9aa4af','#357cc0','#198d76']
fig,axs=plt.subplots(1,3,figsize=(13.6,4.8),constrained_layout=True)
for mi,m in enumerate(methods):
 rr=[next(r for r in a['rows']if r['case']==n and r['method']==m)for n in names]
 for ai,key in enumerate(['LUT','WCE','MAE']):
  vals=[r[key]/r['budget']if key!='LUT'else r[key]for r in rr];b=axs[ai].bar(x+(mi-1)*.27,vals,.25,color=colors[mi],label=['Bucket midpoint','Static numerical window','State-conditioned window'][mi]);axs[ai].bar_label(b,labels=[str(int(v))if key=='LUT'else f'{v:.2f}'for v in vals],padding=3,fontsize=8)
for ax in axs:
 ax.set_xticks(x,[n.replace('_','\n')for n in names],fontsize=8);ax.spines[['top','right']].set_visible(False);ax.grid(axis='y',alpha=.2);ax.set_axisbelow(True)
axs[0].set_ylim(0,max(r['LUT']for r in a['rows'])*1.32);axs[0].set_ylabel('Routed LUT sites');axs[0].legend(frameon=False,fontsize=7);axs[0].set_title('Fixed source, clock and budget')
axs[1].set_ylabel('Measured worst error / allowed bound');axs[1].axhline(1,color='#555',ls='--',lw=.8);axs[1].set_ylim(0,1.3);axs[1].set_title('Exhaustive mathematical error')
axs[2].set_ylabel('Mean absolute error / allowed bound');axs[2].set_title('Mean error, diagnostic only')
fig.suptitle('Round 16: state-conditioned dual-output function synthesis',fontsize=13)
fig.savefig(Q/'reports/ROUND16_RESULTS.png',dpi=160);fig.savefig(Q/'reports/ROUND16_RESULTS.svg');plt.close(fig)
print('Rendered complete Round16')
