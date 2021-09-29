<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/taglibMenu.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>SideOn</title>
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Side-On</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" />
        <link href="../css/MainPage_JHK.css" rel="stylesheet" />
        <link href="../css/RecruitHome_juri.css" rel="stylesheet" />
        <link href="../css/findMember_sh.css" rel="stylesheet" />
        <!-- EmailJs Api -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>
		<script type="text/javascript" src="../js/contactEmail_JHK.js"></script>
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" Style="background-color: white;">
            <div class="container">
            <!-- 로고 추가해야함  -->
                <a class="navbar-brand" href="/"><img src="https://raw.githubusercontent.com/PD-team2/SpringProject_Output/main/JaeHyunKim/IMG/Side%20On.png" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                       
                         <c:choose>
							<c:when test="${(empty memberId && empty grade) || empty dto}">
								<li class="nav-item"><a class="nav-link" href="/member/loginForm" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>LogIn</a></li>	
								<li class="nav-item"><a class="nav-link" href="/recruit/recruitHome" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>Recruit</a></li>
								<li class="nav-item"><a class="nav-link" href="/find/list" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>Find</a></li>
								<li class="nav-item"><a class="nav-link" href="/board/FaQBoard" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>Contact</a></li>
							</c:when>
							
							<c:when test="${(not empty memberId && not empty grade) || empty dto}">
							<c:if test="${grade == 'A' || dto.grade == 'A'}">
								<li class="nav-item"><a class="nav-link" href="/notice/noticeList" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>Notice</a></li>	
								<li class="nav-item"><a class="nav-link" href="/recruit/recruitHome" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>Recruit</a></li>
								<li class="nav-item"><a class="nav-link" href="/find/list" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>Find</a></li>
								<li class="nav-item"><a class="nav-link" href="/vote/pollList" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>vote</a></li>		
								<li class="nav-item"><a class="nav-link" href="/board/replyBoard" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>Board</a></li>
								<li class="nav-item"><a class="nav-link" href="/board/Mypage" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>MyPage</a></li>
								<li class="nav-item"><a class="nav-link" href="/admin/dashboard" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>AdminPage</a></li>
								<li class="nav-item"><a class="nav-link" href="/member/logout" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>LogOut</a></li>	
							</c:if>
							
							<c:if test="${grade == 'G' || dto.grade == 'G'}">
								<li class="nav-item"><a class="nav-link" href="/notice/noticeList" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>Notice</a></li>	
								<li class="nav-item"><a class="nav-link" href="/recruit/recruitHome" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>Recruit</a></li>
								<li class="nav-item"><a class="nav-link" href="/find/list" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>Find</a></li>
								<li class="nav-item"><a class="nav-link" href="/vote/pollList" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>vote</a></li>	
								<li class="nav-item"><a class="nav-link" href="/board/replyBoard" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>Board</a></li>
								<li class="nav-item"><a class="nav-link" href="/board/Mypage" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>MyPage</a></li>
								<li class="nav-item"><a class="nav-link" href="/member/logout" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
									>LogOut</a></li>
							</c:if>	
							</c:when>			
						</c:choose>  
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <div class="head-subheading">Welcome To Side-On Platform</div>
                <div class="head-subheading2">STUDY / DEVELOP / EVOLVE</div>
                <a class="JoinButton" href="#services">Side-On?</a>
                <img class="logoLocation" src="https://raw.githubusercontent.com/PD-team2/SpringProject/main/Side_On/src/main/resources/static/img/Side%20On%20logo.png" alt="..." />
            </div>
        </header>
        <!-- Services-->
        <section class="service-section" id="services">
            <div class="container">
                <div class="text-center">
                   <img class="SideOnExplainImg" src="https://raw.githubusercontent.com/PD-team2/SpringProject/main/Side_On/src/main/resources/static/img/SideOn_Explain.png" alt="..." />
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <img class="serviceImg" src="https://raw.githubusercontent.com/PD-team2/SpringProject/main/Side_On/src/main/resources/static/img/Management%20People.png" alt="..." />
                        </span>
                        <h4 class="my-3">최적 프로젝트 팀 모집</h4>
                        <p class="text-muted">본인이 필요한 직군의 사람들을 여기서 모집해보세요.<br>
                        모집분야를 제공합니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                             <img class="serviceImg" src="https://raw.githubusercontent.com/PD-team2/SpringProject/main/Side_On/src/main/resources/static/img/Connection.png" alt="..." />
                        </span>
                        <h4 class="my-3">팀원 찾기</h4>
                        <p class="text-muted">본인이 필요한 팀원을 직접 찾아서 연락해보세요.<br>
                        Side-On에선 가능합니다!</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                             <img class="serviceImg" src="https://raw.githubusercontent.com/PD-team2/SpringProject/main/Side_On/src/main/resources/static/img/Analytics.png" alt="..." />
                        </span>
                        <h4 class="my-3">다양한 서포트 제공</h4>
                        <p class="text-muted">프로젝트 관리를 위한 페이지부터<br>
                        운영진과의 채팅, 투표기능까지 <br>
                        당신의 프로젝트를 서포트합니다.</p>
                    </div>
                </div>
            </div>
        </section>
         <!-- Portfolio Grid-->
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
			                    <form >
			                      <input type="text" placeholder="Search.." name="search">
			                      <button type="submit"><i class="fa fa-search"></i></button>
			                    </form>
			                  </div>
			         		<div class="checkbox" style="float: left;">	    
								    <label for="check1">모집 중  </label>
								    <input type="checkbox" name="check1" id="check1" value="1" class="checkbox1">
							</div>
							
							               
			                 <div style="padding-top: 10%" style="float: left;">
			                  	<ul class="tags">
								  <li><a href="#" class="tag">FrontEnd</a></li>
								  <li><a href="#" class="tag">BackEnd</a></li>
								  <li><a href="#" class="tag">AOS</a></li>
								  <li><a href="#" class="tag">IOS</a></li>
								   <li><a href="#" class="tag">Server</a></li>
								   <li><a href="#" class="tag">UI/UX</a></li>
								 <li><a href="#" class="tag">기획</a></li>
								 	<li><a href="#" class="tag">PM</a></li>
								</ul>
			                  </div>
						</div>
				</div>
        </section>
        <!-- Portfolio Grid-->
        <section class="page-section" id="portfolio" style="padding : 0; margin : 0; ">
            <div class="container" style="box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;">
               
                <div class="row">
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 1-->
                        <div class="portfolio-item">


	                            <a class="portfolio-link"  href="/recruit/recruitDetail">
	                                <div class="portfolio-hover">
	                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
	                         
	                                </div>
	                                <img class="img-fluid"  src="https://raw.githubusercontent.com/PD-team2/SpringProject/main/Side_On/src/main/resources/static/img/bear2.jpg" alt="..." />
	                            </a>
	                            
	                            <div class="portfolio-caption">
	                                <div class="portfolio-caption-heading">Threads</div>
	                                <div class="portfolio-caption-subheading text-muted">Illustration</div>
	                            </div>
	                        </div>
                        </div>

                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 2-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal2">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
								 <img class="img-fluid"  src="https://raw.githubusercontent.com/PD-team2/SpringProject/main/Side_On/src/main/resources/static/img/bear2.jpg" alt="..." />
                            </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Explore</div>
                                <div class="portfolio-caption-subheading text-muted">Graphic Design</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 3-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal3">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                 <img class="img-fluid"  src="https://raw.githubusercontent.com/PD-team2/SpringProject/main/Side_On/src/main/resources/static/img/bear2.jpg" alt="..." />
                                  </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Finish</div>
                                <div class="portfolio-caption-subheading text-muted">Identity</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
                        <!-- Portfolio item 4-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal4">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
				         	 <img class="img-fluid"  src="https://raw.githubusercontent.com/PD-team2/SpringProject/main/Side_On/src/main/resources/static/img/bear2.jpg" alt="..." />                      
                                </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Lines</div>
                                <div class="portfolio-caption-subheading text-muted">Branding</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
                        <!-- Portfolio item 5-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal5">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                               <img class="img-fluid"  src="https://raw.githubusercontent.com/PD-team2/SpringProject/main/Side_On/src/main/resources/static/img/bear2.jpg" alt="..." />
                              	 </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Southwest</div>
                                <div class="portfolio-caption-subheading text-muted">Website Design</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <!-- Portfolio item 6-->
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal6">
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                </div>
                                <img class="img-fluid"  src="https://raw.githubusercontent.com/PD-team2/SpringProject/main/Side_On/src/main/resources/static/img/bear2.jpg" alt="..." />
                                 </a>
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">Window</div>
                                <div class="portfolio-caption-subheading text-muted">Photography</div>
                            </div>
                        </div>
                    </div>
                    <div style="text-align: right; font-family:'Pretendard'; ">
                	 더 많은 정보를 확인하려면 
                	 <button type="button" class="btn-warning" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='black';"
						onclick="location.href='/member/loginForm'">LogIn</button>
                    </div>
                </div>
            </div>
            
            
            
            
        </section>
       
        <!-- About-->
        <section class="page-section" id="about">
            <div class="container">
                
            </div>
        </section>
        <!-- Team-->
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
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://raw.githubusercontent.com/PD-team2/SpringProject/main/Side_On/src/main/resources/static/img/teamplay.png" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">풀스택 개발자입니다</h5>
                                    <!-- Product price-->
                                    홍길동
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-warning mt-auto" href="/find/detail">더 보러가기</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                               
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-warning mt-auto" href="#">더 보러 가기</a></div>
                            </div>
                        </div>
                    </div>
                      <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                               
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-warning mt-auto" href="#">더 보러 가기</a></div>
                            </div>
                        </div>
                    </div>
                      <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-warning mt-auto" href="#">더 보러 가기</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          </section>
        
       
        <!-- Contact-->
        <section class="page-section" id="contact">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Contact Us</h2>
                    <h3 class="section-subheading text-muted">문의하실 내용을 작성해주시면 운영자가 답변해드립니다.</h3>
                </div>
                <!-- * * * * * * * * * * * * * * *-->
                <!-- * * SB Forms Contact Form * *-->
                <!-- * * * * * * * * * * * * * * *-->
                <!-- This form is pre-integrated with SB Forms.-->
                <!-- To make this form functional, sign up at-->
                <!-- https://startbootstrap.com/solution/contact-forms-->
                <!-- to get an API token!-->
                <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                    <div class="row align-items-stretch mb-5">
                        <div class="col-md-6">
                            <div class="form-group">
                                <!-- Name input-->
                                <input class="form-control" name="title" id="title" type="text" placeholder="문의 제목을 입력해주세요." data-sb-validations="required" />
                                <div class="invalid-feedback" data-sb-feedback="name:required">문의 제목은 필수입니다.</div>
                            </div>
                            <div class="form-group">
                                <!-- Email address input-->
                                <input class="form-control" id="email" type="email" placeholder="답변받으실 이메일을 입력해주세요." data-sb-validations="required,email" />
                                <div class="invalid-feedback" data-sb-feedback="email:required">이메일 주소는 필수입니다.</div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">Email 주소가 정확하지 않습니다.</div>
                            </div>
                            <div class="form-group mb-md-0">
                                <!-- Phone number input-->
                                <input class="form-control" name="mobile" id="mobile" type="tel" placeholder="문의하시는 분의 연락처를 입력해주세요." data-sb-validations="required" />
                                <div class="invalid-feedback" data-sb-feedback="phone:required">연락처는 필수입니다.</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-group-textarea mb-md-0">
                                <!-- Message input-->
                                <textarea class="form-control" name="contents" id="contents" placeholder="문의하실 내용을 기입해주세요" data-sb-validations="required"></textarea>
                                <div class="invalid-feedback" data-sb-feedback="message:required">문의사항은 필수입니다.</div>
                            </div>
                        </div>
                    </div>
                    <!-- Submit success message-->
                    <!---->
                    <!-- This is what your users will see when the form-->
                    <!-- has successfully submitted-->
                    <div class="d-none" id="submitSuccessMessage">
                        <div class="text-center text-white mb-3">
                            <div class="fw-bolder">Form submission successful!</div>
                            To activate this form, sign up at
                            <br />
                            <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                        </div>
                    </div>
                    <!-- Submit error message-->
                    <!---->
                    <!-- This is what your users will see when there is-->
                    <!-- an error submitting the form-->
                    <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                    <!-- Submit Button-->
                    <div class="text-center"><button type="button" class="btn-warning" onclick="sendMail();">문의하기</button></div>
                </form>
            </div>
        </section>
        <!-- Footer-->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">Copyright &copy; Side-On 2021</div>
                    <div class="col-lg-4 my-3 my-lg-0">
                       
                    </div>
                    <div class="col-lg-4 text-lg-end">
                        <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                        <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
                    </div>
                </div>
            </div>
        </footer>
        
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