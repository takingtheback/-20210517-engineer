<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file="../inc/adminHeadLink.jsp" %>
	<title>리워드 관리 | Admin </title>
	
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script>
	
		function rewardPay() {
			var cancel = confirm("[안내] 리워드를 지급하시겠습니까?");
			
			if(cancel == true){		
				alert('[안내] 정상 지급 되었습니다.');
		    	$('#reward').submit();
			}else{
				
			}
		}
	
	</script>
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
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">리워드 관리</h1>
                    </div>

                    <!-- 카드 Row, 방문자수, 신고수, 현재날짜 -->
     
                    <!-- Content Row -->

                    <div class="row">

                        <!-- Notice List 상위 5개 -->
                        <div class="col-12">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">결제 현황</h6>
                                    
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
				                		<div class="container">
                							<div class="row">
                								<table class="table" style="text-align: center; border: 1px solid #dddddd;">
                									<thead>
                										<tr>
                											<th style="background-color: #eeeeee; text-align: center;">결제번호 </th>
                											<th style="background-color: #eeeeee; text-align: center;">글 번호</th>
                											<th style="background-color: #eeeeee; text-align: center;">리더</th>
                											<th style="background-color: #eeeeee; text-align: center;">결제자</th>
                											<th style="background-color: #eeeeee; text-align: center;">금액</th>
                											<th style="background-color: #eeeeee; text-align: center;">리워드 상태</th>
                										</tr>
                									</thead>
                									
                									<tbody>  
  <c:forEach var="admin" items="${reward}">             									           			
  
 <form action="/recruit/reward/complete" method="post" name="reward" id="reward">
  <input type="hidden" name="payment_id" id="payment_id" value="${admin.payment_id}" >
    <input type="hidden" name="recruit_num" id="recruit_num" value="${admin.recruit_num}" >
      <input type="hidden" name="pay_amount" id="pay_amount" value="${admin.pay_amount}" >
  </form>						
                											<tr>
                												<th>${admin.payment_id}</th>
	               												<th>${admin.recruit_num}</th>
	               												<th>${admin.writer_memberId}</th>
	               												<th>${admin.apply_memberId}</th>
	               												<th>${admin.pay_amount}</th>
	               												<th>  
	               												<c:if test="${admin.reward_yn == 'y'}">
	               													<button type="button" class="btn btn-danger" disabled>미지급</button>
	               													<button type="button" class="btn btn-success" onclick="rewardPay(${admin.pay_amount})">지급하기</button>
	               												</c:if>
	               												
	               												<c:if test="${admin.reward_yn == 'n'}">
	               													<button type="button" class="btn btn-success" disabled>지급 완료</button>
	               												</c:if>
	               												</th>
		               												
	               											</tr>

 </c:forEach>              											
                									</tbody>
                								</table>
                							</div>
                						</div>
                					</div>
                                </div>
                        </div>


                        <!-- Browser Column -->

                        <div class="col-lg-6 mb-4">

                        </div>
                    </div>

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