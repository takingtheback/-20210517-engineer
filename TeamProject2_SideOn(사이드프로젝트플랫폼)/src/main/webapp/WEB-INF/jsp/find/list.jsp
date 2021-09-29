<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
       	<title>팀원찾기 | Side-On</title>
      
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/findMember_sh.css" rel="stylesheet" />
    </head>
    <body>
    
    <!-- navibar -->
       <%@ include file="../inc/header.jsp" %>
    
        <!-- Header-->
        <header class="bg-warning py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                <div style="padding-top: 8%;">
                    <h1 class="display-5 fw-bolder">팀원찾기</h1>
                    <p class="lead fw-normal text-white-80 mb-0">직접 프로젝트에 필요한 팀원을 찾아보세요.</p>
				</div>
				</div>
			</div>
        </header>
        
        
        <c:out value="${list}"></c:out>
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
 			<c:forEach var="find" items="${find}" varStatus="status">
                      <div class="col mb-5">
                        <div class="card h-100">
                        <!-- Message box -->
                            <div class="card-body p-4">
                                <div class="text-center">
                                <!-- position -->
                                <a class="badge bg-info text-decoration-none link-light">${find.find_position }</a>
                                <br>
                                <br>
                                	<!-- title -->
                               		<h5 class="fw-bolder">${find.find_title}</h5>
                               		<!-- id -->
                               		${find.find_writer}
                                </div>
                            </div>
                            <!-- detail link-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-warning mt-auto" href="detail?find_no=${find.find_no}">더 보러 가기</a></div>
                            </div>
                        </div>
                    </div>
			</c:forEach>
                   
                   <div>

                   <br>
                   <br>
                   </div>
               <!-- 글쓰기 버튼 -->
				<div class="text-center1">
				<a href="form"><button type="button" class="btn btn-warning btn-lg">글쓰기</button></a>
				</div>
			</div>

        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Side-On 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>