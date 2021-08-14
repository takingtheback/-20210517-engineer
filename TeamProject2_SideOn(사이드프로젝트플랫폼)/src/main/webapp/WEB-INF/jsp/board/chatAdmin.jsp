<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file="../inc/adminHeadLink.jsp" %>
    <title>chatAdmin|Side-On</title>
    <link type="text/css" rel="stylesheet" href="../css/chat_JHK.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="../js/chat_JHK.js"></script>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar (사이드바) -->
        <%@ include file="../inc/adminSideNav.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar (상단바) -->
                <%@ include file="../inc/adminTopNav.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="card shadow mb-4">
                	<!-- content header 제목 -->
                	<div class="card-header py-3">
                	1:1 채팅문의
                	</div>
                	
                	<!-- content body 내용 -->
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
                	
                    <!-- Page Heading -->
                    <!-- 
                    <h1 class="h3 mb-4 text-gray-800">Blank Page</h1>
                     -->

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Team2 Project 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

	<%@ include file="../inc/adminBodyLink.jsp" %>

</body>
<%@ include file="../inc/restManageModalForm.jsp" %>
</html>