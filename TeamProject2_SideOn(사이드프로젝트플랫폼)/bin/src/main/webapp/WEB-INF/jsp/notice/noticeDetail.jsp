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
                							<th colspan="1" style="background-color: #eeeeee; ">No.${dto.noticeNo}</th>
                							<!-- 
                							<td>${dto.noticeNo}</td>
                							 -->
                							<!-- 
                							<th style="background-color: #eeeeee; text-align: center;">제목</th>
                							 -->
                							<td colspan="5" style="text-align: left;">${dto.noticeTitle}</td>
                							
                						</tr>

                						<tr>
                							<th colspan="1" style="background-color: #eeeeee;">작성자</th>
                							<td colspan="1">${dto.memberId}</td>
                							
                							<th colspan="1" style="background-color: #eeeeee; ">조회수</th>                							
                							<td colspan="1">${dto.viewCount}</td>

                							<th colspan="1" style="background-color: #eeeeee;">게시일</th>
                							<td colspan="1">${dto.noticeDate}</td>
                						</tr>
                					</thead>
                					<tbody>
                						<tr>
                						<!-- 
                							<th style="background-color: #eeeeee;">내용</th>
                						 -->
                							<td colspan="6" style="background-color:#fff; text-align: center;">${dto.noticeContent}</td>
                						</tr>
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