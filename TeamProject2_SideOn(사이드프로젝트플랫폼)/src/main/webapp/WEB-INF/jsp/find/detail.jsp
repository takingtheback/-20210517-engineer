<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팀원찾기 | Side-On</title>
 <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/findMember_sh.css" rel="stylesheet" />
        <script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
        
<!-- 삭제 여부 확인창 -->
<script>
function deleteConfirm() { 
	alert("삭제하면 복구되지 않습니다. 정말 삭제하시겠습니까?");
	alert("삭제되었습니다.")
}
</script>

<!-- 카카오톡 공유 api -->
	<script type="text/javascript">
	  Kakao.init('26016e2c821266cce72f941b320eaea2'); // 초기화
	  var title = $('#title').val();
	  var url = $('#url').val();
	  
  function sendLink() { // 카카오톡 공유하기
		  
		  Kakao.Link.sendDefault({
	      objectType: 'text',
	      text: '${dto.find_title}',
	      link: {
	        mobileWebUrl: 'http://localhost:8070/find/detail?find_no=${dto.find_no}',
	        webUrl: 'http://localhost:8070/find/detail?find_no=${dto.find_no}'
	      },
	    })
	  }
	</script>

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
        
     <!-- section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    
                    <div class="col-md-6">
                    <!-- 작성일 -->
                        <div class="small mb-1">${dto.find_date}</div>
                    <!-- 제목 -->
                        <h1 class="display-5 fw-bolder">${dto.find_title}</h1>
                        <!-- 작성자 -->
                        <div class="fs-5">
                            <span>${dto.find_writer}</span>
                        </div>
					<!-- 거주지역 -->                        
                          <div class="fs-5">
                            <span>${dto.find_address}</span>
                        </div>
                   		<br>
                   	<!-- 내용 -->
                       	<div>
                        <p class="lead">${dto.find_content}</p>
                       	</div>
                    <!-- 포지션 -->
                       	 <a class="badge bg-info text-decoration-none link-light">${dto.find_position}</a>
                        <br>
                        <br>
                    <!-- 카카오톡으로 공유하기 -->
                        <input type="hidden" value="${dto.find_title}" id="title" value="title">
                        <input type="hidden" value="${dto.find_no}" id="url" name="url">
                        <div class="d-flex">
                           <a id="kakao-link-btn" href="javascript:sendLink()"> <button class="btn btn-outline-warning" type="button">
                            카카오톡으로 공유하기
                            </button>
                            </a>
                        </div>
                    </div>
                </div>
                <br>
                <!-- 수정 / 삭제 -->
                  <c:choose>
				  <c:when test="${(not empty memberId) || empty dto}">
				  <c:if test="${ memberId == dto.find_writer }">
                  <div style='float:right;'>
                  <input type="button" class="btn btn-warning" onclick="location.href='updateForm?find_no=${dto.find_no}'" value="수정">
                  <input type="button" class="btn btn-danger" value="삭제" onclick="deleteConfirm(); location.href='delete?find_no=${dto.find_no}';">
                  </div>
                  </c:if>
                  </c:when>
                  </c:choose>
                 
                 <!-- 목록으로 가기 -->
                  <button type="reset" class="btn btn-light" ><a href="list" style="color:black; text-decoration:none;">목록으로 가기</a></button>
            </div>
            <input type="hidden" name="deleteButton" id="deleteButton" onclick="location.href='delete?find_no=${dto.find_no}'"></input>
            
        </section>
         
         
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Side-On 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
