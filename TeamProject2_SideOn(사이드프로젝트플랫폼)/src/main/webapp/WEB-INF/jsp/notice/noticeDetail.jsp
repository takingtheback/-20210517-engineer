<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../inc/adminHeadLink.jsp" %>
<title>공지사항 | Side-On</title>
</head>
<body>
	<!-- Top Nav inc -->
	<%@ include file="../inc/adminTopNav.jsp"%>

	<!-- Header-->
	<section>
		<!-- content body 내용 -->
		<div class="card-body">
			<div class="container">
				<div class="row">
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd;">
						<thead>
							<tr>
								<th colspan="1" style="background-color: #eeeeee;">No.${dto.noticeNo}</th>
								
								<td colspan="5" style="text-align: left;">${dto.noticeTitle}</td>

							</tr>

							<tr>
								<th colspan="1" style="background-color: #eeeeee;">작성자</th>
								<td colspan="1">${dto.memberId}</td>

								<th colspan="1" style="background-color: #eeeeee;">조회수</th>
								<td colspan="1">${dto.viewCount}</td>

								<th colspan="1" style="background-color: #eeeeee;">게시일</th>
								<td colspan="1">${dto.noticeDate}</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="6"
									style="background-color: #fff; text-align: center;">${dto.noticeContent}</td>
							</tr>
						</tbody>
					</table>
					<div>
	                	<button onclick="history.back()" type="button" class="btn btn-warning" style="width: 100px; height: 35px;">뒤로가기</button>
	                	&nbsp;&nbsp;
	                	<!-- rest modal -->
						<button type="button" class="btn btn-danger" style="width: 80px; height: 35px;" data-toggle="modal" data-target=".bs-example-modal-lg">신고</button>
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
<%@ include file="../inc/restModalForm.jsp" %>
</html>