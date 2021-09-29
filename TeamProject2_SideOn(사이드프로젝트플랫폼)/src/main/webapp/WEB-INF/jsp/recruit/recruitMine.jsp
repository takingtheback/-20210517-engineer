<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 상세 페이지 | Side-On</title>

<link type="text/css" rel="stylesheet" href="../css/RecruitHome_juri.css">

    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" >
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
	<script type="text/javascript">
	  Kakao.init('2a2410bb5eab80b194f96b2e1d912b59'); // 초기화
	 
	  var title = $('#title').val();
	  var url = $('#url').val();

	  
	  function sendLink() { // 카카오톡 공유하기
	    Kakao.Link.sendDefault({
	      objectType: 'text',
	      text: '${list.title}',
	      link: {
	        mobileWebUrl: 'http://localhost:8070/recruit/recruitDetail?recruit_num=${list.recruit_num}',
	        webUrl: 'http://localhost:8070/recruit/recruitDetail?recruit_num=${list.recruit_num}'
	      },
	    })
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
    
	<!-- 처음 -->
	<div class="container emp-profile" style="font-family: 'Noto Sans KR', sans-serif;">
            <form  action="/recruit/recruitApply" method="get" name="apply" id="apply">
                <div class="row">
                    <div class="col-md-4">
                       <div class="profile-img">
                           	 <img class="img-fluid"  src="../img/user.png" alt="..." />
                            
                        </div>
                        
                     <div>
                  		<h3 class="center">${list.memberId}</h3>
                  	</div>             
                    </div>
                    
                    <div class="col-md-6">
                        <div class="profile-head">
                                    <h2>
                                    	${list.title}
                                    </h2>
                                    <input type="hidden" value="${list.title }" id="title" value="title">
                                    <input type="hidden" value="${list.recruit_num }" id="url" name="url">
                                    <h4 style="color:gray;">
                                 		${list.simple_info}
                                 		<hr>
                                    </h4>
                         			 <c:choose>
	                                    <c:when  test="${ list.pay_check == 'y'}">
	                                    	<h5>지원 방법 : 유료 (${list.pay_amount}원) </h5>
		                                   	<p>해당 게시글은 결제 후 지원이 가능합니다</p>
		                                  </c:when> 	
		                                  
		                                  <c:when  test="${ list.pay_check == 'Y'}">
	                                    	<h5>지원 방법 : 유료 (${list.pay_amount}원) </h5>
		                                   	<p>해당 게시글은 결제 후 지원이 가능합니다</p>
		                                  </c:when> 
		                                  
		                                  <c:otherwise>
		                                   	<h5>지원 방법 : 무료 </h5>
		                                   	<p>해당 게시글은 무료로 지원이 가능합니다</p>
		                                  </c:otherwise>
                                   </c:choose>
                                   
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">리더 소개</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">프로젝트 소개</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="member-tab" data-toggle="tab" href="#member" role="tab" aria-controls="member" aria-selected="false">팀원 현황</a>
                                </li>
                               
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                	 <a id="kakao-link-btn" href="javascript:sendLink()">
					  <img
					    src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
					  />
					</a>

                    </div>   
                    
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
                        <hr>
	                           <h5 class="center">모집 분야</h5><br>
	                            <ul class="center" style=" margin-left: -10%" >
	                            
	                     	   <!-- 모집분야 조건문 -->     
	                            <c:if test="${ list.front != null  && list.front > 0}">
	                        	    <c:if test="${ part.front != null }">
								 		<li>
								 				  <h5 class="center">프론트엔드 ${part.front} / ${list.front }</h5>
								 		</li>
							 		</c:if>
							 	</c:if>	
							 	
							 	<c:if test="${ list.back != null  && list.back > 0}">
							 		 <c:if test="${ part.back != null }">
								 		<li>
								 				  <h5 class="center">백엔드 ${part.back} / ${list.back }</h5>
								 		</li>
							 		</c:if>
							 	</c:if>	
							 	
							 	<c:if test="${ list.aos != null  && list.aos > 0}">
							 		<c:if test="${ part.aos != null }">
							 		<li>
							 				  <h5 class="center">안드로이드 ${part.aos} / ${list.aos }</h5>
							 		</li>
							 		</c:if>
							 	</c:if>	
							 	
							 	<c:if test="${ list.ios != null  && list.ios > 0}">
							 		<c:if test="${ part.ios != null }">
							 		<li>
							 				  <h5 class="center">IOS  ${part.ios} / ${list.ios }</h5>
							 		</li>
							 		</c:if>
							 	</c:if>	
							 	
							 	<c:if test="${ list.server != null  && list.server > 0}">
							 		<c:if test="${ part.server != null  }">
								 		<li>
								 				  <h5 class="center">서버 ${part.server} / ${list.server }</h5>
								 		</li>
							 		</c:if>	
							 	</c:if>	
							 	
							 	<c:if test="${ list.uxui != null  && list.uxui > 0}">
							 		<c:if test="${ part.uxui != null  }">
								 		<li>
								 				  <h5 class="center"> UXUI  ${part.uxui} / ${list.uxui }</h5>
								 		</li>
							 		</c:if>
							 	</c:if>	
							 	
							 	<c:if test="${ list.plan != null  && list.plan > 0}">
								 	<c:if test="${ part.plan != null }">
								 		<li>
								 				  <h5 class="center">기획 ${part.plan} / ${list.plan }</h5>
								 		</li>
							 		</c:if>
							 	</c:if>	
							 	
							 	
							 	<c:if test="${ list.pm != null  && list.pm > 0}">
							 		<c:if test="${ part.pm != null }">
								 		<li>
								 				  <h5 class="center"> PM ${part.pm} / ${list.pm }</h5>
								 		</li>
							 		</c:if>
							 	</c:if>	
							 		
							 		
							 		
					 			</ul>			
                        </div>
				  </div>
        
                      <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                      
                                        <div class="row">
	                                            <div class="col-md-9">
	                              			         ${list.content}
	                                         	</div>   
                       					</div> 	
                         	</div>
                         			   
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>프로젝트 기간</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>  ${list.start_date} ~ ${list.end_date} </p>
                                            </div>
                                        </div>
                            </div>
                            
                            <!-- 멤버소개 -->
                                <div class="tab-pane fade" id="member" role="tabpanel" aria-labelledby="member-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>리더</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p> ${list.memberId} ( 연락처 : ${readerId } )</p>
                                            </div>
                                        </div>
                                        
                                        <!-- 팀원 리스트 출력  -->
                                        <c:forEach var="apply" items="${apply}">
                                        
	                                        <div class="row">
	                                            <div class="col-md-6">
	                                                <label>팀원</label>
	                                            </div>
	                                            <div class="col-md-6">
	                                                <p> ${apply.member_id} (${apply.part})</p>
	                                            </div>
	                                              <div class="col-md-4">
	                                                <label>>> ${apply.member_id}님의 자기소개</label>
	                                            </div>
	                                            <div class="col-md-6">
	                                                <p class="center"> ${apply.message}</p>
	                                            </div>
	                                        </div>
                                        
                                        </c:forEach>
                                        <!-- 여기까지  -->
                            </div>
                            <!-- 끝 -->
                        </div>
                    </div>
                </div>
            </form>           
            
            <div style="text-align: right;">
            <button onclick="history.back()" type="button" class="btn btn-default" style="width: 100px; height: 35px;">뒤로가기</button>
			&nbsp;&nbsp;
			<!-- Small modal -->
			<button type="button" class="btn btn-danger" style="width: 80px; height: 35px;" data-toggle="modal" data-target=".bs-example-modal-lg">신고</button>           
            </div>
        </div>

	<!-- 끝 -->
		
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