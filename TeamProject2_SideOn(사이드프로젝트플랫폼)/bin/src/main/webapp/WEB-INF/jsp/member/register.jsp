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

    <title>회원가입</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                            </div>
                           <form>
  <fieldset>
    
    <div class="form-group row">
     
    </div>
    <div class="form-group">
      <label for="exampleInputId" class="form-label mt-4">아이디</label>
      <input type="email" class="form-control" id="exampleInputId">
      <small id="emailHelp" class="form-text text-muted">영문대/소문자,숫자를 포함해 6-20자 이내로 입력해주세요.</small>
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1" class="form-label mt-4">비밀번호</label>
      <input type="password" class="form-control" id="exampleInputPassword1">
	  <small id="emailHelp" class="form-text text-muted">영문대/소문자,숫자,특수문자(!@#$%^&*_-)를 포함해 8-20자 이내로 입력해주세요.</small>
	</div>
	
	 <div class="form-group">
      <label for="exampleInputPassword2" class="form-label mt-4">비밀번호 확인</label>
      <input type="password" class="form-control" id="exampleInputPassword2">
	</div>
	
	 <div class="form-group">
      <label for="exampleInputName" class="form-label mt-4">이름</label>
      <input type="name" class="form-control" id="exampleInputName">
	</div>

	<div class="form-group">
      <label for="exampleInputEmail" class="form-label mt-4">이메일</label>
      <input type="name" class="form-control" id="exampleInputEmail">
	  <small id="emailHelp" class="form-text text-muted">email@example.com</small>
	
      <label for="exampleSelect1" class="form-label mt-4"> @ </label>
      <select class="form-select" id="exampleSelect1">
        <option>gmail.com</option>
        <option>naver.com</option>
        <option>hanmail.com</option>
        <option>nate.com</option>
        <option>직접입력</option>
      </select>
  
	</div>
	
	<div class="form-group">
      <label for="exampleInputMobile" class="form-label mt-4">핸드폰번호</label>
      <input type="name" class="form-control" id="exampleInputMobile">
	  <button type="button" class="btn btn-outline-warning btn-sm">인증</button>

	</div>
	
	<div class="button1">
   <button type="button" class="btn btn-warning">완료</button>
	<button type="button" class="btn btn-light">취소</button>

  </fieldset>
</form>

                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
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

</body>

</html>