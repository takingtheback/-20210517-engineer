<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="../js/chatList_JHK.js"></script>
	<script src="/resource/js/reply_JHK.js"></script>
	<link type="text/css" rel="stylesheet" href="../css/chat_JHK.css">
<meta charset="UTF-8">
	<title>ChatList|Side-On</title>
</head>
<body>
<%@ include file="../inc/header.jsp" %>
<!-- Header -->
<header class="bg-warning py-5">
    <a href="/board/chatRoom" style="text-decoration:none">
    	<div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
        <!-- 헤더...어떻게... -->
        <div style="padding-top: 8%;">
            <h1 class="display-5 fw-bolder">연락하기</h1>
            <p class="lead fw-normal text-white-80 mb-0">채팅방을 개설하여 팀원들과 채팅하거나 이미지파일을 전송할 수 있습니다.<br>
             Git utterances 기능을 이용해서 댓글을 남길 수 있습니다.</p>
	    </div>
	    </div>
		</div>
 	</a>
</header>
	<!-- 채팅방 -->
	<div class="container">
		<div class="inputArea">
			<table class="inputTable">
				<tr>
					<th><input type="text" name="roomName" id="roomName" placeholder="방 제목을 입력해주세요."></th>
					<th><button id="createRoom" class="btn-warning">방 만들기</button></th>
				</tr>
			</table>
		</div>
		<div id="roomContainer" class="roomContainer">
			<table id="roomList" class="roomList"></table>
		</div>
	</div>
	
	<!-- utteranc -->
	<div class="utterances" style="height: auto;top:50px;bottom:50px;">
		<script src="https://utteranc.es/client.js" repo="PD-team2/SpringProject" issue-term="pathname" theme="github-light" crossorigin="anonymous" async></script>
	</div>
</body>
</html>