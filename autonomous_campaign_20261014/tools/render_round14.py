from pathlib import Path
import json,numpy as np,matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
R=Path(__file__).resolve().parents[1];Q=R/'round14';a=json.loads((Q/'state/analysis.json').read_text());assert len(a['rows'])==15
assert json.loads((Q/'state/progress.json').read_text())['phase']=='ALL_CORE_EXPERIMENTS_COMPLETE'
names=[s['case']for s in a['cases']];x=np.arange(len(names));methods=['seed','numeric_window','repair_window'];colors=['#9aa4af','#357cc0','#198d76']
fig,axs=plt.subplots(1,2,figsize=(13,4.6),constrained_layout=True)
for mi,m in enumerate(methods):
 rr=[next(r for r in a['rows']if r['case']==n and r['method']==m)for n in names]
 b=axs[0].bar(x+(mi-1)*.27,[r['LUT']for r in rr],.25,color=colors[mi],label=['Strong input','One-shot relation window','Witness-regenerated window'][mi]);axs[0].bar_label(b,padding=3,fontsize=8)
 axs[1].bar(x+(mi-1)*.27,[r['WNS_ns']for r in rr],.25,color=colors[mi])
for ax in axs:
 ax.set_xticks(x,[n.replace('_','\n')for n in names],fontsize=8);ax.spines[['top','right']].set_visible(False);ax.grid(axis='y',alpha=.2);ax.set_axisbelow(True)
axs[0].set_ylim(0,max(r['LUT']for r in a['rows'])*1.3);axs[0].set_ylabel('Routed LUT sites');axs[0].legend(frameon=False,fontsize=8);axs[0].set_title('Fixed strongest observed starting flows')
axs[1].set_ylabel('Worst setup slack (ns)');axs[1].set_title('Same registered clock within each case');axs[1].axhline(0,color='#333',lw=.8)
fig.suptitle('Round 14: bounded counterexample-guided function regeneration',fontsize=13)
fig.savefig(Q/'reports/ROUND14_RESULTS.png',dpi=160);fig.savefig(Q/'reports/ROUND14_RESULTS.svg');plt.close(fig)
print('Rendered complete Round14')
