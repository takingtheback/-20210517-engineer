<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크 | Side-On</title>
  <link href="../css/register_sh.css" rel="stylesheet">
  
<script>
/* 회원들의 아이디 정보를 배열 선언 및 저장 구조 */
var memberIdArray = ["user01", "user02", "user03", "user04", "user05", "user06", "example"];

/* 새창 띄우기 */
window.onload = function() {
	var parentMemberIdElement = window.opener.document.getElementById("memberId");
	var childMemberIdElement = document.getElementById("memberId");
	childMemberIdElement.value = parentMemberIdElement.value;
	childMemberIdElement.focus();
	document.getElementById("btn_use_memberId").disabled = true;
}

/* 아이디 중복여부 검증 */
function idCheck() {
	var memberId = document.getElementById("memberId").value;
	var memberIdMsgElement = document.getElementById("memberIdMsg");
	
	for (index = 0; index < memberIdArray.length; index++) {
		if (memberIdArray[index] == memberId) {
			memberIdMsgElement.innerHTML = "사용불가 아이디입니다.";
			memberIdMsgElement.style.color = "red";
			document.getElementById("memberId").focus();
			
			document.getElementById("memberId").select();
			return;
		}
	}
	
	memberIdMsgElement.innerHTML = "사용가능 아이디입니다.";
	memberIdMsgElement.style.color = "green";
	
	document.getElementById("btn_use_memberId").disabled = false;
	
}

/* 아이디 입력시 아이디중복검증 메세지 지우기 */
function clearMsg() {
	document.getElementById("memberIdMsg").innerHTML = "";
	document.getElementById("btn_use_memberId").disabled = true;
}

/* 아이디 사용하기 버튼 */
function useMemberId() {
	var parentMemberIdElement = window.opener.document.getElementById("memberId");
	var childMemberIdElement = document.getElementById("memberId");
	
	parentMemberIdElement.value = childMemberIdElement.value;
	parentMemberIdElement.readOnly = "readOnly";
	window.opener.document.getElementById("checkMemberId").value = "SUCCESS";
	
	window.close();
}

</script>

</head>
<body>
<div class="text-center" >
<form action="result.html" method="post" name="idCheckForm" id="idCheckForm">
	<div class="col-xl-5 col-lg-5 col-md-5">
	 <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
       <!-- Nested Row within Card Body -->
        <div class="row">
       <div class="col-lg-5 d-none d-lg-block"></div>
 	    <div class="col-lg-12">
		<div class="p-5">
                        
	<div>
		<div class="input_title">아이디 중복 확인</div>
		<div>
			<input type="text" class="" name="memberId" id="memberId" onkeydown="clearMsg()">
		</div>
		<br>
		<div>
			<input type="button" class="btn btn-light btn-sm" value="확인" onclick="idCheck()">
		</div>
		<div id="memberIdMsg"></div>
	</div>
	
	<br>
	<br>
	<div>
		<input type="button" id="btn_use_memberId"  class="btn btn-primary btn-sm" value="아이디 사용하기" onclick="useMemberId()">
		<input type="button" value="창닫기"  class="btn btn-danger btn-sm" onclick="window.close();">
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	
</form>
</div>
</body>
</html>
