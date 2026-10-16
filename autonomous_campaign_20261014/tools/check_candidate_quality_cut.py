"""Independent exhaustive development check, not a scientific benchmark."""
from candidate_quality_cut import minimize_orientable, energy_value
from pathlib import Path
import random, itertools, json, hashlib

rng = random.Random(20261015)
tested = unsupported = 0
for trial in range(400):
    n = rng.randrange(1, 9)
    unary = [[rng.randrange(-20, 30) for _ in range(2)] for _ in range(n)]
    factors = [(rng.randrange(n), rng.randrange(n),
                [rng.randrange(-15, 40) for _ in range(4)])
               for _ in range(rng.randrange(0, 2*n+1))]
    result = minimize_orientable(unary, factors)
    if result['status'] == 'NON_ORIENTABLE':
        unsupported += 1
        continue
    independent = min(energy_value(bits, unary, factors)
                      for bits in itertools.product([0, 1], repeat=n))
    assert result['value'] == independent
    assert energy_value(result['bits'], unary, factors) == independent
    tested += 1
assert tested > 150 and unsupported > 0
root = Path(__file__).resolve().parent
out = root/'candidate_quality_cut_development_check.json'
assert not out.exists()
out.write_text(json.dumps(dict(
    status='PASS_DEVELOPMENT_ONLY', exact_optima_checked=tested,
    explicit_non_orientable=unsupported, max_variables=8, random_seed=20261015,
    algorithm_sha256=hashlib.sha256((root/'candidate_quality_cut.py').read_bytes()).hexdigest(),
    scope='Known min-cut implementation versus independent exhaustive enumeration; no circuit gain, new method claim, or selected next round.'
), indent=2))
print(out.read_text())
