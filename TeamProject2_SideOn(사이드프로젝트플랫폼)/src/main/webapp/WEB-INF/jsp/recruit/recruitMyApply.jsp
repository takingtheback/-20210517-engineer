<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>SideOn</title>
		<link type="text/css" rel="stylesheet" href="../css/RecruitHome_juri.css">
		
		<!-- Google Font -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" >
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	
	<script>
	
		function applyCancel() {
		var cancel = confirm("[안내] 참여를 취소하시겠습니까?");
		
		if(cancel == true){		
			alert('[안내] 취소 되었습니다.');
	    	$('#cancelForm').submit();
		}else{
			
		}
	}

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
                    <h1 class="display-5 fw-bolder">마이페이지</h1>
            </div>
            </div>
         </div>
        </header>

<section>
	
		<div class="container">
		<div class="row">
			<div class="col-sm-4 col-md-3 sidebar">
			    <div class="mini-submenu">
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			    </div>
			    <div class="list-group">
			        <span class="list-group-item">
						마이페이지 메뉴
			        </span>
			        <a href="/recruit/recruitMyRecruit" class="list-group-item ">
			          	프로젝트 모집 현황
			        </a>
			         <a href="/recruit/recruitMyApply" class="list-group-item active">
			          	프로젝트 지원 현황 
			        </a>
			         
				    </div>        
				</div>

				<div class="col-md-9 " style="box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;">
				
					<h3 style="padding-left:5%; padding-top:5%;">프로젝트 지원 현황</h3>
					
 <form action="/recruit/recruitCancel" method="post" name="cancelForm" id="cancelForm">
					<table class="table table-hover" style="margin-top:10%; font-family: 'Noto Sans KR', sans-serif;">
						  <thead>
						    <tr>
						      <th scope="col" class="col-md-1">글 번호 </th>
						      <th scope="col" class="col-md-2">리더</th>
						      <th scope="col" class="col-md-6">글 제목</th>
						      <th scope="col" class="col-md-2"></th>
						      <th scope="col" class="col-md-2">상태</th>
						    </tr>
						  </thead>
						  <tbody>   
							  <tr> 
							  <c:forEach var="list" items="${list}" > 
								  <c:forEach items="${list}" var="map">			
								  	   <c:if test="${map.key == 'RECRUIT_NUM'}">
								  	   	 <th scope="row">
								  	   	 			
										
								  	   		<a href="recruitMine?recruit_num=${map.value}">
													      ${map.value}
											<input type="hidden" name="recruit_num" id="recruit_num" value="${map.value}">		      
											</a>
										 
											</th>
										</c:if>			      		        
								
										   <c:if test="${map.key == 'TITLE'}">
												<td colspan="2"> 
													 ${map.value}
												 </td>
											</c:if>
								
								  			<c:if test="${map.key == 'MEMBERID'}">	
													 <td> ${map.value}</td>	    
										  </c:if>  
										  
										  <c:if test="${map.key == 'JOIN_YN'}">	
										  	<c:if test="${map.value == 'y'}">
										  	 <td>
										  	 	 <span class="label label-success">참여 중 </span>
										  	 	 <br/>
                                				  <button  type="button"  class="btn btn-danger" onclick="applyCancel();">참여 취소</button>
											</td>	    	
										  	 </c:if>
										  	 
										  	 <c:if test="${map.value == 'n'}">
										  		  <td>참여 취소</td>	    
										  	 </c:if>
										  </c:if>  
									</c:forEach>			    	    
							 </c:forEach>
			 				 </tr> 
			 		
						  </tbody>
						</table>
				
						<div class="col-md-3 center" style="padding-top:10%;">     
			               <nav class="pagination-outer center" aria-label="Page navigation">
			                       <ul class="pagination">
			                           <li class="page-item">
			                               <a href="#" class="page-link" aria-label="Previous">
			                                   <span aria-hidden="true">«</span>
			                               </a>
			                           </li>
			                           <li class="page-item"><a class="page-link" href="#">1</a></li>
			                       
			                           <li class="page-item">
			                               <a href="#" class="page-link" aria-label="Next">
			                                   <span aria-hidden="true">»</span>
			                               </a>
			                           </li>
			                       </ul>
			                   </nav>
						</div>
</form>	
				</div>
			</div>
		</div>

</section>
   
</body>
</html>