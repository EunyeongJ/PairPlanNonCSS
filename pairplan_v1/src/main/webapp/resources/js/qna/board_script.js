function checkPassword(path, qna_num){
	
	//contextPath
	var offset = location.href.indexOf(location.host) + location.host.length;
	var ctxPath = location.href.substring(offset, location.href.indexOf('/', offset + 1));

	//url과 param설정
	var url = ctxPath + "/qna/check_password";
	var params = "id=" + qna_num + "&password=" + $("#qna_pass").val();
	
	$.ajax({
		type:"post"		// 포스트방식
		,url:url		// url 주소
		,data:params	//  요청에 전달되는 프로퍼티를 가진 객체
		,dataType:"json"
		,success:function(args){	//응답이 성공 상태 코드를 반환하면 호출되는 함수
			if(args.result == "ok") location.href = path + qna_num;
			else passwordAlert("Invalid Password");
		}
	    ,error:function(e) {	// 이곳의 ajax에서 에러가 나면 에러 메시지 출력
	    	alert(e.responseText);
	    }
	});
}

var check = false;
function onPassword(path, qna_num){
	if(!check){
		$("#password_form").show();	//숨겨진 password_form 보여주기
		check = true;
		return;
	}
	if($("#qna_pass").val().trim() == "")	passwordAlert("Please insert password");
	else checkPassword(path, qna_num);
}

function passwordAlert(message){
	$("#password_alert").html("");
	$("#password_alert").append("<button type=\"button\" class=\"btn btn-danger\" disabled=\"disabled\" >" + message + "</button>");
	$("#qna_pass").focus();
}

//보기전에 비밀번호 확인------------------------------------------------------
function qnaContPassCheck(qna_num){
	var qna_pass = $("#qna_pass").val();
	console.log(qna_num);
	
	//비밀번호 입력했는지 확인
	if ( !($("#qna_pass").val()) || $("#qna_pass").val().trim() == "") { 
		falertModal("비밀번호를 입력하세요");
		$("#qna_pass").focus();
		return false;
	}
	
	$.ajax({
		type : 'post',
		data : {"qna_pass" : qna_pass, "qna_num" : qna_num},
		url : '/pairplan_v1/qna/qnaContPassCheckSubmit',
		success : function(data){
			if(data == 'success'){
				location.href = "/pairplan_v1/qna/content_view/" + qna_num;
			}else{
				falertModal("비밀번호가 맞지 않습니다.");
				$("#qna_pass").focus();
			}
		},
		error : function(e){
			alert(e.responseText);
		}		
	});
}



