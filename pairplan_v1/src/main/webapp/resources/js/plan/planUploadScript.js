function imageChange(){
	//취소를 선택한 경우 기본 이미지
	if($('#thumbnail').val()==""){
		$('#plan_img').val(defaultUrl);
		console.log($('#plan_img').val());
		//setImage($('#plan_img').val());
		$('#thumbnailImage').attr("src", $('#plan_img').val());
		return false;
    }
	// 읽기
	var reader = new FileReader();
	reader.readAsDataURL($('#thumbnail')[0].files[0]);
	//로드 한 후
    reader.onload = function  () {
    	$('#plan_img').val($('#thumbnail').val());
    	//setImage(reader.result);
    	$('#thumbnailImage').attr("src", reader.result);
    };
}

//CSS에 이미지 등록
//function setImage(url){
//	$('#thumbnailImage').attr("src", url);
//}

//이미지 삭제
function imageDelete(random){
	$('#plan_img').val('/pairplan_v1/resources/images/plan/default' + random + '.jpg');
	$('#thumbnailImage').attr("src", $('#plan_img').val());
	//setImage($('#plan_img').val());
	$('#thumbnail').val("");
	defaultUrl = $("#plan_img").val();
}

//기본 사진 로딩
var defaultUrl;
$(function(){
	$('#thumbnailImage').attr("src", $("#plan_img").val());
	//$('.thumbnailImage').css({"background":"url("+$("#plan_img").val()+")", "background-size":"contain"});
	defaultUrl = $("#plan_img").val();
});

//json일정정보가 저장된 배열 등록
function locationInfoSet(){
	
	//여행스타일 갯수 검사
	if($("input:checkbox[name=plan_style]:checked").length == 0){
		falertModal("최소 1개 이상의 여행 스타일을 선택하세요.");
		return false;
	}

	if(listArray.length == 0){
		falertModal("일정 정보를 입력하세요.");
		return false;
	}
	document.insertform.plan_infos.value = JSON.stringify(listArray);
}