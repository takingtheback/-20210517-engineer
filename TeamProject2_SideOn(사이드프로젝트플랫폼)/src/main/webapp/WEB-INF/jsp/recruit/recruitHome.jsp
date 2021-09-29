<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 모집/지원 | Side-On</title>
 
<link type="text/css" rel="stylesheet" href="../css/RecruitHome_juri.css">
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    
			<script type="text/javascript">
			 function searchCheck() {
				 var search = document.getElementById('search').value;
				 
					if(search.trim() == ""){
						alert('[안내] 검색어를 입력해주세요');
						$('#search').focus();			
						return false;
					}else if(search.length > 10 ){
						alert('[안내] 검색어는 10자리 이하로 입력해주세요');
						$('#search').focus();			
						return false;
					}else{
						$('#searchForm').submit();
					}
			}
			
			</script>

</head>
<body>
   <%@ include file="../inc/header.jsp" %>
    <!-- Services-->
            <!-- Header-->
        <header class="bg-warning py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                <!-- 헤더...어떻게... -->
                <div style="padding-top: 8%;">
                    <h1 class="display-5 fw-bolder">프로젝트 모집/지원</h1>
            </div>
            </div>
         </div>
        </header>
        
        <section >
	        <div class="row">
			       	<div class="col-md-6 center" >
			
			                <div class="search-container" style="float: left;">
			                    <form action="/recruitSearch" name="searchForm" id="searchForm">
			                      <input type="text" placeholder="검색어를 입력하세요" name="search" id="search">
			                      <button type="button"  onclick="searchCheck();"><i class="fa fa-search"></i></button>
			                    </form>
			                  </div>
			         	<!--  	<div class="checkbox" style="float: left;">	    
								    <label for="check1">모집 중  </label>
								    <input type="checkbox" name="check1" id="check1" value="1" class="checkbox1">
							</div> -->
							
							<div class="checkbox" style="float: right;">	    
								  <input type="button" class="btn btn-warning" style= "margin-left:38%;"onclick="location.href='/recruit/recruitWrite'" value="모집 글쓰기">
							</div>
							
							               
			        <!--          <div style="padding-top: 10%" style="float: left;">
			                  	<ul class="tags">
								  <li><a href="recruitHome?part=front" class="tag">FrontEnd</a></li>
								  <li><a href="#" class="tag">BackEnd</a></li>
								  <li><a href="#" class="tag">AOS</a></li>
								  <li><a href="#" class="tag">IOS</a></li>
								   <li><a href="#" class="tag">Server</a></li>
								   <li><a href="#" class="tag">UI/UX</a></li>
								 <li><a href="#" class="tag">기획</a></li>
								 	<li><a href="#" class="tag">PM</a></li>
								</ul>
			                  </div> -->
						</div>
				</div>
        </section>

            <!-- Portfolio Grid-->
        <section class="page-section" id="portfolio" style="padding : 0; margin : 0; ">
            <div class="container" style="box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;">
               
                <div class="row">
                <c:if test="${empty list}">
						<c:set var="none" value="검색 결과가 없습니다."></c:set>
						
						<h2 class="center" style="margin-top:10%;"><c:out value="${none }" /></h2>
		
						<a style="margin-top:10%; color:black;" href="/recruit/recruitHome" class="btn btn-warning" style="color:black;">전으로 돌아가기</a>
				</c:if>
                	<c:forEach var="list" items="${list}" varStatus="status"> 
	                    <div class="col-lg-4 col-sm-6 mb-4">
	                        <!-- Portfolio item 1-->
	                        <div class="portfolio-item">
									  <a class="portfolio-link"  href="recruitDetail?recruit_num=${list.recruit_num}">
		                                <div class="portfolio-hover">
		                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>                     
		                                </div>
		                                 <img class="img-fluid"  src="../img/team.jpg" alt="..." />
		                            </a>
		                            
		                            <div class="portfolio-caption">
		                                <div class="portfolio-caption-heading">${list.title }</div>
		                                <div class="portfolio-caption-subheading text-muted">${list.memberId }</div>
		                            </div>
		                        </div>
	                        </div>
					</c:forEach>
   
                	<div class="col-md-3 center"  style="padding-top:10%;">     
					</div>
                </div>
            </div>		
        </section>
       
       	<form id="moveForm" method="get">	
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">	
		</form>
	
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
   
</body>
</html>