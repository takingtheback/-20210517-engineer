<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#restModalBtn').click(function () {
			$('#restModal').modal('show')		
		});
		
		$('#submit').click(function () {
			var restNo = $('input[name=restNo]').val();
			var restResult = $('input[name="restResult"]:checked').val();
			
			if(restResult != null){		
				alert( restNo +' 번 신고사항 ' + restResult + ' 처리가 완료되었습니다');
				console.log(restNo + ' ' + restResult);
				
			} else {
				alert('처리 방식을 하나 이상 선택해 주세요');
				location.history();
			}
		});
	});					
</script>
<!-- Modal Form -->
<div id="restModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
    <form action="/rest/restManageModal" method="post">
      <div class="modal-header">
          <h4 class="modal-title" id="mySmallModalLabel">신고 처리<a class="anchorjs-link" href="#mySmallModalLabel"><span class="anchorjs-icon"></span></a></h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
      </div>
      <div class="modal-body">
      	  Rest No : <input type="text" name="restNo" placeholder="No" style="text-align: center; width: 50px;"/>
          <br><hr>
          <input type="radio" name='restResult' id="r1" value='신고접수'><label for="r1" style="margin-left: 10px;">신고 접수</label>
          <br>
          <input type='radio' name='restResult' id="r2" value='사유불충분'><label for="r2" style="margin-left: 10px;">사유 불충분</label>
          <br>
      </div>
	  <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="reset">취소</button>
          <button type="submit" class="btn btn-warning" id="submit">완료</button>
      </div>
    </form>
    </div>
  </div>
</div>