<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FaQ|Side-On</title>
<link type="text/css" rel="stylesheet" href="../css/FaQBoard_JHK.css">
</head>
<body>
<%@ include file="../inc/header.jsp" %>

<div class="FAQForm">
<span class="FAQ_title">FAQ</span>
<span class="FAQ_title">자주 묻는 질문</span>    
<div class="FAQ_explain">자주 물어보시는 질문들에 대한 답변입니다.</div>    
    
<div class="accordian">
<input type="radio" name="accordian" id="answer01"/>
<label for="answer01">Q. 프로젝트 모집은 누가 할 수 있나요?<em></em></label>
<div><p>
A. 비로그인 회원은 프로젝트 모집 게시글을 열람하실 수 있습니다.<br>
로그인 회원은 모집 글을 작성하실 수 있으며 마이페이지에서 확인하실 수 있습니다.<br>
추가 문의사항은 아래 채팅 문의나 메일 문의로 부탁드립니다.
</p></div>
<input type="radio" name="accordian" id="answer02"/>
<label for="answer02">Q. 팀원 모집을 하고 싶습니다.<em></em></label>
<div><p>
A. 비로그인 회원은 팀 모집 게시글을 열람하실 수 있습니다.<br>
로그인 회원은 모집 글을 작성하실 수 있으며 마이페이지에서 확인하실 수 있습니다.<br>
추가 문의사항은 아래 채팅 문의나 메일 문의로 부탁드립니다.
</p></div>
<input type="radio" name="accordian" id="answer03"/>
<label for="answer03">Q. 투표는 어떻게 하나요?<em></em></label>
<div><p>
A. 특정 주제에 대하여 운영자가 투표 게시글을 작성합니다.<br>
로그인한 회원은 투표에 참여하실 수 있습니다.<br>
추가 문의사항은 아래 채팅 문의나 메일 문의로 부탁드립니다.
</p></div>
<input type="radio" name="accordian" id="answer04"/>
<label for="answer04">Q. 신고는 어떻게 이루어지나요?<em></em></label>
<div><p>
A. 광고, 욕설 등에 대한 신고가 접수되면 운영자가 해당 내용을 파악합니다.<br>
누적 경고횟수가 많아지면 강퇴처리됩니다.<br>
추가 문의사항은 아래 채팅 문의나 메일 문의로 부탁드립니다.
</p></div>
</div>
</div>
    
<div class="footer">
<div class="footerMenuForm">
<div class="footerMenu">
<div class="footerTitle">채팅문의</div>
<div class="footerExplain">관리자와 대화로 문의하실 수 있습니다</div>
<div class="footerExplain2">09:00 AM - 12:00 PM  / 01:00 PM - 06:00 PM</div>
<input type="button" class="footerButton" value="관리자와 채팅하기" 
       onclick="location.href='chat'">
</div>
<div class="footerMenu">
<div class="footerTitle">문의 남기기</div>
<div class="footerExplain">문의사항을 남겨주시면 메일로 답변해드립니다.</div>
<div class="footerExplain2">답장 받으실 메일을 남겨주세요.</div>
<input type="button" class="footerButton" value="문의하기"
        onclick="location.href='contactEmail'">
</div>
</div>    
</div>   
</body>
</html>