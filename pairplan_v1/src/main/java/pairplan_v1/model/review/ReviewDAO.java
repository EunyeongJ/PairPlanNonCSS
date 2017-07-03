package pairplan_v1.model.review;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import pairplan_v1.model.member.MemberDTO;

@Component
public class ReviewDAO extends SqlSessionDaoSupport{
	
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	//만료된 여행의 목록을 검색 
	public List<E_PlanDTO> view_expired_plan(int mem_num){
		return getSqlSession().selectList("review.expired_planlist", mem_num);
	}
	
	public void review_write(ReviewDTO dto){
		getSqlSession().insert("review.review_write", dto);
	}
	
	public String search_expired_image(int e_plan_num){
		return getSqlSession().selectOne("review.expired_image", e_plan_num);
	}
	
	public List<ReviewDTO> review_list(){
		return getSqlSession().selectList("review.review_list");
	}
	
	public ReviewContentDTO review_view_info(int re_num){
		return getSqlSession().selectOne("review.review_view_info", re_num);
	}
	
	public List<E_ScheduleDTO> e_plan_schedule(int e_plan_num){
		return getSqlSession().selectList("review.e_plan_schedule", e_plan_num);
	}
	
	public ReviewDTO review_modify_form(int re_num){
		return getSqlSession().selectOne("review.review_modify_view", re_num);
	}
	
	public void review_modify(ReviewDTO dto){
		getSqlSession().update("review.review_modify", dto);
	}
	
	public void review_delete(int re_num){
		getSqlSession().delete("review.review_delete", re_num);
	}
	
	//리뷰 번호 조회
	public int review_num(int e_plan_num){
		return getSqlSession().selectOne("review.review_num", e_plan_num);
	}
	
	//리뷰 작성자 조회
	public MemberDTO review_writer(int re_num){
		return getSqlSession().selectOne("review.review_writer", re_num);
	}
	
	//만료 계획 정보 조회
	public E_PlanDTO e_planInfo(int e_plan_num){
		return getSqlSession().selectOne("review.e_planInfo", e_plan_num);
	}
	
	//만료 계획 여행 스타일 조회
	public List<String> e_planStyle(int e_plan_num){
		return getSqlSession().selectList("preferlist.e_planStyle", e_plan_num);
	}
	
	//만료 계획 작성자 조회
	public MemberDTO e_plan_writer(int e_plan_num){
		return getSqlSession().selectOne("review.e_plan_writer", e_plan_num);
	}
	
	//리뷰 조회수 증가
	public void reviewHitUp(int re_num){
		getSqlSession().update("review.reviewHitUp", re_num);
	}
	
	//만료 계획 그룹원 정보
	public List<MemberDTO> e_plan_group(int e_plan_num){
		return getSqlSession().selectList("member.e_GroupMembers", e_plan_num);
	}
	
	//코멘트 추가하기 4_23
	public void addComment(CommentDTO commentDTO){
		getSqlSession().insert("review.insert_comment", commentDTO);
	}
	
	//코멘트 가져오기 4_23
	public List<CommentDTO> get_comment(int re_num){
		return getSqlSession().selectList("review.get_comment", re_num);
	}
	
	//코멘트 개수 4_23
	public int count_comment(int re_num){
		return getSqlSession().selectOne("review.count_comment", re_num);
	}
	
	//코멘트 삭제하기 4_23
	public void delComment(int cmt_num){
		getSqlSession().delete("review.delete_comment", cmt_num);
	}
}