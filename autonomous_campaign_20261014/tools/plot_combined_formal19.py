from pathlib import Path
import json,numpy as np,matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
R=Path(__file__).resolve().parents[1];Q=R/'round19';a=json.loads((Q/'state/final_tables.json').read_text(encoding='utf-8'))
assert a['status']=='COMPLETE_COLLECTED'
names=[r['case']for r in a['gains']];methods=['seed','quadol_wce','serial_then_quadol','state_window'];labels=['Arithmetic seed','Author QUADOL-WCE','Single-output then QUADOL','Proposed joint generation'];colors=['#abb2b9','#49749d','#d28b38','#138571'];x=np.arange(3)
plt.rcParams.update({'font.size':10,'axes.titlesize':12,'axes.labelsize':10})
fig,axs=plt.subplots(2,2,figsize=(13,9),constrained_layout=True)
for mi,m in enumerate(methods):
 core=[next(r for r in a['core']if r['case']==n and r['method']==m)for n in names];integ=[next(r for r in a['integration']if r['case']==n and r['method']==m)for n in names]
 for ax,rs,key in [(axs[0,0],core,'LUT'),(axs[0,1],integ,'LUT')]:
  values=[r[key]for r in rs];bars=ax.bar(x+(mi-1.5)*.20,values,.19,color=colors[mi],label=labels[mi]);ax.bar_label(bars,padding=3,fontsize=9)
 for ax,task in [(axs[1,0],'alpha_blend'),(axs[1,1],'binomial16')]:
  vals=[next(r['pooled_PSNR_dB']for r in a['quality']if r['case']==n and r['method']==m and r['task']==task)for n in names]
  ax.plot(x,vals,marker=['o','s','D','^'][mi],ms=6,color=colors[mi],label=labels[mi],lw=1.4)
for ax in axs.flat:
 ax.set_xticks(x,['8-bit','9-bit','10-bit']);ax.spines[['top','right']].set_visible(False);ax.grid(axis='y',alpha=.2);ax.set_axisbelow(True)
axs[0,0].set_title('Core: post-route LUT sites');axs[0,0].set_ylabel('LUT');axs[0,0].set_ylim(0,max(r['LUT']for r in a['core'])*1.3)
axs[0,1].set_title('16-term streaming kernel including control');axs[0,1].set_ylabel('LUT');axs[0,1].set_ylim(0,max(r['LUT']for r in a['integration'])*1.25)
axs[1,0].set_title('Image alpha blending');axs[1,1].set_title('16-tap binomial filtering')
for ax in axs[1]:ax.set_ylabel('PSNR pooled across 3 images (dB)')
handles,ls=axs[0,0].get_legend_handles_labels();fig.legend(handles,ls,loc='outside lower center',ncol=2,frameon=False)
fig.suptitle('Final frozen-model evidence — all registered baselines retained',fontsize=14)
fig.savefig(Q/'reports/FINAL_COMBINED_EVIDENCE.png',dpi=180);fig.savefig(Q/'reports/FINAL_COMBINED_EVIDENCE.svg');plt.close(fig)
print('FINAL_COMBINED_EVIDENCE rendered')
