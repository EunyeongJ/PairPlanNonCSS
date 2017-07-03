//메인에서 마이페이지 넘어갈때
function myPageMemNumPost(){	
	document.myPageForm.mem_num
	document.myPageForm.method = "post"
	document.myPageForm.action = "/pairplan_v1/member/memberMyPage";
	document.myPageForm.submit();
}

//마이페이지에서 정보수정 넘어갈때
function ModifyMemNumPost(){
	document.myPageForm.mem_num
	document.myPageForm.method = "post"
	document.myPageForm.action = "/pairplan_v1/member/memberModify";
	document.myPageForm.submit();
}

//마이페이지에서 회원탈퇴 넘어갈때
function DeleteMemNumPost(){
	document.myPageForm.mem_num
	document.myPageForm.method = "post"
	document.myPageForm.action = "/pairplan_v1/member/memberDelete";
	document.myPageForm.submit();
}