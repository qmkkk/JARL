from pathlib import Path
import csv
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
Q=Path(__file__).resolve().parents[1]
rows=list(csv.DictReader((Q/'reports/RESULTS.csv').open()))
fig,axes=plt.subplots(1,4,figsize=(11.8,3.6),layout='constrained')
for ax,n in zip(axes,['mul12','mul13','sqrt12','sqrt16']):
 rr={r['method']:r for r in rows if r['case']==n};vals=[int(rr[m]['LUT'])for m in ['exact_joint','serial','budget_joint']]
 bars=ax.bar(range(3),vals,color=['#326eaa','#b6bbc4','#319878'],width=.65)
 ax.bar_label(bars,padding=4,fontsize=11);ax.set_ylim(0,max(vals)*1.19);ax.set_title(n,weight='bold');ax.set_xticks(range(3),['Exact\njoint','Serial','Budget\njoint'],fontsize=9);ax.spines[['top','right']].set_visible(False);ax.grid(axis='y',alpha=.18);ax.set_axisbelow(True)
axes[0].set_ylabel('Routed physical LUTs (lower is better)')
fig.suptitle('Round 3: fixed cases, common constraints, all registered timing checks pass',fontsize=12)
for suffix in ['png','svg']:fig.savefig(Q/f'reports/ROUND3_LUT_COMPARISON.{suffix}',dpi=180)
print('R3 plot saved')
