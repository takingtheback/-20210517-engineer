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
        <link href="../css/RecruitHome_juri.css" rel="stylesheet" />
        
        	<!-- 아임포트 링크  -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		           
        <script>
        
        function applyCheck() {

        	var message = document.getElementById('message').value;
			
			if(applyForm.part.value =="none"){
        		alert('[안내] 희망 포지션을 선택해주세요.');
        		return false;
        	}
			
			if(message.trim() == ""){
				alert('[안내] 자기소개를 입력해주세요');
				$('#title').focus();			
				return false;
			} 
			// 프로젝트 내용 검사(2) : 불성실 입력 
			if(message.length  < 2){
				alert('[안내] 자기소개를 2글자 이상 입력해주세요');
				$('#title').focus();
				return false;
			}
			
			var pay = confirm("[안내] 지원을 진행하시겠습니까?");
			
			if(pay ==true){		
				$('#applyForm').submit();
				
			}else{
				alert('[안내] 등록이 취소되었습니다.')
			}
			
		}
        
		function applyPay() {
			
			var message = document.getElementById('message').value;
			
			if(applyForm.part.value =="none"){
        		alert('[안내] 희망 포지션을 선택해주세요.');
        		return false;
        	}
			
			if(message.trim() == ""){
				alert('[안내] 자기소개를 입력해주세요');
				$('#title').focus();			
				return false;
			} 
			// 프로젝트 내용 검사(2) : 불성실 입력 
			if(message.length  < 2){
				alert('[안내] 자기소개를 2글자 이상 입력해주세요');
				$('#title').focus();
				return false;
			}
			
			var pay = confirm("[안내] 결제를 진행하시겠습니까?");
			
			if(pay ==true){
			
				IMP.init('imp44190159');
				IMP.request_pay({
				    pg : 'kcp',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : 'Side-ON - ${list.title}' , //결제창에서 보여질 이름
				    amount : '100', //실제 결제되는 가격
				    buyer_email : 'iamport@siot.do',
				    buyer_name : '구매자이름',
				    buyer_tel : '010-1234-5678',
				}, 
					function(rsp) {
					console.log(rsp);
					
				    if ( rsp.success ) {
				    	var msg = '결제가 완료되었습니다.';
				    	$('#applyForm').submit();

				    } else {
				    	 var msg = '[오류] 결제에 실패하였습니다.' + rsp.error_msg;
				    }
				    alert(msg);
				});
			}else{
				alert('[안내] 결제를 취소하셨습니다.');
			}		
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
                <!-- 헤더...어떻게... -->
                <div style="padding-top: 8%;">
                    <h1 class="display-5 fw-bolder">지원하기</h1>
				</div>
				</div>
			</div>
        </header>
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="justify-content-center">
					  <form action="/recruit/apply/complete" method="post" name="applyForm" id="applyForm">
					  <fieldset>
						<div class="justify-content-center text-center">
					
						</div>
							
						    <div class="form-group">
						      <input type="text" class="form-control" id="exampleInputTitle" aria-describedby="title" placeholder="${list.title }"disabled>
						      	
						    	<!-- 글번호 -->
						    	<input type="hidden" id="recruit_num" name="recruit_num" value="${list.recruit_num }">		   
						    	
						    	<c:choose>
	                                    <c:when  test="${list.pay_check eq 'y'}">
						    			<input type="hidden" id="pay_check" name="pay_check" value="y">		   
										</c:when>
										 <c:otherwise>
										<input type="hidden" id="pay_check" name="pay_check" value="n">		  
										</c:otherwise>						    
								</c:choose>						    
						    </div>
									
						    <div class="form-group">
						      <label for="examplePosition" class="form-label mt-4">희망포지션</label>
						      <select class="form-select" id="part" name="part" required="required">
						      
						      <option value="none" selected>희망 포지션을 선택해주세요</option>
						      
						       <c:if test="${ list.front != null  && list.front > 0}">
						        <option  value="front">Front-end(프론트)</option>
						        </c:if>
						        
						        <c:if test="${ list.back != null  && list.back > 0}">
						        <option  value="back">Back-end(백엔드)</option>
						        </c:if>	
						        
						        <c:if test="${ list.aos != null  && list.aos > 0}">
						        <option  value="aos">AOS(안드로이드)</option>
						        </c:if>
						        
						        <c:if test="${ list.ios != null  && list.ios > 0}">
						        <option  value="ios">IOS(애플)</option>
						        </c:if>
						        
						        <c:if test="${ list.server != null  && list.server > 0}">
						        <option value="server">Server(서버)</option>
						        </c:if>
						        
						        <c:if test="${ list.uxui != null  && list.uxui > 0}">
								<option  value="uxui">UI/UX</option>
								</c:if>
								
								<c:if test="${ list.plan != null  && list.plan > 0}">
								<option  value="plan">기획</option>
								</c:if>
								
								<c:if test="${ list.pm != null  && list.pm > 0}">
								<option value="pm" >PM(Project Manager)</option>
								</c:if>
								
						      </select>
						      <input type="hidden" id="position" name="position">
						    </div>
						    
						    <div class="form-group">
						      <label for="exampleTextarea" class="form-label mt-4">자기소개</label>
						      <textarea class="form-control" id="message" name="message" placeholder="자유롭게 자신을 소개해주세요." rows="3" maxlength="25" required></textarea>
							   
						    </div>
							<br>			
								<c:if test="${ list.pay_check == 'y'}">
								
								  <div class="form-group">
								  	 <label for="pay" class="form-label mt-4">최종 결제 금액</label>
								      <input type="text" class="form-control" id="pay_amount" aria-describedby="pay" placeholder="${list.pay_amount }"disabled>
								    </div>  
						    	</c:if>
						    	
						    	<c:if test="${ list.pay_check == 'Y'}">
								
								  <div class="form-group">
								  	 <label for="pay" class="form-label mt-4">최종 결제 금액</label>
								      <input type="text" class="form-control" id="pay_amount" aria-describedby="pay" placeholder="${list.pay_amount }"disabled>
								    </div>  
						    	</c:if>
								<br>
							<br>
							<div class="justify-content-center text-center">
							
							<c:choose>
	                                    <c:when  test="${list.pay_check == 'y'}">
	                                     <button type="button" class="btn btn-warning" onclick="applyPay();">결제</button>
	                                    </c:when>
	                                    
	                                     <c:otherwise>
	                                      <button type="button" class="btn btn-warning" onclick="applyCheck();">등록</button>
	                                     </c:otherwise>
	                          </c:choose>           
						   
							</div>
							
						  </fieldset>
						</form>
					 </div>
	                    </div>
        </section>
        <!-- Footer-->

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
