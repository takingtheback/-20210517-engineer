<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>오류 | SideOn</title>
		<link type="text/css" rel="stylesheet" href="../css/RecruitHome_juri.css">
		
		<!-- Google Font -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<style>
	* {
		  -webkit-box-sizing: border-box;
		          box-sizing: border-box;
		}
		
		body {
		  padding: 0;
		  margin: 0;
		}
		
		#notfound {
		  position: relative;
		  height: 100vh;
		}
		
		#notfound .notfound {
		  position: absolute;
		  left: 50%;
		  top: 50%;
		  -webkit-transform: translate(-50%, -50%);
		      -ms-transform: translate(-50%, -50%);
		          transform: translate(-50%, -50%);
		}
		
		.notfound {
		  max-width: 560px;
		  width: 100%;
		  padding-left: 160px;
		  line-height: 1.1;
		}
		
		.notfound .notfound-404 {
		  position: absolute;
		  text-align:center;
		  left: 0;
		  top: 0;
		  display: inline-block;
		  width: 140px;
		  height: 140px;
		  background-image: url('../img/emoji.png');
		  background-size: cover;
		}
		
		.notfound .notfound-404:before {
		  content: '';
		  position: absolute;
		  width: 100%;
		  height: 100%;
		  -webkit-transform: scale(2.4);
		      -ms-transform: scale(2.4);
		          transform: scale(2.4);
		  border-radius: 50%;
		  z-index: -1;
		}
		
		.notfound h1 {
		  font-family: 'Nunito', sans-serif;
		  font-size: 65px;
		  font-weight: 700;
		  margin-top: 0px;
		  margin-bottom: 10px;
		  color: #151723;
		  text-transform: uppercase;
		}
		
		.notfound h2 {
		  font-family: 'Nunito', sans-serif;
		  font-size: 21px;
		  font-weight: 400;
		  margin: 0;
		  text-transform: uppercase;
		  color: #151723;
		}
		
		.notfound p {
		  font-family: 'Nunito', sans-serif;
		  color: #999fa5;
		  font-weight: 400;
		}
		
		.notfound a {
		  font-family: 'Nunito', sans-serif;
		  display: inline-block;
		  font-weight: 700;
		  border-radius: 40px;
		  text-decoration: none;
		}
		
		@media only screen and (max-width: 767px) {
		  .notfound .notfound-404 {
		    width: 110px;
		    height: 110px;
		  }
		  .notfound {
		    padding-left: 15px;
		    padding-right: 15px;
		    padding-top: 110px;
		  }
		}
	</style>
</head>
<body>
<%@ include file="../inc/header.jsp" %>

<section>
	
		<div class="container-fluid" >
			<div class="row">
				<div class="col-md-8 center" style="background-color : #ffd800">
					<div id="notfound">
						<div class="notfound">
							<div class="notfound-404"></div>
								<c:if test="${not empty title}">
								<h1 >${title}</h1>
								</c:if>
							<c:if test="${not empty message}">
								${message}
							</c:if>
							<h2>Oops! Page Not Be Found</h2>
							<p style="color : black;"><b>오류가 발생하여 해당 작업을 실패하였습니다. <br>다시 시도해보시거나 관리자에게 문의해주세요.</b></p>			
						</div>
					</div>
				</div>
		</div>
	</div>
</section>
   
</body>
</html>