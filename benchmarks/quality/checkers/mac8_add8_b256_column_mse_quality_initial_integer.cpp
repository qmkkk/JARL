
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
constexpr int NN=211,BITS=24,T=0;
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
v[8]=0;
v[9]=plane(base,7);
v[10]=plane(base,6);
v[11]=plane(base,5);
v[12]=plane(base,4);
v[13]=plane(base,3);
v[14]=plane(base,2);
v[15]=plane(base,1);
v[16]=plane(base,0);
v[17]=plane(base,23);
v[18]=plane(base,22);
v[19]=plane(base,21);
v[20]=plane(base,20);
v[21]=plane(base,19);
v[22]=plane(base,18);
v[23]=plane(base,17);
v[24]=plane(base,16);
v[25]=plane(base,15);
v[26]=plane(base,14);
v[27]=plane(base,13);
v[28]=plane(base,12);
v[29]=plane(base,11);
v[30]=plane(base,10);
v[31]=plane(base,9);
v[32]=plane(base,8);
}
static void unpack(const U*v,uint32_t*out){std::fill(out,out+64,0);
{U b=v[49];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<0;b&=b-1;}}
{U b=v[48];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<1;b&=b-1;}}
{U b=v[47];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<2;b&=b-1;}}
{U b=v[46];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<3;b&=b-1;}}
{U b=v[45];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<4;b&=b-1;}}
{U b=v[44];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<5;b&=b-1;}}
{U b=v[43];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<6;b&=b-1;}}
{U b=v[42];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<7;b&=b-1;}}
{U b=v[41];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<8;b&=b-1;}}
{U b=v[40];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<9;b&=b-1;}}
{U b=v[39];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<10;b&=b-1;}}
{U b=v[38];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<11;b&=b-1;}}
{U b=v[37];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<12;b&=b-1;}}
{U b=v[36];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<13;b&=b-1;}}
{U b=v[35];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<14;b&=b-1;}}
{U b=v[34];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<15;b&=b-1;}}
{U b=v[33];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<16;b&=b-1;}}
{U b=v[33];while(b){int j=__builtin_ctzll(b);out[j]|=uint32_t(1)<<17;b&=b-1;}}
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
static void reference(U x,U&a,U&b,U&low,U&high){a=x&255;b=x>>8;low=a*(b&255)+(b>>8);high=low;}
static U seed_expected(U a,U b,U x){return ((((a>>0)&1)*((b>>6)&1)<<6)+(((a>>0)&1)*((b>>7)&1)<<7)+(((a>>1)&1)*((b>>5)&1)<<6)+(((a>>1)&1)*((b>>6)&1)<<7)+(((a>>1)&1)*((b>>7)&1)<<8)+(((a>>2)&1)*((b>>4)&1)<<6)+(((a>>2)&1)*((b>>5)&1)<<7)+(((a>>2)&1)*((b>>6)&1)<<8)+(((a>>2)&1)*((b>>7)&1)<<9)+(((a>>3)&1)*((b>>3)&1)<<6)+(((a>>3)&1)*((b>>4)&1)<<7)+(((a>>3)&1)*((b>>5)&1)<<8)+(((a>>3)&1)*((b>>6)&1)<<9)+(((a>>3)&1)*((b>>7)&1)<<10)+(((a>>4)&1)*((b>>2)&1)<<6)+(((a>>4)&1)*((b>>3)&1)<<7)+(((a>>4)&1)*((b>>4)&1)<<8)+(((a>>4)&1)*((b>>5)&1)<<9)+(((a>>4)&1)*((b>>6)&1)<<10)+(((a>>4)&1)*((b>>7)&1)<<11)+(((a>>5)&1)*((b>>1)&1)<<6)+(((a>>5)&1)*((b>>2)&1)<<7)+(((a>>5)&1)*((b>>3)&1)<<8)+(((a>>5)&1)*((b>>4)&1)<<9)+(((a>>5)&1)*((b>>5)&1)<<10)+(((a>>5)&1)*((b>>6)&1)<<11)+(((a>>5)&1)*((b>>7)&1)<<12)+(((a>>6)&1)*((b>>0)&1)<<6)+(((a>>6)&1)*((b>>1)&1)<<7)+(((a>>6)&1)*((b>>2)&1)<<8)+(((a>>6)&1)*((b>>3)&1)<<9)+(((a>>6)&1)*((b>>4)&1)<<10)+(((a>>6)&1)*((b>>5)&1)<<11)+(((a>>6)&1)*((b>>6)&1)<<12)+(((a>>6)&1)*((b>>7)&1)<<13)+(((a>>7)&1)*((b>>0)&1)<<7)+(((a>>7)&1)*((b>>1)&1)<<8)+(((a>>7)&1)*((b>>2)&1)<<9)+(((a>>7)&1)*((b>>3)&1)<<10)+(((a>>7)&1)*((b>>4)&1)<<11)+(((a>>7)&1)*((b>>5)&1)<<12)+(((a>>7)&1)*((b>>6)&1)<<13)+(((a>>7)&1)*((b>>7)&1)<<14)+80+(b>>8));}
static void candidate(U* v){
v[0]=0;
v[33]=0;
v[50]=FULL;
v[204]=v[33]|v[33];
v[210]=v[33]|v[33];
v[94]=v[16]&~v[33];
v[91]=v[15]&~v[33];
v[89]=v[14]&~v[33];
v[69]=v[13]&~v[33];
v[70]=v[12]&~v[33];
v[86]=v[11]&~v[33];
v[55]=v[10]&~v[33];
v[53]=v[9]&~v[33];
v[134]=v[32]&~v[33];
v[190]=v[22]&~v[33];
v[191]=v[21]&~v[33];
v[132]=v[20]&~v[33];
v[199]=v[19]&~v[33];
v[139]=v[18]&~v[33];
v[135]=v[17]&~v[33];
v[85]=v[31]&~v[33];
v[54]=v[30]&~v[33];
v[56]=v[29]&~v[33];
v[123]=v[28]&~v[33];
v[90]=v[27]&~v[33];
v[88]=v[26]&~v[33];
v[92]=v[25]&~v[33];
v[149]=v[24]&~v[33];
v[189]=v[23]&~v[33];
{U x[]={v[53],v[54],v[55],v[56]};v[61]=lut<0x7888ULL,4>(x);}
{U x[]={v[53],v[85],v[56],v[55],v[54],v[86]};v[62]=lut<0xf880808088000000ULL,6>(x);}
{U x[]={v[55],v[85],v[56],v[70],v[54],v[86]};v[63]=lut<0xf888800080008000ULL,6>(x);}
{U x[]={v[86],v[54],v[56],v[70],v[85],v[55]};v[64]=lut<0x8777788878887888ULL,6>(x);}
{U x[]={v[54],v[56],v[69],v[70],v[85]};v[65]=lut<0xffffffffULL,5>(x);}
{U x[]={v[55],v[54],v[85],v[53],v[56],v[86]};v[66]=lut<0x8777788878887888ULL,6>(x);}
{U x[]={v[88],v[89],v[90],v[69],v[91],v[92]};v[87]=lut<0x8777788878887888ULL,6>(x);}
{U x[]={v[94],v[88]};v[95]=lut<0x8ULL,2>(x);}
{U x[]={v[94],v[92],v[89],v[90],v[88],v[91]};v[98]=lut<0x8777788878887888ULL,6>(x);}
{U x[]={v[88],v[94],v[90],v[91]};v[99]=lut<0x7888ULL,4>(x);}
{U x[]={v[85],v[86]};v[71]=lut<0x7ULL,2>(x);}
{U x[]={v[53],v[54],v[55],v[56]};v[75]=lut<0x8000ULL,4>(x);}
{U x[]={v[55],v[90],v[86],v[92],v[70],v[88]};v[110]=lut<0xf880808088000000ULL,6>(x);}
{U x[]={v[90],v[86],v[70],v[88],v[92],v[69]};v[111]=lut<0xf888800080008000ULL,6>(x);}
{U x[]={v[70],v[90],v[92],v[89],v[88],v[69]};v[112]=lut<0xf888800080008000ULL,6>(x);}
{U x[]={v[69],v[90],v[92],v[89],v[88],v[91]};v[113]=lut<0xf880808088000000ULL,6>(x);}
{U x[]={v[53],v[123]};v[122]=lut<0x8ULL,2>(x);}
{U x[]={v[55],v[123]};v[124]=lut<0x8ULL,2>(x);}
{U x[]={v[86],v[92]};v[115]=lut<0x7ULL,2>(x);}
{U x[]={v[90],v[55]};v[117]=lut<0x7ULL,2>(x);}
{U x[]={v[70],v[88]};v[119]=lut<0x7ULL,2>(x);}
{U x[]={v[92],v[89]};v[121]=lut<0x7ULL,2>(x);}
{U x[]={v[55],v[92],v[53],v[88]};v[127]=lut<0x8000ULL,4>(x);}
{U x[]={v[53],v[90],v[86],v[92],v[88],v[55]};v[128]=lut<0xf888800080008000ULL,6>(x);}
{U x[]={v[88],v[55],v[92],v[53]};v[129]=lut<0x7000ULL,4>(x);}
{U x[]={v[86],v[90],v[88],v[53],v[92],v[55]};v[130]=lut<0xe75f30007800f000ULL,6>(x);}
{U x[]={v[132]};v[131]=lut<0x1ULL,1>(x);}
{U x[]={v[134],v[53],v[69],v[135],v[123],v[70]};v[133]=lut<0x77f8800f8808800ULL,6>(x);}
{U x[]={v[55],v[89],v[123],v[134],v[139]};v[138]=lut<0x953f6ac0ULL,5>(x);}
{U x[]={v[70],v[54],v[85],v[86],v[56],v[69]};v[140]=lut<0x8777788878887888ULL,6>(x);}
{U x[]={v[135],v[69],v[123],v[53],v[134]};v[147]=lut<0xea808080ULL,5>(x);}
{U x[]={v[55],v[89],v[123],v[134],v[139]};v[137]=lut<0xeac08000ULL,5>(x);}
{U x[]={v[86],v[123]};v[148]=lut<0x8ULL,2>(x);}
v[49]=v[149]&~v[33];
v[163]=v[33]^v[204];
v[162]=(v[33]&v[204])|(~v[33]&v[33]);
v[48]=v[189]&~v[33];
v[47]=v[190]&~v[33];
v[46]=v[191]&~v[33];
v[209]=v[33]|v[132];
{U x[]={v[87],v[89],v[90],v[92],v[94]};v[93]=lut<0x3fc0c0c0ULL,5>(x);}
{U x[]={v[61],v[62],v[63],v[64],v[65],v[66]};v[60]=lut<0x9996969696666666ULL,6>(x);}
{U x[]={v[64],v[65],v[66],v[63]};v[67]=lut<0x8778ULL,4>(x);}
{U x[]={v[54],v[56],v[69],v[70],v[85],v[64]};v[68]=lut<0xffffffffULL,6>(x);}
{U x[]={v[87],v[89],v[90],v[92],v[94]};v[96]=lut<0x6aaaaaaaULL,5>(x);}
{U x[]={v[110],v[53],v[90],v[115],v[88],v[55]};v[114]=lut<0x956a6a956a956a95ULL,6>(x);}
{U x[]={v[111],v[92],v[70],v[117],v[86],v[88]};v[116]=lut<0x956a6a956a956a95ULL,6>(x);}
{U x[]={v[112],v[90],v[86],v[69],v[92],v[119]};v[118]=lut<0x956a6a6a6a959595ULL,6>(x);}
{U x[]={v[113],v[90],v[70],v[121],v[88],v[69]};v[120]=lut<0x956a6a956a956a95ULL,6>(x);}
{U x[]={v[63],v[64],v[65],v[66],v[61],v[62]};v[52]=lut<0xffffea80ea800000ULL,6>(x);}
{U x[]={v[137],v[123],v[69],v[135],v[53],v[134]};v[136]=lut<0x6a95956a956a956aULL,6>(x);}
v[144]=v[99]^v[162];
v[161]=(v[99]&v[162])|(~v[99]&v[95]);
v[45]=v[131]&~v[33];
v[192]=v[199]^v[209];
v[198]=(v[199]&v[209])|(~v[199]&v[33]);
v[146]=v[138]^v[210];
v[202]=(v[138]&v[210])|(~v[138]&v[33]);
{U x[]={v[52],v[53],v[54],v[55],v[56]};v[51]=lut<0xa666aaaaULL,5>(x);}
{U x[]={v[52],v[53],v[54],v[55],v[56]};v[84]=lut<0xc8880000ULL,5>(x);}
{U x[]={v[144],v[140],v[146]};v[145]=lut<0x69ULL,3>(x);}
v[81]=v[98]^v[161];
v[160]=(v[98]&v[161])|(~v[98]&v[93]);
v[44]=v[192]&~v[33];
v[80]=v[136]^v[202];
v[201]=(v[136]&v[202])|(~v[136]&v[137]);
{U x[]={v[80],v[81],v[68]};v[79]=lut<0xe8ULL,3>(x);}
{U x[]={v[80],v[81],v[68]};v[141]=lut<0x96ULL,3>(x);}
{U x[]={v[68],v[81],v[80],v[144],v[140]};v[143]=lut<0x69696996ULL,5>(x);}
v[101]=v[96]^v[160];
v[159]=(v[96]&v[160])|(~v[96]&v[87]);
v[193]=v[145]^v[198];
v[197]=(v[145]&v[198])|(~v[145]&v[146]);
v[102]=v[133]^v[201];
v[200]=(v[133]&v[201])|(~v[133]&v[147]);
{U x[]={v[67],v[101],v[102],v[68],v[81],v[80]};v[103]=lut<0x9696960096000000ULL,6>(x);}
{U x[]={v[68],v[81],v[80],v[67],v[101],v[102]};v[142]=lut<0x17e8e817e81717e8ULL,6>(x);}
v[207]=v[159]|v[33];
v[43]=v[193]&~v[33];
v[194]=v[143]^v[197];
v[196]=(v[143]&v[197])|(~v[143]&v[141]);
v[58]=v[148]^v[200];
v[183]=(v[148]&v[200])|(~v[148]&v[33]);
v[59]=v[120]^v[207];
v[182]=(v[120]&v[207])|(~v[120]&v[113]);
v[208]=v[183]|v[33];
v[42]=v[194]&~v[33];
v[195]=v[142]^v[196];
v[153]=(v[142]&v[196])|(~v[142]&v[33]);
{U x[]={v[58],v[59],v[60]};v[57]=lut<0xe8ULL,3>(x);}
{U x[]={v[59],v[60],v[58]};v[82]=lut<0x96ULL,3>(x);}
{U x[]={v[58],v[60],v[59],v[67],v[101],v[102]};v[100]=lut<0x9696960096000000ULL,6>(x);}
v[203]=v[153]|v[33];
v[74]=v[118]^v[182];
v[181]=(v[118]&v[182])|(~v[118]&v[112]);
v[73]=v[124]^v[208];
v[186]=(v[124]&v[208])|(~v[124]&v[33]);
v[41]=v[195]&~v[33];
{U x[]={v[73],v[74],v[52],v[75],v[56],v[53]};v[72]=lut<0xe88e8ee88ee88ee8ULL,6>(x);}
{U x[]={v[51],v[57],v[73],v[74],v[100]};v[97]=lut<0x84488448ULL,5>(x);}
{U x[]={v[51],v[57],v[73],v[74],v[100]};v[108]=lut<0x96696996ULL,5>(x);}
{U x[]={v[79],v[82],v[102],v[101],v[67]};v[109]=lut<0x9336366cULL,5>(x);}
v[77]=v[116]^v[181];
v[180]=(v[116]&v[181])|(~v[116]&v[111]);
v[78]=v[122]^v[186];
v[185]=(v[122]&v[186])|(~v[122]&v[33]);
{U x[]={v[77],v[52],v[56],v[53],v[75],v[78]};v[76]=lut<0xa999955556666aaaULL,6>(x);}
{U x[]={v[78],v[84],v[77],v[51],v[74],v[73]};v[83]=lut<0x9696960096000000ULL,6>(x);}
v[158]=v[109]^v[203];
v[157]=(v[109]&v[203])|(~v[109]&v[103]);
v[106]=v[114]^v[180];
v[174]=(v[114]&v[180])|(~v[114]&v[110]);
v[188]=v[50]^v[185];
v[105]=(v[50]&v[185])|(~v[50]&v[33]);
{U x[]={v[72],v[78],v[77],v[84],v[105],v[106]};v[104]=lut<0x7ee8811781177ee8ULL,6>(x);}
{U x[]={v[57],v[76],v[73],v[74],v[51]};v[107]=lut<0x9336366cULL,5>(x);}
v[150]=v[108]^v[157];
v[156]=(v[108]&v[157])|(~v[108]&v[100]);
v[206]=v[174]|v[33];
v[187]=v[33]^v[105];
v[184]=(v[33]&v[105])|(~v[33]&v[33]);
v[40]=v[158]&~v[33];
v[39]=v[150]&~v[33];
v[151]=v[107]^v[156];
v[155]=(v[107]&v[156])|(~v[107]&v[97]);
v[126]=v[130]^v[206];
v[177]=(v[130]&v[206])|(~v[130]&v[128]);
{U x[]={v[105],v[106],v[78],v[77],v[84],v[126]};v[125]=lut<0x11171777eee8e888ULL,6>(x);}
v[38]=v[151]&~v[33];
v[152]=v[104]^v[155];
v[154]=(v[104]&v[155])|(~v[104]&v[83]);
v[173]=v[129]^v[177];
v[176]=(v[129]&v[177])|(~v[129]&v[127]);
v[37]=v[152]&~v[33];
v[205]=v[154]|v[33];
v[179]=v[50]^v[176];
v[172]=(v[50]&v[176])|(~v[50]&v[33]);
v[164]=v[125]^v[205];
v[170]=(v[125]&v[205])|(~v[125]&v[126]);
v[178]=v[33]^v[172];
v[175]=(v[33]&v[172])|(~v[33]&v[33]);
v[36]=v[164]&~v[33];
v[165]=v[173]^v[170];
v[169]=(v[173]&v[170])|(~v[173]&v[33]);
v[35]=v[165]&~v[33];
v[166]=v[172]^v[169];
v[168]=(v[172]&v[169])|(~v[172]&v[33]);
v[34]=v[166]&~v[33];
v[171]=v[33]^v[168];
v[167]=(v[33]&v[168])|(~v[33]&v[33]);
}
int main(){U v[NN],sae=0,sse=0,wce=0,minimum=UINT64_MAX,maximum=0,wa=0,wb=0,wy=0;I signed_sum=0;uint32_t yy[64];
for(U base=0;base<N;base+=64){inputs(v,base);candidate(v);unpack(v,yy);for(int j=0;j<64;j++){U a,b,l,h;reference(base+j,a,b,l,h);I e=I(yy[j])-I(l);U ae=std::abs(e);if(ae>256)return 7;if(ae>wce){wce=ae;wa=a;wb=b;wy=yy[j];}sae+=ae;sse+=ae*ae;signed_sum+=e;minimum=std::min(minimum,U(yy[j]));maximum=std::max(maximum,U(yy[j]));}}
std::cout<<"inputs,WCE,SAE,SSE,signed_sum,minimum_output,maximum_output,witness_A,witness_B,witness_Y\n"<<N<<","<<wce<<","<<sae<<","<<sse<<","<<signed_sum<<","<<minimum<<","<<maximum<<","<<wa<<","<<wb<<","<<wy<<std::endl;return 0;}
