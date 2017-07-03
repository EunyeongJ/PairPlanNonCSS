package pairplan_v1.service.qna;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import pairplan_v1.model.qna.QnaDAO;
import pairplan_v1.model.qna.QnaDTO;

@Component
public class QnaService {
	
	@Autowired
	QnaDAO qnaDAO;
	
	//리스트 뽑아오기
	public void list(int page, Model model) {
		int pageSize = 10;						//한 페이지의 글의 개수
		int first = (page - 1) * pageSize +1; 	//한 페이지의 시작 글 번호
		int last = page * pageSize;				//한 페이지의 마지막 글 번호
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("first", first);
		map.put("last", last);
		List<QnaDTO> list = qnaDAO.list(map);
		int count = qnaDAO.countAll();
		
		//페이징 처리 후 모델에 데이터 입력
		model.addAttribute("list", list);			//글 리스트
		model.addAttribute("count", count);			//총 글의 개수
		model.addAttribute("number", count - (page - 1) * pageSize);	//글번호
		model.addAttribute("first", first);
		model.addAttribute("last", last);
		model.addAttribute("page", page);
		
		if(count > 0){
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);	//총 페이지 수
			int pageBlock = 5;										//페이지네이션 크기
			int startPage = (page / (pageBlock + 1)) * pageBlock + 1;		//시작 페이지
			int endPage = (startPage + pageBlock - 1);				//마지막 페이지
			int tempEndPage = endPage;
			if(endPage > pageCount)endPage = pageCount;
				
			
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("startPage", startPage);
			model.addAttribute("tempEndPage", tempEndPage);
			model.addAttribute("endPage", endPage);
		}
	}
	
	//질문 작성
	public void insert(QnaDTO qnaDTO, HttpServletRequest request) {
		qnaDAO.insert(qnaDTO);
	}
	
	//delete
	public int delete(int qna_num) {
		return qnaDAO.delete(qna_num);
	}
	
	//질문보기 전 비밀번호 확인
	public String getContPass(int qna_num, Model Model){
		return qnaDAO.getContPass(qna_num);
	}	
	
	//질문 보기
	public void content(int qna_num, Model model) {
		model.addAttribute("article", qnaDAO.content(qna_num));
	}
	
	//노히트
	public void nohit_content(int qna_num, Model model) {
		model.addAttribute("article", qnaDAO.content(qna_num));
	}
	
	//태선 update
	public int update(QnaDTO qnaDTO) {
		return qnaDAO.update(qnaDTO);
	}
	
	//답변
	public void reply(QnaDTO qnaDTO, HttpServletRequest request){
		//step증가
		//qnaDAO.reply_update(qnaDTO);		
		qnaDTO.setQna_step(qnaDTO.getQna_step() + 1);
		
		//답변 저장
		qnaDAO.reply(qnaDTO);
	}
	
	//비밀번호 체크
	public String check_password(int qna_num, String bPassword) {
		String real = qnaDAO.check_password(qna_num);
		if(bPassword.equals(real))	return "ok";
		else						return "no";
	}
		
	
}
