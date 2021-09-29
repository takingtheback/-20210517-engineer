<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/taglibMenu.jsp" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Side-On</title>
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
        <!-- EmailJs Api -->
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@3/dist/email.min.js"></script>
		<script type="text/javascript" src="../js/contactEmail_JHK.js"></script>
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" Style="background-color: #4D4D4D;">
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
								<li class="nav-item"><a class="nav-link" href="/member/loginForm" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>LogIn</a></li>	
								<li class="nav-item"><a class="nav-link" href="/recruit/recruitHome" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>Recruit</a></li>
								<li class="nav-item"><a class="nav-link" href="/find/list" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>Find</a></li>
								<li class="nav-item"><a class="nav-link" href="/board/FaQBoard" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>Contact</a></li>
							</c:when>
							
							<c:when test="${(not empty memberId && not empty grade) || empty dto}">
							<c:if test="${grade == 'A' || dto.grade == 'A'}">
								<li class="nav-item"><a class="nav-link" href="/notice/noticeList" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>Notice</a></li>	
								<li class="nav-item"><a class="nav-link" href="/recruit/recruitHome" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>Recruit</a></li>
								<li class="nav-item"><a class="nav-link" href="/find/list" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>Find</a></li>
								<li class="nav-item"><a class="nav-link" href="/vote/pollList" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>vote</a></li>		
								<li class="nav-item"><a class="nav-link" href="/board/chatRoom" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>Contact</a></li>
								<li class="nav-item"><a class="nav-link" href="/board/Mypage" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>MyPage</a></li>
								<li class="nav-item"><a class="nav-link" href="/admin/dashboard" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>AdminPage</a></li>
								<li class="nav-item"><a class="nav-link" href="/member/logout" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>LogOut</a></li>	
							</c:if>
							
							<c:if test="${grade == 'G' || dto.grade == 'G'}">
								<li class="nav-item"><a class="nav-link" href="/notice/noticeList" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>Notice</a></li>	
								<li class="nav-item"><a class="nav-link" href="/recruit/recruitHome" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>Recruit</a></li>
								<li class="nav-item"><a class="nav-link" href="/find/list" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>Find</a></li>
								<li class="nav-item"><a class="nav-link" href="/vote/pollList" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>vote</a></li>	
								<li class="nav-item"><a class="nav-link" href="/board/chatRoom" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>Contact</a></li>
								<li class="nav-item"><a class="nav-link" href="/board/Mypage" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>MyPage</a></li>
								<li class="nav-item"><a class="nav-link" href="/member/logout" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
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
                <div class="head-subheading1">Welcome to</div>
                <div class="head-subheading2">Side-On Platform!</div>
                <div class="head-subheading3">Study / Develop / Evolve</div>
                <a class="mastheadButton" href="#services"><img src="https://raw.githubusercontent.com/PD-team2/SpringProject/main/Side_On/src/main/resources/static/img/mainButton.png" alt="..." /></a>
            </div>
        </header>
        <!-- Services-->
        <section class="service-section" id="services">
            <div class="container">
                <div class="text-center">
                   <img class="SideOnExplainImg" src="https://raw.githubusercontent.com/PD-team2/SpringProject/main/Side_On/src/main/resources/static/img/SideOnExplain.png" alt="..." />
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
                    <div class="text-center">
                    <a onclick="sendMail();"><img src="https://raw.githubusercontent.com/PD-team2/SpringProject/main/Side_On/src/main/resources/static/img/sendButton.png"></a></div>
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
        <script src="../js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
 

</body>
</html>