package pairplan_v1.service.member;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import pairplan_v1.model.member.MemberDAO;
import pairplan_v1.model.member.MemberDTO;
import pairplan_v1.model.member.MessageDTO;
import pairplan_v1.utils.UploadFileUtil;

@Component
public class MemberService implements ApplicationContextAware{

	private WebApplicationContext context = null;
	private String uploadPath = null;
	
	@Autowired
	MemberDAO memberDAO;
	
	//@Resource
	//private String imagePath;
		
	//시퀀스
	//@Override
	public void sequence(Model model) {
		int sequence = memberDAO.sequence();
		model.addAttribute("mem_num", sequence);
	}
	
	//회원가입
	//@Override
	public void memberJoin(MultipartFile multipartFile, MemberDTO memberDTO) {		
		int mem_num = memberDAO.sequence();
		String uniquePath = "/member/" + mem_num + "/";
		
		if(!multipartFile.isEmpty()){								//multipartFile이 있다면	
			//memberDTO.setMem_img(imagePath + uniquePath + multipartFile.getOriginalFilename());
			memberDTO.setMem_img(uniquePath + multipartFile.getOriginalFilename());
			UploadFileUtil.uploadImage(uploadPath, uniquePath, multipartFile);
		}else{
			String mem_img = memberDTO.getMem_img();
			memberDTO.setMem_img(mem_img.substring(mem_img.indexOf("/member")));
		}
		
		memberDTO.setMem_num(mem_num);
		memberDAO.memberJoin(memberDTO);
	}
	
	//아이디 중복 체크
	//@Override
	public int confirmId(String confirmId) {
		return memberDAO.confirmId(confirmId);
	}
	
	//닉네임 중복 체크
	//@Override
	public int confirmNick(String confirmNick) {
		return memberDAO.confirmNick(confirmNick);
	}
	
	//로그인
	//@Override
	public int memberLogin(HttpServletRequest request) {
		String mem_id = request.getParameter("mem_id");
		String mem_pass = request.getParameter("mem_pass");
				
		HashMap<String, Object> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("mem_pass", mem_pass);
		
		System.out.println(mem_id+", "+mem_pass);
		return memberDAO.memberLogin(map);
	}
	
	//아이디로 멤버 넘버만 뽑아오기
	//@Override
	public void getMemberNumber(HttpServletRequest request, HttpSession session){
		  String mem_id = request.getParameter("mem_id");
	      
		  MemberDTO memberDTO = memberDAO.getMemberNumber(mem_id);      
		  session.setAttribute("session_mem_id", memberDTO.getMem_id()); //멤버 아이디를 세션으로 저장한다.
		  session.setAttribute("session_mem_num", memberDTO.getMem_num()); //멤버 넘버를 세션으로 저장한다
		  session.setAttribute("session_mem_nick", memberDTO.getMem_nick()); //멤버 닉네임을 세션으로 저장한다.
		  session.setAttribute("session_mem_img", memberDTO.getMem_img()); //멤버 이미지를 세션으로 저장한다.
	}
	
	//회원정보 빼오기
	//@Override
	public void memberInfo(int mem_num, Model model) {		
		MemberDTO memberDTO = memberDAO.memberInfo(mem_num);
		model.addAttribute("memberInfo", memberDTO);
	}

	//회원정보 수정
	//@Override
	public void memberInfoModify(MultipartFile multipartFile, MemberDTO memberDTO, HttpSession session) {
		int mem_num = memberDTO.getMem_num();
		String uniquePath = "/member/" + mem_num + "/";
		
		if(!multipartFile.isEmpty()){								//multipartFile이 있다면
			//memberDTO.setMem_img(imagePath + uniquePath + multipartFile.getOriginalFilename());
			memberDTO.setMem_img(uniquePath + multipartFile.getOriginalFilename());
			UploadFileUtil.deleteDirectory(uploadPath, uniquePath);
			UploadFileUtil.uploadImage(uploadPath, uniquePath, multipartFile);
		}else{
			String mem_img = memberDTO.getMem_img();
			if(mem_img.indexOf("member/default")>-1)
				UploadFileUtil.deleteDirectory(uploadPath, uniquePath);
			memberDTO.setMem_img(mem_img.substring(mem_img.indexOf("/member")));
		}
		
		//세션 재설정
		session.setAttribute("session_mem_img", memberDTO.getMem_img());
		memberDAO.memberInfoModify(memberDTO);
	}
	
	//회원 탈퇴 전 비번 맞는지 확인
	public int memberDeleteInfoPasswordCheck(HashMap<String, Object> map){
		return memberDAO.memberDeleteInfoPasswordCheck(map);
	}

	//회원 탈퇴
	public int memberInfoDelete(HashMap<String, Object> map) {
		int mem_num = (int)map.get("mem_num");
		String uniquePath = "/member/" + mem_num + "/";
		UploadFileUtil.deleteDirectory(uploadPath, uniquePath);	//파일삭제
		
		return memberDAO.memberInfoDelete(map);					//회원삭제
	}
	
	//----------------쪽지------------------------
	public void msg_list(Model model, int mem_num){
		model.addAttribute("message", memberDAO.msg_list(mem_num));			//내가 받은 쪽지들
	}
	public void msg_content(Model model, int msg_num){
		model.addAttribute("message", memberDAO.msg_content(msg_num));			//내가 볼 쪽지
	}
	public void msg_receiverInfo(Model model, int mem_num){
		model.addAttribute("receiverInfo", memberDAO.receiverInfo(mem_num));			//내가 받은 쪽지들
	}
	public void msg_send(Model model, MessageDTO messageDTO){
		memberDAO.msg_send(messageDTO);
	}
	public void msg_delete(int msg_num){
		memberDAO.msg_delete(msg_num);
	}

	//upload경로 설정
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.context = (WebApplicationContext)applicationContext;
		uploadPath = context.getServletContext().getRealPath("/resources/images");
	}
}
