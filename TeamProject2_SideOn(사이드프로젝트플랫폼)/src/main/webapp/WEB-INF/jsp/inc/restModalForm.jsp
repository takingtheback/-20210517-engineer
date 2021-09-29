<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
 
	 /* 왜 안먹히나요 왜? */
	$('#submit').click(function () {
		var noticeNo = ${param.noticeNo};
		
		if($('input[name=radioReason]').val() == 'etc') {
			var reason = $('input[name=textReason]').val();
			alert(noticeNo + ' 번 게시글 [' + reason + '] 의 사유로 신고가 접수되었습니다.');
		} else if($('input[name=radioReason]').val() == null){
			alert('신고 사유를 입력해 주세요.');
			location.history();
		} else {
			var reason = $('input[name=radioReason]').val();
			alert(noticeNo + ' 번 게시글 [' + reason + '] 의 사유로 신고가 접수되었습니다.');
		}
	});
});
</script>
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
    <form action="/recruit/restReportModal" method="post">
      <div class="modal-header">
          <h4 class="modal-title" id="mySmallModalLabel">신고 접수<a class="anchorjs-link" href="#mySmallModalLabel"><span class="anchorjs-icon"></span></a></h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
      </div>
      <div class="modal-body">
          <input type="radio" name='radioReason' id="r1" value='광고' onclick="this.form.textReason.disabled=true"/><label for="r1">&nbsp;광고/홍보 게시글</label>
          <br><br>
          <input type='radio' name='radioReason' id="r2" value='도배' onclick="this.form.textReason.disabled=true"/><label for="r2">&nbsp;도배 게시글</label>
          <br><br>
          <input type='radio' name='radioReason' id="r3" value='etc' onclick="this.form.textReason.disabled=false"/><label for="r3">&nbsp;기타</label>
          <input type="text" name="textReason" placeholder="신고 사유를 입력하세요." id="restReason" name="restReason" style="width: 200px">
          <input type="hidden" name="recruit_num" value="${param.recruit_num}" />
      </div>
	  <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
          <button type="submit" class="btn btn-warning">신고하기</button>
      </div>
    </form>
    </div>
  </div>
</div>