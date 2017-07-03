//회원 탈퇴 자바 스크립트
function memberDeletePasswordCheck(){
	var mem_pass = $("#mem_pass").val();
	var mem_num = $("#mem_num").val();
	console.log(mem_num+ " , "+mem_pass);
	
	//비밀번호 입력했는지 확인
	if ( !($("#mem_pass").val()) || $("#mem_pass").val().trim() == "") { 
		falertModal("비밀번호를 입력하세요");
		$("#mem_pass").focus();
		return false;
	}
	
	$.ajax({
		type : 'post',
		data : {"mem_num" : mem_num, "mem_pass" : mem_pass},
		url : '/pairplan_v1/member/memberDeleteSubmit',
		success : function(data){
			console.log(data);
			if(data == 'success'){
				//salertModal("회원 탈퇴 완료되었습니다. 이용해 주셔서 감사합니다.");
				location.href = '/pairplan_v1/member/main'; //새로고침!
			}else{
				falertModal("비밀번호가 맞지 않습니다.");
			}
		},
		error : function(e){
			alert(e.responseText);
		}		
	});
}