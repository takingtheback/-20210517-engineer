<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <input type="text" class="form-control" id="exampleInputTitle" aria-describedby="title" placeholder="목록에 보여질 제목을 작성해주세요.">
    </div>
	
	<div class="form-group">
      <label for="exampleInputWriter" class="form-label mt-4">이름</label>
      <input type="text" class="form-control" id="exampleInputWriter" aria-describedby="writer" placeholder="본명을 사용해주세요.">
      <small id="writer" class="form-text text-muted"></small>
    </div>
	
   <div class="form-group">
      <label for="exampleInputAdress" class="form-label mt-4">거주지역</label>
      <input type="text" class="form-control" id="exampleInputAdress" aria-describedby="emailHelp" placeholder="ex) 서울시 강남구">
      <small id="adress" class="form-text text-muted"></small>
    </div>
	
    <div class="form-group">
      <label for="examplePosition" class="form-label mt-4">희망포지션</label>
      <select class="form-select" id="examplePosition">
        <option>Front-end(프론트)</option>
        <option>Back-end(백엔드)</option>
        <option>AOS(안드로이드)</option>
        <option>IOS(애플)</option>
        <option>Server(서버)</option>
		<option>UI/UX</option>
		<option>기획</option>
		<option>PM(Project Manager)</option>
      </select>
    </div>
    
    <div class="form-group">
      <label for="exampleTextarea" class="form-label mt-4">자기소개</label>
      <textarea class="form-control" id="exampleTextarea" placeholder="자유롭게 자신을 소개해주세요." rows="3"></textarea>
	   
    </div>
    <div class="form-group">
      <label for="formFile" class="form-label mt-4">대표 이미지</label>
      <input class="form-control" type="file" id="formFile">
	  <small id="imgfile" class="form-text text-muted">대표 이미지는 목록에 보여집니다.</small>
    </div>
    
	<br>
	<br>
	
	<div class="justify-content-center text-center">
    <a href="#"><button type="submit" class="btn btn-warning">등록</button></a>
	<button type="reset" class="btn btn-light"><a href="list" style="color:black; text-decoration:none;">취소</a></button>
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
