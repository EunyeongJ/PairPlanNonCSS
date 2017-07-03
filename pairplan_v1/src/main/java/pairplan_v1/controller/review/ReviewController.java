package pairplan_v1.controller.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import pairplan_v1.model.review.CommentDTO;
import pairplan_v1.model.review.ReviewDTO;
import pairplan_v1.service.review.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	//종료된 계획 보기
	@RequestMapping("/expired_plan_view/{mem_num}")
	public String expired_plan_view(Model model, @PathVariable int mem_num){
		System.out.println("in");
		reviewService.view_expired_plan(model, mem_num);
		return "review/expired_plan";
	}
	
	//리뷰 작성 페이지
	@RequestMapping("/review_write_form/{e_plan_num}")
	public String review_write_form(@PathVariable int e_plan_num, Model model){
		//만료 계획 정보 조회
		reviewService.e_planInfo(e_plan_num, model);
		
		return "review/review_write";
	}
	
	//리뷰 저장
	@RequestMapping("/review_write")
	public String review_write(ReviewDTO dto, HttpServletRequest request){
		int re_num = reviewService.review_write(dto, request, "write");
		return "redirect:review_view/" + re_num;			//리뷰 저장후 리뷰 상세 페이지로 이동
	}
	
	//이미지 업로드
	@RequestMapping(value="/imageUpload", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String image_upload(@RequestParam("uploadFile") MultipartFile multipartFile, @RequestParam("e_plan_num") int e_plan_num, HttpServletRequest request){
		return reviewService.image_upload(multipartFile, e_plan_num, request);
	}
	
	//리뷰 목록 보기
	@RequestMapping("/review_list")
	public String review_list(Model model){
		reviewService.review_list(model);
		return "review/review_list";
	}

	//리뷰 내용 보기
	@RequestMapping("review_view/{re_num}")
	public String review_view(@PathVariable int re_num, Model model, HttpServletRequest request){
		reviewService.review_view(re_num, model, request);
		return "review/review_content";
	}
	
	//리뷰 수정 하기
	@RequestMapping("review_modify_form/{re_num}")
	public String review_modify_form(@PathVariable int re_num, Model model, HttpServletRequest request){
		reviewService.review_modify_form(re_num, model, request);
		return "review/review_modify";
	}
	
	/*@RequestMapping("review_modify")
	public String review_modify(ReviewDTO dto, @RequestParam("imageSrc") String[] imageSrc){
		int re_num = reviewService.review_write(dto, imageSrc, "modify");
		return "redirect:review_view/" + re_num;			//리뷰 수정후 리뷰 상세 페이지로 이동
	}*/
	
	@RequestMapping("review_modify")
	public String review_modify(ReviewDTO dto, HttpServletRequest request){
		 
		int re_num = reviewService.review_write(dto, request, "modify");
		return "redirect:review_view/" + re_num;			//리뷰 수정후 리뷰 상세 페이지로 이동
	}
	
	//리뷰 삭제 하기
	@RequestMapping("review_delete/{re_num}/{e_plan_num}")
	public String review_delete(@PathVariable int re_num, @PathVariable int e_plan_num){
		reviewService.review_delete(re_num, e_plan_num);
		return "redirect:../../review_list";
	}
	
	//코멘트 추가하기
	@RequestMapping("addComment")
	public String addComment(CommentDTO commentDTO){
		reviewService.addComment(commentDTO);
		return "redirect:../loadComment/" + commentDTO.getRe_num();
	}
	
	//코멘트 가져오기
	@RequestMapping("loadComment/{re_num}")
	public String addComment(Model model, @PathVariable int re_num){
		reviewService.get_comment(re_num, model);
		return "review/review_comment";
	}
	
	//코멘트 삭제하기
	@RequestMapping("delComment")
	public String delComment(@RequestParam("re_num") int re_num, @RequestParam("cmt_num") int cmt_num){
		reviewService.delComment(cmt_num);
		return "redirect:../loadComment/" + re_num;
	}
	
}

