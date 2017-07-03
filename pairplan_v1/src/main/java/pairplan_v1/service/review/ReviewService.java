package pairplan_v1.service.review;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import pairplan_v1.model.member.MemberDTO;
import pairplan_v1.model.review.CommentDTO;
import pairplan_v1.model.review.ReviewContentDTO;
import pairplan_v1.model.review.ReviewDAO;
import pairplan_v1.model.review.ReviewDTO;
import pairplan_v1.utils.UploadFileUtil;

@Component
public class ReviewService {

	@Autowired
	private String uploadPath;
	
	//@Autowired
	//private String imagePath;
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	public void view_expired_plan(Model model, int mem_num){
		model.addAttribute("plan_list", reviewDAO.view_expired_plan(mem_num)); 
	}
	
	public int review_write(ReviewDTO dto, HttpServletRequest request, String type){
		
		int e_plan_num = dto.getE_plan_num();
		String uniquePath = "/review/" + e_plan_num + "/";
		//String conPath = "/editorImgConPath/resources/images";
		
		//입력된 사진이 있는지 확인
		String[] imageSrc;
		if(request.getParameterValues("imageSrc")!=null){		//사진이 있다면
			imageSrc = request.getParameterValues("imageSrc");	//배열에 저장 후 contextPath 변경
			for(int i=0; i<imageSrc.length; i++)
				System.out.println(imageSrc[i]);
			for(int i=0; i<imageSrc.length; i++)
				imageSrc[i] = imageSrc[i].substring(imageSrc[i].indexOf("/review/"));
		}
		else
			imageSrc = new String[0];							//없다면 비어있는 배열 생성
		UploadFileUtil.deleteEditorFile(uploadPath, imageSrc, uniquePath);	//파일 검사
		
		String review_images = "";
		if(imageSrc.length > 0){								//에디터에 입력된 사진이 있다면
			review_images = StringUtils.join(imageSrc, ",");	//구분자를 넣어 하나의 문자열 저장
			dto.setRe_mainImg(imageSrc[0]);						//첫번째 이미지를 대표이미지로 저장
		}
		else													//입력된 사진이 없다면
			dto.setRe_mainImg(reviewDAO.search_expired_image(e_plan_num).replace("/member/", "/review/"));	//계획 이미지를 저장
		dto.setRe_imgs(review_images);	
		
		if(type.indexOf("write")>-1){					//리뷰 작성인 경우
			reviewDAO.review_write(dto);				//데이터 베이스 입력
			return reviewDAO.review_num(e_plan_num);	//생성된 리뷰번호 조회
		}
		else{
			reviewDAO.review_modify(dto);
			return dto.getRe_num();
		}
	}
	
	public String image_upload(MultipartFile multipartFile, int planNum, HttpServletRequest request){
		String uniquePath = "/review/" + planNum + "/";
		String fileName = UploadFileUtil.uploadEditorFile(uploadPath, multipartFile, uniquePath);	//파일업로드
		return request.getContextPath() + "/resources/images" + uniquePath + fileName;
	}
	
	
	public void review_list(Model model){
		//플랜 리스트 정보
		List<ReviewDTO> reviews = reviewDAO.review_list();
		model.addAttribute("review_list", reviews);

		//리뷰 작성자 정보
		List<MemberDTO> writers = new ArrayList<>();
		List<Integer> comments = new ArrayList<>();
		for(int i=0; i<reviews.size(); i++){
			writers.add(reviewDAO.review_writer(reviews.get(i).getRe_num()));
			comments.add(reviewDAO.count_comment(reviews.get(i).getRe_num()));
		}
		model.addAttribute("review_writers", writers);
		model.addAttribute("comments", comments);
	}
	
	public void review_view(int re_num, Model model, HttpServletRequest request){
		//리뷰 조회수 증가
		reviewDAO.reviewHitUp(re_num);
		//리뷰 정보 꺼내오기
		ReviewContentDTO review_content = reviewDAO.review_view_info(re_num);
		
		//내용안에 저장된 img태그의 contextPath를 전부 editorImgConPath로 변경
		String re_cont = review_content.getRe_cont();
		if(re_cont.indexOf("src=\"/")>-1){
		re_cont = re_cont.replace(re_cont.substring(re_cont.indexOf("src=\"/"), re_cont.indexOf("/resources/images/review")), "src=\"" + request.getContextPath());
		review_content.setRe_cont(re_cont);
		}
		model.addAttribute("review_content", review_content);
		
		//만료 계획 스타일
		model.addAttribute("e_plan_style", reviewDAO.e_planStyle(review_content.getE_plan_num()));
		//만료 계획 작성자 정보
		model.addAttribute("e_plan_writer", reviewDAO.e_plan_writer(review_content.getE_plan_num()));
		//만료 계획 그룹원 정보
		model.addAttribute("e_plan_group", reviewDAO.e_plan_group(review_content.getE_plan_num()));
		//지역 정보 꺼내오기
		model.addAttribute("review_schedule", reviewDAO.e_plan_schedule(review_content.getE_plan_num()));
		//코멘트 개수
		model.addAttribute("count_comment", reviewDAO.count_comment(re_num));
	}
	
	public void review_modify_form(int re_num, Model model, HttpServletRequest request){
		ReviewDTO review_content = reviewDAO.review_modify_form(re_num);
		
		//내용안에 저장된 img태그의 contextPath를 전부 editorImgConPath로 변경
		String re_cont = review_content.getRe_cont();
		if(re_cont.indexOf("src=\"/")>-1){
		re_cont = re_cont.replace(re_cont.substring(re_cont.indexOf("src=\"/"), re_cont.indexOf("/resources/images/review")), "src=\"" + request.getContextPath());
		review_content.setRe_cont(re_cont);
		}
		model.addAttribute("review_content", review_content);
	}
	
	public void review_delete(int re_num, int e_plan_num){
		String uniquePath = "review/" + e_plan_num + "/";
		UploadFileUtil.deleteDirectory(uploadPath, uniquePath);
		reviewDAO.review_delete(re_num);
	}
	
	//만료 계획 정보 불러오기
	public void e_planInfo(int e_plan_num, Model model){
		//만료 계획 정보
		model.addAttribute("e_plan_content", reviewDAO.e_planInfo(e_plan_num));
		//만료 계획 스타일
		model.addAttribute("e_plan_style", reviewDAO.e_planStyle(e_plan_num));
		//만료 계획 작성자 정보
		model.addAttribute("e_plan_writer", reviewDAO.e_plan_writer(e_plan_num));
		//지역 정보 꺼내오기
		model.addAttribute("e_plan_schedule", reviewDAO.e_plan_schedule(e_plan_num));
	}
	
	//코멘트 추가하기
	public void addComment(CommentDTO commentDTO){
		reviewDAO.addComment(commentDTO);
	}
	
	//코멘트 가져오기
	public void get_comment(int re_num, Model model){
		model.addAttribute("comments", reviewDAO.get_comment(re_num));
	}
	
	//코멘트 개수
	public void count_comment(int re_num, Model model){
		model.addAttribute("comments", reviewDAO.count_comment(re_num));
	}
	
	//코멘트 삭제하기
	public void delComment(int cmt_num){
		reviewDAO.delComment(cmt_num);
	}
	
	
}
