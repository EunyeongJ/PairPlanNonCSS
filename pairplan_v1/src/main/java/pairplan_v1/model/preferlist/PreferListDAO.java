package pairplan_v1.model.preferlist;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PreferListDAO extends SqlSessionDaoSupport{
	
	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	//지역
	public List<LocationDTO> location(){
		return getSqlSession().selectList("preferlist.location");
	}	

	//여행 스타일
	public List<Travel_StyleDTO> travel_style(){
		return getSqlSession().selectList("preferlist.travel");
	}
	
	//회원 선호 지역 빼오기
	public List<OuterJoinLocationDTO> memberWishLocation(int mem_num){
		return getSqlSession().selectList("preferlist.memberWishLocation", mem_num);
	}
	
	//회원 선호 여행지 빼오기
	public List<M_OuterJoinTravel_StyleDTO> memberWishTravelStyle(int mem_num){
		return getSqlSession().selectList("preferlist.memberWishTravelStyle", mem_num);
	}
	
	//계획 여행스타일 선택항목 뽑아오기
	public List<Travel_StyleDTO> selectPlanStyle(int plan_num){
		return getSqlSession().selectList("preferlist.selectPlanStyle", plan_num);
	}
	
	//계획 여행스타일 전체 뽑아오기
	public List<Travel_StyleDTO> selectPlanAllStyle(int plan_num){
		return getSqlSession().selectList("preferlist.selectPlanAllStyle", plan_num);
	}
	
	//--------------- 추천 -----------------------
	//회원 선호 지역 빼오기(선택만)
	public List<OuterJoinLocationDTO> memberWishLocationSelect(int mem_num){
		return getSqlSession().selectList("preferlist.memberWishLocationSelect", mem_num);
	}
	//회원 선호 여행지 빼오기(선택만)
	public List<M_OuterJoinTravel_StyleDTO> memberWishTravelStyleSelect(int mem_num){
		return getSqlSession().selectList("preferlist.memberWishTravelStyleSelect", mem_num);
	}
	
}
