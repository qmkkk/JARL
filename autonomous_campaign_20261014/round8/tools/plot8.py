from pathlib import Path
import json,numpy as np,matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
Q=Path(__file__).resolve().parents[1];a=json.loads((Q/'state/analysis.json').read_text());names=[c['case']for c in a['cases']];methods=['seed','local_exact','relation'];colors=['#677889','#e1aa49','#1d968b'];x=np.arange(len(names));fig,axs=plt.subplots(2,1,figsize=(11,7),constrained_layout=True)
for i,m in enumerate(methods):
 vals=[next(r['LUT']for r in a['rows']if r['case']==n and r['method']==m)for n in names];b=axs[0].bar(x+(i-1)*.24,vals,.23,color=colors[i],label=['Strong starting design','Matched local-exact','Context relation'][i]);axs[0].bar_label(b,padding=2,fontsize=8)
 wns=[next(r['WNS_ns']for r in a['rows']if r['case']==n and r['method']==m)for n in names];axs[1].bar(x+(i-1)*.24,wns,.23,color=colors[i])
axs[0].set_ylabel('Routed physical LUTs');axs[0].legend(frameon=False,ncol=3,loc='upper left');axs[0].set_ylim(0,max(r['LUT']for r in a['rows'])*1.24);axs[1].set_ylabel('Worst setup slack (ns)');axs[1].axhline(0,color='#555',lw=.8)
for ax in axs:ax.set_xticks(x,names);ax.spines[['top','right']].set_visible(False);ax.set_axisbelow(True);ax.grid(axis='y',alpha=.2)
fig.suptitle('Round 8: identical output functions, fixed clocks, stronger starting designs',fontsize=13);fig.savefig(Q/'reports/ROUND8_RESULTS.png',dpi=160);fig.savefig(Q/'reports/ROUND8_RESULTS.svg');plt.close(fig)
