<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>팀원찾기</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color: white">
            <div class="container">
                <a class="navbar-brand" href="#page-top"><img src="assets/img/navbar-logo.svg" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#login">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="#findMember">팀원찾기</a></li>
                        <li class="nav-item"><a class="nav-link" href="#projecr">팀원모집</a></li>
                        <li class="nav-item"><a class="nav-link" href="#notice">공지사항</a></li>
                        <li class="nav-item"><a class="nav-link" href="#community">커뮤니티</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-warning py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">팀원찾기</h1>
                    <p class="lead fw-normal text-white-80 mb-0">직접 프로젝트에 필요한 팀원을 찾아보세요.</p>
				</div>
			
			</div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="justify-content-center">
                     <form>
  <fieldset>
	<div class="justify-content-center text-center">
	<h2>
	<legend>자신을 소개해주세요!</legend>
    </h2>
	<br>
	<br>
	</div>
	
    <div class="form-group">
      <label for="exampleInputTitle" class="form-label mt-4">제목</label>
      <input type="title" class="form-control" id="exampleInputTitle" aria-describedby="title" placeholder="목록에 보여질 제목을 작성해주세요.">
    </div>
	
	<div class="form-group">
      <label for="exampleInputWriter" class="form-label mt-4">이름</label>
      <input type="writer" class="form-control" id="exampleInputWriter" aria-describedby="writer" placeholder="본명을 사용해주세요.">
      <small id="writer" class="form-text text-muted"></small>
    </div>
	
   <div class="form-group">
      <label for="exampleInputWriter" class="form-label mt-4">거주지역</label>
      <input type="writer" class="form-control" id="exampleInputWriter" aria-describedby="emailHelp" placeholder="ex) 서울시 강남구">
      <small id="writer" class="form-text text-muted"></small>
    </div>
	
    <div class="form-group">
      <label for="examplePosition" class="form-label mt-4">희망포지션</label>
      <select class="form-select" id="examplePosition">
        <option>백엔드</option>
        <option>프론트엔드</option>
        <option>풀스택</option>
        <option>웹디자인</option>
        <option>기획/마케팅</option>
		<option>기타</option>
      </select>
    </div>
    
    <div class="form-group">
      <label for="exampleTextarea" class="form-label mt-4">자기소개</label>
      <textarea class="form-control" id="exampleTextarea" placeholder="자유롭게 자신을 소개해주세요." rows="3"></textarea>
	   
    </div>
    <div class="form-group">
      <label for="formFile" class="form-label mt-4">대표 이미지</label>
      <input class="form-control" type="file" id="formFile">
	  <small id="writer" class="form-text text-muted">대표 이미지는 목록에 보여집니다.</small>
    </div>
    
	<br>
	<br>
	
	<div class="justify-content-center text-center">
    <button type="submit" class="btn btn-warning">등록</button>
	<button type="reset" class="btn btn-light">취소</button>
	</div>
  </fieldset>
</form>
	

        
                   
                   
                           
                        </div>
                    </div>
                </div>
			<br>
			<br>	
			</div>

        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
