from pathlib import Path
import json,numpy as np,matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
R=Path(__file__).resolve().parents[1];Q=R/'round17';a=json.loads((Q/'state/analysis.json').read_text());assert len(a['rows'])==12
fig,axs=plt.subplots(1,3,figsize=(13.5,4.5),constrained_layout=True);x=np.arange(3);keys=['native_seed','native_state_window','column_seed','column_state_window'];labels=['Native','Native + proposed','Column truncation','Column + proposed'];colors=['#a0a9b3','#557fb6','#d9ad62','#128773']
for mi,key in enumerate(keys):
 for ai,metric in enumerate(['LUT','WCE','MAE']):
  vals=[s[metric][key]for s in a['cases']]
  if metric!='LUT':vals=[v/b for v,b in zip(vals,[256,1024,4096])]
  bars=axs[ai].bar(x+(mi-1.5)*.21,vals,.2,color=colors[mi],label=labels[mi]);axs[ai].bar_label(bars,labels=[str(v)if metric=='LUT'else f'{v:.2f}'for v in vals],fontsize=7,padding=2)
for ax in axs:ax.set_xticks(x,['8x8 + 8','9x9 + 6','10x10 + 4']);ax.spines[['right','top']].set_visible(False);ax.grid(axis='y',alpha=.2);ax.set_axisbelow(True)
axs[0].set_ylabel('Routed LUT sites');axs[0].set_ylim(0,170);axs[0].legend(fontsize=7,frameon=False);axs[0].set_title('All registered clocks pass')
axs[1].set_ylabel('Measured WCE / bound');axs[1].axhline(1,color='gray',ls='--');axs[1].set_ylim(0,1.2)
axs[2].set_ylabel('Mean absolute error / bound');axs[2].set_ylim(0,.8)
fig.suptitle('Round 17: unchanged method on two arithmetic starting points');fig.savefig(Q/'reports/ROUND17_RESULTS.png',dpi=160);fig.savefig(Q/'reports/ROUND17_RESULTS.svg');plt.close(fig)
