pragma solidity 0.8.15;

interface IPoseidonHasher {
	function hash(uint256[2] memory input) external pure returns (uint256 result);

	function identity() external pure returns (uint256);
}

contract PoseidonHasher is IPoseidonHasher {
	uint256 constant Q = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
	uint256 constant C0 = 2768970367241139781802170833007148522174069744848643939234067191877771423371;
	uint256 constant C1 = 6468574107656347268529237497718336587709069456280471580424455063721832719771;
	uint256 constant C2 = 18794671303815708509784162368644133457448839260573151733485130900959816547847;
	uint256 constant C3 = 21495479230478098685877232964279351350768322664786520160088149860043275231591;
	uint256 constant C4 = 13499990804456294376331975175669076043666672782766959528979369127842395667962;
	uint256 constant C5 = 11128727858753328237562379127901473551876426168355298792273038389175814738273;
	uint256 constant C6 = 6174623859769212836350518599861056828848352474434521101649917228563284157731;
	uint256 constant C7 = 731429061815452030222739129549549044853294286077603862495031070831228988506;
	uint256 constant C8 = 18691825946094184197601861261718857711439992232978967087150603050561229972879;
	uint256 constant C9 = 6901715409529528992021081413007214967207374659260807285380744444309443019002;
	uint256 constant C10 = 7889774703159213060685393199720756541539275646424166159037924832893670779999;
	uint256 constant C11 = 19148164181730036907570646123652401621475121269795476659255226436085540432812;
	uint256 constant C12 = 356519004282890736138910009474234839367086357569508205089190200287135015343;
	uint256 constant C13 = 5070064330380484074844995745007722918545766490350556589468108281662282971512;
	uint256 constant C14 = 17531425645708334340342421865584088711059286683026910061769879104052748058500;
	uint256 constant C15 = 920858801565935944623869688790191117976818337296182581403952541435643043455;
	uint256 constant C16 = 7671542183617251806500810220803333911317855932989746628699368932279406768167;
	uint256 constant C17 = 7881690674485945577862776772342991782415236259307258648854817257894786877801;
	uint256 constant C18 = 19155896751615806549889067080381563929649717724892491357642801041215501837659;
	uint256 constant C19 = 9657176770419678097838646349393281787292209556252142440714968703151552794280;
	uint256 constant C20 = 1376534476338443314506167934949939673567644510933411653555577922098640496938;
	uint256 constant C21 = 17373401671868429549652772677366856294616993437583002599910365256220696563780;
	uint256 constant C22 = 9746128003951157537728271629364357225604237114762257721895149249266834505625;
	uint256 constant C23 = 17782316906978487011972931426261039391542241330560756508577882755911543517908;
	uint256 constant C24 = 6589224737393540076643416156354549730831080306137040791236143083907274321011;
	uint256 constant C25 = 17321856211701727875100310423669922181823762220382619531116210312384063527081;
	uint256 constant C26 = 21321909001724533038371153813693276559530291455431564073497502239396933319818;
	uint256 constant C27 = 17849794853142289789836828064662594833303692772683927435966421769162340090898;
	uint256 constant C28 = 3469446763321625523201767743510820386262850368964003752018684310306935672122;
	uint256 constant C29 = 4411200946062535851397814394775457104021582693964231752948256822578636459939;
	uint256 constant C30 = 18626579782117576204277882219675177684589838126472487652629778677837675278662;
	uint256 constant C31 = 764261930639154699767774045099363658161006905585481283735008957581415860662;
	uint256 constant C32 = 6122983345977564957406231576949193286198709429730716375547595362175192593123;
	uint256 constant C33 = 2469188694307740124657403582315280809174737971010077914159812443136587941756;
	uint256 constant C34 = 5382605971470296415808536561267917764719132018437742878552512928718168489695;
	uint256 constant C35 = 6589667679759352998039311059993721585330589021804485020627575514256149305666;
	uint256 constant C36 = 20661471625156349582050865201555079410137144327315643708284763422133754381325;
	uint256 constant C37 = 18694584274137621868895160209707042629719656780873050479100267791928497600376;
	uint256 constant C38 = 13822590562029956399621741895244911145933359734099212387467069390727913142666;
	uint256 constant C39 = 694674849457359992382704784272941309716157308424480468618786287819256378917;
	uint256 constant C40 = 18763037144982179742008371677750585549220053470184500098542470704194556690623;
	uint256 constant C41 = 18486457976264107916834430437402981813449917200007719339429151501964183082936;
	uint256 constant C42 = 6556747954001777118869362753998468478855885460502383141235961204400638463294;
	uint256 constant C43 = 12385133754714463216711399717325449316164682530612784512290690756146937377664;
	uint256 constant C44 = 19895348036861519723386861870711743699604138662509897355377030959682349375552;
	uint256 constant C45 = 16830822151531046474312344756361243376821272897299262546129244900502111682734;
	uint256 constant C46 = 20875209030695524214960780268667166557156788659940284813793529164900666593068;
	uint256 constant C47 = 8777606742656153264634386709062440729894098167014885703560793183003141571957;
	uint256 constant C48 = 3404497983786933300887052921900023151252717521554164668384012034556256626067;
	uint256 constant C49 = 2555107629226010512992356367848094165962022522393505508367085820070687884355;
	uint256 constant C50 = 15113919336730148565553505760820732613676431799289611544548947520407297443700;
	uint256 constant C51 = 12109280671570307231007703707720632582709786369013364642897329602318304275337;
	uint256 constant C52 = 14968914070423010632399365015358049892440762915276845426568596163422798377730;
	uint256 constant C53 = 19061189532957010364709072574663003871548558794774753349573267371990486123152;
	uint256 constant C54 = 8682801373989521576522508447484143687434748406228624907362693631377691698421;
	uint256 constant C55 = 10836672514863795455996193088790111107823297731722043988991810099345596059914;
	uint256 constant C56 = 15783196349960742821266383686606772431598902255698169764526487081837237805029;
	uint256 constant C57 = 2908608383546665417899486637528022511748691900266764564499649456344035921401;
	uint256 constant C58 = 11329727236614532496067886659074662970462346457991275919233250048151273297377;
	uint256 constant C59 = 5116653167814666817290578004214535117470888177090558374943095066718387153691;
	uint256 constant C60 = 13540152826778549413479417002435847356268346234631393477044136590757331815911;
	uint256 constant C61 = 7947441526608065582264952807420254797193034288774248212171921641395121801332;
	uint256 constant C62 = 1547483282147791156522335107475157206253201614573941966672490820147450725004;
	uint256 constant M0 = 10115680371401748607263639966297231210785101245789087039760048681884121897698;
	uint256 constant M1 = 7682529184580308813007726368887641784100790067958820768670102409394963579396;
	uint256 constant M2 = 3036380094837744536618704667164758501777151816139077990926623931426168668495;
	uint256 constant M3 = 462021688665431536448264191536285854244979957674130050775621906384644169421;
	uint256 constant M4 = 62665112908715427992420108025470785827183241813778563254523765114425841603;
	uint256 constant M5 = 534236519266104271325123542701236478972353175554309786393016883839422407419;
	uint256 constant M6 = 5922526147398848214826466482573128257954044394758836008121691281747299315999;
	uint256 constant M7 = 10778490508693548114587990025762035374898560218037495485187480124708600063292;
	uint256 constant M8 = 13853145901042782779715203529626320031162484246107565810821674712070680357632;

	function hash(uint256[2] memory input) external pure override returns (uint256 result) {
		return _hash(input);
	}

	function _hash(uint256[2] memory input) internal pure returns (uint256 result) {
		assembly {
			let q := Q
			let pos := mload(0x40)
			mstore(pos, M0)
			mstore(add(pos, 32), M1)
			mstore(add(pos, 64), M2)
			mstore(add(pos, 96), M3)
			mstore(add(pos, 128), M4)

			// mstore(add(pos, 160), M5)
			// mstore(add(pos, 192), M6)
			// mstore(add(pos, 224), M7)
			// mstore(add(pos, 256), M8)

			// use stack intensively
			let m5 := M5
			let m6 := M6
			let m7 := M7
			let m8 := M8

			let s0 := add(mload(input), C0)
			let s1 := add(mload(add(input, 32)), C0)
			let s2 := C0

			let t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := mulmod(s1, s1, q)
			s1 := mulmod(mulmod(t, t, q), s1, q)
			t := mulmod(s2, s2, q)
			s2 := mulmod(mulmod(t, t, q), s2, q)
			t := C1
			let z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			let z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := mulmod(z1, z1, q)
			z1 := mulmod(mulmod(t, t, q), z1, q)
			t := mulmod(s2, s2, q)
			s2 := mulmod(mulmod(t, t, q), s2, q)
			t := C2
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := mulmod(s1, s1, q)
			s1 := mulmod(mulmod(t, t, q), s1, q)
			t := mulmod(s2, s2, q)
			s2 := mulmod(mulmod(t, t, q), s2, q)
			t := C3
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := mulmod(z1, z1, q)
			z1 := mulmod(mulmod(t, t, q), z1, q)
			t := mulmod(s2, s2, q)
			s2 := mulmod(mulmod(t, t, q), s2, q)
			t := C4
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)

			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C5
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C6
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C7
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C8
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C9
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C10
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C11
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C12
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C13
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C14
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C15
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C16
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C17
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C18
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C19
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C20
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C21
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C22
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C23
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C24
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C25
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C26
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C27
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C28
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C29
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C30
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C31
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C32
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C33
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C34
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C35
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C36
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C37
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C38
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C39
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C40
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C41
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C42
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C43
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C44
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C45
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C46
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C47
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C48
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C49
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C50
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C51
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C52
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C53
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C54
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C55
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C56
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C57
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := C58
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := C59
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)

			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := mulmod(z1, z1, q)
			z1 := mulmod(mulmod(t, t, q), z1, q)
			t := mulmod(s2, s2, q)
			s2 := mulmod(mulmod(t, t, q), s2, q)
			t := C60
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := mulmod(s1, s1, q)
			s1 := mulmod(mulmod(t, t, q), s1, q)
			t := mulmod(s2, s2, q)
			s2 := mulmod(mulmod(t, t, q), s2, q)
			t := C61
			z0 := add(add(add(mulmod(s0, mload(pos), q), mulmod(s1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			z1 := add(add(add(mulmod(s0, mload(add(pos, 96)), q), mulmod(s1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(s0, m6, q), mulmod(s1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(z0, z0, q)
			z0 := mulmod(mulmod(t, t, q), z0, q)
			t := mulmod(z1, z1, q)
			z1 := mulmod(mulmod(t, t, q), z1, q)
			t := mulmod(s2, s2, q)
			s2 := mulmod(mulmod(t, t, q), s2, q)
			t := C62
			s0 := add(add(add(mulmod(z0, mload(pos), q), mulmod(z1, mload(add(pos, 32)), q)), mulmod(s2, mload(add(pos, 64)), q)), t)
			s1 := add(add(add(mulmod(z0, mload(add(pos, 96)), q), mulmod(z1, mload(add(pos, 128)), q)), mulmod(s2, m5, q)), t)
			s2 := add(add(add(mulmod(z0, m6, q), mulmod(z1, m7, q)), mulmod(s2, m8, q)), t)
			t := mulmod(s0, s0, q)
			s0 := mulmod(mulmod(t, t, q), s0, q)
			t := mulmod(s1, s1, q)
			s1 := mulmod(mulmod(t, t, q), s1, q)
			t := mulmod(s2, s2, q)
			s2 := mulmod(mulmod(t, t, q), s2, q)

			result := s0
		}
	}

	function identity() external pure override returns (uint256) {
		return _identity();
	}

	function _identity() internal pure returns (uint256) {
		return 0x2ff267fd23782a5625e6d804f0a7fa700b8dc6084e2e7a5aff7cd4b1c506d30b;
	}
}