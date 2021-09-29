<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="background-color: #FFD026">

<head>
	<%@ include file="../inc/adminHeadLink.jsp" %>
    <title>아이디 찾기 완료 | Side-On</title>
    
    
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
                                        <h1 class="h4 text-gray-900 mb-4">아이디 찾기 성공</h1>
                                    </div>
                                        <div class="form-group" style="margin-top: 5%">
                                            <input type="text" class="form-control form-control-user"
                                                id="name" name="name" aria-describedby="name"
                                                value="${memberId} " disabled="disabled">
                                        </div>
                                       
                                        <hr>
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