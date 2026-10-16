
#include <array>
#include <vector>
#include <cstdint>
#include <algorithm>
#include <iostream>
#include <fstream>
#include <limits>
#include <chrono>
#include <cstdlib>
using U=uint64_t; using I=int64_t;
constexpr U FULL=~U(0);
template<U T,int K> inline U lut(const U* x) {
 if constexpr (T==0) return 0;
 else if constexpr (T==(FULL>>(64-(1<<K)))) return FULL;
 else if constexpr(K==0) return (T&1)?FULL:0;
 else {
  constexpr int H=1<<(K-1);
  constexpr U MASK=(H==64)?FULL:((U(1)<<H)-1);
  constexpr U L=T&MASK,R=T>>H;
  if constexpr (L==R) return lut<L,K-1>(x);
  else return (lut<L,K-1>(x)&~x[K-1])|(lut<R,K-1>(x)&x[K-1]);
 }
}
static U plane(U base,int bit){
 static const U lo[6]={0xaaaaaaaaaaaaaaaaULL,0xccccccccccccccccULL,0xf0f0f0f0f0f0f0f0ULL,0xff00ff00ff00ff00ULL,0xffff0000ffff0000ULL,0xffffffff00000000ULL};
 return bit<6?lo[bit]:((base>>bit)&1?FULL:0);
}

#include <cmath>
constexpr int NN=249,BITS=24,T=0;
constexpr bool MUL=true;
constexpr U N=U(1)<<24;
static void inputs(U*v,U base){
v[1]=0;
v[2]=0;
v[3]=0;
v[4]=0;
v[5]=0;
v[6]=0;
v[7]=0;
v[8]=plane(base,8);
v[9]=plane(base,7);
v[10]=plane(base,6);
v[11]=plane(base,5);
v[12]=plane(base,4);
v[13]=plane(base,3);
v[14]=plane(base,2);
v[15]=plane(base,1);
v[16]=plane(base,0);
v[17]=0;
v[18]=plane(base,23);
v[19]=plane(base,22);
v[20]=plane(base,21);
v[21]=plane(base,20);
v[22]=plane(base,19);
v[23]=plane(base,18);
v[24]=plane(base,17);
v[25]=plane(base,16);
v[26]=plane(base,15);
v[27]=plane(base,14);
v[28]=plane(base,13);
v[29]=plane(base,12);
v[30]=plane(base,11);
v[31]=plane(base,10);
v[32]=plane(base,9);
}
static void unpack(const U*v,uint32_t*out){std::fill(out,out+64,0);
{U b=v[50];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<0;b&=b-1;}}
{U b=v[49];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<1;b&=b-1;}}
{U b=v[48];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<2;b&=b-1;}}
{U b=v[47];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<3;b&=b-1;}}
{U b=v[46];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<4;b&=b-1;}}
{U b=v[45];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<5;b&=b-1;}}
{U b=v[44];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<6;b&=b-1;}}
{U b=v[33];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<7;b&=b-1;}}
{U b=v[43];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<8;b&=b-1;}}
{U b=v[42];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<9;b&=b-1;}}
{U b=v[41];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<10;b&=b-1;}}
{U b=v[40];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<11;b&=b-1;}}
{U b=v[39];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<12;b&=b-1;}}
{U b=v[38];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<13;b&=b-1;}}
{U b=v[37];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<14;b&=b-1;}}
{U b=v[36];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<15;b&=b-1;}}
{U b=v[35];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<16;b&=b-1;}}
{U b=v[34];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<17;b&=b-1;}}
{U b=v[33];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<18;b&=b-1;}}
{U b=v[33];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<19;b&=b-1;}}
{U b=v[33];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<20;b&=b-1;}}
{U b=v[33];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<21;b&=b-1;}}
{U b=v[33];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<22;b&=b-1;}}
{U b=v[33];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<23;b&=b-1;}}
{U b=v[33];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<24;b&=b-1;}}
{U b=v[33];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<25;b&=b-1;}}
{U b=v[33];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<26;b&=b-1;}}
{U b=v[33];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<27;b&=b-1;}}
{U b=v[33];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<28;b&=b-1;}}
{U b=v[33];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<29;b&=b-1;}}
{U b=v[33];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<30;b&=b-1;}}
{U b=v[33];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<31;b&=b-1;}}
}
static U root(U x){U y=std::sqrt(double(x));while((y+1)*(y+1)<=x)++y;while(y*y>x)--y;return y;}
static void reference(U x,U&a,U&b,U&low,U&high){a=x&511;b=x>>9;low=a*(b&511)+(b>>9);high=low;}
static U seed_expected(U a,U b,U x){return ((((a>>0)&1)*((b>>8)&1)<<8)+(((a>>1)&1)*((b>>7)&1)<<8)+(((a>>1)&1)*((b>>8)&1)<<9)+(((a>>2)&1)*((b>>6)&1)<<8)+(((a>>2)&1)*((b>>7)&1)<<9)+(((a>>2)&1)*((b>>8)&1)<<10)+(((a>>3)&1)*((b>>5)&1)<<8)+(((a>>3)&1)*((b>>6)&1)<<9)+(((a>>3)&1)*((b>>7)&1)<<10)+(((a>>3)&1)*((b>>8)&1)<<11)+(((a>>4)&1)*((b>>4)&1)<<8)+(((a>>4)&1)*((b>>5)&1)<<9)+(((a>>4)&1)*((b>>6)&1)<<10)+(((a>>4)&1)*((b>>7)&1)<<11)+(((a>>4)&1)*((b>>8)&1)<<12)+(((a>>5)&1)*((b>>3)&1)<<8)+(((a>>5)&1)*((b>>4)&1)<<9)+(((a>>5)&1)*((b>>5)&1)<<10)+(((a>>5)&1)*((b>>6)&1)<<11)+(((a>>5)&1)*((b>>7)&1)<<12)+(((a>>5)&1)*((b>>8)&1)<<13)+(((a>>6)&1)*((b>>2)&1)<<8)+(((a>>6)&1)*((b>>3)&1)<<9)+(((a>>6)&1)*((b>>4)&1)<<10)+(((a>>6)&1)*((b>>5)&1)<<11)+(((a>>6)&1)*((b>>6)&1)<<12)+(((a>>6)&1)*((b>>7)&1)<<13)+(((a>>6)&1)*((b>>8)&1)<<14)+(((a>>7)&1)*((b>>1)&1)<<8)+(((a>>7)&1)*((b>>2)&1)<<9)+(((a>>7)&1)*((b>>3)&1)<<10)+(((a>>7)&1)*((b>>4)&1)<<11)+(((a>>7)&1)*((b>>5)&1)<<12)+(((a>>7)&1)*((b>>6)&1)<<13)+(((a>>7)&1)*((b>>7)&1)<<14)+(((a>>7)&1)*((b>>8)&1)<<15)+(((a>>8)&1)*((b>>0)&1)<<8)+(((a>>8)&1)*((b>>1)&1)<<9)+(((a>>8)&1)*((b>>2)&1)<<10)+(((a>>8)&1)*((b>>3)&1)<<11)+(((a>>8)&1)*((b>>4)&1)<<12)+(((a>>8)&1)*((b>>5)&1)<<13)+(((a>>8)&1)*((b>>6)&1)<<14)+(((a>>8)&1)*((b>>7)&1)<<15)+(((a>>8)&1)*((b>>8)&1)<<16)+769+(b>>9));}
static void candidate(U* v){
v[0]=0;
v[33]=0;
v[51]=FULL;
v[239]=v[33]|v[33];
v[240]=v[33]|v[33];
v[241]=v[33]|v[33];
v[247]=v[33]|v[51];
v[86]=v[16]&~v[33];
v[68]=v[15]&~v[33];
v[82]=v[14]&~v[33];
v[93]=v[13]&~v[33];
v[71]=v[12]&~v[33];
v[89]=v[11]&~v[33];
v[65]=v[10]&~v[33];
v[74]=v[9]&~v[33];
v[76]=v[8]&~v[33];
v[77]=v[32]&~v[33];
v[227]=v[22]&~v[33];
v[226]=v[21]&~v[33];
v[225]=v[20]&~v[33];
v[238]=v[19]&~v[33];
v[237]=v[18]&~v[33];
v[73]=v[31]&~v[33];
v[64]=v[30]&~v[33];
v[91]=v[29]&~v[33];
v[72]=v[28]&~v[33];
v[90]=v[27]&~v[33];
v[88]=v[26]&~v[33];
v[67]=v[25]&~v[33];
v[83]=v[24]&~v[33];
v[228]=v[23]&~v[33];
{U x[]={v[64],v[65]};v[63]=lut<0x7ULL,2>(x);}
{U x[]={v[76],v[77]};v[75]=lut<0x8ULL,2>(x);}
{U x[]={v[82],v[83]};v[81]=lut<0x8ULL,2>(x);}
{U x[]={v[68],v[83]};v[84]=lut<0x8ULL,2>(x);}
{U x[]={v[77],v[76],v[83],v[86]};v[85]=lut<0x7888ULL,4>(x);}
{U x[]={v[71],v[88],v[89],v[90],v[74],v[91]};v[87]=lut<0xf888800080008000ULL,6>(x);}
{U x[]={v[88],v[93],v[65],v[90],v[71],v[91]};v[92]=lut<0xf880808088000000ULL,6>(x);}
{U x[]={v[82],v[88],v[89],v[90],v[91],v[93]};v[94]=lut<0xf880880080800000ULL,6>(x);}
{U x[]={v[91],v[89],v[82],v[88],v[93],v[90]};v[101]=lut<0x8777788878887888ULL,6>(x);}
{U x[]={v[89],v[88]};v[96]=lut<0x7ULL,2>(x);}
{U x[]={v[89],v[90]};v[98]=lut<0x7ULL,2>(x);}
{U x[]={v[93],v[88]};v[100]=lut<0x7ULL,2>(x);}
{U x[]={v[67],v[89]};v[122]=lut<0x7ULL,2>(x);}
{U x[]={v[67],v[65]};v[127]=lut<0x7ULL,2>(x);}
{U x[]={v[65],v[83]};v[144]=lut<0x8ULL,2>(x);}
{U x[]={v[89],v[83]};v[145]=lut<0x8ULL,2>(x);}
{U x[]={v[71],v[83]};v[146]=lut<0x8ULL,2>(x);}
{U x[]={v[93],v[83]};v[147]=lut<0x8ULL,2>(x);}
{U x[]={v[89],v[72],v[73],v[76],v[64],v[74]};v[56]=lut<0x8777788878887888ULL,6>(x);}
{U x[]={v[65],v[72],v[76],v[64]};v[58]=lut<0x7888ULL,4>(x);}
{U x[]={v[64],v[74],v[73],v[76],v[72],v[89]};v[59]=lut<0xf888800080008000ULL,6>(x);}
{U x[]={v[72],v[74]};v[148]=lut<0x7ULL,2>(x);}
{U x[]={v[76],v[72],v[65],v[64]};v[149]=lut<0x8000ULL,4>(x);}
{U x[]={v[65],v[74],v[76],v[88],v[90]};v[156]=lut<0xf000f000ULL,5>(x);}
{U x[]={v[65],v[74],v[76],v[88],v[90]};v[157]=lut<0x0ULL,5>(x);}
{U x[]={v[88],v[89],v[65],v[90],v[91],v[76]};v[158]=lut<0xf888800080008000ULL,6>(x);}
{U x[]={v[65],v[74],v[76],v[88],v[90]};v[159]=lut<0x3800f000ULL,5>(x);}
{U x[]={v[65],v[74],v[76],v[88],v[90]};v[160]=lut<0xb4f0cc00ULL,5>(x);}
{U x[]={v[91],v[76]};v[162]=lut<0x7ULL,2>(x);}
{U x[]={v[76],v[83]};v[169]=lut<0x8ULL,2>(x);}
{U x[]={v[74],v[83]};v[170]=lut<0x8ULL,2>(x);}
v[184]=v[33]^v[240];
v[183]=(v[33]&v[240])|(~v[33]&v[33]);
v[171]=v[228]^v[247];
v[224]=(v[228]&v[247])|(~v[228]&v[228]);
{U x[]={v[56],v[63],v[71],v[73],v[74]};v[57]=lut<0xf3003000ULL,5>(x);}
{U x[]={v[56],v[63],v[71],v[73],v[74]};v[53]=lut<0x59b292a2ULL,5>(x);}
{U x[]={v[87],v[90],v[65],v[96],v[91],v[76]};v[95]=lut<0x956a6a956a956a95ULL,6>(x);}
{U x[]={v[92],v[88],v[71],v[98],v[74],v[91]};v[97]=lut<0x956a6a956a956a95ULL,6>(x);}
{U x[]={v[94],v[90],v[71],v[100],v[65],v[91]};v[99]=lut<0x956a6a956a956a95ULL,6>(x);}
{U x[]={v[162],v[89],v[65],v[88],v[74],v[90]};v[161]=lut<0xdbaf2450b400b400ULL,6>(x);}
v[50]=v[171]&~v[33];
v[69]=v[85]^v[183];
v[182]=(v[85]&v[183])|(~v[85]&v[75]);
v[106]=v[101]^v[241];
v[188]=(v[101]&v[241])|(~v[101]&v[33]);
v[218]=v[227]^v[224];
v[223]=(v[227]&v[224])|(~v[227]&v[227]);
{U x[]={v[71],v[72],v[73],v[74],v[106]};v[70]=lut<0x88888888ULL,5>(x);}
{U x[]={v[59],v[56],v[57],v[58],v[148],v[149]};v[121]=lut<0xea80ffff0000ea80ULL,6>(x);}
{U x[]={v[149],v[58],v[57],v[56],v[59],v[148]};v[126]=lut<0x56666aaaa9999555ULL,6>(x);}
{U x[]={v[58],v[57],v[56],v[59]};v[142]=lut<0xea80ULL,4>(x);}
{U x[]={v[67],v[68],v[69]};v[66]=lut<0x7fULL,3>(x);}
{U x[]={v[71],v[72],v[73],v[74],v[106]};v[105]=lut<0x88887777ULL,5>(x);}
v[104]=v[84]^v[182];
v[181]=(v[84]&v[182])|(~v[84]&v[33]);
v[54]=v[99]^v[188];
v[187]=(v[99]&v[188])|(~v[99]&v[94]);
v[49]=v[218]&~v[33];
v[219]=v[226]^v[223];
v[222]=(v[226]&v[223])|(~v[226]&v[226]);
{U x[]={v[106],v[70],v[69],v[68],v[67]};v[110]=lut<0x96696969ULL,5>(x);}
{U x[]={v[64],v[65],v[76],v[74],v[72],v[142]};v[112]=lut<0xf70000070f00000ULL,6>(x);}
{U x[]={v[64],v[65],v[74],v[142],v[76],v[72]};v[119]=lut<0xf880000000000000ULL,6>(x);}
{U x[]={v[54],v[53]};v[62]=lut<0x9ULL,2>(x);}
v[61]=v[81]^v[181];
v[180]=(v[81]&v[181])|(~v[81]&v[33]);
v[60]=v[97]^v[187];
v[186]=(v[97]&v[187])|(~v[97]&v[92]);
v[48]=v[219]&~v[33];
v[220]=v[225]^v[222];
v[221]=(v[225]&v[222])|(~v[225]&v[225]);
v[179]=v[110]^v[239];
v[177]=(v[110]&v[239])|(~v[110]&v[105]);
{U x[]={v[56],v[57],v[58],v[59],v[60],v[61]};v[55]=lut<0x8778788778878778ULL,6>(x);}
{U x[]={v[62],v[82],v[67],v[104],v[68],v[69]};v[103]=lut<0x659a956a956a956aULL,6>(x);}
{U x[]={v[62],v[104],v[69],v[68],v[67],v[82]};v[79]=lut<0x8000000000000000ULL,6>(x);}
{U x[]={v[56],v[57],v[58],v[59],v[61],v[60]};v[130]=lut<0xffff877887780000ULL,6>(x);}
v[125]=v[95]^v[186];
v[185]=(v[95]&v[186])|(~v[95]&v[87]);
v[243]=v[180]|v[33];
v[47]=v[220]&~v[33];
v[248]=v[221]|v[33];
{U x[]={v[53],v[54],v[55],v[67],v[93]};v[52]=lut<0xeeeeeeeeULL,5>(x);}
v[43]=v[179]&~v[33];
{U x[]={v[53],v[54],v[55],v[67],v[93]};v[102]=lut<0xe11e1e1eULL,5>(x);}
{U x[]={v[103],v[106],v[70]};v[109]=lut<0x56ULL,3>(x);}
v[124]=v[147]^v[243];
v[200]=(v[147]&v[243])|(~v[147]&v[33]);
v[246]=v[185]|v[33];
v[229]=v[238]^v[248];
v[234]=(v[238]&v[248])|(~v[238]&v[238]);
{U x[]={v[102],v[62],v[82],v[67],v[104],v[66]};v[108]=lut<0x56666aaa95555696ULL,6>(x);}
{U x[]={v[124],v[125],v[126]};v[123]=lut<0xe8ULL,3>(x);}
{U x[]={v[125],v[126],v[124]};v[131]=lut<0x96ULL,3>(x);}
v[178]=v[109]^v[177];
v[176]=(v[109]&v[177])|(~v[109]&v[103]);
v[114]=v[146]^v[200];
v[199]=(v[146]&v[200])|(~v[146]&v[33]);
v[113]=v[161]^v[246];
v[216]=(v[161]&v[246])|(~v[161]&v[158]);
v[46]=v[229]&~v[33];
v[230]=v[237]^v[234];
v[233]=(v[237]&v[234])|(~v[237]&v[237]);
{U x[]={v[72],v[76],v[113],v[114],v[121]};v[120]=lut<0x78878778ULL,5>(x);}
{U x[]={v[72],v[76],v[113],v[114],v[121]};v[128]=lut<0xf770f880ULL,5>(x);}
{U x[]={v[123],v[113],v[112],v[114],v[67],v[89]};v[135]=lut<0x6996966996699669ULL,6>(x);}
{U x[]={v[67],v[71],v[79],v[130],v[131]};v[80]=lut<0x88777788ULL,5>(x);}
{U x[]={v[123],v[67],v[89],v[113],v[112],v[114]};v[139]=lut<0xea8080ea80eaea80ULL,6>(x);}
v[172]=v[108]^v[176];
v[175]=(v[108]&v[176])|(~v[108]&v[102]);
v[117]=v[145]^v[199];
v[198]=(v[145]&v[199])|(~v[145]&v[33]);
v[118]=v[160]^v[216];
v[215]=(v[160]&v[216])|(~v[160]&v[157]);
v[45]=v[230]&~v[33];
v[236]=v[51]^v[233];
v[231]=(v[51]&v[233])|(~v[51]&v[33]);
v[42]=v[178]&~v[33];
{U x[]={v[67],v[71],v[79],v[130],v[131]};v[78]=lut<0x78878778ULL,5>(x);}
{U x[]={v[67],v[71],v[130],v[131],v[135]};v[129]=lut<0xf880f880ULL,5>(x);}
{U x[]={v[80],v[79],v[55],v[93],v[67],v[52]};v[107]=lut<0x9996969696666666ULL,6>(x);}
{U x[]={v[117],v[118],v[119]};v[116]=lut<0xe8ULL,3>(x);}
{U x[]={v[118],v[121],v[76],v[72],v[117]};v[115]=lut<0x95556aaaULL,5>(x);}
{U x[]={v[67],v[71],v[130],v[131],v[135]};v[150]=lut<0xf880ULL,5>(x);}
{U x[]={v[79],v[80]};v[151]=lut<0x8ULL,2>(x);}
{U x[]={v[79],v[130],v[67],v[71],v[131],v[135]};v[155]=lut<0x7eeee88881111777ULL,6>(x);}
v[41]=v[172]&~v[33];
v[134]=v[144]^v[198];
v[197]=(v[144]&v[198])|(~v[144]&v[33]);
v[133]=v[159]^v[215];
v[214]=(v[159]&v[215])|(~v[159]&v[156]);
v[44]=v[231]&~v[33];
v[235]=v[33]^v[231];
v[232]=(v[33]&v[231])|(~v[33]&v[33]);
{U x[]={v[112],v[113],v[114],v[67],v[65],v[115]};v[111]=lut<0xffe8e8e8e8000000ULL,6>(x);}
{U x[]={v[74],v[67],v[133],v[134]};v[140]=lut<0x8778ULL,4>(x);}
{U x[]={v[112],v[113],v[114],v[115],v[67],v[65]};v[141]=lut<0x17e8e817e817e817ULL,6>(x);}
{U x[]={v[120],v[122],v[123],v[127],v[115],v[128]};v[143]=lut<0xb2b200b20000b2ULL,6>(x);}
{U x[]={v[133],v[67],v[74],v[134]};v[164]=lut<0xea80ULL,4>(x);}
v[173]=v[107]^v[175];
v[174]=(v[107]&v[175])|(~v[107]&v[78]);
v[245]=v[197]|v[33];
v[217]=v[51]^v[214];
v[137]=(v[51]&v[214])|(~v[51]&v[33]);
{U x[]={v[111],v[74],v[67],v[133],v[134],v[116]};v[132]=lut<0xeabfbfea802a2a80ULL,6>(x);}
{U x[]={v[139],v[128],v[127],v[115],v[116],v[140]};v[153]=lut<0xe78e18711871e78eULL,6>(x);}
{U x[]={v[129],v[123],v[67],v[89],v[120],v[141]};v[154]=lut<0x7eeee88881111777ULL,6>(x);}
v[40]=v[173]&~v[33];
v[242]=v[174]|v[33];
v[138]=v[170]^v[245];
v[211]=(v[170]&v[245])|(~v[170]&v[33]);
{U x[]={v[67],v[76],v[137],v[138],v[164]};v[136]=lut<0x87788778ULL,5>(x);}
{U x[]={v[67],v[76],v[137],v[138],v[164]};v[163]=lut<0x87780000ULL,5>(x);}
v[189]=v[155]^v[242];
v[196]=(v[155]&v[242])|(~v[155]&v[151]);
v[166]=v[169]^v[211];
v[210]=(v[169]&v[211])|(~v[169]&v[33]);
{U x[]={v[132],v[136],v[133],v[67],v[74],v[134]};v[152]=lut<0x9996969696666666ULL,6>(x);}
{U x[]={v[164],v[166],v[137],v[67],v[76],v[138]};v[168]=lut<0x93363636366c6c6cULL,6>(x);}
v[39]=v[189]&~v[33];
v[190]=v[154]^v[196];
v[195]=(v[154]&v[196])|(~v[154]&v[150]);
v[213]=v[51]^v[210];
v[167]=(v[51]&v[210])|(~v[51]&v[33]);
{U x[]={v[166],v[137],v[67],v[76],v[138],v[167]};v[165]=lut<0x57777fffa8888000ULL,6>(x);}
v[38]=v[190]&~v[33];
v[191]=v[153]^v[195];
v[194]=(v[153]&v[195])|(~v[153]&v[143]);
v[212]=v[33]^v[167];
v[209]=(v[33]&v[167])|(~v[33]&v[33]);
v[37]=v[191]&~v[33];
v[192]=v[152]^v[194];
v[193]=(v[152]&v[194])|(~v[152]&v[132]);
v[36]=v[192]&~v[33];
v[244]=v[193]|v[33];
v[201]=v[168]^v[244];
v[206]=(v[168]&v[244])|(~v[168]&v[163]);
v[35]=v[201]&~v[33];
v[202]=v[165]^v[206];
v[205]=(v[165]&v[206])|(~v[165]&v[33]);
v[34]=v[202]&~v[33];
v[208]=v[33]^v[205];
v[204]=(v[33]&v[205])|(~v[33]&v[33]);
v[207]=v[33]^v[204];
v[203]=(v[33]&v[204])|(~v[33]&v[33]);
}
int main(){U v[NN],sae=0,sse=0,wce=0,minimum=UINT64_MAX,maximum=0,wa=0,wb=0,wy=0;I signed_sum=0;uint32_t yy[64];
for(U base=0;base<N;base+=64){inputs(v,base);candidate(v);unpack(v,yy);for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);I e=I(yy[j])-I(l);U ae=std::abs(e);if(ae>1024)return 7;if(ae>wce){wce=ae;wa=a;wb=b;wy=yy[j];}sae+=ae;sse+=ae*ae;signed_sum+=e;minimum=std::min(minimum,U(yy[j]));maximum=std::max(maximum,U(yy[j]));}}
std::cout<<"inputs,WCE,SAE,SSE,signed_sum,minimum_output,maximum_output,witness_A,witness_B,witness_Y\n"<<N<<","<<wce<<","<<sae<<","<<sse<<","<<signed_sum<<","<<minimum<<","<<maximum<<","<<wa<<","<<wb<<","<<wy<<std::endl;return 0;}
