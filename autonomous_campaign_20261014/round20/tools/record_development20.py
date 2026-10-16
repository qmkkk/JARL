from common20 import Q,R,dump
from pathlib import Path
import hashlib,datetime

paths=[R/'tools'/name for name in ['candidate_quality_cut.py','candidate_quality_tables.py',
       'check_candidate_quality_cut.py','candidate_quality_cut_development_check.json']]
dump(Q/'inputs/deferred_solver_development.json',dict(
 created=datetime.datetime.now().astimezone().isoformat(),
 status='PREPARATION_ONLY_NOT_R20_METHOD_OR_NEXT_ROUND_SELECTION',
 facts=['Pure-integer standard graph-cut reduction is implemented.',
        '312 small random orientable objectives matched independent exhaustive minima;88 were explicitly unsupported.',
        'No circuit experiment has used this module; no resource or quality benefit has been established.'],
 sources=[dict(url='https://www.cs.cornell.edu/~rdz/Papers/KZ-PAMI04.pdf',
               use='Existing binary submodular-energy characterization and graph-cut reduction, not our novelty.'),
          dict(url='https://github.com/SJTU-ECTL/QUADOL',
               use='Already optimizes quality and pair selection; adding quality as an objective alone is not a contribution.'),
          dict(url='https://github.com/SJTU-ECTL/MECALS',
               use='Maximum-error checking is established prior art; author points to2026 journal extension.'),
          dict(url='https://yosyshq.readthedocs.io/projects/yosys/en/stable/cmd/index_formal.html',
               use='Sequential SAT proof setup must account for warm-up and arbitrary initial states.'),
          dict(url='https://docs.amd.com/r/2021.1-English/ug900-vivado-logic-simulation/Generating-SAIF-Dumping',
               use='Official activity dump flow; library/version-specific behavior must be checked when executed.')],
 files={str(p):hashlib.sha256(p.read_bytes()).hexdigest()for p in paths},
 fixed_round_unchanged=True))
dump(Q/'state/engineering_recovery2.json',dict(
 created=datetime.datetime.now().astimezone().isoformat(),
 observed='Two isolated synthesis jobs exited with only Common17-69 after technology mapping.',
 jobs=['r20_mac6_add4_b1_state_window','r20_dot2_u4_b4_serial_then_quadol'],
 recovery='Same source, command, constraints, part, threads and strategy passed on second invocation.',
 root_cause='Not diagnosed; not a scientific result. No named errors were suppressed.',
 bounded_policy='At most one retry for first-attempt failures containing only the exact generic diagnostic; preserve both logs. Any named/repeated error stops for diagnosis.',
 physical_configuration_changed=False))
print('RECORDED_DEVELOPMENT_AND_RECOVERY')
