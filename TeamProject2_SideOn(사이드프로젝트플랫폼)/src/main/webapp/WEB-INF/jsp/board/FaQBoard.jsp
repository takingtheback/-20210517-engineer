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
	<label for="answer01">Q. 프로젝트 모집은 누가 어떻게 할 수 있나요?<em></em></label>
		<div><p>
		A. 비로그인 회원은 프로젝트 모집 게시글을 열람하실 수 있습니다.<br>
		로그인 회원은 모집 글을 작성하실 수 있으며 마이페이지에서 확인하실 수 있습니다.<br>
		문의메일이나 문의게시판을 이용해 추가 문의사항을 물어보실 수 있습니다. 
		</p></div>
	<input type="radio" name="accordian" id="answer02"/>
	<label for="answer02">Q. 팀원 모집을 하고 싶습니다.<em></em></label>
		<div><p>
		A. 비로그인 회원은 팀 모집 게시글을 열람하실 수 있습니다.<br>
		로그인 회원은 모집 글을 작성하실 수 있으며 마이페이지에서 확인하실 수 있습니다.<br>
		문의메일이나 문의게시판을 이용해 추가 문의사항을 물어보실 수 있습니다. 
		</p></div>
	<input type="radio" name="accordian" id="answer03"/>
	<label for="answer03">Q. 투표는 어떻게 하나요?<em></em></label>
		<div><p>
		A. 특정 주제에 대하여 운영자가 투표 게시글을 작성합니다.<br>
		로그인한 회원은 투표에 참여하실 수 있습니다.<br>
		문의메일이나 문의게시판을 이용해 추가 문의사항을 물어보실 수 있습니다. 
		</p></div>
	<input type="radio" name="accordian" id="answer04"/>
	<label for="answer04">Q. 신고는 어떻게 이루어지나요?<em></em></label>
		<div><p>
		A. 광고, 욕설 등에 대한 신고가 접수되면 운영자가 해당 내용을 파악합니다.<br>
		누적 경고횟수가 많아지면 강퇴처리 될 수 있습니다.<br>
		문의메일이나 문의게시판을 이용해 추가 문의사항을 물어보실 수 있습니다. 
		</p></div>
</div>
</div>

  
<div class="footer">
<div class="footerMenuForm">
	<div class="footerMenu">
		<div class="footerTitle">문의 남기기</div>
		<div class="footerExplain">문의사항을 남겨주시면 메일로 답변해드립니다.</div>
		<div class="footerExplain2">답장 받으실 메일을 남겨주세요.</div>
		<input type="button" class="footerButton" style="margin-top:10px; margin-left:20px;" value="문의하기"
		        onclick="location.href='contactEmail'">
	</div>
	<c:choose>
		<c:when test="${(not empty memberId && not empty grade) || empty dto}">
			<c:if test="${grade == 'A' || dto.grade == 'A'}">
				<div class="footerMenu">
				<div class="footerTitle">문의 게시판</div>
				<div class="footerExplain">문의 게시판을 이용하실 수 있습니다.</div>
				<div class="footerExplain2">문의게시판 이동</div>
					<input type="button" class="footerButton" style="margin-top:10px; margin-left:20px;" value="문의게시판"
					        onclick="location.href='QnABoard'">
				</div>
			</c:if>
			<c:if test="${grade == 'G' || dto.grade == 'G'}">
				<div class="footerMenu">
				<div class="footerTitle">문의 게시판</div>
				<div class="footerExplain">문의 게시판을 이용하실 수 있습니다.</div>
				<div class="footerExplain2">문의게시판 이동</div>
					<input type="button" class="footerButton"  style="margin-top:10px; margin-left:20px;" value="문의게시판"
					        onclick="location.href='QnABoard'">
				</div>
			</c:if>	
		</c:when>			
	</c:choose>

</div>    
</div>   
</body>
</html>