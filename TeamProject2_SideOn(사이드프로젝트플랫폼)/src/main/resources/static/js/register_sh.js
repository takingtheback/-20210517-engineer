
/* 유효성 체크 */
function checkForm() {
	// 아이디 입력 데이터 가져오기 : id
	var memberId = document.getElementById("memberId").value;
	console.log("memberId: ", memberId.length);
	
	// 아이디 길이 체크
	if(memberId.trim().length < 5 || memberId.trim().length > 21) {
		document.getElementById("memberId").focus();
		document.getElementById("memberIdMsg").innerHTML = "아이디는 6자 이상, 20자 이하로 입력해주세요.";
		document.getElementById("memberIdMsg").style.color = "red";
		document.getElementById("memberId").value = ""; // 사용자 입력데이터를 공백문자열 초기화
		return false; // input type="submit"
	}
	memberId = memberId.trim();	// 사용자 입력데이터에 있는 공백제거 
	console.log("memberId: ", memberId.length);
	
	
	// 비밀번호 입력 데이터 가져오기 : name
	var memberPw = document.getElementById("memberPw").value;
	console.log("memberPw: ", memberPw);
	
	if(memberPw == "" || memberPw.trim().length == 0) {
		document.getElementById("memberPw").focus();
		document.getElementById("memberPwMsg").innerHTML = "비밀번호는 6자 이상, 30자 이하로 입력해주세요.";
		document.getElementById("memberPwMsg").style.color = "red";
		document.getElementById("memberPw").value = "";
		return false; // input type="submit"
	}
	memberPw = memberPw.trim();
	
	// 비밀번호 확인 입력 데이터 가져오기 :
	var memberPwConfirm = document.getElementById("memberPwConfirm").value;
	console.log("memberPwConfirm: ", memberPwConfirm);
	
	if (memberPwConfirm == "" || memberPwConfirm.trim().length == 0) {
		document.getElementById("memberPwConfirm").focus();
		document.getElementById("memberPwConfirmMsg").innerHTML = "비밀번호확인을 입력하세요";
		document.getElementById("memberPwConfirmMsg").style.color = "red";
		document.getElementById("memberPw").value = "";
		return false; // input type="submit"
	}
	memberPwConfirm = memberPwConfirm.trim();
	
	// 
	if (memberPw != memberPwConfirm) {
		document.getElementById("memberPw").focus();
		document.getElementById("memberPwMsg").innerHTML = "비밀번호와 비밀번호 확인이 동일하지 않습니다.";
		document.getElementById("memberPwMsg").style.color = "red";
		return false; 
	}
	
	// 아이디 중복여부 검증 완료 여부 체크
	var checkMemberIdResult = document.getElementById("checkMemberId").value;
	if (checkMemberIdResult != "SUCCESS") {
		document.getElementById("memberId").focus();
		document.getElementById("memberIdMsg").innerHTML = "아이디 중복여부를 확인하시기 바랍니다.";
		document.getElementById("memberIdMsg").style.color = "red";
		return false;			
	}
}
	
	function checkMappingMemberPw() {
		var memberPw = document.getElementById("memberPw").value;
		var memberPwConfirm = document.getElementById("memberPwConfirm").value;
		
		if (memberPw != memberPwConfirm) {
			document.getElementById("memberPw").focus();
			document.getElementById("memberPwMsg").innerHTML = "비밀번호와 비밀번호 확인이 동일하지 않습니다.";
			document.getElementById("memberPwMsg").style.color = "red";
			
			// 입력 데이터 선택
			document.getElementById("memberPw").select()
			return false; 
		}
	}