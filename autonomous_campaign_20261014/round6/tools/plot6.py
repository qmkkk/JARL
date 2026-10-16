from pathlib import Path
import json
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
Q=Path(__file__).resolve().parents[1]
a=json.loads((Q/'state/analysis.json').read_text());cases=[c['case']for c in a['cases']];methods=['seed','abc_exact','relation'];colors=['#9aa4b2','#507fbd','#bd572d'];labels=['Vivado seed','ABC region','Joint relation'];x=np.arange(len(cases));fig,axs=plt.subplots(1,2,figsize=(12,4.6),layout='constrained')
for j,(m,color,label)in enumerate(zip(methods,colors,labels)):
 rows=[next(r for r in a['rows']if r['case']==c and r['method']==m)for c in cases];xx=x+(j-1)*.25
 bars=axs[0].bar(xx,[r['LUT']for r in rows],.23,label=label,color=color)
 for b,r in zip(bars,rows):
  axs[0].text(b.get_x()+b.get_width()/2,b.get_height()+2,str(r['LUT']),ha='center',fontsize=8)
  if not r['pass_registered_clock']:b.set_hatch('///')
 axs[1].bar(xx,[r['WNS_ns']for r in rows],.23,label=label,color=color)
for ax in axs:
 ax.set_xticks(x,['Exact sqrt16','Div8 OR1','AbsDiff8 OR1','MAC8 OR1']);ax.grid(axis='y',alpha=.18);ax.set_axisbelow(True);ax.spines[['top','right']].set_visible(False)
axs[0].set_ylabel('Routed physical LUTs');axs[0].set_ylim(0,max(r['LUT']for r in a['rows'])*1.16);axs[0].legend(frameon=False,fontsize=9);axs[0].set_title('Resource cost, identical output functions')
axs[1].axhline(0,color='#444444',lw=.8);axs[1].set_ylabel('Worst setup slack (ns)');axs[1].set_title('Registered clocks: 25 / 25 / 10 / 10 ns')
fig.suptitle('Project 3 · Round 6 · Fixed-method generalization',fontsize=14)
fig.savefig(Q/'reports/ROUND6_RESULTS.png',dpi=180);fig.savefig(Q/'reports/ROUND6_RESULTS.svg');plt.close(fig)
