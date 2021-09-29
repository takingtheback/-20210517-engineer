<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA Board|Side-On</title>
<link type="text/css" rel="stylesheet" href="../css/QnABoard_JHK.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="../js/QnABoard_JHK.js"></script>
</head>
<body>
<%@ include file="../inc/header.jsp" %>
<!-- Header-->
<header class="bg-warning py-5">
<a href="/board/QnABoard" style="text-decoration:none">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
        <!-- 헤더...어떻게... -->
        <div style="padding-top: 8%;">
            <h1 class="display-5 fw-bolder">문의게시판</h1>
            <p class="lead fw-normal text-white-80 mb-0">직접 문의글을 남겨보세요.</p>
    </div>
    </div>
 </div>
 </a>
</header>
<div class="QnAForm">
<table class="QnATable" >
	<tr class="QnATitle">
		<th>번호</th>
		<th>문의제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	
	<tr>
		<!-- status.index => 0시작, status.count => 1시작 -->
		<th>${dto.qnaBoardNo}</th>
		<th>${dto.qnaBoardTitle}</th>
		<th>${dto.memberId}</th>
		<th>${dto.qnaBoardDate}</th>
		<th>${dto.qnaBoardViews}</th>
	</tr>
	<tr colspan= "5" class="QnATitle">
		<th>문의내용</th>
		<th></th>
		<th></th>
		<th></th>
		<th></th>
		<th></th>
	</tr>
	<tr class="qnaContents">
	<th colspan="5"><textarea id="qnaContentsArea" name="qnaContentsArea" rows="5" cols="33">
	${dto.qnaBoardContents}</textarea></th>
	</tr>
	</table>

</div>
		
<div class=UpdateButtonArea>

   <c:choose>
	<c:when test="${(not empty memberId && not empty grade) || empty dto}">
	<c:if test="${ memberId == dto.memberId }">
	<button type="button" class="btn-warning" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
	onclick="location.href='QnABoardUpdate?qnaBoardNo=${dto.qnaBoardNo}'">수정하기</button>
	<button type="button" class="btn-warning" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
	onclick="deleteConfirm()">삭제하기</button>
	</c:if>
	</c:when>
	</c:choose>
	
	<button type="button" class="btn-warning" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
	onclick="location.href='QnABoard'">되돌아가기</button>
</div>

<input type="hidden" name="deleteButton" id="deleteButton" onclick="location.href='QnABoardDelete?qnaBoardNo=${dto.qnaBoardNo}'"></input>



</body>
</html>