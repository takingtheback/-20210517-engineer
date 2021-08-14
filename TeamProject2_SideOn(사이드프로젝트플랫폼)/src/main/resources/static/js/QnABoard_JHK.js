
function deleteConfirm() { 
	swal({
  title: "정말 삭제하시겠습니까?",
  text: "한번 삭제하시면 파일을 다시 복구하실 수 없습니다!",
  icon: "warning",
  buttons: true,
  dangerMode: true,
})
.then((willDelete) => {
  if (willDelete) {
 
  document.getElementById('deleteButton').click();


  } else {
    swal("문의글 삭제가 취소되었습니다.");
  }
});
};

