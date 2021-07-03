// (FSRCNNX_x2_8-0-4-1) mapping 1_2


cbuffer constants : register(b0) {
	int2 srcSize : packoffset(c0.x);
};


#define MAGPIE_INPUT_COUNT 2
#include "common.hlsli"

#define get0(pos) uncompressLinear(SampleInput(0, pos), -1, 1.5)
#define get1(pos) uncompressLinear(SampleInput(1, pos), -2, 2)


D2D_PS_ENTRY(main) {
	InitMagpieSampleInput();

	float2 leftTop = GetCheckedOffPos(0, float2(-1, -1));
	float2 rightBottom = GetCheckedOffPos(0, float2(1, 1));

	float4 res = { 0.0713458731770515,-0.1403961777687073,-0.0019562745001167,0.0153338573873043 };
	res += mul(get0(leftTop), float4x4(-0.0950641855597496, -0.1496641039848328, -0.0653550028800964, 0.0655386000871658, -0.0118882004171610, 0.2012491524219513, -0.2844599783420563, -0.4794720113277435, 0.1128025799989700, -0.0173030979931355, -0.0558849945664406, -0.2957552075386047, 0.0128202112391591, 0.0199047476053238, -0.0091027505695820, -0.0789640173316002));
	res += mul(get1(leftTop), float4x4(0.1597457975149155, -0.0476507246494293, 0.1466529071331024, 0.0859163030982018, 0.0797316282987595, -0.3380981683731079, 0.2370245009660721, -0.1145931258797646, -0.0352988094091415, -0.0444888733327389, -0.2100716233253479, 0.1305520236492157, -0.1359029710292816, 0.1097442805767059, 0.0449938289821148, -0.1155664771795273));
	res += mul(get0(float2(leftTop.x, Coord(0).y)), float4x4(-0.0333916284143925, 0.2415594160556793, 0.0520512908697128, 0.1228107511997223, -0.0491011217236519, 0.4408806562423706, 0.4631956815719604, 0.2014560103416443, -0.3688595592975616, 0.0367180295288563, 0.2484581321477890, -0.1113442853093147, 0.1283355057239532, 0.0418004281818867, -0.0171243026852608, -0.1231943219900131));
	res += mul(get1(float2(leftTop.x, Coord(0).y)), float4x4(0.3493446409702301, 0.4550022482872009, 0.0368724688887596, 0.0748724937438965, 0.5001406073570251, 0.0145555436611176, 0.1236629858613014, 0.3143120706081390, -0.1951988488435745, -0.0157914645969868, 0.0937998965382576, -0.2233840376138687, 0.5033411383628845, -0.3183194100856781, -0.2259195148944855, 0.3639536798000336));
	res += mul(get0(float2(leftTop.x, rightBottom.y)), float4x4(-0.0742707476019859, -0.1287801116704941, -0.2533137500286102, 0.0666435658931732, -0.0185621567070484, 0.1427449285984039, -0.0724751204252243, -0.0781485065817833, -0.2270648330450058, -0.2314778864383698, 0.3814929425716400, -0.1655400246381760, 0.0408568829298019, -0.1139645278453827, 0.1797397136688232, -0.0245632305741310));
	res += mul(get1(float2(leftTop.x, rightBottom.y)), float4x4(0.1184135973453522, 0.0439366139471531, 0.0225226897746325, -0.0038526873104274, 0.1292685419321060, 0.0629177838563919, 0.3455114960670471, -0.1857204884290695, -0.4921502172946930, -0.1171003505587578, 0.0188624169677496, -0.1101682260632515, 0.0676844567060471, 0.5154085755348206, -0.0898379907011986, 0.3413280248641968));
	res += mul(get0(float2(Coord(0).x, leftTop.y)), float4x4(-0.2631838321685791, 0.0215514600276947, 0.3092688918113708, -0.0200904365628958, 0.0678770467638969, 0.1769931465387344, -0.3653681278228760, -0.3274513185024261, 0.4608019888401031, -0.1544784456491470, 0.1189439669251442, 0.7015876173973083, 0.2732816934585571, -0.0545057803392410, -0.3474545478820801, -0.0253226496279240));
	res += mul(get1(float2(Coord(0).x, leftTop.y)), float4x4(0.0994316861033440, 0.0642566010355949, 0.2031503319740295, 0.2276959568262100, -0.1094077304005623, 0.4463521838188171, 0.0921792611479759, -0.3033096492290497, -0.0953373983502388, -0.1331395804882050, 0.2615413069725037, -0.2874414622783661, -0.0389687754213810, 0.0338272154331207, 0.2804331183433533, -0.3443813025951385));
	res += mul(get0(Coord(0).xy), float4x4(-0.1806042939424515, -0.4840798676013947, 0.4222546219825745, 0.1238701492547989, 0.0117481639608741, -0.5986865758895874, 0.3057619929313660, 0.1934896260499954, -0.7086342573165894, -0.8567376136779785, 0.6944998502731323, -1.4599204063415527, 0.0886754393577576, -0.4293498098850250, -0.1524195969104767, 0.2418079674243927));
	res += mul(get1(Coord(0).xy), float4x4(2.1706113815307617, 0.3525652289390564, -0.7008359432220459, -0.4825965166091919, -0.3203429281711578, 0.8500943183898926, -0.7993509769439697, 0.4329842329025269, 0.2106771767139435, 1.1103280782699585, 1.2092385292053223, 1.4814503192901611, -0.4147390127182007, -0.7046836614608765, -0.1443170011043549, -0.6811133027076721));
	res += mul(get0(float2(Coord(0).x, rightBottom.y)), float4x4(-0.1489356607198715, 0.1400019824504852, 0.2425604313611984, -0.2098473459482193, -0.1580564379692078, 0.1463224738836288, -0.2187854647636414, 0.5174596905708313, -0.0143817225471139, -0.0362622961401939, -0.0068237944506109, 0.4749472737312317, 0.2914732992649078, -0.3306328952312469, -0.2444777786731720, -0.1171946674585342));
	res += mul(get1(float2(Coord(0).x, rightBottom.y)), float4x4(0.0455239675939083, 0.3496046066284180, 0.1297491937875748, -0.2541095912456512, 0.3605501055717468, 0.2339573651552200, -0.0188565086573362, -0.0526181310415268, 0.1471424549818039, 0.8212822079658508, 0.0819099843502045, -0.0851665437221527, 0.3739568293094635, 0.1304695755243301, 0.1481167376041412, -0.2134698331356049));
	res += mul(get0(float2(rightBottom.x, leftTop.y)), float4x4(-0.2076720446348190, -0.0932599306106567, 0.0648527294397354, -0.2374770641326904, -0.0927826911211014, 0.1848200261592865, 0.4131188094615936, 0.3280069231987000, -0.2099185734987259, 0.2130926996469498, -0.0362745784223080, 0.0191331822425127, 0.1590368449687958, 0.0303016249090433, 0.1207325309514999, 0.2451425045728683));
	res += mul(get1(float2(rightBottom.x, leftTop.y)), float4x4(-0.0135009605437517, -0.0101303057745099, 0.0752487555146217, 0.0533373840153217, -0.0253537259995937, 0.1318614929914474, -0.1263181120157242, 0.0249524712562561, -0.1477261483669281, 0.3236559033393860, 0.0773291289806366, -0.1439673304557800, -0.2005890905857086, 0.0892757251858711, 0.0398719944059849, 0.3675192892551422));
	res += mul(get0(float2(rightBottom.x, Coord(0).y)), float4x4(-0.0193535499274731, -0.2256918102502823, 0.0341436080634594, 0.0795947611331940, 0.1496857404708862, -0.2784725725650787, -0.0582313314080238, -0.2786065340042114, -0.1666128039360046, -0.6534121036529541, 0.2695854306221008, -0.0179719906300306, 0.0015976354479790, 0.0139929885044694, -0.1706486046314240, -0.3274765610694885));
	res += mul(get1(float2(rightBottom.x, Coord(0).y)), float4x4(-0.7170836329460144, 0.0868831276893616, 0.1829078495502472, -0.0076045366004109, 0.1525912433862686, -0.2558896839618683, 0.0893209800124168, -0.3426039516925812, -0.2871107757091522, -0.2445062994956970, 0.1676304638385773, 0.2116415053606033, 0.0883995518088341, -0.3880331516265869, 0.2636835277080536, -0.2514505982398987));
	res += mul(get0(rightBottom), float4x4(-0.1861270815134048, 0.2000686377286911, -0.1501186788082123, 0.1525203883647919, 0.1969228833913803, 0.1174068301916122, -0.1281060427427292, -0.0854888409376144, 0.0290613435208797, -0.0538076497614384, -0.0251582786440849, 0.0692845508456230, 0.0384319014847279, 0.2888138592243195, 0.1151804402470589, 0.0990421250462532));
	res += mul(get1(rightBottom), float4x4(-0.0344385802745819, 0.1270371377468109, 0.0922426953911781, -0.0426749102771282, -0.1656492203474045, -0.3273328542709351, -0.0282224025577307, 0.1099396124482155, -0.1113230437040329, 0.2943290174007416, -0.2181112915277481, -0.3177657723426819, -0.1096536740660667, -0.0508293099701405, -0.0256164856255054, -0.0388228967785835));
	res = max(res, ZEROS4) + float4(0.7142407894134521, 0.0686190053820610, 0.3999933302402496, -1.0247212648391724) * min(res, ZEROS4);

	return compressTan(res);
}
