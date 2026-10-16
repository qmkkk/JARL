import re, json, pathlib, collections, itertools

def parse_sexpr(text):
    tok=re.findall(r'\(|\)|"(?:\\.|[^"\\])*"|[^\s()]+',text)
    stack=[[]]
    for t in tok:
        if t=='(': stack.append([])
        elif t==')':
            a=stack.pop();stack[-1].append(a)
        else: stack[-1].append(t[1:-1] if t.startswith('"') else t)
    assert len(stack)==1 and len(stack[0])==1
    return stack[0][0]

def children(a,k):return [x for x in a if isinstance(x,list) and x and x[0].lower()==k.lower()]

def one(a,k):
    b=children(a,k);assert len(b)==1,(k,len(b));return b[0]

def ident(a):return a[1] if isinstance(a,list) else a

def portdef(a):
    d=a[1];n=1
    if isinstance(d,list) and d[0]=='array': n=int(d[2]);d=d[1]
    return ident(d),n,one(a,'direction')[1]

def pref(a):
    if isinstance(a,list) and a[0]=='member':return a[1],int(a[2])
    return a,None

class DSU:
    def __init__(self):self.p={}
    def get(self,x):
        if x not in self.p:self.p[x]=x
        if self.p[x]!=x:self.p[x]=self.get(self.p[x])
        return self.p[x]
    def union(self,x,y):
        x=self.get(x);y=self.get(y)
        if x!=y:self.p[y]=x

def read_edif(path):
    tree=parse_sexpr(pathlib.Path(path).read_text())
    defs={};where={}
    for lib in children(tree,'library'):
        for c in children(lib,'cell'):
            defs[ident(c[1])]=c;where[ident(c[1])]=ident(lib[1])
    design=one(tree,'design');top=one(design,'cellref')[1]
    dsu=DSU();prims=[]; topports={}
    def flatten(cell,prefix,bindings=None):
        c=defs[cell];v=one(c,'view');it=one(v,'interface')
        ports={name:(width,direction) for name,width,direction in map(portdef,children(it,'port'))}
        contents=children(v,'contents')
        endpoint={}
        for name,(width,di) in ports.items():
            for idx in (range(width) if width>1 else [None]):
                endpoint[(None,name,idx)]=(prefix,'@',name,idx)
                if bindings is not None:dsu.union(endpoint[(None,name,idx)],bindings[(name,idx)])
                if not prefix:topports[f'{name}[{width-1-idx}]' if idx is not None else name]=endpoint[(None,name,idx)]
        if not contents:raise ValueError('unexpected leaf',cell)
        insts={}
        for obj in children(contents[0],'instance'):
            name=ident(obj[1]);typ=one(one(obj,'viewref'),'cellref')[1]
            props={ident(p[1]):p[2][1] for p in children(obj,'property') if len(p)>2 and len(p[2])>1 and isinstance(p[2][1],str)}
            insts[name]=(typ,props)
            iv=one(defs[typ],'view')
            for pn,pw,pd in map(portdef,children(one(iv,'interface'),'port')):
                for idx in (range(pw) if pw>1 else [None]):endpoint[(name,pn,idx)]=(prefix,name,pn,idx)
        for net in children(contents[0],'net'):
            conn=[]
            for pr in children(one(net,'joined'),'portref'):
                pn,idx=pref(pr[1]); ir=children(pr,'instanceref');name=ir[0][1] if ir else None
                conn.append(endpoint[(name,pn,idx)])
            for x in conn[1:]:dsu.union(conn[0],x)
        for name,(typ,props) in insts.items():
            ep={(pn,idx):e for (inst,pn,idx),e in endpoint.items() if inst==name}
            full=prefix+'/'+name if prefix else name
            if where[typ]=='hdi_primitives':
                pw={p[0]:p[1] for p in map(portdef,children(one(one(defs[typ],'view'),'interface'),'port'))}
                pins={f'{pn}{pw[pn]-1-idx}' if idx is not None else pn:ep[(pn,idx)] for pn,idx in ep}
                prims.append({'name':full,'type':typ,'props':props,'pins':pins})
            else:flatten(typ,full,ep)
    flatten(top,'')
    ids={}
    def nid(e):
        root=dsu.get(e)
        if root not in ids:ids[root]=len(ids)
        return ids[root]
    tp={k:nid(v) for k,v in topports.items()}
    for p in prims:p['pins']={k:nid(v) for k,v in p['pins'].items()}
    return {'top':top,'n_nets':len(ids),'ports':tp,'cells':prims}

def candidates(g):
    cells=g['cells']; luts=[c for c in cells if re.fullmatch('LUT[1-6]',c['type'])]
    for c in luts:c['support']=set(c['pins'][f'I{i}'] for i in range(int(c['type'][-1])))
    ans=[]
    for a,b in itertools.combinations(luts,2):
        sa,sb=a['support'],b['support'];ka,kb=len(sa),len(sb)
        if a['pins']['O'] in sb or b['pins']['O'] in sa:continue
        if not (ka in [5,6] and kb in [5,6] and max(ka,kb)==6 and len(sa&sb)>=5):continue
        same_hlut=bool(a['props'].get('HLUTNM')) and a['props'].get('HLUTNM')==b['props'].get('HLUTNM') and a['name'].rsplit('/',1)[0]==b['name'].rsplit('/',1)[0]
        ans.append({'a':a['name'],'b':b['name'],'shared':len(sa&sb),'union':len(sa|sb),'same_hlutnm':same_hlut})
    for c in luts:del c['support']
    return ans
