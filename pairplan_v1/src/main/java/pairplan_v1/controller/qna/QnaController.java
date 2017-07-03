package pairplan_v1.controller.qna;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;
import pairplan_v1.model.qna.QnaDTO;
import pairplan_v1.service.qna.QnaService;

@Controller
public class QnaController {
	
	@Autowired
	QnaService qnaService;
	
	//page번호가 없을경우 1번 page로 redirect
	@RequestMapping("/list")
	public String defaultList(){
		return "redirect:list/1";
	}
	
	@RequestMapping("/list/{page}")
	public String searchList(@PathVariable int page, Model model){
		System.out.println("aa");
		qnaService.list(page, model);
		return "qna/list";
	}
	
	//글쓰기
	@RequestMapping("/insert_form")
	public String insertForm(Model model){		
		return "qna/insert_view";
	}
	
	@RequestMapping("/qnaInsert")
	public String insertArticle(QnaDTO qnaDTO, HttpServletRequest request){
		qnaService.insert(qnaDTO, request);
		return "redirect:list";
	}
	
	//delete
	@RequestMapping("/delete/{qna_num}")
	public String deleteArticle(@PathVariable int qna_num){
		int result = qnaService.delete(qna_num);
		
		if(result == 1){
			return "redirect:../list"; //삭제하면 리스트 보여주기
		}else{
			return "../qna/delete_fail"; //삭제 실패하면 틀렸다고 띄우기
		}	
	}
		
	//일반 계정 질문보기 전 비밀번호 확인
	@RequestMapping("/qnaContPassCheck/{qna_num}")
	public String qnaContPassCheckForm(@PathVariable int qna_num, Model model){
		model.addAttribute("qna_num", qna_num);		
		return "/qna/qnaContPassCheck";
	}
	
	@RequestMapping("/qnaContPassCheckSubmit")
	@ResponseBody
	public String qnaContPassCheck(HttpServletRequest request, Model model){
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		String qna_pass = request.getParameter("qna_pass");		
		
		String qna_pass_result = qnaService.getContPass(qna_num, model); //qna_num으로 비번 뽑아오기
		if(qna_pass.equals(qna_pass_result)){ //쓴거랑 가져온거랑 맞는지 비교
			System.out.println("맞았다요");
			return "success";
		}else{
			System.out.println("틀렸다요");
			return "fail";
		}		
	}	
	
	//질문 보기
	@RequestMapping("/content_view/{qna_num}")
	public String articleView(@PathVariable int qna_num, Model model){
		qnaService.content(qna_num, model);
		return "qna/content_view";
	}	
	
	
	
	//update
	@RequestMapping("/update_form/{qna_num}")
	public String updateForm(@PathVariable int qna_num, Model model){
		qnaService.nohit_content(qna_num, model);
		return "qna/update_view";
	}
	
	@RequestMapping("/qnaUpdate")
	public String updateArticle(QnaDTO qnaDTO){
		if(qnaService.update(qnaDTO)==1)
			return "redirect:list";
		else		
			return "false";
	}

	//답변
	@RequestMapping("/reply_form/{qna_num}")
	public String replyForm(@PathVariable int qna_num, Model model){
		qnaService.nohit_content(qna_num, model);
		return "qna/reply_view";
	}
	
	@RequestMapping("/reply")
	public String replyArticle(QnaDTO qnaDTO, HttpServletRequest request){
		qnaService.reply(qnaDTO, request);
		return "redirect:list";
	}
	
	@RequestMapping(value = "/check_password", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String checkPassword(HttpServletResponse resp, @RequestParam("id") int qna_num, @RequestParam("password") String qna_pass){
		resp.setContentType("text/html; charset=UTF-8");
		JSONObject jso = new JSONObject();
		jso.put("result", qnaService.check_password(qna_num, qna_pass));
		return jso.toString();
	} 	
	
	
}
