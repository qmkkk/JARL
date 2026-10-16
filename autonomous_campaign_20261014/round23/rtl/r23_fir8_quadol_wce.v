// GENERATED; vendor HDL simulation and physical implementation: NOT_RUN.
// Same registered boundary as source EDIF; no DONT_TOUCH or placement constraints.
module r21_mac8_add8_b256_column_mse_quadol_wce(input wire clk,input wire [15:0] A,B,output wire [31:0] Y);
wire [209:0] v;
assign v[0]=clk;
assign v[1]=A[15];
assign v[2]=A[14];
assign v[3]=A[13];
assign v[4]=A[12];
assign v[5]=A[11];
assign v[6]=A[10];
assign v[7]=A[9];
assign v[8]=A[8];
assign v[9]=A[7];
assign v[10]=A[6];
assign v[11]=A[5];
assign v[12]=A[4];
assign v[13]=A[3];
assign v[14]=A[2];
assign v[15]=A[1];
assign v[16]=A[0];
assign v[17]=B[15];
assign v[18]=B[14];
assign v[19]=B[13];
assign v[20]=B[12];
assign v[21]=B[11];
assign v[22]=B[10];
assign v[23]=B[9];
assign v[24]=B[8];
assign v[25]=B[7];
assign v[26]=B[6];
assign v[27]=B[5];
assign v[28]=B[4];
assign v[29]=B[3];
assign v[30]=B[2];
assign v[31]=B[1];
assign v[32]=B[0];
assign Y[31]=v[33];
assign Y[30]=v[33];
assign Y[29]=v[33];
assign Y[28]=v[33];
assign Y[27]=v[33];
assign Y[26]=v[33];
assign Y[25]=v[33];
assign Y[24]=v[33];
assign Y[23]=v[33];
assign Y[22]=v[33];
assign Y[21]=v[33];
assign Y[20]=v[33];
assign Y[19]=v[33];
assign Y[18]=v[33];
assign Y[17]=v[33];
assign Y[16]=v[33];
assign Y[15]=v[34];
assign Y[14]=v[35];
assign Y[13]=v[36];
assign Y[12]=v[37];
assign Y[11]=v[38];
assign Y[10]=v[39];
assign Y[9]=v[40];
assign Y[8]=v[41];
assign Y[7]=v[42];
assign Y[6]=v[43];
assign Y[5]=v[44];
assign Y[4]=v[45];
assign Y[3]=v[46];
assign Y[2]=v[47];
assign Y[1]=v[48];
assign Y[0]=v[49];
GND  c0 (.G(v[33]));
VCC  c1 (.P(v[50]));
LUT5 #(.INIT(32'hA666AAAA)) c2 (.O(v[51]),.I0(v[52]),.I1(v[53]),.I2(v[54]),.I3(v[55]),.I4(v[56]));
LUT3 #(.INIT(8'hE8)) c3 (.O(v[57]),.I0(v[58]),.I1(v[59]),.I2(v[60]));
LUT6 #(.INIT(64'h9996969696666666)) c4 (.O(v[60]),.I0(v[61]),.I1(v[62]),.I2(v[63]),.I3(v[64]),.I4(v[65]),.I5(v[66]));
LUT4 #(.INIT(16'h8778)) c5 (.O(v[67]),.I0(v[64]),.I1(v[65]),.I2(v[66]),.I3(v[63]));
LUT6 #(.INIT(64'h7FFF135F8000ECA0)) c6 (.O(v[68]),.I0(v[54]),.I1(v[69]),.I2(v[70]),.I3(v[56]),.I4(v[71]),.I5(v[64]));
LUT6 #(.INIT(64'hE88E8EE88EE88EE8)) c7 (.O(v[72]),.I0(v[73]),.I1(v[74]),.I2(v[52]),.I3(v[75]),.I4(v[56]),.I5(v[53]));
LUT6 #(.INIT(64'hA999955556666AAA)) c8 (.O(v[76]),.I0(v[77]),.I1(v[52]),.I2(v[56]),.I3(v[53]),.I4(v[75]),.I5(v[78]));
LUT3 #(.INIT(8'hE8)) c9 (.O(v[79]),.I0(v[80]),.I1(v[81]),.I2(v[68]));
LUT3 #(.INIT(8'h96)) c10 (.O(v[82]),.I0(v[59]),.I1(v[60]),.I2(v[58]));
LUT6 #(.INIT(64'h9696960096000000)) c11 (.O(v[83]),.I0(v[78]),.I1(v[84]),.I2(v[77]),.I3(v[51]),.I4(v[74]),.I5(v[73]));
LUT4 #(.INIT(16'h7888)) c12 (.O(v[61]),.I0(v[53]),.I1(v[54]),.I2(v[55]),.I3(v[56]));
LUT6 #(.INIT(64'hF880808088000000)) c13 (.O(v[62]),.I0(v[53]),.I1(v[85]),.I2(v[56]),.I3(v[55]),.I4(v[54]),.I5(v[86]));
LUT6 #(.INIT(64'hF888800080008000)) c14 (.O(v[63]),.I0(v[55]),.I1(v[85]),.I2(v[56]),.I3(v[70]),.I4(v[54]),.I5(v[86]));
LUT6 #(.INIT(64'h8777788878887888)) c15 (.O(v[64]),.I0(v[86]),.I1(v[54]),.I2(v[56]),.I3(v[70]),.I4(v[85]),.I5(v[55]));
LUT6 #(.INIT(64'h8777788878887888)) c16 (.O(v[66]),.I0(v[55]),.I1(v[54]),.I2(v[85]),.I3(v[53]),.I4(v[56]),.I5(v[86]));
LUT6 #(.INIT(64'h8777788878887888)) c17 (.O(v[87]),.I0(v[88]),.I1(v[89]),.I2(v[90]),.I3(v[69]),.I4(v[91]),.I5(v[92]));
LUT4 #(.INIT(16'h7888)) c18 (.O(v[93]),.I0(v[90]),.I1(v[89]),.I2(v[92]),.I3(v[94]));
LUT2 #(.INIT(4'h8)) c19 (.O(v[95]),.I0(v[94]),.I1(v[88]));
LUT5 #(.INIT(32'h6AAAAAAA)) c20 (.O(v[96]),.I0(v[87]),.I1(v[92]),.I2(v[89]),.I3(v[94]),.I4(v[90]));
LUT4 #(.INIT(16'h9600)) c21 (.O(v[97]),.I0(v[73]),.I1(v[51]),.I2(v[74]),.I3(v[57]));
LUT6 #(.INIT(64'h8777788878887888)) c22 (.O(v[98]),.I0(v[94]),.I1(v[92]),.I2(v[89]),.I3(v[90]),.I4(v[88]),.I5(v[91]));
LUT4 #(.INIT(16'h7888)) c23 (.O(v[99]),.I0(v[88]),.I1(v[94]),.I2(v[90]),.I3(v[91]));
LUT2 #(.INIT(4'h7)) c24 (.O(v[71]),.I0(v[85]),.I1(v[86]));
LUT4 #(.INIT(16'h8000)) c25 (.O(v[75]),.I0(v[53]),.I1(v[54]),.I2(v[55]),.I3(v[56]));
LUT6 #(.INIT(64'h9696960096000000)) c26 (.O(v[100]),.I0(v[58]),.I1(v[60]),.I2(v[59]),.I3(v[67]),.I4(v[101]),.I5(v[102]));
LUT6 #(.INIT(64'h9696960096000000)) c27 (.O(v[103]),.I0(v[67]),.I1(v[101]),.I2(v[102]),.I3(v[68]),.I4(v[81]),.I5(v[80]));
LUT6 #(.INIT(64'h7EE8811781177EE8)) c28 (.O(v[104]),.I0(v[72]),.I1(v[78]),.I2(v[77]),.I3(v[84]),.I4(v[105]),.I5(v[106]));
LUT5 #(.INIT(32'h9336366C)) c29 (.O(v[107]),.I0(v[57]),.I1(v[76]),.I2(v[73]),.I3(v[74]),.I4(v[51]));
LUT5 #(.INIT(32'h96696996)) c30 (.O(v[108]),.I0(v[100]),.I1(v[74]),.I2(v[51]),.I3(v[73]),.I4(v[57]));
LUT5 #(.INIT(32'h9336366C)) c31 (.O(v[109]),.I0(v[79]),.I1(v[82]),.I2(v[102]),.I3(v[101]),.I4(v[67]));
LUT5 #(.INIT(32'hC0808080)) c32 (.O(v[84]),.I0(v[52]),.I1(v[56]),.I2(v[53]),.I3(v[54]),.I4(v[55]));
LUT6 #(.INIT(64'hF880808088000000)) c33 (.O(v[110]),.I0(v[55]),.I1(v[90]),.I2(v[86]),.I3(v[92]),.I4(v[70]),.I5(v[88]));
LUT6 #(.INIT(64'hF888800080008000)) c34 (.O(v[111]),.I0(v[90]),.I1(v[86]),.I2(v[70]),.I3(v[88]),.I4(v[92]),.I5(v[69]));
LUT6 #(.INIT(64'hF888800080008000)) c35 (.O(v[112]),.I0(v[70]),.I1(v[90]),.I2(v[92]),.I3(v[89]),.I4(v[88]),.I5(v[69]));
LUT6 #(.INIT(64'hF880808088000000)) c36 (.O(v[113]),.I0(v[69]),.I1(v[90]),.I2(v[92]),.I3(v[89]),.I4(v[88]),.I5(v[91]));
LUT6 #(.INIT(64'h956A6A956A956A95)) c37 (.O(v[114]),.I0(v[110]),.I1(v[53]),.I2(v[90]),.I3(v[115]),.I4(v[88]),.I5(v[55]));
LUT6 #(.INIT(64'h956A6A956A956A95)) c38 (.O(v[116]),.I0(v[111]),.I1(v[92]),.I2(v[70]),.I3(v[117]),.I4(v[86]),.I5(v[88]));
LUT6 #(.INIT(64'h956A6A6A6A959595)) c39 (.O(v[118]),.I0(v[112]),.I1(v[90]),.I2(v[86]),.I3(v[69]),.I4(v[92]),.I5(v[119]));
LUT6 #(.INIT(64'h956A6A956A956A95)) c40 (.O(v[120]),.I0(v[113]),.I1(v[90]),.I2(v[70]),.I3(v[121]),.I4(v[88]),.I5(v[69]));
LUT2 #(.INIT(4'h8)) c41 (.O(v[122]),.I0(v[53]),.I1(v[123]));
LUT2 #(.INIT(4'h8)) c42 (.O(v[124]),.I0(v[55]),.I1(v[123]));
LUT6 #(.INIT(64'hFFFFEA80EA800000)) c43 (.O(v[52]),.I0(v[63]),.I1(v[64]),.I2(v[65]),.I3(v[66]),.I4(v[61]),.I5(v[62]));
LUT2 #(.INIT(4'h7)) c44 (.O(v[115]),.I0(v[86]),.I1(v[92]));
LUT2 #(.INIT(4'h7)) c45 (.O(v[117]),.I0(v[90]),.I1(v[55]));
LUT2 #(.INIT(4'h7)) c46 (.O(v[119]),.I0(v[70]),.I1(v[88]));
LUT2 #(.INIT(4'h7)) c47 (.O(v[121]),.I0(v[92]),.I1(v[89]));
LUT6 #(.INIT(64'h11171777EEE8E888)) c48 (.O(v[125]),.I0(v[105]),.I1(v[106]),.I2(v[78]),.I3(v[77]),.I4(v[84]),.I5(v[126]));
LUT4 #(.INIT(16'h8000)) c49 (.O(v[127]),.I0(v[55]),.I1(v[92]),.I2(v[53]),.I3(v[88]));
LUT6 #(.INIT(64'hF888800080008000)) c50 (.O(v[128]),.I0(v[53]),.I1(v[90]),.I2(v[86]),.I3(v[92]),.I4(v[88]),.I5(v[55]));
LUT4 #(.INIT(16'h7000)) c51 (.O(v[129]),.I0(v[88]),.I1(v[55]),.I2(v[92]),.I3(v[53]));
LUT6 #(.INIT(64'hE75F30007800F000)) c52 (.O(v[130]),.I0(v[86]),.I1(v[90]),.I2(v[88]),.I3(v[53]),.I4(v[92]),.I5(v[55]));
LUT1 #(.INIT(2'h1)) c53 (.O(v[131]),.I0(v[132]));
LUT6 #(.INIT(64'h6A95956A956A956A)) c54 (.O(v[136]),.I0(v[137]),.I1(v[123]),.I2(v[69]),.I3(v[135]),.I4(v[53]),.I5(v[134]));
LUT5 #(.INIT(32'h87787878)) c55 (.O(v[138]),.I0(v[134]),.I1(v[55]),.I2(v[139]),.I3(v[89]),.I4(v[123]));
LUT3 #(.INIT(8'h96)) c56 (.O(v[141]),.I0(v[80]),.I1(v[81]),.I2(v[68]));
LUT6 #(.INIT(64'h17E8E817E81717E8)) c57 (.O(v[142]),.I0(v[68]),.I1(v[81]),.I2(v[80]),.I3(v[67]),.I4(v[101]),.I5(v[102]));
LUT5 #(.INIT(32'h69696996)) c58 (.O(v[143]),.I0(v[68]),.I1(v[81]),.I2(v[80]),.I3(v[144]),.I4(v[140]));
LUT3 #(.INIT(8'h69)) c59 (.O(v[145]),.I0(v[144]),.I1(v[140]),.I2(v[146]));
LUT5 #(.INIT(32'hF8888000)) c60 (.O(v[137]),.I0(v[55]),.I1(v[134]),.I2(v[89]),.I3(v[123]),.I4(v[139]));
LUT2 #(.INIT(4'h8)) c61 (.O(v[148]),.I0(v[86]),.I1(v[123]));
FDRE #(.INIT(1'b0)) c62 (.Q(v[49]),.C(v[0]),.CE(v[50]),.D(v[149]),.R(v[33]));
FDRE #(.INIT(1'b0)) c63 (.Q(v[39]),.C(v[0]),.CE(v[50]),.D(v[150]),.R(v[33]));
FDRE #(.INIT(1'b0)) c64 (.Q(v[38]),.C(v[0]),.CE(v[50]),.D(v[151]),.R(v[33]));
FDRE #(.INIT(1'b0)) c65 (.Q(v[37]),.C(v[0]),.CE(v[50]),.D(v[152]),.R(v[33]));
CARRY4  c66 (.CO({v[154],v[155],v[156],v[157]}),.O({v[152],v[151],v[150],v[158]}),.DI({v[83],v[97],v[100],v[103]}),.S({v[104],v[107],v[108],v[109]}),.CI(v[153]),.CYINIT(v[33]));
CARRY4  c67 (.CO({v[159],v[160],v[161],v[162]}),.O({v[101],v[81],v[144],v[163]}),.DI({v[87],v[93],v[95],v[33]}),.S({v[96],v[98],v[99],v[33]}),.CI(v[33]),.CYINIT(v[33]));
FDRE #(.INIT(1'b0)) c68 (.Q(v[36]),.C(v[0]),.CE(v[50]),.D(v[164]),.R(v[33]));
FDRE #(.INIT(1'b0)) c69 (.Q(v[35]),.C(v[0]),.CE(v[50]),.D(v[165]),.R(v[33]));
FDRE #(.INIT(1'b0)) c70 (.Q(v[34]),.C(v[0]),.CE(v[50]),.D(v[166]),.R(v[33]));
CARRY4  c71 (.CO({v[167],v[168],v[169],v[170]}),.O({v[171],v[166],v[165],v[164]}),.DI({v[33],v[33],v[33],v[126]}),.S({v[33],v[172],v[173],v[125]}),.CI(v[154]),.CYINIT(v[33]));
CARRY4  c72 (.CO({v[175],v[172],v[176],v[177]}),.O({v[178],v[179],v[173],v[126]}),.DI({v[33],v[33],v[127],v[128]}),.S({v[33],v[50],v[129],v[130]}),.CI(v[174]),.CYINIT(v[33]));
CARRY4  c73 (.CO({v[174],v[180],v[181],v[182]}),.O({v[106],v[77],v[74],v[59]}),.DI({v[110],v[111],v[112],v[113]}),.S({v[114],v[116],v[118],v[120]}),.CI(v[159]),.CYINIT(v[33]));
CARRY4  c74 (.CO({v[184],v[105],v[185],v[186]}),.O({v[187],v[188],v[78],v[73]}),.DI({v[33],v[33],v[33],v[33]}),.S({v[33],v[50],v[122],v[124]}),.CI(v[183]),.CYINIT(v[33]));
FDRE #(.INIT(1'b0)) c75 (.Q(v[48]),.C(v[0]),.CE(v[50]),.D(v[189]),.R(v[33]));
FDRE #(.INIT(1'b0)) c76 (.Q(v[47]),.C(v[0]),.CE(v[50]),.D(v[190]),.R(v[33]));
FDRE #(.INIT(1'b0)) c77 (.Q(v[46]),.C(v[0]),.CE(v[50]),.D(v[191]),.R(v[33]));
FDRE #(.INIT(1'b0)) c78 (.Q(v[45]),.C(v[0]),.CE(v[50]),.D(v[131]),.R(v[33]));
FDRE #(.INIT(1'b0)) c79 (.Q(v[44]),.C(v[0]),.CE(v[50]),.D(v[192]),.R(v[33]));
FDRE #(.INIT(1'b0)) c80 (.Q(v[43]),.C(v[0]),.CE(v[50]),.D(v[193]),.R(v[33]));
FDRE #(.INIT(1'b0)) c81 (.Q(v[42]),.C(v[0]),.CE(v[50]),.D(v[194]),.R(v[33]));
FDRE #(.INIT(1'b0)) c82 (.Q(v[41]),.C(v[0]),.CE(v[50]),.D(v[195]),.R(v[33]));
CARRY4  c83 (.CO({v[153],v[196],v[197],v[198]}),.O({v[195],v[194],v[193],v[192]}),.DI({v[33],v[141],v[146],v[33]}),.S({v[142],v[143],v[145],v[199]}),.CI(v[33]),.CYINIT(v[132]));
CARRY4  c84 (.CO({v[183],v[200],v[201],v[202]}),.O({v[58],v[102],v[80],v[146]}),.DI({v[33],v[147],v[137],v[33]}),.S({v[148],v[133],v[136],v[138]}),.CI(v[33]),.CYINIT(v[33]));
FDRE #(.INIT(1'b0)) c85 (.Q(v[40]),.C(v[0]),.CE(v[50]),.D(v[158]),.R(v[33]));
FDRE #(.INIT(1'b0)) c86 (.Q(v[94]),.C(v[0]),.CE(v[50]),.D(v[16]),.R(v[33]));
FDRE #(.INIT(1'b0)) c87 (.Q(v[91]),.C(v[0]),.CE(v[50]),.D(v[15]),.R(v[33]));
FDRE #(.INIT(1'b0)) c88 (.Q(v[89]),.C(v[0]),.CE(v[50]),.D(v[14]),.R(v[33]));
FDRE #(.INIT(1'b0)) c89 (.Q(v[69]),.C(v[0]),.CE(v[50]),.D(v[13]),.R(v[33]));
FDRE #(.INIT(1'b0)) c90 (.Q(v[70]),.C(v[0]),.CE(v[50]),.D(v[12]),.R(v[33]));
FDRE #(.INIT(1'b0)) c91 (.Q(v[86]),.C(v[0]),.CE(v[50]),.D(v[11]),.R(v[33]));
FDRE #(.INIT(1'b0)) c92 (.Q(v[55]),.C(v[0]),.CE(v[50]),.D(v[10]),.R(v[33]));
FDRE #(.INIT(1'b0)) c93 (.Q(v[53]),.C(v[0]),.CE(v[50]),.D(v[9]),.R(v[33]));
FDRE #(.INIT(1'b0)) c94 (.Q(v[134]),.C(v[0]),.CE(v[50]),.D(v[32]),.R(v[33]));
FDRE #(.INIT(1'b0)) c95 (.Q(v[190]),.C(v[0]),.CE(v[50]),.D(v[22]),.R(v[33]));
FDRE #(.INIT(1'b0)) c96 (.Q(v[191]),.C(v[0]),.CE(v[50]),.D(v[21]),.R(v[33]));
FDRE #(.INIT(1'b0)) c97 (.Q(v[132]),.C(v[0]),.CE(v[50]),.D(v[20]),.R(v[33]));
FDRE #(.INIT(1'b0)) c98 (.Q(v[199]),.C(v[0]),.CE(v[50]),.D(v[19]),.R(v[33]));
FDRE #(.INIT(1'b0)) c99 (.Q(v[139]),.C(v[0]),.CE(v[50]),.D(v[18]),.R(v[33]));
FDRE #(.INIT(1'b0)) c100 (.Q(v[135]),.C(v[0]),.CE(v[50]),.D(v[17]),.R(v[33]));
FDRE #(.INIT(1'b0)) c101 (.Q(v[85]),.C(v[0]),.CE(v[50]),.D(v[31]),.R(v[33]));
FDRE #(.INIT(1'b0)) c102 (.Q(v[54]),.C(v[0]),.CE(v[50]),.D(v[30]),.R(v[33]));
FDRE #(.INIT(1'b0)) c103 (.Q(v[56]),.C(v[0]),.CE(v[50]),.D(v[29]),.R(v[33]));
FDRE #(.INIT(1'b0)) c104 (.Q(v[123]),.C(v[0]),.CE(v[50]),.D(v[28]),.R(v[33]));
FDRE #(.INIT(1'b0)) c105 (.Q(v[90]),.C(v[0]),.CE(v[50]),.D(v[27]),.R(v[33]));
FDRE #(.INIT(1'b0)) c106 (.Q(v[88]),.C(v[0]),.CE(v[50]),.D(v[26]),.R(v[33]));
FDRE #(.INIT(1'b0)) c107 (.Q(v[92]),.C(v[0]),.CE(v[50]),.D(v[25]),.R(v[33]));
FDRE #(.INIT(1'b0)) c108 (.Q(v[149]),.C(v[0]),.CE(v[50]),.D(v[24]),.R(v[33]));
FDRE #(.INIT(1'b0)) c109 (.Q(v[189]),.C(v[0]),.CE(v[50]),.D(v[23]),.R(v[33]));
LUT1 #(.INIT(2'h2)) c110 (.I0(v[205]),.O(v[140]));
LUT1 #(.INIT(2'h2)) c111 (.I0(v[203]),.O(v[65]));
LUT1 #(.INIT(2'h2)) c112 (.I0(v[208]),.O(v[133]));
LUT1 #(.INIT(2'h2)) c113 (.I0(v[206]),.O(v[147]));
assign v[209]=~v[56];
LUT6_2 #(.INIT(64'h936c5fa0ec80a000)) direct_quadol_10 (.I0(v[70]),.I1(v[85]),.I2(v[54]),.I3(v[69]),.I4(v[86]),.I5(v[209]),.O6(v[205]),.O5(v[203]));
LUT6_2 #(.INIT(64'h42226aaae888c000)) direct_quadol_21 (.I0(v[123]),.I1(v[135]),.I2(v[134]),.I3(v[53]),.I4(v[69]),.I5(v[70]),.O6(v[208]),.O5(v[206]));
endmodule

module r23_fir8_quadol_wce_signed(input wire clk,input wire [15:0] A,B,output reg [31:0] Y);
wire [15:0] ma=A[15]?-A:A,mb=B[15]?-B:B;
wire [31:0] p;
r21_mac8_add8_b256_column_mse_quadol_wce u(.clk(clk),.A({8'b0,ma[7:0]}),.B({8'b0,mb[7:0]}),.Y(p));
reg s1,s2;
always @(posedge clk)begin s1<=A[15]^B[15];s2<=s1;Y<=s2?-$signed(p):$signed(p);end
endmodule
module r23_fir8_quadol_wce(
 input wire clk, reset,
 input wire coeff_we, input wire [3:0] coeff_addr,
 input wire signed [7:0] coeff_data,
 input wire sample_valid, input wire signed [7:0] sample_data,
 output wire sample_ready,
 output reg result_valid, output reg signed [39:0] result
);
localparam integer TAPS=16;
localparam integer LAT=3;
reg signed [7:0] history[0:TAPS-1];
reg signed [7:0] coeff[0:TAPS-1];
reg busy;
reg [4:0] index;
wire issue=busy && index<TAPS;
wire [15:0] a=issue?{{8{history[index[3:0]][7]}},history[index[3:0]]}:16'b0;
wire [15:0] b=issue?{{8{coeff[index[3:0]][7]}},coeff[index[3:0]]}:16'b0;
wire [31:0] p_bits;
wire signed [39:0] product={{8{p_bits[31]}},p_bits};
r23_fir8_quadol_wce_signed core(.clk(clk),.A(a),.B(b),.Y(p_bits));
reg [LAT-1:0] vpipe,firstpipe,lastpipe;
reg signed [39:0] acc;
wire signed [39:0] next_acc=firstpipe[LAT-1]?product:acc+product;
assign sample_ready=!busy && !coeff_we;
integer j;
always @(posedge clk) begin
 if(reset)begin
  busy<=0;index<=0;vpipe<=0;firstpipe<=0;lastpipe<=0;
  acc<=0;result<=0;result_valid<=0;
  for(j=0;j<TAPS;j=j+1)history[j]<=0;
 end else begin
  result_valid<=0;
  if(coeff_we && !busy)coeff[coeff_addr]<=coeff_data;
  vpipe<={vpipe[LAT-2:0],issue};
  firstpipe<={firstpipe[LAT-2:0],issue && index==0};
  lastpipe<={lastpipe[LAT-2:0],issue && index==TAPS-1};
  if(sample_valid && sample_ready)begin
   for(j=TAPS-1;j>0;j=j-1)history[j]<=history[j-1];
   history[0]<=sample_data;busy<=1;index<=0;acc<=0;
  end
  if(issue)index<=index+1'b1;
  if(vpipe[LAT-1])begin
   acc<=next_acc;
   if(lastpipe[LAT-1])begin result<=next_acc;result_valid<=1;busy<=0;end
  end
 end
end
endmodule
