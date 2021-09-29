<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>글 작성 | Side-On</title>

<link type="text/css" rel="stylesheet" href="../css/RecruitHome_juri.css">

    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> 
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" >
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	

	  <script>
		document.getElementById('start_date').valueAsDate = new Date();
		
		function getToday(){
		    var date = new Date();
		    var year = date.getFullYear();
		    var month = ("0" + (1 + date.getMonth())).slice(-2);
		    var day = ("0" + date.getDate()).slice(-2);
		    var today = year + "-" + month + "-" + day;

		    return year + "-" + month + "-" + day;
		}
		
		function formCheck() {

			//글 제목 
			var title = document.getElementById('title').value;
			//프로필 (아직 안함)
			/*var profile = document.getElementById('profile').value; */
			//프로젝트 이름
			var project_name = document.getElementById('project_name').value;
			//프로젝트 간단 설명
			var simple_info = document.getElementById('simple_info').value;
			//지원 유/무료 여부 (checked)
			var free = document.recruitForm.pay_check1.checked;
			var pay = document.recruitForm.pay_check2.checked;
			//유료 가격 
			var pay_amount = document.getElementById('pay_amount').value;
			//프로젝트 기간(시작일)
			var start_date = document.getElementById("start_date").value;
			var end_date = document.getElementById("end_date").value;
			
			var today = getToday();
			//프로젝트 기간(마감일)
			var end_date = document.getElementById('end_date').value;
			//리더 소개
			var content = document.getElementById('content').value;
			//프로젝트 소개
			var pj_content = document.getElementById('pj_content').value;
			//모집 분야 (count) 10개 이하 0개 이상
			var front = document.getElementById('Front').value; console.log(front);
			var back = document.getElementById('Back').value; 
			var aos = document.getElementById('aos').value;
			var ios = document.getElementById('ios').value; 
			var server = document.getElementById('server').value; 
			var uxui = document.getElementById('uxui').value;
			var plan = document.getElementById('plan').value; 
			var pm = document.getElementById('pm').value;
			
			// 글 제목 유효성 검사(1) : 미입력 
			if(title.trim() == ""){
				alert('[안내] 글 제목을 입력해주세요');
				$('#title').focus();			
				return false;
			} 
			// 글 제목 유효성 검사(2) : 불성실 입력 
			if(title.length  < 5){
				console.log(title.length );
				alert('[안내] 글 제목을 5자리 이상 입력해주세요');
				$('#title').focus();
				return false;
			}
			// 글 제목 유효성 검사(3) : 글자 수 초과 입력 
			if(title.length > 30){
				console.log(title.length );
				alert('[안내] 글 제목을 20자 이하로 입력해주세요');
				$('#title').focus();
				return false;
			}
			
			//input 경로 설정?
	/*		var fileCheck = document.getElementById("file").value;
			    if(!fileCheck){
			        alert("파일을 첨부해 주세요");
			        return false;
			    }
		*/	
			// 프로젝트 제목 유효성 검사(1) : 미입력 
			if(project_name.trim() == ""){
				alert('[안내] 프로젝트 제목을 입력해주세요');
				$('#project_name').focus();			
				return false;
			} 
			// 프로젝트 유효성 검사(2) : 불성실 입력 
			if(project_name.length  < 5){
				console.log(title.length );
				alert('[안내] 프로젝트 제목을 5자리 이상 입력해주세요');
				$('#project_name').focus();
				return false;
			}
			
			// 프로젝트 내용 유효성 검사(1) : 미입력 
			if(simple_info.trim() == ""){
				alert('[안내] 프로젝트 내용을 입력해주세요');
				$('#title').focus();			
				return false;
			} 
			// 프로젝트 내용 검사(2) : 불성실 입력 
			if(simple_info.length  < 5){
				console.log(title.length );
				alert('[안내] 프로젝트 내용을 5자리 이상 입력해주세요');
				$('#title').focus();
				return false;
			}
			
			// 리더 소개  내용 유효성 검사(1) : 미입력 
			if(content.trim() == ""){
				alert('[안내] 리더 소개 글을 입력해주세요');
				$('#content').focus();			
				return false;
			} 
			// 리더 소개 검사(2) : 불성실 입력 
			if(content.length  < 5){
				alert('[안내] 리더 소개 글을 5자리 이상 입력해주세요');
				$('#content').focus();
				return false;
			}
			// 프로젝트 소개 유효성 검사(1) : 미입력 
			if(pj_content.trim() == ""){
				alert('[안내] 프로젝트 소개 글을 입력해주세요');
				$('#pj_content').focus();			
				return false;
			} 
			// 프로젝트 소개 검사(2) : 불성실 입력 
			if(pj_content.length  < 5){
				alert('[안내] 프로젝트 소개 글을 5자리 이상 입력해주세요');
				$('#pj_content').focus();
				return false;
			}
			
			
			//지원 유/무료 여부 (checked) pay_amount
			if(pay == true) {
				
				if(pay_amount == ""){
					alert("[안내] 금액을 입력해주세요.");
					$('#pay_amount').focus();
					return false;
				}else if(pay_amount < 1000)
					{
						alert("[안내] 금액 최소단위는 1,000원 입니다. 다시 입력해주세요.");
						$('#pay_amount').focus();
						return false;
					}else if(pay_amount > 1000000)
					{
						alert("[안내] 금액 최대단위는 1,000,000원 입니다. 다시 입력해주세요.");
						$('#pay_amount').focus();
						return false;
					}
			}
			
			if(pay == false && free == false){
				alert('[안내] 지원 유/무료 항목을 체크해주세요.');
				return false;
			}
			
			if(pay == true && free == true){
				alert('[안내] 지원 유/무료 항목을 하나만 체크해주세요.');
				return false;
			}

			//프로젝트 시작, 마지막 날짜 유효성 검사(1) : 날짜 미입력
			if(start_date == "" || end_date == ""){
				alert("[안내] 프로젝트 기간을 입력해주세요.");
				$('#start_date').focus();
				return false;
			}
			
			//프로젝트 시작, 마지막 날짜 유효성 검사(2) : 오늘 이전의 날짜를 입력시
			if(start_date < today  ){
				alert("[안내] 오늘 이전의 날짜를 입력할 수 없습니다. 다시 입력해주세요.");
				$('#start_date').focus();
				return false;
			}
			
			if(end_date < today  ){
				alert("[안내] 오늘 이전의 날짜를 입력할 수 없습니다. 다시 입력해주세요.");
				$('#end_date').focus();
				return false;
			}
			
			console.log(front);
			//프로젝트 분야 갯수 유효성 검사(0) : NaN 값 0으로 변환 
			if(front == ""){
				front = 0;	
			} if(back == ""){
				back = 0;	
			} if(aos == ""){
				aos = 0;	
			} if(ios == ""){
				ios = 0;	
			} if(server == ""){
				server = 0;	
			} if(uxui == ""){
				uxui = 0;	
			} if(plan == ""){
				plan = 0;	
			} if(pm == ""){
				pm = 0;	
			} 
			
			//프로젝트 분야 갯수 유효성 검사(1) : 다합쳐서 10명 이상이면 안됨
			var add = parseInt(front) +parseInt(back) + parseInt(aos) + parseInt(ios) + parseInt(server) +parseInt(uxui) +parseInt(plan) +parseInt(pm) ;
			console.log(add);
			
			if(add>10){
				alert("[안내] 프로젝트 최대인원은 10명 입니다. 다시 입력해주세요.");
				return false;
			}
			
			if(add<2){
				alert("[안내] 프로젝트 최소인원은 2명 이상입니다. 다시 입력해주세요.");
				return false;
			}
	
			//폼 전송
			$('#recruitForm').submit();
			
			//함수 끝
		}
	
	    </script>    
	    
	    <script>
	    $(document).ready(function(){
	    	
	    	/*체크박스 하나만 체크 되게 / change*/ 

		 $('input[type="checkbox"][name="check"]').click(function(){
		        //클릭 이벤트 발생한 요소가 체크 상태인 경우
		        if ($(this).prop('checked')) {
		            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
		            $('input[type="checkbox"][name="check"]').prop('checked', false);
		            $(this).prop('checked', true);
		        }
		    });


			/* 유료 금액 input 나오게 */
			  $("#pay_check1").change(function () {  
	        	 if($("#pay_check1").is(":checked")){ 
	        			$('#pay_check').val('n');
	        			 $('#pay_amount').hide();  
	             }else{
	            	 $('#pay_amount').hide();  
	             }
	   		 });
			
	        $("#pay_check2").change(function () {  
	        	 if($("#pay_check2").is(":checked")){
	        		 $('#pay_amount').show();  
	        			$('#pay_check').val('y');
	             }else{
	            	 $('#pay_amount').hide();  
	             }
	   		 });
			
	    });
	    </script>

	</head>
<body>
   <%@ include file="../inc/header.jsp" %>
   
    <!-- Header-->
        <header class="bg-warning py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                <!-- 헤더...어떻게... -->
                <div style="padding-top: 8%;">
                    <h1 class="display-5 fw-bolder">글 작성</h1>
            </div>
            </div>
         </div>
        </header>      
        
        
       <section> 
          	<div class="d-grid gap-2 col-6 mx-auto">
			  <button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop" >
			  		글을 등록하기 전, 필수로 읽어주세요 (클릭)
			  </button>
			</div>
			
<form action="/recruit/write/complete" method="post" name="recruitForm" id="recruitForm" enctype="multipart/form-data">
       	<div class="row" style="margin-top:5%;">
       	<div class="col-md-6 center" >		
            <div class="form-group row" >
				    <label for="title" class="col-sm-2 col-form-label col-form-label-lg">글 제목</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control form-control-lg" id="title" name="title" placeholder="글 제목을 입력해주세요." maxlength="30">
				    </div>
			 </div>
			 </div>
		</div>
    
	<!-- 처음 -->
	<div class="container emp-profile" style="font-family: 'Noto Sans KR', sans-serif;">
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img src="../img/bear2.jpg" alt=""/>
                            <div class="file btn btn-lg btn-primary">
                                대표 사진 선택
                                <input type="file" name="file" id = "file" accept="image/*"  /> 
                            </div>
                        </div>
                        
                     <div >
                  		<h3 class="center">memberId 님</h3>    
                  		<br>
                  				
							<!-- Button trigger modal -->
			
								<!-- Modal -->
								<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
								  <div class="modal-dialog "  style="max-width: 100%; width: auto; display: table;">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="staticBackdropLabel">모집 글 작성 안내</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        <h5>1. 글을 적을 때는 구체적으로 적어주세요. </h5>
								        <p>글이 구체적일수록 리더님의 글을 예비 팀원분들이 잘 이해할 수 있겠죠? 지원률도 쑥쑥 올라갈 거예요!</p>
								        
								        <h5>2. 리더님을 멋지게 소개해주세요. </h5>
								        <p>짧고 간결한 글보다 넉넉한 분량의 소개글은 예비 팀원분들에게 진정성 있게 다가올 거예요.</p>
								        
								        <h5>3. 리더는 책임감! </h5>
								        <p>
								        리더는 프로젝트의 방향과 완성까지 이끄는 중요한 역할입니다. 글 등록은 프로젝트의 첫 걸음인데요. <br>
								        책임감 있게 프로젝트의 마무리까지 팀원분들과 잘 완성하시기를 <b>'Side-On'</b>이 응원합니다!	
								        </p>
								        
								        <h5>4. 가격은 적정선으로 설정해주세요 (유료 모집 경우) </h5>
								        <p>
										예비 팀원분들이 지원을 고민할 수 있는 정도의 합리적인 가격으로 정할 경우 지원률이 쑥쑥 올라갈 거예요!<br>
										리더님의 역량, 경험, 경력을 자세하게 적어 어필하는 것도 중요합니다.
								        </p>
								      </div>
								      
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								        <button type="button" class="btn btn-primary">Understood</button>
								      </div>
								    </div>
								  </div>
								</div>
						<!-- 끝  -->
						</div>
                        
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
							  <div class="form-group row">
							    <label for="project_name" class="col-sm-4 col-form-label">프로젝트 이름</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="project_name" name="project_name" placeholder="프로젝트 이름을 입력해주세요." maxlength="20">
							    </div>	 
							  </div>
							   <br>
							   
						  <div class="form-group row">
							    <label for="simple_info" class="col-sm-4 col-form-label">프로젝트 간단 설명</label>
							    <div class="col-sm-8">
							      <input type="text" class="form-control" id="simple_info" name="simple_info" placeholder="프로젝트를 간단하게 설명해주세요." maxlength="40">
							    </div>
							  </div>
							  <br>
							  
							<div class="form-group row">
							    <label for="project_name" class="col-sm-4 col-form-label">지원 유/무료 여부</label>
							    <div class="col-sm-8">
							      <label for="pay_check1"> 무료  </label>
								    <input type="checkbox" class="change"  id="pay_check1" name="pay_check1"  name="check" >
								    <label for="pay_check2">유료</label>
								    <input type="checkbox"  class="change" id="pay_check2" name="pay_check2"  name="check">
								   	<input type='number' name='pay_amount' id='pay_amount' placeholder='금액 입력' style="display:none;"  pattern='\d*' step="10" >
								   	
								   	<!-- input hidden -->
								   	<input type="hidden" name="pay_check"  id="pay_check" />
								   	<span id="amout"> </span> 
								   
								   </div>
							  </div>
							<br>
							
							
							<div class="form-group row">
							    <label for="project_name" class="col-sm-4 col-form-label">프로젝트 기간  </label>
							    <div class="col-sm-8">
                                        <input type="date" id="start_date" name="start_date" min="2021-08-01" max="2025-12-31"> ~ 
                                       <input type="date" id="end_date" name="end_date" min="2021-08-01" max="2025-12-31">
                                 </div>
                       
                              </div>
                            <ul class="nav nav-tabs" id="myTab" role="tablist" style="padding-top:20%">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">리더 소개</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="project_content-tab" data-toggle="tab" href="#project_content" role="tab" aria-controls="project_content" aria-selected="false">프로젝트 소개</a>
                                </li>
                                 <li class="nav-item">
                                    <a class="nav-link" id="set-tab" data-toggle="tab" href="#set" role="tab" aria-controls="set" aria-selected="false">모집 분야 설정</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                  
                 
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
  
								    
                        </div>
                    </div>
                      <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

					            <textarea class="form-control" id="content" name="content" rows="8" maxlength="500"
					            style="width:630px; height:400px;"></textarea>

                            </div>
                            <div class="tab-pane fade" id="project_content" role="tabpanel" aria-labelledby="project_content-tab">

                              <textarea class="form-control" id="pj_content" name="pj_content" rows="8" maxlength="500"
					            style="width:630px; height:400px;"></textarea>
               
                            </div>
                            
                               <div class="tab-pane fade" id="set" role="tabpanel" aria-labelledby="set-tab">
	                              
	                                <div class="form-group row">
                                    <label for="project_name" class="col-sm-4 col-form-label">Front-end(프론트)</label>
                                    <div class="col-sm-5">
                                      <input type="number" class="form-control" id="Front" name="Front" min="0" max="5" value="0">
                                    </div>
                                    
                                    <label for="project_name" class="col-sm-4 col-form-label">Back-end(백엔드)</label>
                                      <div class="col-sm-5">
                                        <input type="number" class="form-control" id="Back" name="Back" min="0" max="5" value="0">
                                      </div>
                                    
                                  <label for="project_name" class="col-sm-4 col-form-label">AOS(안드로이드)</label>
                                      <div class="col-sm-5">
                                        <input type="number" class="form-control" id="aos" name="aos" min="0" max="5" value="0">
                                      </div>
                                    
                                    <label for="project_name" class="col-sm-4 col-form-label">IOS(애플)</label>
                                      <div class="col-sm-5">
                                        <input type="number" class="form-control" id="ios" name="ios" min="0" max="5" value="0">
                                      </div>
                                    
                                    <label for="project_name" class="col-sm-4 col-form-label">Server(서버)</label>
                                      <div class="col-sm-5">
                                        <input type="number" class="form-control" id="server" name="server" min="0" max="5" value="0">
                                      </div>
                                    
                                    <label for="project_name" class="col-sm-4 col-form-label">UI/UX</label>
                                      <div class="col-sm-5">
                                        <input type="number" class="form-control" id="uxui" name="uxui" min="0" max="5" value="0">
                                      </div>
                                    
                                    <label for="project_name" class="col-sm-4 col-form-label">기획</label>
                                      <div class="col-sm-5">
                                        <input type="number" class="form-control" id="plan" name="plan" min="0" max="5" value="0">
                                      </div>
                                    
                                    <label for="project_name" class="col-sm-4 col-form-label">PM(Project Manager)</label>
                                      <div class="col-sm-5">
                                        <input type="number" class="form-control" id="pm" name="pm" min="0" max="5" value="0">
                                      </div>
	                        	   </div>
	                        </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class=" center" style="padding-top:5%;">
		          		 <button type="button" id="test" class="btn btn-warning" onclick="formCheck();">등록하기</button>
		        </div>    
	</form>			
	<!-- 끝 -->
 </section>
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