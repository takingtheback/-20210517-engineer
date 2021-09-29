<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원가입 | Side-On</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../css/register_sh.css" rel="stylesheet">
<script type="text/javascript">
	
/* 아이디 중복확인 페이지 팝업 */
function openIdChekWindow() {
	var specs = "width=400,height=300,top=300,left=500";
	var idWin = window.open("idCheck", "_blank", specs);
}

/* 핸드폰 인증 페이지 팝업 */
function openMobileWindow() {
	var specs = "width=400,height=300,top=300,left=500";
	var idWin = window.open("mobile", "_blank", specs);
}

</script>
</head>

<body class="" style="background-color: #FFD026" >
   <!-- navibar -->
       <%@ include file="../inc/header.jsp" %>
    <div class="container">

	<!-- Outer Row -->
        <div class="row justify-content-center" >

            <div class="col-xl-8 col-lg-6 col-md-8">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block"></div>
                    <div class="col-lg-12">
                        <div class="p-5">
                        
                        <br>
                        <br>
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">환영합니다!</h1>
                            </div>
                            
                            <!-- 회원가입 폼 -->
                            <form action='/member/registerDone' method="post" id="register" class="user">
                               
                                <div class="form-group row">
                               
                               <!-- 아이디 -->
                                <div class="col-sm-8 mb-3 mb-sm-0">
                                    <input type="text" class="form-control form-control-user" id="memberId" name="memberId"
                                        placeholder="아이디" pattern="[A-Za-z0-9_-]{6,20}" maxlength="20" required="required">
                               		<div id="memberIdMsg"></div>
                                </div>
                                
                                <!-- onclick 함수 -->
                                <div class="col-sm-4 mb-3 mb-sm-0">
                                   <input type="button" value="중복확인" onclick="openIdChekWindow()" class="btn btn-outline-warning btn-user btn-block" >
                                </div>
                                
                                </div>
                                
                                <!-- 비밀번호 -->
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user"
                                            id="memberPw" name="memberPw" pattern="[a-z0-9!@#$%^&*_-+=]{6,30}" maxlength="30" required="required"
                                            placeholder="비밀번호">
                                   		<div id="memberPwMsg"></div>
                                   	</div>
                                   	
                                   <div class="form-group">
                                        <input type="password" class="form-control form-control-user"
                                            id="memberPwConfirm" name="memberPwConfirm" pattern="[a-z0-9!@#$%^&*_-+=]{6,30}" maxlength="30" required="required"
                                            placeholder="비밀번호">
                                    	<div id="memberPwConfirmMsg"></div>
                                    </div>
                					
                				<!-- 이름 -->
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="name" name="name"
                                        placeholder="이름" pattern="[a-zA-Z가-힣]{1,20}" required="required">
                                	<div id="nameMsg"></div>
                                </div>
                                
                                <!-- 이메일 -->
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="email" name="email"
                                        placeholder="이메일 ex)id@mail.com" pattern="[a-zA-z_-@.]{2,40}" maxlength="40" required="required">
                               		<div id="emailMsg"></div>
                                </div>
                                
                                <!-- 핸드폰번호 -->
                                  <div class="form-group row">
                                <div class="col-sm-8 mb-3 mb-sm-0">
                                    <input type="tel" class="form-control form-control-user" id="mobile" name="mobile"
                                        placeholder="핸드폰 번호 ex)010-0000-0000" pattern="\d{3}-\d{3,4}-\d{4}" maxlength="13" required="required">
                                </div>
                                 <div class="col-sm-4 mb-3 mb-sm-0">
                                   <input type="button" value="인증" class="btn btn-outline-warning btn-user btn-block" onclick="openMobileWindow()">
                                </div>
                                </div>
                                <input type="submit" value='완료' class="btn btn-primary btn-user btn-block" onclick="return checkForm();">                                
                               	
                                <a href="/" class="btn btn-danger btn-user btn-block">
                                   취소
                                </a>
                              
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="loginForm">이미 회원가입이 되어 있어요!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
   </div>
   </div>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
    
    <script type="text/javascript">
	
	/* 비밀번호 유효성 체크 */
	function checkForm() {
	
	var memberId = document.getElementById("memberId").value;
	
	if(memberId.trim().length < 5 || memberId.trim().length > 21) {
		document.getElementById("memberId").focus();
		document.getElementById("memberIdMsg").innerHTML = "아이디는 6자 이상, 20자 이하로 입력해주세요.";
		document.getElementById("memberIdMsg").style.color = "red";
		document.getElementById("memberId").value = "";
		return false; 
	}
	
	
	var memberPw = document.getElementById("memberPw").value;
	if(memberPw.trim().length < 5 || memberPw.trim().length > 31) {
		document.getElementById("memberPw").focus();
		document.getElementById("memberPwMsg").innerHTML = "비밀번호는 6자 이상, 30자 이하로 입력해주세요.";
		document.getElementById("memberPwMsg").style.color = "red";
		document.getElementById("memberPw").value = "";
		return false;
	}
	
	var memberPw2 = document.getElementById("memberPwConfirm").value;
	
	if (memberPw != memberPw2) {
		document.getElementById("memberPw").focus();
		document.getElementById("memberPwMsg").innerHTML = "비밀번호와 비밀번호 확인이 동일하지 않습니다.";
		document.getElementById("memberPwMsg").style.color = "red";
		return false; 
	} 
	 var email = document.getElementById("email").value;
	 var emailtext = "@";
	 if (email.indexOf(emailtext)!=-1) {
	 } else {
		 	document.getElementById("email").focus();
			document.getElementById("emailMsg").innerHTML = "이메일 형식에 따라 입력해주세요.";
			document.getElementById("emailMsg").style.color = "red";
			document.getElementById("email").value = ""; 
			return false; 
}
}

	/* 이메일 문자 "@" 포함 체크*/
	function emailCheck() {
	 
 	var email = document.getElementById("email").value;
 	var emailtext = "@";
 	if (email.indexOf(emailtext)!=-1) {
 	} else {
	 	document.getElementById("email").focus();
		document.getElementById("emailMsg").innerHTML = "이메일 형식에 따라 입력해주세요.";
		document.getElementById("emailMsg").style.color = "red";
		document.getElementById("email").value = ""; 
		return false; 
 }
}

    </script>

</body>

</html>