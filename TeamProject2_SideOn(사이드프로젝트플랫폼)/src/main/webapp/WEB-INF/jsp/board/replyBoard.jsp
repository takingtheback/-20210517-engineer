<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Git utterances|Side-On</title>
<link type="text/css" rel="stylesheet" href="../css/FaQBoard_JHK.css">
<script src="/resource/js/reply_JHK.js"></script>
</head>
<body>
<%@ include file="../inc/header.jsp" %>
<!-- Header -->
<header class="bg-warning py-5">
    <a href="/board/replyBoard" style="text-decoration:none">
    	<div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
        <!-- 헤더...어떻게... -->
        <div style="padding-top: 8%;">
            <h1 class="display-5 fw-bolder">Board</h1>
            <p class="lead fw-normal text-white-80 mb-0">Git utterances 기능을 이용해서 댓글을 남겨주세요.</p>
	    </div>
	    </div>
		</div>
 	</a>
</header>
<div class="utterances" style="height: auto;top:50px;">
<script src="https://utteranc.es/client.js"
        repo="PD-team2/SpringProject"
        issue-term="pathname"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
</div>


    

</body>
</html>