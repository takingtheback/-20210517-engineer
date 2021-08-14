<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 | Side-On</title>
</head>
<body>
	<!-- Top Nav inc -->
	<%@ include file="../inc/header.jsp"%>

	<!-- Header-->
	<section>
		<header class="bg-warning py-5">
			<div class="container px-4 px-lg-5 my-5">
				<div class="text-center text-white">

					<div style="padding-top: 8%;">
						<h1 class="display-5 fw-bolder">NOTICE</h1>
						<!-- 
                    	<p class="lead fw-normal text-white-80 mb-0">부제목</p>
                    	 -->
					</div>
				</div>
			</div>
		</header>
	

	<!-- Begin Page Content -->
	<div class="card shadow mb-4">
		<!-- content header 제목 -->
		<div class="card-header py-3"></div>

		<!-- content body 내용 -->
		<div class="card-body">
			<div class="container">
				<div class="row">
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd;">
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">No</th>
								<th style="background-color: #eeeeee; text-align: center;">제목</th>
								
								<th style="background-color: #eeeeee; text-align: center;">작성자</th>
								<th style="background-color: #eeeeee; text-align: center;">게시일</th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${noticeList}" varStatus="status">
								<tr>
									<th>${dto.noticeNo}</th>
									<th><a href="noticeDetail?noticeNo=${dto.noticeNo}" style="color: #3f3f3f;">${dto.noticeTitle}</a></th>
									<th>${dto.memberId}</th>
									<th>${dto.noticeDate}</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	</section>
	
	<!-- Footer -->
	<footer class="sticky-footer bg-white">
		<div class="container my-auto">
			<div class="copyright text-center my-auto">
				<span>Copyright &copy; Side-On 2021</span>
			</div>
		</div>
	</footer>
	<!-- End of Footer -->

	<!-- Bootstrap core JavaScript-->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../js/sb-admin-2.min_yuna.js"></script>

</body>
</html>