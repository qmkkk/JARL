from pathlib import Path
R=Path(__file__).resolve().parents[1];Q=R/'round6';s=(R/'round2/tools/map_seeds.py').read_text();s=s.replace("d=Q/'build'/('seed_'+n)","d=Q/'build'/('seed_'+n)")
s=s.replace("top=f'r2_{n}_seed'","top=f'{n}_source'").replace("f'rtl/{top}_source.v'","f'rtl/{top}.v'")
s=s.replace("(Q/f'graphs/{n}.json').write_text(json.dumps(g,indent=2));","(Q/f'graphs/{n}.json').write_text(json.dumps(g,indent=2));(Q/f'graphs/{n}_seed.json').write_text(json.dumps(g,indent=2));")
p=Q/'tools/map6.py';assert not p.exists();p.write_text(s)
