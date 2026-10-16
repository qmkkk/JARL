"""Render the complete registered round only; no experiment or selection."""
from pathlib import Path
import json, csv, numpy as np, matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
R=Path(__file__).resolve().parents[1];Q=R/'round12'
a=json.loads((Q/'state/analysis.json').read_text())
assert len(a['rows'])==20
assert json.loads((Q/'state/progress.json').read_text())['phase']=='ALL_CORE_EXPERIMENTS_COMPLETE'
names=[s['source_case'] for s in a['cases']];x=np.arange(len(names));colors=['#788697','#188d85']
fig,axs=plt.subplots(2,2,figsize=(13,8),constrained_layout=True)
for fi,flow in enumerate(['native','area']):
 for mi,m in enumerate(['seed','numeric_window']):
  rows=[next(r for r in a['rows'] if r['source_case']==n and r['flow']==flow and r['method']==m) for n in names]
  b=axs[fi,0].bar(x+(mi-.5)*.34,[r['LUT']for r in rows],.32,color=colors[mi],label=['Input flow','Same numeric-window method'][mi])
  axs[fi,0].bar_label(b,padding=3,fontsize=8)
  axs[fi,1].bar(x+(mi-.5)*.34,[r['WNS_ns']for r in rows],.32,color=colors[mi])
 axs[fi,0].set_title(['Native Vivado starting graph','Area-oriented ABC starting graph'][fi]);axs[fi,0].set_ylabel('Routed LUTs')
 axs[fi,0].set_ylim(0,max(r['LUT'] for r in a['rows']if r['flow']==flow)*1.28)
 axs[fi,1].set_title('Same case clocks; worst setup slack');axs[fi,1].set_ylabel('WNS (ns)');axs[fi,1].axhline(0,color='#555',lw=.8)
 for ax in axs[fi]:
  ax.set_xticks(x,[n.replace('_','\n')for n in names],fontsize=8);ax.spines[['top','right']].set_visible(False);ax.grid(axis='y',alpha=.2);ax.set_axisbelow(True)
axs[0,0].legend(frameon=False,fontsize=9)
fig.suptitle('Round 12: transfer across two fixed mapping starts',fontsize=14)
fig.savefig(Q/'reports/ROUND12_RESULTS.png',dpi=160);fig.savefig(Q/'reports/ROUND12_RESULTS.svg');plt.close(fig)
print('Rendered complete round12; compare LUT and carry resources jointly across flows')
