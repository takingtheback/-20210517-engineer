<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA Board|Side-On</title>
<link type="text/css" rel="stylesheet" href="../css/contactEmail_JHK.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>
<script type="text/javascript" src="../js/contactEmail_JHK.js"></script>
</head>
<body>
<%@ include file="../inc/header.jsp" %>
<!-- Header -->
<header class="bg-warning py-5">
    <a href="/board/QnABoardWrite" style="text-decoration:none">
    	<div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
        <!-- 헤더...어떻게... -->
        <div style="padding-top: 8%;">
            <h1 class="display-5 fw-bolder">문의글 수정</h1>
            <p class="lead fw-normal text-white-80 mb-0">문의글을 수정합니다.</p>
	    </div>
	    </div>
		</div>
 	</a>
</header>

<form class="formArea" action="/board/QnAUpdate" method="post">

	<div class="Chat_explain"> 
	작성자 : ${memberId}<br> 
	수정할 작성글: ${dto.qnaBoardNo}
	</div>   
<input type="hidden" class="mailForm" name="memberId" id="memberId" value="${memberId}">
<input type="hidden"name="qnaBoardNo" id="qnaBoardNo" value="${dto.qnaBoardNo}">

<div class="int-area">
<input type="text" class="mailForm" name="qnaBoardTitle" id="qnaBoardTitle" value="${dto.qnaBoardTitle}"
       placeholder="수정할 문의제목" autocomplete="off" required>
</div>
<div class="text-area">
<p><textarea class="textForm" name="qnaBoardContents" id="qnaBoardContents" 
     placeholder="수정할 문의내용을 입력해주세요..">${dto.qnaBoardContents}</textarea></p>
</div>    

<div style="position: absolute; right: 370px; bottom: -40px;">

<button type="submit" class="btn-warning">수정하기</button>
<button type="button" class="btn-warning" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
	onclick="location.href='QnABoard'">되돌아가기</button>
</div>
</form>

</body>
</html>