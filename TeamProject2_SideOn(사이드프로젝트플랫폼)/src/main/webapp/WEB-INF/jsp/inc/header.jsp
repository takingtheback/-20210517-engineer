<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="../inc/taglibMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	  <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
		  <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/css/styles.css" rel="stylesheet" />	
	<title>Side-On</title>
</head>
<body>
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
								<li class="nav-item"><a class="nav-link" href="/notice/noticeList" onmouseover="this.style.color='#ffc800';" onmouseout="this.style.color='#ffffff';"
									>Notice</a></li>	
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
  </body>
  </html>