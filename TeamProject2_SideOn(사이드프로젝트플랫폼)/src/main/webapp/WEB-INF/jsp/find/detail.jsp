qe	1<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
                <!-- 헤더...어떻게... -->
                <div style="padding-top: 8%;">
                    <h1 class="display-5 fw-bolder">팀원찾기</h1>
                    <p class="lead fw-normal text-white-80 mb-0">직접 프로젝트에 필요한 팀원을 찾아보세요.</p>
				</div>
				</div>
			</div>
        </header>
        
     <!-- section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="../img/teamplay.png" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">2021-08-08</div>
                        <h1 class="display-5 fw-bolder">풀스택 개발자입니다</h1>
                        
                        <div class="fs-5 ">
                            <span>홍길동</span>
                        </div>
                          <div class="fs-5">
                            <span>서울시 강남구</span>
                        </div>
                   
                   		<br>
                       	<div>
                        <p class="lead">실무 프로젝트 다수 경험있습니다. 자세한 포트폴리오가 궁금하신 분은 hhh@naver.com으로 메일주세요.</p>
                       	</div>
                       	 <a class="badge bg-warning text-decoration-none link-light" href="#!">Front-end(프론트)</a>
                       	 <a class="badge bg-warning text-decoration-none link-light" href="#!">Back-end(백엔드)</a>
                        <br>
                        <br>
                        <div class="d-flex">
                            <button class="btn btn-outline-warning" type="button">
                            저장하기
                            </button>
                        </div>
                        
                   
                    </div>
                </div>
                <br>
                  <button type="reset" class="btn btn-light" ><a href="list" style="color:black; text-decoration:none;">목록으로 가기</a></button>
            </div>
            
        </section>
         
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
