// (FSRCNNX_x2_8-0-4-1_LA) sub-pixel convolution 1


cbuffer constants : register(b0) {
	int2 srcSize : packoffset(c0.x);
};


#define MAGPIE_INPUT_COUNT 2
#include "common.hlsli"

#define get0(pos) uncompressLinear(SampleInput(0, pos), -1.5, 2)
#define get1(pos) uncompressLinear(SampleInput(1, pos), -1, 4)


D2D_PS_ENTRY(main) {
	InitMagpieSampleInput();

	float2 leftTop = GetCheckedOffPos(0, float2(-1, -1));
	float2 rightBottom = GetCheckedOffPos(0, float2(1, 1));

	float4 res = { 0.2160381823778152,0.2298326790332794,0.2062894254922867,0.2233859002590179 };
	res += mul(get0(leftTop), float4x4(-0.0031023439951241, 0.0059619112871587, 0.0058020050637424, 0.0062482208013535, 0.0052765505388379, -0.0022552218288183, -0.0065842187032104, -0.0008604917675257, 0.0003460258303676, -0.0022195784840733, -0.0074996319599450, -0.0015739878872409, 0.0056171459145844, 0.0002592361997813, 0.0019835520070046, 0.0018105609342456));
	res += mul(get1(leftTop), float4x4(0.0275507327169180, 0.0051669259555638, -0.0139658711850643, 0.0030883529689163, 0.0089544747024775, 0.0085759535431862, -0.0002981633588206, -0.0054096584208310, -0.0125233745202422, 0.0065056309103966, 0.0073427790775895, 0.0003864165919367, -0.0041021117940545, 0.0030372787732631, 0.0006185144884512, 0.0062267151661217));
	res += mul(get0(float2(leftTop.x, Coord(0).y)), float4x4(0.0105074141174555, -0.0004502697847784, -0.0009122507181019, 0.0026426143012941, 0.0040101194754243, -0.0023395312018692, 0.0017362632788718, 0.0091658774763346, 0.0205013062804937, -0.0020239499863237, -0.0114130824804306, -0.0075353132560849, 0.0225470513105392, -0.0366680622100830, -0.0000535918843525, 0.0050146644935012));
	res += mul(get1(float2(leftTop.x, Coord(0).y)), float4x4(0.0625989288091660, 0.1151928976178169, -0.0027104590553790, -0.0123298475518823, -0.0099824573844671, 0.0108926137909293, 0.0334197729825974, 0.0193741749972105, 0.0490560680627823, 0.0152345551177859, 0.0405332818627357, 0.0399475656449795, 0.0105373272672296, -0.0020778691396117, -0.0097913276404142, 0.0004653275245801));
	res += mul(get0(float2(leftTop.x, rightBottom.y)), float4x4(-0.0080901645123959, -0.0073888520710170, -0.0015905323671177, 0.0006022278103046, -0.0082205599173903, -0.0010853469138965, 0.0055166282691061, 0.0084898881614208, 0.0071090045385063, 0.0003273489419371, -0.0063129402697086, -0.0121429329738021, -0.0069875395856798, -0.0045646210201085, 0.0015905641485006, 0.0037552448920906));
	res += mul(get1(float2(leftTop.x, rightBottom.y)), float4x4(-0.0046724923886359, 0.0016644159331918, 0.0062663913704455, 0.0014710600953549, -0.0338839665055275, -0.0083738788962364, 0.0060393707826734, 0.0241303537040949, -0.0034021178726107, 0.0056042689830065, -0.0083823651075363, 0.0026392592117190, 0.0026657863054425, 0.0020144139416516, -0.0042312326841056, -0.0035609540063888));
	res += mul(get0(float2(Coord(0).x, leftTop.y)), float4x4(0.0009882192825899, 0.0002152582601411, -0.0123004913330078, -0.0005484037101269, -0.0111524788662791, 0.0119459852576256, -0.0154546750709414, 0.0188625976443291, 0.0204733721911907, -0.0079483250156045, -0.0007576426141895, -0.0042714662849903, 0.0307108033448458, -0.0069440440274775, 0.0000003838358680, 0.0070015545934439));
	res += mul(get1(float2(Coord(0).x, leftTop.y)), float4x4(-0.0063984976150095, -0.0027606852818280, -0.0355033427476883, 0.0163108259439468, -0.0317453853785992, 0.0353556163609028, -0.0016268522012979, 0.0312290452420712, 0.0149499354884028, -0.0139254443347454, 0.0109228380024433, 0.0234404578804970, 0.0088780215010047, 0.0083913588896394, 0.0070422240532935, 0.0086190626025200));
	res += mul(get0(Coord(0).xy), float4x4(0.4668360948562622, 0.5502970218658447, 0.5616708993911743, 0.4827409684658051, -0.4825374484062195, -0.4473012387752533, -0.3305214643478394, -0.5241096019744873, -0.1466400325298309, 0.0804405659437180, 0.0349484048783779, 0.0052239256910980, -0.1175492331385612, 0.0954673886299133, 0.1326161473989487, -0.1377900093793869));
	res += mul(get1(Coord(0).xy), float4x4(0.0407393611967564, 0.0987918972969055, -0.0807525441050529, -0.1235820129513741, -0.0658119991421700, 0.0621846020221710, -0.0816140249371529, 0.0406704805791378, 0.3287288248538971, 0.3512411415576935, -0.3979234397411346, -0.3275865316390991, 0.2961717247962952, 0.0169802401214838, 0.2695185840129852, 0.0150923738256097));
	res += mul(get0(float2(Coord(0).x, rightBottom.y)), float4x4(-0.0050105354748666, -0.0008035619393922, -0.0079824347048998, 0.0376648232340813, -0.0048509594053030, -0.0067090289667249, -0.0259696990251541, 0.0086074192076921, 0.0126011213287711, -0.0174850821495056, 0.0156697910279036, 0.0028463243506849, 0.0099161649122834, -0.0114374589174986, -0.0169337950646877, 0.0257211104035378));
	res += mul(get1(float2(Coord(0).x, rightBottom.y)), float4x4(0.0043578865006566, -0.0106186466291547, 0.0165964700281620, 0.0014091627672315, 0.0037815889809281, 0.0364324115216732, -0.0395258180797100, 0.0625703483819962, -0.0144113656133413, 0.0321297869086266, 0.0208382532000542, -0.0383783876895905, -0.0258011315017939, -0.0143258580937982, -0.0092717679217458, -0.0178859047591686));
	res += mul(get0(float2(rightBottom.x, leftTop.y)), float4x4(-0.0050332350656390, -0.0001488960406277, -0.0115145305171609, 0.0045622875913978, -0.0021374952048063, 0.0015796425286680, -0.0077072884887457, 0.0015828146133572, 0.0171351470053196, 0.0024297721683979, -0.0374940223991871, 0.0058337682858109, -0.0027352231554687, 0.0007051698048599, -0.0002820930676535, -0.0036236173473299));
	res += mul(get1(float2(rightBottom.x, leftTop.y)), float4x4(0.0016052227001637, 0.0049667325802147, -0.0081164520233870, -0.0035548578016460, -0.0131295239552855, 0.0158293209969997, -0.0340857952833176, 0.0222462061792612, -0.0019779701251537, -0.0012918257853016, 0.0048964750021696, 0.0049310824833810, 0.0011332486756146, -0.0004788591759279, -0.0017202866729349, 0.0012215448077768));
	res += mul(get0(float2(rightBottom.x, Coord(0).y)), float4x4(-0.0057867411524057, -0.0133802210912108, 0.0158019792288542, 0.0344623439013958, -0.0040443707257509, -0.0037790425121784, 0.0045541841536760, 0.0198037009686232, 0.1110823750495911, 0.0822209641337395, -0.0382958762347698, -0.1459431499242783, 0.0010219293180853, -0.0161874033510685, -0.0285891294479370, 0.0300961043685675));
	res += mul(get1(float2(rightBottom.x, Coord(0).y)), float4x4(-0.0089390166103840, -0.0105021111667156, -0.0130960196256638, -0.0257005076855421, 0.0099271116778255, -0.0267942640930414, 0.0677764937281609, 0.0239320658147335, -0.0469516664743423, -0.0230019800364971, -0.0446235798299313, -0.0338921397924423, -0.0061601125635207, 0.0139691382646561, -0.0029954034835100, -0.0108477231115103));
	res += mul(get0(rightBottom), float4x4(-0.0002513871586416, 0.0017334159929305, -0.0072467559948564, -0.0149013847112656, -0.0091025009751320, -0.0054195052944124, -0.0053499941714108, 0.0118143679574132, -0.0134334927424788, 0.0106377983465791, -0.0072384304367006, 0.0483081750571728, -0.0011459409724921, -0.0010465533705428, 0.0040362793952227, -0.0004637696838472));
	res += mul(get1(rightBottom), float4x4(0.0037248437292874, 0.0041816406883299, -0.0139264371246099, 0.0035959482192993, -0.0390684641897678, -0.0257617402821779, -0.0298785082995892, -0.0066674682311714, -0.0151000469923019, -0.0176323894411325, 0.0045121158473194, 0.0077007445506752, 0.0051746177487075, 0.0075236861594021, 0.0008582049049437, 0.0010294843232259));
	return res;
}
