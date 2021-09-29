<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="background-color: #FFD026">

<head>
	<%@ include file="../inc/adminHeadLink.jsp" %>
    <title>비밀번호 재설정</title>
        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
    
    function resetPwCheck() {

    	var resetPw =document.getElementById("resetPw").value;
    	var resetPw2 = document.getElementById("resetPw2").value;
    	var regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/.test(resetPw);
    	var regExpPw2 = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/.test(resetPw2);

    	
    	if(resetPw.trim() == "" || resetPw2.trim() == ""){
			alert('[안내] 비밀번호를 입력해주세요.');
			return false;
		}else if(resetPw.trim() != resetPw2.trim()){
			alert('[안내] 비밀번호칸과 재입력한 비밀번호의 내용이 다릅니다. 다시 입력해주세요.');
			return false;
		}else if(regExpPw== false || regExpPw2 == false){
			alert('[안내] 숫자, 특수문자(!@$%^&*) 1개 이상, 영문 2개 이상 사용하여 비밀번호를 8자리 이상으로 입력해주세요.');	
			return false;
		}else{
			$('#resetPwForm').submit();
		}
	}

    </script>
    
    
    
    
</head>

<body class="" style="background-color: #FFD026">

    <div class="container" style="background-color: #FFD026">

        <!-- Outer Row -->
        <div class="row justify-content-center" >

            <div class="col-xl-10 col-lg-6 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">비밀번호 재설정</h1>
                                        
                                        <h6>비밀번호 조건 : 숫자, 특수문자(!@$%^&*) 1개 이상, 영문은 2개 이상 사용하여 8자리 이상 비밀번호 구성 </h6>
                                    </div>
 <form  action="/member/resetPwComplete" name="resetPwForm" id="resetPwForm" method="post">
                                        <div class="form-group" style="margin-top: 5%">
                                            비밀번호 <input type="password" class="form-control form-control-user"
                                                id="resetPw" name="resetPw" aria-describedby="memberPw">
                                        </div>
                                        <div class="form-group">
                                           비밀번호 재입력 <input type="password" class="form-control form-control-user"
                                                id="resetPw2" name="resetPw2" >
                                        </div>
    
                                        <input type="button" value="확인" class="btn btn-primary btn-user btn-block" onclick='resetPwCheck();'>
                                        <input type="hidden" name="memberId" id="memberId" value="${ memberId}">
                                        <hr>
</form>
                                    <div class="text-center">
                                        <a class="small" href="loginForm">돌아가기</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

	<%@ include file="../inc/adminBodyLink.jsp" %>
	
</body>

</html>