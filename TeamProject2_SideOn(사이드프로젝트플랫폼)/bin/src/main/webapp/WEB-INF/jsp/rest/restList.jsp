<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file="../inc/adminHeadLink.jsp" %>
    <title>Rest</title>
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
                	REST LIST
                	</div>
                	
                	<!-- content body 내용 -->
                	<div class="card-body">
                		<div class="container">
                			<div class="row">
                				<table class="table" style="text-align: center; border: 1px solid #dddddd;">
                					<thead>
                						<tr>
                							<th style="background-color: #eeeeee; text-align: center;">No</th>
                							<th style="background-color: #eeeeee; text-align: center;">작성자</th>
                							<!-- 
                							<th style="background-color: #eeeeee; text-align: center;">내용</th>
                							 -->
                							<th style="background-color: #eeeeee; text-align: center;">글번호</th>
                							<th style="background-color: #eeeeee; text-align: center;">사유</th>
                							<th style="background-color: #eeeeee; text-align: center;">신고접수</th>                							 
                							<th style="background-color: #eeeeee; text-align: center;">신고처리</th>                							 
                							<th style="background-color: #eeeeee; text-align: center;">처리상태</th>
                							<th style="background-color: #eeeeee; text-align: center;">관리</th>
                							
                						</tr>
                					</thead>
                					<tbody>
                					<c:forEach var="dto" items="${restList}" varStatus="status">
	               						<tr>
	               							<th>${dto.restNo}</th>
	                						<th>${dto.memberId}</th>
	                						<th>${dto.noticeNo}</th>
	                						<th>${dto.reason}</th>
	                						<th>${dto.restEnroll}</th>
	                						<th>${dto.restConfirm}</th>
	                						<!-- 
	                						<th>2020-05-11</th>
	                						<th>2020-11-20</th>
	                						 -->
	                						<th>
	                							<c:choose>
	                								<c:when test="${dto.restCheck eq 'F'}">처리요청</c:when>
	                								<c:when test="${dto.restCheck eq 'T'}">처리완료</c:when>
	                							</c:choose>
	                						</th>
	                						<th><a href="restMenagement"><i class="fas fa-fw fa-cog"></i></a></th>
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