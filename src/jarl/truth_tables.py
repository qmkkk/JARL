import numpy as np

def truth(init,ins,support,rows):
    ix=np.zeros(len(rows),dtype=np.int64)
    for b,n in enumerate(ins):ix|=((rows>>support.index(n))&1)<<b
    return ((np.uint64(init)>>ix.astype(np.uint64))&1).astype(np.int64)
