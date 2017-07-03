//멤버 사진 변경시--------------------------------------------------------------------
function imageChange(){
	//취소를 선택한 경우 기본 이미지
	if($('#thumbnail').val()==""){
		$('#mem_img').val(defaultUrl);
		console.log($('#mem_img').val());
		//setImage($('#mem_img').val());
		$('#thumbnailImage').attr("src", $('#mem_img').val());
		return false;
    }
	// 읽기
	var reader = new FileReader();
	reader.readAsDataURL($('#thumbnail')[0].files[0]);
	//로드 한 후
    reader.onload = function  () {
    	$('#mem_img').val($('#thumbnail').val());
    	//setImage(reader.result);
    	$('#thumbnailImage').attr("src", reader.result);
    };
}

////CSS에 이미지 등록
//function setImage(url){
//	var imageUrl = "url(" + url + ")";
//	$('.thumbnailImage').css({"background" : imageUrl,"background-size" : "contain"});
//}

//멤버 사진 삭제시(수정)-----------------------------------------------------------------
function imageDelete(){
	$('#mem_img').val('/pairplan_v1/resources/images/member/default.png');
	$('#thumbnailImage').attr("src", $('#mem_img').val());
	//setImage($('#mem_img').val());
	$('#thumbnail').val("");
	defaultUrl = $("#mem_img").val();
}


//$(function(){ 
//	$("#thumbnail").change(function(){
//
//		var data = new FormData();
//		data.append("thumbnail", $('#thumbnail')[0].files[0]);
//		data.append("image", joinForm.mem_img.value);
//		console.log(data.get("thumbnail"));
//
//		$.ajax({
//			data : data,
//			type : "post",
//			url : "thumbnailUpload",
//			cache : false,
//			enctype : "multipart/form-data",
//			contentType : false, //필수
//			processData : false, //필수
//			success : function(data) {
//
//				joinForm.mem_img.value = data;
//				var imageUrl = "url(" + data + ")";
//				$('.thumbnailImage').css({
//					"background" : imageUrl,
//					"background-size" : "contain"
//				});
//				alert(joinForm.mem_img.value);
//				alert(imageUrl);
//
//			},
//			error : function(e) {
//				alert(e.responseText);
//			}
//		});
//	})
//});

//저장한 프사 불러오기---------------------------------------------------------------------------
var defaultUrl;
$(function(){
	$('#thumbnailImage').attr("src", $("#mem_img").val());
	//$('.thumbnailImage').css({"background":"url("+$("#mem_img").val()+")", "background-size":"contain"});
	defaultUrl = $("#mem_img").val();
});