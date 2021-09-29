<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.side_on.dto.Member" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>SideOn</title>
		<link type="text/css" rel="stylesheet" href="../css/RecruitHome_juri.css">
		
		<!-- Google Font -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
<body>
<%@ include file="../inc/header.jsp" %>

        <!-- Header-->
        <header class="bg-warning py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                <!-- 헤더...어떻게... -->
                <div style="padding-top: 8%;">
                    <h1 class="display-5 fw-bolder">내정보조회 및 변경</h1>
            </div>
            </div>
         </div>
        </header><br>
<body>
<div align="center" style="font-size:1.5em;">
<%= session.getAttribute("memberId") %>님의 정보입니다.
</div><br>
<%
	Member dto = (Member)request.getAttribute("dto");
	if (dto == null) {
		out.write("<script>");
		out.write("alert('내정보 조회 서비스를 먼저 요청하시기 바랍니다.');");
		out.write("location.href='main.jsp'");
		out.write("</script>");
		return;
	}
%>
<div align="center">
<form action="myInfoUpdate" method="post">
	<div>아이디</div>
	<input type="text" name="memberId" value="<%= dto.getMemberId() %>" 
		readonly="readonly">
	
	<div>비밀번호</div>
	<input type="password" name="memberPw" value="<%= dto.getMemberPw() %>">
	
	<div>이메일</div>
	<input type="text" name="email" value="<%= dto.getEmail() %>">
	
	<div>등급</div>
	<input type="text" name="grade" value="<%= dto.getGrade() %>" readonly="readonly">
	
	<div>이름</div>
	<input type="text" name="name" value="<%= dto.getName() %>">
	
	<div>휴대폰</div>
	<input type="text" name="mobile" value="<%= dto.getMobile() %>">
	
	<div>가입일</div>
	<input type="text" name="entryDate" value="<%= dto.getEntryDate() %>" readonly="readonly">
	
	<div>신고횟수</div>
	<input type="text" name="restCount" value="<%= dto.getRestCount() %>" readonly="readonly">
	
	<div>리워드 금액</div>
	<input type="text" name="reward" value="<%= dto.getReward() %>" readonly="readonly"><br>
	
	<div class="btn both">
	<button type="submit" class="btn btn-warning">내정보변경</button>
	<button type="button"  class="btn btn-danger" onclick="location.href='/board/Mypage'">돌아가기</button>
	</div>
</form>
</div>
</body>
</html>
