// (FSRCNNX_x2_8-0-4-1) mapping 3_2


cbuffer constants : register(b0) {
	int2 srcSize : packoffset(c0.x);
};


#define MAGPIE_INPUT_COUNT 2
#include "common.hlsli"

#define get(i, pos) uncompressTan(SampleInput(i, pos))


D2D_PS_ENTRY(main) {
	InitMagpieSampleInput();

	float2 leftTop = GetCheckedOffPos(0, float2(-1, -1));
	float2 rightBottom = GetCheckedOffPos(0, float2(1, 1));

	float4 res = { -0.0089084329083562,-0.0336172059178352,0.0177190825343132,0.0529975406825542 };
	res += mul(get(0, leftTop), float4x4(-0.0275970958173275, 0.0141968233510852, 0.1181544512510300, -0.0572245270013809, 0.1161347925662994, -0.1156444773077965, -0.2549640238285065, 0.0882879272103310, -0.0715355500578880, 0.0151285668835044, 0.1079384386539459, 0.0650847703218460, -0.1597152203321457, 0.0669793561100960, 0.2084401696920395, -0.0951152443885803));
	res += mul(get(1, leftTop), float4x4(0.0404323227703571, -0.0206144321709871, -0.1080420613288879, -0.2038477361202240, 0.0248847268521786, -0.0064681121148169, 0.0389525443315506, 0.0011026862775907, 0.0885242074728012, 0.0295896343886852, -0.3323790132999420, 0.1935138553380966, -0.0466548874974251, 0.1023886054754257, 0.1257870644330978, -0.1541756242513657));
	res += mul(get(0, float2(leftTop.x, Coord(0).y)), float4x4(-0.0076520540751517, 0.0361139886081219, 0.1749804913997650, -0.2051989138126373, 0.0022692133206874, -0.0282937753945589, -0.2039019316434860, -0.2343468815088272, -0.0357327871024609, -0.0570764988660812, 0.2925858795642853, -0.1988349705934525, -0.0584560707211494, -0.0341510921716690, 0.1300961822271347, 0.5184492468833923));
	res += mul(get(1, float2(leftTop.x, Coord(0).y)), float4x4(0.0884973928332329, 0.0333527140319347, 0.0180535931140184, -0.2655122876167297, 0.0433661043643951, 0.0104369185864925, 0.0010909073753282, -0.0705273598432541, -0.0602585524320602, 0.2420269846916199, -0.4731841087341309, -0.8040290474891663, 0.3066828548908234, -0.2466925680637360, 0.0938910692930222, -0.2002603262662888));
	res += mul(get(0, float2(leftTop.x, rightBottom.y)), float4x4(0.0549152903258801, 0.0291299298405647, 0.0946277007460594, -0.0581608228385448, 0.0669180899858475, -0.0635575056076050, -0.2427970170974731, -0.2677550315856934, 0.2226776182651520, 0.1301570236682892, -0.1519709974527359, 0.0671724304556847, -0.0526433289051056, 0.1898351758718491, 0.2383745312690735, 0.21917118132114417));
	res += mul(get(1, float2(leftTop.x, rightBottom.y)), float4x4(-0.0234222635626793, 0.0238620284944773, 0.0427630320191383, -0.1080563366413116, 0.0332126952707767, -0.0039051575586200, 0.0293126031756401, 0.0161924213171005, 0.0453971028327942, 0.0131999952718616, -0.0689036697149277, 0.2349009960889816, 0.1013344153761864, 0.2706570029258728, 0.1191426888108253, -0.2830821871757507));
	res += mul(get(0, float2(Coord(0).x, leftTop.y)), float4x4(0.0181465242058039, -0.0571886636316776, 0.4875229001045227, -0.4244020283222198, 0.4331104159355164, 0.1066712513566017, -0.5277034044265747, 0.1110567077994347, -0.1179447323083878, -0.0273578558117151, 0.1798476576805115, -0.2829602360725403, 0.1012385115027428, -0.2528488039970398, 0.1697608679533005, 0.1121710017323494));
	res += mul(get(1, float2(Coord(0).x, leftTop.y)), float4x4(-0.1404130905866623, -0.0984055623412132, -0.0279541295021772, -0.1321212500333786, -0.0841855704784393, 0.1336171030998230, -0.1458790600299835, -0.0044095455668867, 0.2203754037618637, 0.1455714553594589, -0.2362042963504791, -0.0329121425747871, -0.1683547794818878, 0.0289597529917955, 0.3424547612667084, 0.0143845872953534));
	res += mul(get(0, Coord(0).xy), float4x4(0.0287246014922857, 0.1948280781507492, 0.5998955368995667, 0.1192114129662514, -0.6269109249114990, 0.8724324703216553, -0.6399638652801514, -0.4201497733592987, -0.3355066180229187, -0.1566904038190842, -0.4396412074565887, 0.1525828838348389, 0.5573399066925049, 0.2324324846267700, 0.2762884795665741, 0.0406046211719513));
	res += mul(get(1, Coord(0).xy), float4x4(0.3890096545219421, -0.0574061162769794, -0.1468243300914764, -0.5953360199928284, -0.1363215148448944, -0.2224670499563217, -0.2237723320722580, 0.2738097012042999, -0.4868114292621613, -0.5029351711273193, -0.3570256233215332, -0.1776263266801834, -0.0176672954112291, -0.4318660795688629, 1.0395888090133667, 0.1728395074605942));
	res += mul(get(0, float2(Coord(0).x, rightBottom.y)), float4x4(0.1337304115295410, -0.0809440389275551, 0.1600498855113983, -0.1108811497688293, -0.2376178801059723, -0.1532768607139587, -0.0447455830872059, 0.2515332102775574, 0.4848278462886810, -0.0915748402476311, -0.0336527302861214, -0.2141884714365005, 0.2125129699707031, 0.3237875998020172, 0.0022272330243140, -0.0167857185006142));
	res += mul(get(1, float2(Coord(0).x, rightBottom.y)), float4x4(0.0457934997975826, 0.0510537698864937, -0.0519523508846760, -0.4506326615810394, -0.1029204949736595, 0.0116113182157278, -0.1750748157501221, -0.0048758201301098, 0.1506977379322052, 0.0633068457245827, -0.1628549993038177, -0.0144928665831685, 0.1408756822347641, 0.2896180152893066, 0.0803691521286964, -0.4930096566677094));
	res += mul(get(0, float2(rightBottom.x, leftTop.y)), float4x4(-0.0484248884022236, 0.1371297985315323, -0.1235475391149521, -0.2618594765663147, -0.0280395895242691, 0.0248795989900827, 0.1204105168581009, 0.3246576189994812, 0.0426272377371788, -0.0520061068236828, 0.0575957447290421, -0.2613646090030670, 0.1165295541286469, -0.0390013493597507, -0.0470846109092236, -0.0014663023175672));
	res += mul(get(1, float2(rightBottom.x, leftTop.y)), float4x4(-0.1066762879490852, -0.0869804695248604, -0.0099332248792052, -0.1355892717838287, -0.0760413780808449, 0.1377770304679871, -0.0263407956808805, 0.0880135521292686, 0.1496269851922989, -0.0487459264695644, 0.1286851912736893, 0.2218491584062576, 0.1723349541425705, -0.0165541302412748, -0.0690477639436722, -0.2388458102941513));
	res += mul(get(0, float2(rightBottom.x, Coord(0).y)), float4x4(-0.4236431121826172, 0.0465179122984409, -0.1526456624269485, 0.1426440477371216, 0.5913932919502258, -0.1082349196076393, 0.2731275856494904, -0.2687640488147736, -0.4628683030605316, -0.0537119321525097, -0.1597615629434586, 0.0528527684509754, -0.3485085070133209, 0.1395110934972763, 0.0642972290515900, 0.0323829315602779));
	res += mul(get(1, float2(rightBottom.x, Coord(0).y)), float4x4(0.0066713397391140, -0.0482029877603054, -0.1707276403903961, -0.1001396998763084, 0.0539822019636631, -0.1624453216791153, 0.4913550019264221, 0.3687861263751984, 0.0491421781480312, 0.1311376541852951, 0.0992425829172134, -0.4636098444461823, -0.3415873646736145, -0.0153833786025643, -0.0270162131637335, -0.0935514941811562));
	res += mul(get(0, rightBottom), float4x4(-0.1738258153200150, 0.0458541549742222, -0.0653749182820320, -0.0156540926545858, -0.0357586294412613, -0.1486178338527679, 0.1798035055398941, -0.1310307979583740, 0.0783249065279961, -0.0261360015720129, -0.1047066971659660, 0.3385537564754486, -0.0339452810585499, 0.2299628853797913, -0.1408322304487228, -0.0352708548307419));
	res += mul(get(1, rightBottom), float4x4(0.0463018082082272, 0.0565674640238285, -0.0538956597447395, -0.2354862987995148, 0.0297824125736952, 0.0307939313352108, 0.1271791011095047, -0.1025698855519295, 0.1060482114553452, -0.0703211054205894, -0.0083062350749969, 0.0474255047738552, 0.0442508421838284, 0.1569559425115585, -0.0442709513008595, -0.1188704669475555));
	res = max(res, ZEROS4) + float4(0.7366524934768677, 1.0013850927352905, -0.0276311747729778, 0.0734841898083687) * min(res, ZEROS4);

	return compressTan(res);
}
