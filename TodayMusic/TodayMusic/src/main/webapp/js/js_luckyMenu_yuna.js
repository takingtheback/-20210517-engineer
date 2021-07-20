/**
 * 
 */
/* 현재날짜 띄우기 위한 함수 */
function getCurrentDate() {
	var currentDate = new Date();
	var year = currentDate.getFullYear();

	var month = currentDate.getMonth() + 1;
	if (month <= 9) {
		month = "0" + month;
	}
	var date = currentDate.getDate();
	if (date <= 9) {
		date = "0" + date;
	}

	currentDate = year + "-" + month + "-" + date;
	console.log("currentDate : " + currentDate);

	return currentDate;
}

/* lotto 번호 확인 새창 열기 */
function openLottoWindow() {
	var specs = "width=460,height=300,top=200,left=300";
	var idWin = window.open("luckyNum_yuna.html", "_blank", specs);
}

/* lotto 번호 확인 새창 열기 */
function openLuckyWindow() {
	var specs = "width=460,height=300,top=200,left=300";
	var idWin = window.open("luckyMsg_yuna.html", "_blank", specs);
}

/* 랜덤 문구 */
var luck = [
	"뭘 해도 잘 될 거예요",
	"흔들리지 않도록 마음가짐을 단단하게",
	"힘들땐 잠시 쉬어가도 좋아요",
	"언제나 좋은 일만 있기를 바랍니다",
	"성과에 주목을 받는 날이네요",
	"일생일대의 기회가 찾아옵니다",
	"자신이 하고 싶은 일을 찾게되어 그 일에 올인하게 됩니다",
	"누군가와 친밀한 신뢰를 나눌 수 있는 보다 가까운 관계로 발전할 것입니다.",
	"당신의 부주의한 행동이나 태도가 타인에게 편견을 남길 수 있습니다",
	"무턱대고 일을 벌리는 것에 너무 익숙해져선 안됩니다",
	"수많은 경험은 당신의 발전을 위한 것이어야 합니다",
	"세상은 생각보다 좁은 곳일 수 있습니다",
	"당신은 혼자가 아니에요",
	"새로운 기회가 다가올 것입니다",
	"지금 사고 싶은 물건 때문에 꼭 사야할 물건을 사지 못하게 될 수 있습니다",
	"예전 같은 관게를 꿈꾸고 있다면 당신이 먼저 손을 내밀어 보세요",
	"당신은 정서적으로 마음을 기댈 수 있는 곳이 필요합니다",
	"긍정적인 시작이야 말로 좋은 결과를 예측할 수 있습니다",
	"당신의 연락을 기다리고 있어요",
	"능동적인 노력이 필요할 때입니다",
	"곧 새로운 사람을 만나게 될 것입니다",
	"당신이 확실한 결정을 하면 무거운 짐을 내려놓을 수 있게 됩니다",
	"왜 안되는지 이유를 찾기 전에 내가 무얼 하려는지 다시 생각해보세요",
	"드디어 어두운 터널의 끝이 보이네요",
	"곧 당신의 마음 속에 두근대는 소리가 울려 퍼질거예요",
	"지금으로 부터 머지 않은 시간에 기적이 일어납니다",
	"목표 성취를 위해 사용 가능한 힘을 낭비하지 마세요"];

/* 랜덤 색상 */
var color = [
	"분홍색",
	"하늘색",
	"빨간색",
	"청록색",
	"검은색",
	"노란색",
	"보라색",
	"청록색",
	"감색",
	"금색",
	"은색",
	"연분홍색",
	"연노랑색",
	"연두색",
	"주황색",
	"파란색",
	"살구색",
	"하얀색"
];

/* 랜덤 노래 */
var song = [
	"No show blues - Ben Bostick",
	"Lie in the Sun - ORKAS",
	"Ashes - Stellar",
	"Butter - BTS",
	"Yours - 데이먼스 이어",
	"OHAYO MY NIGHT - 파데코, 디핵",
	"Love Or Lust - 24KGolden",
	"라일락 - 아이유",
	"시간의 바깥 - 아이유",
	"Bonfire - Peder Eilas",
	"2002 - Anne-Marie",
	"Gimme Gimme - Johnny Stimson",
	"One Call Away - Charlie Puth",
	"ride - wavw to earth",
	"Dry flower - SURL"
];

//var input = document.querySelector(".input");
var btn = document.querySelector(".button");

btn.addEventListener("click", action1);
btn.addEventListener("click", action2);
btn.addEventListener("click", action3);


function action1() {
	var luckyMsg = luck[Math.floor(Math.random() * luck.length)];
	input.textContent = (luckyMsg);
}

function action2() {
	var luckyColorMsg = color[Math.floor(Math.random() * color.length)];
	input2.textContent = ("행운의 색 : " + luckyColorMsg);
}

function action3() {
	var luckySong = song[Math.floor(Math.random() * song.length)];
	input3.textContent = ("♬ " + luckySong + " ♪");
}



