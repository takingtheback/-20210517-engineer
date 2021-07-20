/**
 * 
 */
let likeList = {
  
    /* 전체 목록 삭제 */
    delAllItem: function(){
        document.querySelectorAll('.row.data').forEach(function (item) {
            item.remove();
          });
    },

   	/* 전체 항목 삭제 */
    delItem: function () {
        event.target.parentElement.parentElement.parentElement.remove();
        this.reCalc();
        this.updateUI();
    }
}
