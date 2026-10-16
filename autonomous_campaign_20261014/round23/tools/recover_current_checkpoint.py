from pathlib import Path
import run23 as r
Q=r.Q
p=r.load(Q/'state/progress.json');e=next(x for x in r.load(Q/'rtl/design_manifest.json')if x['top']==p['top'])
assert p['phase']=='PHYSICAL_AND_ACTIVITY'
d=r.O/(p['part']+'__'+p['top']);assert not(d/'route.complete').exists()
assert r.sha(e['rtl'])==e['rtl_sha256']
assert not(d/'checkpoint_recovery.json').exists()
old_error=Q/'state/execution_error.json'
(Q/'state/execution_error_before_checkpoint_recovery.json').write_bytes(old_error.read_bytes())
receipt=dict(top=p['top'],part=p['part'],source_sha256=e['rtl_sha256'],synth_checkpoint_sha256=r.sha(d/'synth.dcp'),status='ATTEMPTED',reason='Two opt_design Synth20-411 failures after successful synth and DRC; restart standard implementation from saved synthesis checkpoint, same constraints and strategies.')
r.dump(d/'checkpoint_recovery.json',receipt)
log=r.execute([r.V/'vivado.bat','-mode','batch','-nojournal','-nolog','-source',Q/'tools/implement_from_synth.tcl','-tclargs',d.as_posix(),p['top'],p['part']],d,'checkpoint_recovery','R23_ROUTE_COMPLETE')
assert r.sha(d/'synth.dcp')==receipt['synth_checkpoint_sha256']
(d/'route.complete').write_text(e['rtl_sha256'])
receipt.update(status='RECOVERED',log=str(log));r.dump(d/'checkpoint_recovery.json',receipt)
print('CHECKPOINT_RECOVERY_SUCCESS',p['top'],flush=True)
