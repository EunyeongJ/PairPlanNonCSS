$(document).ready(function() {
	$('#summernote').summernote({
		height : 400,
		callbacks :{
			onImageUpload : function(files) {
	            sendFile(files[0]);
	        }
		}			
	});
	//$('#summernote').summernote('code', ${review_content.re_cont});
});

function sendFile(file) {
    var data = new FormData();					//폼데이터 생성
    data.append("uploadFile", file);			//file추가
    
   	var e_plan_num = $('#e_plan_num').val();
    data.append("e_plan_num", e_plan_num);
    
    $.ajax({
        data : data,
        type : "post",
        url : "/pairplan_v1/review/imageUpload/",
        //cache : false,
        enctype: "multipart/form-data",
        contentType : false,					//필수
        processData : false,					//필수
        success : function(url) {
        	//console.log(data);
        	$('#summernote').summernote('editor.insertImage', url);
        },
        error : function(e){
        	alert(e.responseText);
        }
    });
}

function checkImage(){
	$('.note-editable').find('img').each(function(){
		var str = $(this).attr('src');
		$('#editorForm').append('<input type="hidden" name="imageSrc" value="' + str + '">');
	});
	
	/* console.log();
	return false; */
}