"""Unselected arithmetic-cost context generator; no experiment on import.

Caller supplies a validated bit-sliced evaluator, arithmetic reference and a
support which does not depend on either forced root. SSE uses128-bit integers.
"""


def tail(support, root_a, root_b, budget):
    assert 0 < len(support) <= 8
    prefix = ('static const int support[]={' + ','.join(map(str, support)) + '};\n'
              + f'constexpr int K={len(support)},S=1<<K,AOUT={root_a},BOUT={root_b};'
              + f'constexpr I BUDGET={budget};\n')
    return prefix + r'''
using Wide=unsigned __int128;
static std::string decimal(Wide x){if(x==0)return "0";std::string s;while(x){s.push_back('0'+x%10);x/=10;}std::reverse(s.begin(),s.end());return s;}
int main(){U v[NN],orig[NN];uint32_t out[64];
I lo[4][256],hi[4][256];Wide sse[4][256]={},sae[4][256]={};U count[256]={};
for(int q=0;q<4;q++)for(int r=0;r<S;r++){lo[q][r]=INT64_MAX;hi[q][r]=INT64_MIN;}
for(U base=0;base<N;base+=64){
 inputs(orig,base);original(orig);unpack(orig,out);int rows[64]={};
 for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);if(l!=h)return 12;if(std::abs(I(out[j])-I(l))>BUDGET)return 4;}
 for(int k=0;k<K;k++){U bits=orig[support[k]];while(bits){int j=__builtin_ctzll(bits);rows[j]|=1<<k;bits&=bits-1;}}
 for(int j=0;j<64;j++)count[rows[j]]++;
 for(int q=0;q<4;q++){
  inputs(v,base);original(v,AOUT,BOUT,q);unpack(v,out);
  for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);int r=rows[j];I e=I(out[j])-I(l);Wide magnitude=std::abs(e);
   lo[q][r]=std::min(lo[q][r],e);hi[q][r]=std::max(hi[q][r],e);sse[q][r]+=magnitude*magnitude;sae[q][r]+=magnitude;}
 }
}
std::cout<<"row,count,q,error_lo,error_hi,SSE,SAE\n";
for(int r=0;r<S;r++)if(count[r])for(int q=0;q<4;q++)std::cout<<r<<","<<count[r]<<","<<q<<","<<lo[q][r]<<","<<hi[q][r]<<","<<decimal(sse[q][r])<<","<<decimal(sae[q][r])<<"\n";
return 0;}
'''
