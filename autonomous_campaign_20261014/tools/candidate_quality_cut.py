"""Unselected quality-completion utility; not used by frozen R20.

Standard binary submodular-energy minimization after consistent polarity flips.
This implements the known graph-cut reduction, NOT a new min-cut algorithm.
Exactness is restricted to the supplied fixed-variable/fixed-factor problem.
Non-orientable energies return an explicit unsupported result.
"""
from collections import deque


class Dinic:
    def __init__(self, n):
        self.g = [[] for _ in range(n)]

    def edge(self, a, b, cap):
        assert isinstance(cap, int) and cap >= 0
        forward = [b, cap, len(self.g[b])]
        reverse = [a, 0, len(self.g[a])]
        self.g[a].append(forward)
        self.g[b].append(reverse)

    def solve(self, source, sink):
        total = 0
        while True:
            level = [-1] * len(self.g)
            level[source] = 0
            queue = deque([source])
            while queue:
                a = queue.popleft()
                for b, cap, _ in self.g[a]:
                    if cap and level[b] < 0:
                        level[b] = level[a] + 1
                        queue.append(b)
            if level[sink] < 0:
                return total, {i for i, distance in enumerate(level) if distance >= 0}
            cursor = [0] * len(self.g)

            def augment(a, amount):
                if a == sink:
                    return amount
                while cursor[a] < len(self.g[a]):
                    e = self.g[a][cursor[a]]
                    b, cap, rev = e
                    if cap and level[b] == level[a] + 1:
                        pushed = augment(b, min(amount, cap))
                        if pushed:
                            e[1] -= pushed
                            self.g[b][rev][1] += pushed
                            return pushed
                    cursor[a] += 1
                return 0

            upper = sum(e[1] for e in self.g[source])
            while upper:
                sent = augment(source, upper)
                if not sent:
                    break
                total += sent
                upper -= sent


def energy_value(bits, unary, factors):
    return sum(int(u[x]) for u, x in zip(unary, bits)) + sum(
        int(e[bits[a] + 2 * bits[b]]) for a, b, e in factors
    )


def minimize_orientable(unary, factors):
    """Factors use q=x_a+2*x_b. Costs are arbitrary Python integers.

    Aggregate repeated factors before testing orientation. Hard constraints must
    be encoded by the caller with a proven sufficiently large finite penalty;
    the caller must independently check every returned hard constraint.
    """
    n = len(unary)
    unary = [[int(v) for v in u] for u in unary]
    factors = [(a, b, [int(v) for v in e]) for a, b, e in factors]
    aggregate = {}
    for a, b, e in factors:
        assert 0 <= a < n and 0 <= b < n and len(e) == 4
        if a == b:
            unary[a][0] += e[0]
            unary[a][1] += e[3]
            continue
        if a > b:
            a, b, e = b, a, [e[0], e[2], e[1], e[3]]
        target = aggregate.setdefault((a, b), [0, 0, 0, 0])
        for i in range(4):
            target[i] += e[i]
    edges = [[] for _ in range(n)]
    for (a, b), e in aggregate.items():
        curvature = e[1] + e[2] - e[0] - e[3]
        if curvature:
            parity = int(curvature < 0)
            edges[a].append((b, parity))
            edges[b].append((a, parity))
    flip = [None] * n
    for root in range(n):
        if flip[root] is not None:
            continue
        flip[root] = 0
        queue = deque([root])
        while queue:
            a = queue.popleft()
            for b, parity in edges[a]:
                expected = flip[a] ^ parity
                if flip[b] is None:
                    flip[b] = expected
                    queue.append(b)
                elif flip[b] != expected:
                    return dict(status='NON_ORIENTABLE', conflicting_edge=[a, b])
    work = [[2*u[flip[i]], 2*u[flip[i] ^ 1]] for i, u in enumerate(unary)]
    graph = Dinic(n + 2)
    source, sink, constant = n, n + 1, 0
    for (a, b), original in aggregate.items():
        e = [original[((q & 1) ^ flip[a]) + 2*((q >> 1) ^ flip[b])]
             for q in range(4)]
        weight = e[1] + e[2] - e[0] - e[3]
        assert weight >= 0
        constant += 2 * e[0]
        work[a][1] += 2*(e[1] - e[0]) - weight
        work[b][1] += 2*(e[2] - e[0]) - weight
        graph.edge(a, b, weight)
        graph.edge(b, a, weight)
    for i, costs in enumerate(work):
        offset = min(costs)
        constant += offset
        graph.edge(source, i, costs[1] - offset)
        graph.edge(i, sink, costs[0] - offset)
    flow, reachable = graph.solve(source, sink)
    bits = [int(i not in reachable) ^ flip[i] for i in range(n)]
    value = sum(unary[i][bits[i]] for i in range(n)) + sum(
        e[bits[a] + 2*bits[b]] for (a, b), e in aggregate.items())
    assert constant + flow == 2*value
    return dict(status='OPTIMAL_FIXED_ENERGY', bits=bits, value=value,
                flips=flip, mincut_twice_energy=constant + flow,
                pair_factors=len(aggregate), variables=n)
