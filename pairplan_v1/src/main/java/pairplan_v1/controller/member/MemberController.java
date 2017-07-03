package pairplan_v1.controller.member;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import pairplan_v1.model.member.MemberDTO;
import pairplan_v1.model.member.MessageDTO;
import pairplan_v1.service.member.MemberService;
import pairplan_v1.service.plan.PlanService;
import pairplan_v1.service.preferlist.PreferListService;

@Controller
public class MemberController{
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	PreferListService preferListService;
	
	@Autowired
	PlanService planService;
	
	@RequestMapping("/main")
	public String main(Model model){
		planService.select_list(model);
		return "main";
	}
	
	//회원가입 누르면... 여행 스타일이랑 지역정보 꺼내오기
	@RequestMapping("/memberJoin")
	public String memberJoinForm(Model model){
		preferListService.Location(model); //저장된 지역 뽑아오기  memberWishLocation(0,model)
		preferListService.travel_style(model); //저장된 여행스타일 뽑아오기
		memberService.sequence(model); //시퀀스 대신 사용
		return "member/memberJoinForm";
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/memberJoinSubmit", produces="application/text; charset=UTF-8")
	public String memberJoin(@RequestParam("thumbnail") MultipartFile multipartFile,
								MemberDTO memberInfoDTO){
		memberService.memberJoin(multipartFile, memberInfoDTO);
		return "member/memberJoin";
	}
	
	//아이디 중복 확인
	@RequestMapping("/confirmId")
	@ResponseBody
	public String confirmId(HttpServletRequest request){
		String confirmId = request.getParameter("confirmId");
		int result = memberService.confirmId(confirmId);
		if(result >= 1){
			return "No";
		}else{
			return "Yes";
		}
	}
	
	//닉네임 중복 확인
	@RequestMapping("/confirmNick")
	@ResponseBody
	public String confirmNick(HttpServletRequest request){
		String confirmNick = request.getParameter("confirmNick");
		int result = memberService.confirmNick(confirmNick);
		if(result >= 1){
			return "No";
		}else{
			return "Yes";
		}
	}
	
	//로그인
	@RequestMapping("/memberLogin")
	public String memberLoginForm(){
		return "member/memberLoginForm";
	}
	
	@RequestMapping(value="/memberLoginSubmit")
	@ResponseBody
	public String memberLogin(HttpServletRequest request, HttpSession session, Model model){
		int result = memberService.memberLogin(request);
		if(result == 0){
			System.out.println("fail");
			return "fail";
			
			//return "memberLoginFail"; //로그인 실패
		}else{ //있어야 로그인 가능...
			memberService.getMemberNumber(request, session); //아이디로 멤버 넘버를 뽑아온다.
			System.out.println("success");
			return "success";
			
			//no ajax-------------------------------------------------------
			//memberInfoServiceImpl.memberInfo(request, model); //회원정보 빼오기	
			//session.setAttribute("session_member_id", request.getParameter("member_id")); //멤버 아이디를 세션으로 저장한다.
			//model.addAttribute("sessionClass", this.getClass())
			//return "memberLoginSuccess"; //로그인 성공
		}
	}
	
	//로그아웃
	@RequestMapping("/memberLogout")
	public String memberLogoutForm(){
		return "member/memberLogoutForm";
	}
	
	//회원 정보 수정
	@RequestMapping("/memberModify")
	public String memberModifyForm(HttpServletRequest request, Model model){
		int mem_num = Integer.parseInt(request.getParameter("mem_num")); //세션 저장한 멤버 넘버로...
		memberService.memberInfo(mem_num, model); //멤버 넘버로 정보 뽑아오기
		preferListService.memberWishLocation(mem_num, model); //멤버 넘버로 선호 지역 뽑아오기
		preferListService.memberWishTravelStyle(mem_num, model); //멤버 넘버로 선호 여행 스타일 뽑아오기
		return "member/memberModifyForm";
	}
	
	@RequestMapping("/memberModifySubmit")
	public String memberModify(@RequestParam("thumbnail") MultipartFile multipartFile, MemberDTO memberDTO, HttpSession session){
		memberService.memberInfoModify(multipartFile, memberDTO, session);
		return "member/memberModify";
	}
	
	//마이페이지
	@RequestMapping("/memberMyPage")
	public String memberMyPageForm(HttpServletRequest request, Model model){		
		int mem_num = Integer.parseInt(request.getParameter("mem_num")); //세션 저장한 멤버 넘버로...
		memberService.memberInfo(mem_num, model); //멤버 넘버로 정보 뽑아오기
		planService.select_group(mem_num, model);	// 멤버넘버로 그룹 정보들 뽑아오기
		
		return "member/memberMyPageForm";
	}
	
	//회원 탈퇴
	@RequestMapping("/memberDelete")
	public String memberDeleteForm(HttpServletRequest request, Model model){
		int mem_num = Integer.parseInt(request.getParameter("mem_num")); //세션 저장한 멤버 넘버로...
		model.addAttribute("mem_num", mem_num);
		return "member/memberDeleteForm";
	}
	@RequestMapping("/memberDeleteSubmit")
	@ResponseBody
	public String memberDelete(HttpServletRequest request, HttpSession session){	
		int mem_num = Integer.parseInt(request.getParameter("mem_num")); //세션 저장한 멤버 넘버로...
		String mem_pass = request.getParameter("mem_pass");
		System.out.println("member_number : "+mem_num+", member_password : "+mem_pass);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("mem_num", mem_num);
		map.put("mem_pass", mem_pass);
		
		int result = memberService.memberDeleteInfoPasswordCheck(map); //멤버 넘버랑 비밀번호가 맞다 --> 탈퇴 가능
		if(result >= 1){
			int deleteResult = memberService.memberInfoDelete(map); //멤버 삭제
			if(deleteResult == 1){
				session.invalidate();//세션 제거
				return "success"; //삭제 성공
			}else{
				return "false";
			}
		}else{
			return "fail";
		}			
	}
	
	//동행 현황 조회
	@RequestMapping("/planStatus")
	public String planStatus(HttpSession session, Model model){
		int mem_num = (int)session.getAttribute("session_mem_num");
		planService.planStatus(mem_num, model);
		return "member/memberPlanStatus";
	}
	
	//------------------쪽지--------------------//
	//쪽지 리스트 보기
	@RequestMapping("/msg_list")
	public String list(Model model, HttpSession session){
		memberService.msg_list(model, (int)session.getAttribute("session_mem_num"));
		return "member/msg_list";
	}
	
	//쪽지 보내기
	@RequestMapping("/msg_send")
	public String send(Model model, MessageDTO messageDTO){
		System.out.println("aaaa");
		memberService.msg_send(model,messageDTO);
		return "main";
	}
	
	//쪽지 삭제하기
	@RequestMapping("/msg_delete/{msg_num}")
	public String delete( @PathVariable int msg_num){
		memberService.msg_delete(msg_num);
		return "main";
	}

}
