<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage|Side-On</title>
<link type="text/css" rel="stylesheet" href="../css/Mypage_JHK.css">
</head>
<body>
<%@ include file="../inc/header.jsp" %>
<!-- Header -->
<header class="bg-warning py-5">
    <a href="/board/Mypage" style="text-decoration:none">
    	<div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
        <!-- 헤더...어떻게... -->
        <div style="padding-top: 8%;">
            <h1 class="display-5 fw-bolder">마이페이지</h1>
            <p class="lead fw-normal text-white-80 mb-0">본인정보를 관리하세요.</p>
	    </div>
	    </div>
		</div>
 	</a>
</header>

<div class="MyPage-Form">
<div class="MyProfile">
    <div class="Img"><a href="#">
    <img src="https://raw.githubusercontent.com/PD-team2/SpringProject_Output/main/JaeHyunKim/IMG/MyProfile.png"></a></div>
    <div class="title"> 내 프로필</div> 
    <div class="expalin"> 회원님의 정보를 확인하고 변경할 수 있습니다.</div> 
    <input style="margin-top:30px;" type="button" class="btn-warning" value="프로필 보기" onclick="location.href='/member/myInfo'" >
</div>
<div class="MyProfile">
    <div class="Img"><a href="#">
    <img src="https://raw.githubusercontent.com/PD-team2/SpringProject_Output/main/JaeHyunKim/IMG/MyInfo.png"></a></div>
    <div class="title"> 프로젝트 관리</div> 
    <div class="expalin"> 회원님의 모집글 참여현황을 관리할 수 있습니다.</div> 
    <input style="margin-top:30px;" type="button" class="btn-warning" value="프로젝트 관리" onclick="location.href='/recruit/recruitMypage'" >
</div>

<div class="MyProfile">
    <div class="Img"><a href="/board/FaQBoard">
    <img src="https://raw.githubusercontent.com/PD-team2/SpringProject_Output/main/JaeHyunKim/IMG/Question.png"></a></div>
    <div class="title"> 문의하기</div> 
    <div class="expalin"> 관리자에게 문의하실 수 있습니다.</div> 
    <input style="margin-top:30px;" type="button" class="btn-warning" value="문의하기" onclick="location.href='FaQBoard'"> 
</div>
<div class="MyProfile">
    <div class="Img"><a href="/member/deleteForm">
    <img src="https://raw.githubusercontent.com/PD-team2/SpringProject_Output/main/JaeHyunKim/IMG/Myrecord.png"></a></div>
    <div class="title"> 회원 탈퇴</div> 
    <div class="expalin"> 등록된 아이디를 삭제할 수 있습니다.</div> 
    <input style="margin-top:30px;" type="button" class="btn-warning" value="탈퇴하기" onclick="location.href='/member/deleteForm'" >
     
</div>
    
</div>

</body>
</html>
