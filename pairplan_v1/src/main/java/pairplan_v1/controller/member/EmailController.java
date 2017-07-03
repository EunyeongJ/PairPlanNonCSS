package pairplan_v1.controller.member;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;
import pairplan_v1.service.member.EmailService;

@Controller
public class EmailController {
	
	@Autowired
	EmailService emailService;
	
	//난수
	String joinCode;

	//이메일 인증
	@RequestMapping(value="/confirmEmail", produces="application/json")
	@ResponseBody
	public String confirmEmail(HttpServletRequest request, HttpSession session, Model model){		
		String email = request.getParameter("confirmEmail");
		System.out.println(email);
		
		//이메일 중복 검사...
		int confirmEmail = emailService.confirmEmail(email);
		if(confirmEmail >= 1){ //이미 있는 이메일
			JSONObject emailInfo = new JSONObject();
			emailInfo.put("ok", "false");
			String emailToString = emailInfo.toString();
			return emailToString;
		}else{ //이메일 중복 아니면...
			//난수 발생시켜서 인증 메일 보내기
			int ran = new Random().nextInt(100000)+10000; //10000~99999
			joinCode = String.valueOf(ran); //String화
			session.setAttribute("joinCode", joinCode);
			System.out.println(joinCode);
			
			//이메일 쓰기
			String subject = "[Pair Plan] 회원가입 이메일 인증 코드 발급 안내입니다.";
			StringBuilder sb = new StringBuilder(); //StringBuilder 객체는 string과 마찬가지로 문자열을 담는 역할. 문자열을 수정할 수 있다
			sb.append("귀하의 인증 코드는 "+joinCode+" 입니다.");		
			
			//이메일 수신성공하면 난수코드 같이 보내기
			JSONObject emailInfo = new JSONObject();
			emailInfo.put("ok", "true");
			emailInfo.put("joinCode", joinCode);
			String emailToString = emailInfo.toString();
			System.out.println(emailToString);
			
			//이메일 보내기
			boolean result = emailService.send(subject, sb.toString(), email);
			System.out.println(result);
					
			if(result == true){
				return emailToString; //전송 성공
			}else{
				return "false"; //전송 실패
			}
		}		
	}
	
	//인증번호 확인
	/*@RequestMapping(value="/confirmEmailCheck", produces="application/json")
	@ResponseBody
	public String confirmEmailCheck(HttpServletRequest request){
		String confirmEmailCheck = request.getParameter("confirmEmailCheck");
		System.out.println(joinCode);
		
		if(confirmEmailCheck.equals(joinCode)){
			return "true"; //인증 성공
		}else{
			return "false"; //인증 실패
		}
	}*/
	
	
	//아이디 찾기
	@RequestMapping("/memberFind")
	public String memberIdFindForm(){
		return "member/memberFindForm";
	}

	@RequestMapping("/memberIdFindSubmit")
	@ResponseBody
	public String memberIdFind(HttpServletRequest request){		
		String idFindNameCheck = request.getParameter("idFindNameCheck");
		String idFindEmailCheck = request.getParameter("idFindEmailCheck");
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("idFindNameCheck", idFindNameCheck);
		map.put("idFindEmailCheck", idFindEmailCheck);
		
		int result = emailService.memberIdFindCheck(map); //셀렉트가 된다 == 가입한 사람이 있다.
		if(result >= 1){
			String member_id = emailService.memberIdFind(map); //아이디 찾아온다.
			
			//이메일 쓰기
			String subject = "[Pair Plan] 아이디 찾기 관련 이메일 입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("귀하의 가입 아이디는 "+member_id+" 입니다.");		
			
			//이메일 보내기
			boolean emailResult = emailService.send(subject, sb.toString(), idFindEmailCheck);
			System.out.println(emailResult);
			
			if(emailResult == true){
				return "success"; //전송 성공
			}else{
				return "fail"; //전송 실패
			}
		}else{
			return "no";
		}		
	}
	
	//비밀번호 찾기
	@RequestMapping("/memberPasswordFindSubmit")
	@ResponseBody
	public String memberPasswordFind(HttpServletRequest request){		
		String passwordFindIdCheck = request.getParameter("passwordFindIdCheck");
		String passwordFindEmailCheck = request.getParameter("passwordFindEmailCheck");
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("passwordFindIdCheck", passwordFindIdCheck);
		map.put("passwordFindEmailCheck", passwordFindEmailCheck);
		
		int result = emailService.memberPasswordFindCheck(map); //셀렉트가 된다 == 가입한 사람이 있다.
		if(result >= 1){
			String member_password = emailService.memberPasswordFind(map); //비밀번호 찾아온다.
			
			//이메일 쓰기
			String subject = "[Pair Plan] 비밀번호 찾기 관련 이메일 입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("귀하의 가입 설정 비밀번호는 "+member_password+" 입니다. \n");
			sb.append("로그인 후 비밀번호를 변경하여 주십시오.");
			
			//이메일 보내기
			boolean emailResult = emailService.send(subject, sb.toString(), passwordFindEmailCheck);
			System.out.println(emailResult);
			
			if(emailResult == true){
				return "success"; //전송 성공
			}else{
				return "fail"; //전송 실패
			}
		}else{
			return "no";
		}		
	}
	
}
