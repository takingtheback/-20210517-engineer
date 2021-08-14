<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 chat|Side-On</title>
<link type="text/css" rel="stylesheet" href="../css/chat_JHK.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/chat_JHK.js"></script>
</head>
<body>
<%@ include file="../inc/header.jsp" %>
<!-- Header -->
<header class="bg-warning py-5">
    <a href="/board/chat" style="text-decoration:none">
    	<div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
        <!-- 헤더...어떻게... -->
        <div style="padding-top: 8%;">
            <h1 class="display-5 fw-bolder">1:1 문의하기</h1>
            <p class="lead fw-normal text-white-80 mb-0">관리자에게 채팅으로 문의하실 수 있습니다.</p>
	    </div>
	    </div>
		</div>
 	</a>
</header>

	<div id="container" class="container">
		<div class="ChatForm">
		<input type="hidden" id="sessionId" value="">
		<div id="chating" class="chating">
		</div>
		
		<div id="yourName">
			<table class="inputTable">
				<tr>
					
					<th><input type="text" name="userName" id="userName" value="${dto.memberId}"></th>
					<th><button onclick="chatName()" id="startBtn" class="btn-warning">이름 등록</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					
					<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn" class="btn-warning">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
</div>  
</body>
</html>