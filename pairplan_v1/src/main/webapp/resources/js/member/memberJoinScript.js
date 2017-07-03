//아이디 중복 검사-------------------------------------------------------------
function confirmId(){
	var confirmId = $("#mem_id").val();	
	
	// 아이디를 입력했는지 검사		
	if ( !($("#mem_id").val()) || $("#mem_id").val().trim() == "") { 
		document.getElementById('id_status').innerHTML = '';
		return false;
	}
	
	$.ajax({
		type : 'post',
		data : {"confirmId" : confirmId},
		url : 'confirmId',
		success : function(data){
			if(data == 'Yes'){
				document.getElementById('id_status').innerHTML = '사용가능한 아이디입니다.';
				$("#id_check").val('Y');
			}else{
				document.getElementById('id_status').innerHTML = '이미 사용중인 아이디 입니다.';
				$("#id_check").val('N');
			}
		},
		error : function(e){
			alert(e.responseText);
		}
		
	});
}

//아이디 중복 검사 후 변경하면 중복검사 또 하게끔---------------------------------------
function reConfirmId(){
	console.log("i : " + $("#id_check").val());
	if($("#id_check").val() == "Y"){
		document.getElementById('id_status').innerHTML = '';
		$("#id_check").val('N');
	}
}

//닉네임 중복검사----------------------------------------------------------------
function confirmNick(){
	var confirmNick = $("#mem_nick").val();
	
	// 닉네임 입력했는지 검사		
	if ( !($("#mem_nick").val()) || $("#mem_nick").val().trim() == "") { 
		document.getElementById('nick_status').innerHTML = '';
		return false;
	}
	
	$.ajax({
		type : 'post',
		data : {"confirmNick" : confirmNick},
		url : 'confirmNick',
		success : function(data){
			if(data == 'Yes'){
				document.getElementById('nick_status').innerHTML = '사용가능한 닉네임입니다.';
				$("#nick_check").val('Y');
			}else{
				document.getElementById('nick_status').innerHTML = '이미 사용중인 닉네임입니다.';
				$("#nick_check").val('N');
			}
		},
		error : function(e){
			alert(e.responseText);
		}
		
	});
}


//닉네임 중복 검사 후 아이디 변경하면 중복검사 또 하게끔---------------------------------------
function reConfirmNick(){
	console.log("nick : " + $("#nick_check").val());
	if($("#nick_check").val() == "Y"){
		document.getElementById('nick_status').innerHTML = '';
		$("#nick_check").val('N');
	}
}

//이메일 인증 검사-----------------------------------------------------------------
var joinCode;

function confirmEmail(){
	var confirmEmail = $("#mem_email").val();
		
	// 이메일을 입력했는지 검사		
	if ( !($("#mem_email").val()) || $("#mem_email").val().trim() == "") { 
		document.getElementById('email_status1').innerHTML = '';
		/*$("#mem_email").focus();*/
		return false;
	}	
	
	$.ajax({
		type : 'post',
		data : {"confirmEmail" : confirmEmail},
		url : 'confirmEmail',
		success : function(data){
			var emailOK = JSON.parse(data); //넘어온 json 데이터 javascript화
			if(emailOK.ok == "false"){
				document.getElementById('email_status1').innerHTML = '이미 사용중인 이메일입니다.';
				$("#member_email").val("");
				$("#member_email").focus();
			}else if(emailOK.ok == "true"){
				document.getElementById('email_status1').innerHTML = '입력하신 이메일 주소로 메일을 전송하였습니다.';
				joinCode = emailOK.joinCode;
			}else{
				document.getElementById('email_status1').innerHTML = '입력하신 이메일 주소로 메일을 전송 실패하였습니다. 다시 입력해주세요.';
			}
		},
		error : function(e){
			alert(e.responseText);
		}
		
	});	
			
}

//인증번호 확인
function confirmEmailCheck(){	
	var confirmEmailCheck = $("#mem_email_check").val();
	
	//인증번호 입력 검사
	if( !($("#mem_email_check").val()) || $("#mem_email_check").val().trim() == "") { 
		document.getElementById('email_status2').innerHTML = '';
		/*$("#mem_email_check").focus();*/
		return false;
	}
	
	document.getElementById('email_status2').innerHTML = '이메일 인증되었습니다.';
	$("#email_check").val('Y');
	$("#mem_email_check").attr("disabled", true);
	
//	if(joinCode == confirmEmailCheck){
//		alert("email 인증되었습니다.")
//		$("#email_check").val('Y');
//		$("#mem_email_check").attr("disabled", true);
//	}else{
//		alert("인증번호가 맞지 않습니다.");
//		$("#email_check").val('N');
//	}
}

//이메일 인증 번호 확인
/*function confirmEmailCheck(){
	//인증번호 확인
	var confirmEmailCheck = $("#member_email_check").val();
	
	if ( !($("#member_email_check").val()) || $("#member_email_check").val().trim() == "") { 
		alert("인증번호를 입력하세요");
		$("#member_email_check").focus();
		return;
	}
	
	$.ajax({
		type : 'post',
		data : {"confirmEmailCheck" : confirmEmailCheck},
		url : 'confirmEmailCheck',
		success : function(data){
			if(data == "true"){
				alert("이메일 인증되었습니다.")
				$("#email_check").val('Y');
				$("#member_email_check").attr("disabled", true);
			}else{
				alert("인증번호가 맞지 않습니다.");
				$("#email_check").val('N');
			}
		},
		error : function(e){
			alert("에러");
			alert(e);
		}
		
	});	
	
}*/


//이메일 인증 후 변경하면 중복검사 또 하게끔---------------------------------------
function reConfirmEmail(){
	console.log("email : " + $("#email_check").val());
		
	//이미 인증 받았는데, 또 건들면...
	if($("#email_check").val() == "Y"){
		$("#email_check").val('N');
		$("#mem_email_check").attr("disabled", false);
		$("#mem_email_check").val("");
		document.getElementById('email_status1').innerHTML = '';
		document.getElementById('email_status2').innerHTML = '';
	}
	
	//아예 인증을 안받았으면 -- 회원번호 수정
	/*if($("#email_check").val() == "N"){
		alert("email인증을 해주세요");
		return false;
	}*/
}

//등록--------------------------------------------------------------------------
function insertCheck(){
	
	//선호 지역 검사
	if($("input:checkbox[name=loc_name]:checked").length == 0){
		falertModal("최소 1개 이상의 선호 지역을 선택하세요.");
		return false;
	}
	
	//여행스타일 갯수 검사
	if($("input:checkbox[name=style_name]:checked").length == 0){
		falertModal("최소 1개 이상의 여행 스타일을 선택하세요.");
		return false;
	}
	
	// 아이디를 입력했는지 검사		
	if ( !($("#mem_id").val()) || $("#mem_id").val().trim() == "") { 
		falertModal("아이디를 입력하세요");
		$("#mem_id").focus();
		return false;
	}
	
	//아이디 중복 검사
	if($("#id_check").val() == 'N'){
		falertModal("아이디 중복검사를 해주세요.");
		$("#mem_id").focus();
		return false;
	}
	
	// 닉네임 입력했는지 검사		
	if ( !($("#mem_nick").val()) || $("#mem_nick").val().trim() == "") { 
		falertModal("닉네임을 입력하세요");
		$("#mem_nick").focus();
		return false;
	}
	
	//닉네임 중복 검사
	if($("#nick_check").val() == 'N'){
		falertModal("닉네임 중복검사를 해주세요.");
		$("#mem_nick").focus();
		return false;
	}	
	
	// 이메일을 입력했는지 검사		
	if ( !($("#mem_email").val()) || $("#mem_email").val().trim() == "") { 
		falertModal("이메일을 입력하세요");
		$("#mem_email").focus();
		return false;
	}	
	
	//이메일 인증 했는지
	if(!($("#mem_email_check").val()) || $("#mem_email_check").val().trim() == ""){
		falertModal("이메일을 인증 해주세요.");
		$("#mem_email_check").focus();
		return false;
	}
	
	//아예 인증을 안받았으면 -- 회원번호 수정
	if($("#email_check").val() == 'N'){
		falertModal("이메일을 인증 해주세요");
		$("#mem_email_check").focus();
		return false;
	}
	
	//비밀번호 입력했는지 검사		
	if ( !($("#mem_pass").val()) || $("#mem_pass").val().trim() == "") { 
		falertModal("비밀번호를 입력하세요");
		$("#mem_pass").focus();
		return false;
	}	
	
	//비밀번호 확인
	if($("#mem_pass").val() != $("#mem_pass2").val()){
		falertModal("비밀번호 확인이 올바르지 않습니다.");
		$("#mem_pass2").focus();
		return false;
	}	
	
	//이름 입력했는지 검사		
	if ( !($("#mem_name").val()) || $("#mem_name").val().trim() == "") { 
		falertModal("이름을 입력하세요");
		$("#mem_name").focus();
		return false;
	}
	
	//나이 입력했는지 검사		
	if ( !($("#mem_age").val()) || $("#mem_age").val().trim() == "") { 
		falertModal("나이를 입력하세요");
		$("#mem_age").focus();
		return false;
	}		
	
}

//수정--------------------------------------------------------------------------
function modifyCheck(){
	
	//선호 지역 검사
	if($("input:checkbox[name=loc_name]:checked").length == 0){
		falertModal("최소 1개 이상의 선호 지역을 선택하세요.");
		return false;
	}
	
	//여행스타일 갯수 검사
	if($("input:checkbox[name=style_name]:checked").length == 0){
		falertModal("최소 1개 이상의 여행 스타일을 선택하세요.");
		return false;
	}
	
	//비밀번호 입력했는지 검사		
	if ( !($("#mem_pass").val()) || $("#mem_pass").val().trim() == "") { 
		falertModal("비밀번호를 입력하세요");
		$("#mem_pass").focus();
		return false;
	}	
	
	//비밀번호 확인
	if($("#mem_pass").val() != $("#mem_pass2").val()){
		falertModal("비밀번호 확인이 올바르지 않습니다.");
		$("#mem_pass2").focus();
		return false;
	}
}
