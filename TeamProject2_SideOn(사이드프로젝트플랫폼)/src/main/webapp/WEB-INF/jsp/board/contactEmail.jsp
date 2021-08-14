<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact|Side-On</title>
<link type="text/css" rel="stylesheet" href="../css/contactEmail_JHK.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>
<script type="text/javascript" src="../js/contactEmail_JHK.js"></script>
</head>
<body>
<%@ include file="../inc/header.jsp" %>
<!-- Header -->
<header class="bg-warning py-5">
    <a href="/board/contactEmail" style="text-decoration:none">
    	<div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
        <!-- 헤더...어떻게... -->
        <div style="padding-top: 8%;">
            <h1 class="display-5 fw-bolder">문의 메일 작성</h1>
            <p class="lead fw-normal text-white-80 mb-0">작성하신 문의메일로 운영자가 답변해드립니다.</p>
	    </div>
	    </div>
		</div>
 	</a>
</header>
<div style="margin-top:20px;" class="int-area">
<input type="text" class="mailForm" name="email" id="email"
       placeholder="답변받으실 이메일을 입력해주세요." autocomplete="off" required>

</div>
<div class="int-area">
<input type="text" class="mailForm" name="title" id="title"
       placeholder="문의 제목을 입력해주세요." autocomplete="off" required>
</div>
<div class="int-area">
<input type="text" class="mailForm" name="mobile" id="mobile"
       placeholder="연락처를 입력해주세요." autocomplete="off" required>
</div>
<div class="text-area">
<p><textarea class="textForm" name="contents" id="contents"
     placeholder="문의 내용을 입력해주세요."></textarea></p>
</div>    


<div style="position: absolute; right: 370px; bottom: -40px;">
<button type="button" class="btn-warning" onclick="sendMail();">문의하기</button>
<button type="button" class="btn-warning" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
	onclick="location.href='FaQBoard'">되돌아가기</button>
</div>

</body>
</html>