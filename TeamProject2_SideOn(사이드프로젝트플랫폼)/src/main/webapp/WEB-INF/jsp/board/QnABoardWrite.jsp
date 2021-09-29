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
            <h1 class="display-5 fw-bolder">문의글 작성</h1>
            <p class="lead fw-normal text-white-80 mb-0">문의글을 작성합니다.</p>
	    </div>
	    </div>
		</div>
 	</a>
</header>

<form class="formArea" action="/board/QnAWrite" method="post">

<input type="hidden" class="mailForm" name="memberId" id="memberId" value="${memberId}">
<input type="hidden" name="grade" id="grade" value="${grade}">

<div class="int-area">
<input type="text" class="mailForm" name="qnaBoardTitle" id="qnaBoardTitle" maxlength='50'
       placeholder="문의 제목" autocomplete="off" required>
</div>
<div class="text-area">
<p><textarea  class="textForm" name="qnaBoardContents" id="qnaBoardContents" maxlength='4000'
     placeholder="문의 내용을 입력해주세요.."></textarea></p>
</div>    


<div style="position: absolute; right: 370px; bottom: -40px;">
<button type="submit" class="btn-warning">작성하기</button>
<button type="button" class="btn-warning" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
	onclick="location.href='QnABoard'">되돌아가기</button>
</div>
</form>

</body>
</html>