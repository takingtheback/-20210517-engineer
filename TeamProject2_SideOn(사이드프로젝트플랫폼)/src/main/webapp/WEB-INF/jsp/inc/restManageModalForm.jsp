<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
/*
$(document).ready(function(){
 
    $("input:radio[name=radio]").click(function(){
        if($("input[name=radio]:checked").val() == "etc") {
            $("input:text[name=restReason]").attr("disabled",false);
 
        } else {
              $("input:text[name=restReason]").attr("disabled",true);
        }
    });
});
*/
</script>
<!-- 
<c:forEach var="dto" items="${restList}" varStatus="status">
<c:choose>
	<c:when test="${dto.restCheck eq 'F'}">
 -->
		<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		      <div class="modal-header">
		          <h4 class="modal-title" id="mySmallModalLabel">신고 처리<a class="anchorjs-link" href="#mySmallModalLabel"><span class="anchorjs-icon"></span></a></h4>
		          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		      </div>
		      <div class="modal-body">
		          <input type="radio" name='radio' id="r1" value='accept'><label for="r1" style="margin-left: 10px;">신고 접수</label>
		          <br>
		          <input type='radio' name='radio' id="r2" value='cancle'><label for="r2" style="margin-left: 10px;">사유 부적절</label>
		          <br>
		      </div>
			  <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		          <button type="button" class="btn btn-warning">완료</button>
		      </div>
		    </div>
		  </div>
		</div>
<!-- 
	</c:when>
	<c:when test="${dto.restCheck eq 'T'}">
		<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		      <div class="modal-header">
		          <h4 class="modal-title" id="mySmallModalLabel">신고 처리<a class="anchorjs-link" href="#mySmallModalLabel"><span class="anchorjs-icon"></span></a></h4>
		          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		      </div>
		      <div class="modal-body">
		          <div>이미 처리된 항목입니다.</div>
		      </div>
			  <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		          <button type="button" class="btn btn-warning">완료</button>
		      </div>
		    </div>
		  </div>
		</div>
	</c:when>
</c:choose>

</c:forEach>
 -->