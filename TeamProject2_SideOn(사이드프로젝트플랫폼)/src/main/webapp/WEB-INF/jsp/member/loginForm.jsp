<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" style="background-color: #FFD026">

<head>
	<%@ include file="../inc/adminHeadLink.jsp" %>
    <title>Login</title>
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
                                        <h1 class="h4 text-gray-900 mb-4">Welcome!</h1>
                                    </div>
                                    <form class="user" action="login" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="memberId" name="memberId" aria-describedby="emailHelp"
                                                placeholder="Enter your Id...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="memberPw" name="memberPw" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                        <input type="submit" value="Login" class="btn btn-primary btn-user btn-block">
                                        
                                        <hr>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                       <a class="small" href="/member/findID">아이디 찾기</a>
                                         <a class="small" href="/member/findPw">비밀번호 찾기</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="register">Create an Account!</a>
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