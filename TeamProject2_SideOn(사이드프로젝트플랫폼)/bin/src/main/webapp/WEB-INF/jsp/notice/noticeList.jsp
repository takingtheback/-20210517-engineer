<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file="../inc/adminHeadLink.jsp" %>
    <title>Notice</title>
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
                	NOTICE
                	</div>
                	
                	<!-- content body 내용 -->
                	<div class="card-body">
                		<div class="container">
                			<div class="row">
                				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
                					<thead>
                						<tr>
                							<th style="background-color: #eeeeee; text-align: center;">No</th>
                							<th style="background-color: #eeeeee; text-align: center;">제목</th>
                							<!-- 
                							<th style="background-color: #eeeeee; text-align: center;">내용</th>
                							 -->
                							<th style="background-color: #eeeeee; text-align: center;">작성자</th>
                							<th style="background-color: #eeeeee; text-align: center;">게시일</th>
                							<!-- 
                							<th style="background-color: #eeeeee; text-align: center;">게시상태</th>
                							<th style="background-color: #eeeeee; text-align: center;">관리</th>
                							 -->
                						</tr>
                					</thead>
                					<tbody>
                					<c:forEach var="dto" items="${noticeList}" varStatus="status">
	               						<tr>
	               							<th>${dto.noticeNo}</th>
	                						<th><a href="noticeDetail?noticeNo=${dto.noticeNo}" style="color: #3f3f3f;">${dto.noticeTitle}</a></th>
	                						<!-- 
	                						<th>${dto.noticeContent}</th>
	                						 -->
	                						<th>${dto.memberId}</th>
	                						<th>${dto.noticeDate}</th>
	                						<!-- 
	                						<th><a href="restMenagement"><i class="fas fa-fw fa-cog"></i></a></th>
	                						 -->
	                					</tr>
                					</c:forEach>
                					</tbody>
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

</html>