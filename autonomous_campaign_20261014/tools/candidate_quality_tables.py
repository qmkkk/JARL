"""Unselected fixed-support LUT half-table cost optimizer.

All entries in costs must be nonnegative integer sums over disjoint reachable
input rows. bounds must be full-domain bounds if a global WCE claim is desired.
This utility alone establishes no circuit improvement and is not used in R20.
"""
from candidate_quality_cut import minimize_orientable


def optimize_half_tables(bounds, costs, budget, mask_a, mask_b, incumbent):
    assert len(bounds) == len(costs) == len(incumbent) == 32
    assert 0 <= mask_a < 32 and 0 <= mask_b < 32
    allowed = [[int(b) <= budget for b in row] for row in bounds]
    costs = [[int(v) for v in row] for row in costs]
    assert all(len(row) == 4 and min(row) >= 0 for row in costs)
    assert all(allowed[r][q] for r, q in enumerate(incumbent))
    groups_a = sorted({r & mask_a for r in range(32)})
    groups_b = sorted({r & mask_b for r in range(32)})
    for mask, shift in [(mask_a, 0), (mask_b, 1)]:
        for group in {r & mask for r in range(32)}:
            assert len({(incumbent[r] >> shift) & 1 for r in range(32)
                        if r & mask == group}) == 1, 'INCUMBENT_SUPPORT_MISMATCH'
    index_a = {r: i for i, r in enumerate(groups_a)}
    index_b = {r: i+len(groups_a) for i, r in enumerate(groups_b)}
    # Every feasible assignment costs at most M-1. One forbidden choice costs M.
    penalty = 1 + sum(max(row) for row in costs)
    factors = [(index_a[r & mask_a], index_b[r & mask_b],
                [costs[r][q] if allowed[r][q] else penalty for q in range(4)])
               for r in range(32)]
    result = minimize_orientable([[0, 0] for _ in range(len(groups_a)+len(groups_b))], factors)
    old_cost = sum(costs[r][q] for r, q in enumerate(incumbent))
    result.update(incumbent_cost=old_cost, hard_penalty=penalty,
                  mask_a=mask_a, mask_b=mask_b)
    if result['status'] != 'OPTIMAL_FIXED_ENERGY':
        return result
    bits = result['bits']
    q = [bits[index_a[r & mask_a]] + 2*bits[index_b[r & mask_b]] for r in range(32)]
    assert all(allowed[r][x] for r, x in enumerate(q)), 'INCUMBENT_FEASIBILITY_OR_PENALTY_ERROR'
    cost = sum(costs[r][x] for r, x in enumerate(q))
    assert cost == result['value'] and cost <= old_cost
    result.update(q=q, cost=cost, improved=cost < old_cost,
                  initA=f'{sum((x & 1) << r for r, x in enumerate(q)):08x}',
                  initB=f'{sum((x >> 1) << r for r, x in enumerate(q)):08x}')
    return result
