<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FaQ Board</title>
<link type="text/css" rel="stylesheet" href="../css/chat_JHK.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/chat_JHK.js"></script>
</head>
<body>
<%@ include file="../inc/header.jsp" %>


	<div id="container" class="container">
		<div class="ChatForm">
        <span class="Chat_title">
        <img src="https://raw.githubusercontent.com/PD-team2/SpringProject_Output/main/JaeHyunKim/IMG/Question_bgWhite.png">
        </span>    
        <span class="Chat_title">1:1 문의하기</span>
        <div class="Chat_explain">관리자에게 채팅으로 문의하실 수 있습니다.</div>   
        <hr>    
		<input type="hidden" id="sessionId" value="">
		<div id="chating" class="chating">
		</div>
		
		<div id="yourName">
			<table class="inputTable">
				<tr>
					
					<th><input type="text" name="userName" id="userName" value=memberId></th>
					<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					
					<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
</div>  
</body>
</html>