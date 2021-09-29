<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="background-color: #FFD026">

<head>
	<%@ include file="../inc/adminHeadLink.jsp" %>
    <title>아이디 찾기</title>
    
    <script type="text/javascript">
    
    function findId() {
		
    	//이름  입력데이터 가져오기
    	var name = document.getElementById("name").value;
    	 console.log(name);
    	//핸드폰 입력데이터 가져오기
    	var phone = document.getElementById("mobile").value;
    	 console.log(phone);
    	//이름 입력 확인 
    	
    		if(name.trim() == ""){
    			alert('[안내] 이름을 입력해주세요.');
    		}else{
    			//이름이 공백이 아닐 때 > 이름 입력 완료
    			
    			//핸드폰 유효성 검사
    		phone = phone.split('-').join('');
    			var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
    			
    			//유효성 검사 통과
    			if(regPhone.test(phone)){
    				$('#findIDForm').submit();
	
    			}else{
    				//핸드폰 유효성 검사 실패 
    				alert('[안내] 핸드폰 번호를 정확하게 입력해주세요. 예시)010-0000-0000 또는 01012345678');		
    			}	
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
                                        <h1 class="h4 text-gray-900 mb-4">아이디 찾기</h1>
                                    </div>
 <form  action="/member/findIdComplete" name="findIDForm" id="findIDForm" method="post">
                                        <div class="form-group" style="margin-top: 5%">
                                            <input type="text" class="form-control form-control-user"
                                                id="name" name="name" aria-describedby="name"
                                                placeholder="이름을 입력해주세요">
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="mobile" name="mobile" placeholder="핸드폰 번호를 입력해주세요. 예시)010-1234-5678">
                                        </div>
    
                                        <input type="button" value="확인" class="btn btn-primary btn-user btn-block" onclick="findId();">
                                        
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