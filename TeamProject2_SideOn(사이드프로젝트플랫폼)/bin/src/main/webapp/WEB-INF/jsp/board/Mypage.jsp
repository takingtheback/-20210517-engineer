<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FaQ Board</title>
<link type="text/css" rel="stylesheet" href="../css/Mypage_JHK.css">
</head>
<body>
<%@ include file="../inc/header.jsp" %>

<div class="MyPage-Form">
<div class="MyProfile">
    <div class="Img"><a href="#">
    <img src="https://raw.githubusercontent.com/PD-team2/SpringProject_Output/main/JaeHyunKim/IMG/MyProfile.png"></a></div>
    <div class="title"> 내 프로필</div> 
    <div class="expalin"> 회원님의 정보를 확인하고 변경할 수 있습니다.</div> 
    <input type="button" class="button" value="프로필 보기">
</div>
<div class="MyProfile">
    <div class="Img"><a href="#">
    <img src="https://raw.githubusercontent.com/PD-team2/SpringProject_Output/main/JaeHyunKim/IMG/MyInfo.png"></a></div>
    <div class="title"> 프로젝트 관리</div> 
    <div class="expalin"> 회원님의 모집글 참여현황을 관리할 수 있습니다.</div> 
    <input type="button" class="button" value="프로젝트 관리">
</div>

<div class="MyProfile">
    <div class="Img"><a href="/board/FaQBoard">
    <img src="https://raw.githubusercontent.com/PD-team2/SpringProject_Output/main/JaeHyunKim/IMG/Question.png"></a></div>
    <div class="title"> 문의하기</div> 
    <div class="expalin"> 관리자에게 문의하실 수 있습니다.</div> 
    <input type="button" class="button" value="문의하기" onclick="location.href='FaQBoard'"> 
</div>
<div class="MyProfile">
    <div class="Img"><a href="/member/deleteForm">
    <img src="https://raw.githubusercontent.com/PD-team2/SpringProject_Output/main/JaeHyunKim/IMG/Myrecord.png"></a></div>
    <div class="title"> 회원 탈퇴</div> 
    <div class="expalin"> 등록된 아이디를 삭제할 수 있습니다.</div> 
    <input type="button" class="button" value="탈퇴하기" onclick="location.href='/member/deleteForm'" >
     
</div>
    
</div>
    

</body>
</html>