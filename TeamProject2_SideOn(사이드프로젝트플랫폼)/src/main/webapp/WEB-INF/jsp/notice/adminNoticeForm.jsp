<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="../inc/adminHeadLink.jsp"%>
<title>Notice</title>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar (사이드바) -->
		<%@ include file="../inc/adminSideNav.jsp"%>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar (상단바) -->
				<%@ include file="../inc/adminTopNav.jsp"%>
				<!-- End of Topbar -->
			
				 <!-- Begin Page Content -->
                <div class="card shadow mb-4">
                	<!-- content header 제목 -->
                	<div class="card-header py-3">
                	NOTICE | 공지사항 글쓰기
                	</div>
                	
                	<!-- content body 내용 -->
                	<div class="card-body">
                		<div class="container">
                			<div class="row">
                			<form method="post" action="noticeWrite">
                				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
                					<thead>
                						<tr>
                						</tr>
                					</thead>
                					<tbody>
                						<tr>
                							<td colspan="6" style="background-color:#fff; text-align: center; height: 50px;">
                							<input type="text" placeholder="글 제목" id="noticeTitle" name="noticeTitle" style="width: 700px; height: 50px;"/>
                							</td>
                							
                						</tr>
                						<tr>
                							<td colspan="6" style="background-color:#fff; text-align: center; height: 350px;">
                							<input type="text" placeholder="내용을 입력하세요." id="noticeContent" name="noticeContent" style="width: 700px; height: 350px;"/>
                							</td>
                						</tr>
                							
                					</tbody>
                				</table>
                				<button class="btn btn-primary" type="submit" value="작성" style="width: 60px; height: 35px;">작성</button>
                				&nbsp;&nbsp;
                				<button class="btn btn-danger" type="reset" value="취소" style="width: 60px; height: 35px;">취소</button>
                			</form>
                			</div>
                		</div>
                	</div>
                	<!-- content body 내용 끝 -->
                </div>
			
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

	<%@ include file="../inc/adminBodyLink.jsp"%>



</body>

</html>