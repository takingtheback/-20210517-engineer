<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FaQ Board|Side-On</title>
<link type="text/css" rel="stylesheet" href="../css/FaQBoard_JHK.css">
</head>
<body>
<%@ include file="../inc/header.jsp" %>
<!-- Header -->
<header class="bg-warning py-5">
    <a href="/board/FaQBoard" style="text-decoration:none">
    	<div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
        <!-- 헤더...어떻게... -->
        <div style="padding-top: 8%;">
            <h1 class="display-5 fw-bolder">FaQ</h1>
            <p class="lead fw-normal text-white-80 mb-0">자주 물어보시는 질문들에 대한 답변입니다.</p>
	    </div>
	    </div>
		</div>
 	</a>
</header>
<div class="FAQForm">
   
<div class="accordian">
<input type="radio" name="accordian" id="answer01"/>
<label for="answer01">Q. 프로젝트 모집 관련 질문<em></em></label>
<div><p>
A. 프로젝트 모집관련 질문에 대한 답변입니다.<br>
질문에 대한 답변입니다.<br>
    질문에 대한 답변입니다.
</p></div>
<input type="radio" name="accordian" id="answer02"/>
<label for="answer02">Q. 팀원 모집 관련 질문<em></em></label>
<div><p>
A. 프로젝트 모집관련 질문에 대한 답변입니다.<br>
질문에 대한 답변입니다.<br>
    질문에 대한 답변입니다.
</p></div>
<input type="radio" name="accordian" id="answer03"/>
<label for="answer03">Q. 투표 관련 질문<em></em></label>
<div><p>
A. 프로젝트 모집관련 질문에 대한 답변입니다.<br>
질문에 대한 답변입니다.<br>
    질문에 대한 답변입니다.
</p></div>
<input type="radio" name="accordian" id="answer04"/>
<label for="answer04">Q. 신고 관련 질문<em></em></label>
<div><p>
A. 프로젝트 모집관련 질문에 대한 답변입니다.<br>
질문에 대한 답변입니다.<br>
    질문에 대한 답변입니다.
</p></div>
</div>
</div>

  
<div class="footer">
<div class="footerMenuForm">
	<div class="footerMenu">
		<div class="footerTitle">채팅문의</div>
		<div class="footerExplain">관리자와 대화로 문의하실 수 있습니다</div>
		<div class="footerExplain2">09:00 AM - 12:00 PM  / 01:00 PM - 06:00 PM</div>
		<input type="button" class="btn-warning" style="margin-top:10px; margin-left:20px;" value="관리자와 채팅하기" 
		       onclick="location.href='chat'">
	</div>
<c:choose>
<c:when test="${(empty memberId && empty grade) || empty dto}">
	<div class="footerMenu">
		<div class="footerTitle">문의 남기기</div>
		<div class="footerExplain">문의사항을 남겨주시면 메일로 답변해드립니다.</div>
		<div class="footerExplain2">답장 받으실 메일을 남겨주세요.</div>
		<input type="button" class="btn-warning" style="margin-top:10px; margin-left:20px;" value="문의하기"
		        onclick="location.href='contactEmail'">
	</div>
</c:when>		
	
<c:when test="${(not empty memberId && not empty grade) || empty dto}">
<c:if test="${grade == 'A' || dto.grade == 'A'}">
		<div class="footerMenu">
		<div class="footerTitle">문의 게시판</div>
		<div class="footerExplain">문의 게시판을 이용하실 수 있습니다.</div>
		<div class="footerExplain2">문의게시판 이동</div>
		<input type="button" class="btn-warning" style="margin-top:10px; margin-left:20px;" value="문의게시판"
		        onclick="location.href='QnABoard'">
		</div>
	</c:if>
	
	<c:if test="${grade == 'G' || dto.grade == 'G'}">
		<div class="footerMenu">
		<div class="footerTitle">문의 게시판</div>
		<div class="footerExplain">문의 게시판을 이용하실 수 있습니다.</div>
		<div class="footerExplain2">문의게시판 이동</div>
		<input type="button" class="btn-warning"  style="margin-top:10px; margin-left:20px;" value="문의게시판"
		        onclick="location.href='QnABoard'">
		</div>
	</c:if>	
	</c:when>			
</c:choose>

</div>    
</div>   
</body>
</html>