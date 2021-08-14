<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
 
    $("input:radio[name=radio]").click(function(){
        if($("input[name=radio]:checked").val() == "etc") {
            $("input:text[name=restReason]").attr("disabled",false);
 
        } else {
              $("input:text[name=restReason]").attr("disabled",true);
        }
    });
});
</script>
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
          <h4 class="modal-title" id="mySmallModalLabel">신고 접수<a class="anchorjs-link" href="#mySmallModalLabel"><span class="anchorjs-icon"></span></a></h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
      </div>
      <div class="modal-body">
          <input type="radio" name='radio' id="r1" value='광고' /><label for="r1">광고/홍보 게시글</label>
          <br><br>
          <input type='radio' name='radio' id="r2" value='도배' /><label for="r2">도배 게시글</label>
          <br><br>
          <input type='radio' name='radio' id="r3" value='etc' /><label for="r3">기타</label>
          <input type="text" name="restReason" placeholder="신고 사유를 입력하세요." id="restReason" name="restReason" style="width: 350px">
          
      </div>
	  <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
          <button type="button" class="btn btn-warning">신고하기</button>
      </div>
    </div>
  </div>
</div>