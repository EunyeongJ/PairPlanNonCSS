//모달 오픈-----------------------------------------------------------------
function loginModal(){
	$("#login_mem_id").val("");
	$("#login_mem_pass").val("");	
	$('#login_status').html("");
	$('#loginpage').modal('show');
}

//모달 로그인----------------------------------------------------------------
function loginCheck() {
	$('#login_status').html("");
	var mem_id = $("#login_mem_id").val(); //name 프로퍼티 접근
	var mem_pass = $("#login_mem_pass").val();
			
	if ($("#login_mem_id").val().trim() == "" || !($("#login_mem_id").val()) ) {
		//alert("아이디를 입력해주세요.");
		$('#login_status').append("아이디를 입력해주세요.");
		$("#login_mem_id").focus();
		return false;
	}	

	if ($("#login_mem_pass").val().trim() == "" || !($("#login_mem_pass").val()) ) {
		//alert("비밀번호를 입력해주세요.");
		$('#login_status').append("비밀번호를 입력해주세요.")
		$("#login_mem_pass").focus();
		return false;
	}
	
	//로그인 에이잭스----------------------------------------------------------------
	$.ajax({
		type : 'post',
		data : {"mem_id" : mem_id, "mem_pass" : mem_pass},
		url : '/pairplan_v1/member/memberLoginSubmit',
		success : function(data){
			//alert("data"+date+", textStatus"+textStatus+", jqXHR"+jqXHR);
			if(data == 'success'){
				$("#login_mem_id").val("");
				$("#login_mem_pass").val("");	
				location.href = '/pairplan_v1/member/main'; //새로고침!
			}else{
				$('#login_status').append("로그인에 실패하였습니다.<br>아이디와 비밀번호를 다시 입력해주세요.")
			}
		},
		error : function(e){
			alert(e.responseText);
		}		
	});	
}


//모달 아닌 로그인---------------------------------------------------------------------------------------
function noModalLoginCheck() {
	var mem_id = $("input[name=no_modal_mem_id]").val(); //name 프로퍼티 접근
	var mem_pass = $("input[name=no_modal_mem_pass]").val();
	
	console.log("no modal"+mem_id+", "+mem_pass);
		
	if ($("input[name=no_modal_mem_id]").val().trim() == "" || !($("input[name=no_modal_mem_id]").val()) ) {
		falertModal("아이디를 입력해주세요.");
		$("input[name=no_modal_mem_id]").focus();
		return false;
	}	

	if ($("input[name=no_modal_mem_pass]").val().trim() == "" || !($("input[name=no_modal_mem_pass]").val()) ) {
		falertModal("비밀번호를 입력해주세요.");
		$("input[name=no_modal_mem_pass]").focus();
		return false;
	}
	
	//로그인 에이잭스----------------------------------------------------------------
	$.ajax({
		type : 'post',
		data : {"mem_id" : mem_id, "mem_pass" : mem_pass},
		url : '/pairplan_v1/member/memberLoginSubmit',
		success : function(data){
			console.log(data);
			if(data == 'success'){
				$("input[name=no_modal_mem_id]").val("");
				$("input[name=no_modal_mem_pass]").val("");	
				location.href = '/pairplan_v1/member/main.jsp'; //새로고침!
			}else{
				falertModal("아이디와 비밀번호를 다시 입력해주세요.");
				$("input[name=no_modal_mem_id]").val("");
				$("input[name=no_modal_mem_pass]").val("");
			}
		},
		error : function(e){
			alert(e.responseText);
		}		
	});	
}