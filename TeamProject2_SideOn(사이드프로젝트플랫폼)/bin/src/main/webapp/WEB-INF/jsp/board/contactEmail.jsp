<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ContactEmail|Side-On</title>
<link type="text/css" rel="stylesheet" href="../css/contactEmail_JHK.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>
<script type="text/javascript" src="../js/contactEmail_JHK.js"></script>
</head>
<body>
<%@ include file="../inc/header.jsp" %>

<div id="container" class="container">
    <div class="ChatForm">
        <span class="Chat_title">
            <img src="https://raw.githubusercontent.com/PD-team2/SpringProject_Output/main/JaeHyunKim/IMG/QuestionMail_bgWhite.png"></span>  
        <span class="Chat_title">문의 메일 작성</span>
        <div class="Chat_explain"> 문의사항을 남겨주시면 빠른 시일내로 답변해드립니다.</div>   
        <hr> 
    </div>
</div>

<div class="int-area">
<input type="text" class="mailForm" name="emial" id="email"
       placeholder=" 답변 받으실 이메일을 입력해주세요." autocomplete="off" required>

</div>
<div class="int-area">
<input type="text" class="mailForm" name="title" id="title"
       placeholder="문의 제목" autocomplete="off" required>
</div>
<div class="text-area">
<p><textarea name="contents" class="textForm" id="contents"
     placeholder="문의 내용을 입력해주세요.."></textarea></p>
</div>    


<div class="btn-area">
<button type="button" class="button" onclick="sendMail();">문의하기</button>
</div>

</body>
</html>