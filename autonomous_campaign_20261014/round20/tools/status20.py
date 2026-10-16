from pathlib import Path
import json
Q=Path(__file__).resolve().parents[1]
def load(p):return json.loads(p.read_text(encoding='utf-8'))
s=load(Q/'state/round_status.json');out={k:s[k]for k in ['status','phase','complete_cells','planned_cells']if k in s}
if(Q/'rtl/design_manifest.json').exists():
 ee=load(Q/'rtl/design_manifest.json');out.update(endpoints=len(ee),unique_synth_planned=sum(e['duplicate_of']is None for e in ee),unique_synth_done=len(list((Q/'results/hardware').glob('*/synth.done'))),unique_route_planned=len({e['duplicate_of']or e['top']for e in ee if e['route_registered']}))
if(Q/'state/rtl_validation.json').exists():out['HDL_families_pass']=len(load(Q/'state/rtl_validation.json'))
if(Q/'results/hardware/route_unique.json').exists():out['unique_route_done']=len(load(Q/'results/hardware/route_unique.json'))
print(json.dumps(out,ensure_ascii=False,indent=2))
