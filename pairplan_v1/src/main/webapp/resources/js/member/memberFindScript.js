//아이디 찾기
function idFindCheck(){
	var idFindNameCheck = $("#mem_name").val();
	var idFindEmailCheck = $("#idFind_mem_email").val();
	
	// 이름 입력했는지 검사		
	if ( !($("#mem_name").val()) || $("#mem_name").val().trim() == "") { 
		alert("이름을 입력하세요");
		$("#mem_name").focus();
		return false;
	}
	
	// 이메일 입력했는지 검사		
	if ( !($("#idFind_mem_email").val()) || $("#idFind_mem_email").val().trim() == "") { 
		alert("이메일을 입력하세요");
		$("#idFind_mem_email").focus();
		return false;
	}
		
	$.ajax({
		type : 'post',
		data : {"idFindNameCheck" : idFindNameCheck, "idFindEmailCheck" : idFindEmailCheck},
		url : 'memberIdFindSubmit',
		success : function(data){
			if(data == 'success'){
				alert("입력하신 이메일로 아이디를 전송하였습니다.");
				$("#mem_name").val("");
				$("#idFind_mem_email").val("");
			}else if(data == 'fail'){
				alert("입력하신 이메일로 전송 실패하였습니다.");
			}else{
				alert("입력하신 이름과 이메일이 일치하는 가입자가 없습니다.");
			}
		},
		error : function(e){
			alert("에러");
			alert(e);
		}
		
	});
}

//비밀번호 찾기
function passwordFindCheck(){
	var passwordFindIdCheck = $("#mem_id").val();
	var passwordFindEmailCheck = $("#passwordFind_mem_email").val();
	
	// 아이디 입력했는지 검사		
	if ( !($("#mem_id").val()) || $("#mem_id").val().trim() == "") { 
		alert("아이디를 입력하세요");
		$("#mem_id").focus();
		return false;
	}
	
	// 이메일 입력했는지 검사		
	if ( !($("#passwordFind_mem_email").val()) || $("#passwordFind_mem_email").val().trim() == "") { 
		alert("이메일을 입력하세요");
		$("#passwordFind_mem_email").focus();
		return false;
	}
		
	$.ajax({
		type : 'post',
		data : {"passwordFindIdCheck" : passwordFindIdCheck, "passwordFindEmailCheck" : passwordFindEmailCheck},
		url : 'memberPasswordFindSubmit',
		success : function(data){
			if(data == 'success'){
				alert("입력하신 이메일로 비밀번호를 전송하였습니다.");
				$("#mem_id").val("");
				$("#passwordFind_mem_email").val("");
			}else if(data == 'fail'){
				alert("입력하신 이메일로 전송 실패하였습니다.");
			}else{
				alert("입력하신 아이디와 이메일이 일치하는 가입자가 없습니다.");
			}
		},
		error : function(e){
			alert("에러");
			alert(e);
		}
		
	});
}