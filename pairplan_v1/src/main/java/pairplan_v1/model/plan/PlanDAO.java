package pairplan_v1.model.plan;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import pairplan_v1.model.member.MemberDTO;

@Component
public class PlanDAO extends SqlSessionDaoSupport {

	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	//계획 번호
	public int plan_num(){
		return getSqlSession().selectOne("plan.select_plan_number");
	}
	
	//계획저장
	public void insert_plan(PlanDTO planDTO){
		getSqlSession().insert("plan.insert_plan", planDTO);
	}
	
	public void insert_travelStyle(PlanDTO planDTO){
		
		HashMap<String , Integer> m = new HashMap<String , Integer>();
		m.put("plan_num", planDTO.getPlan_num());
		
		for(int i =0; i<planDTO.getPlan_style().length; i++){
			m.put("style_num", planDTO.getPlan_style()[i]);
			getSqlSession().insert("preferlist.planJoinTravelStyle", m);
		}
	}
	
	//그룹생성
	public void create_group(PlanDTO planDTO){
		getSqlSession().insert("group.create", planDTO);
	}
	//일정정보 등록
	public void insert_planInfo(ScheduleDTO scheduleDTO){
		getSqlSession().insert("plan.insert_planInfo", scheduleDTO);
	}
	//상세보기
	public PlanDTO select_plan(int plan_num){
		return getSqlSession().selectOne("plan.select_plan", plan_num);
	}
	public MemberDTO select_member(int mem_num){
		return getSqlSession().selectOne("member.memberInfo", mem_num);
	}
	//현재인원 카운트
	public int count_people(int plan_num){
		return getSqlSession().selectOne("group.count_people", plan_num);
	}
	public List<ScheduleDTO> select_planInfo( int plan_num ){
		return getSqlSession().selectList("plan.select_planInfo", plan_num);
	}
	
	//동행 신청 생성
	public String makePlanRequest(int mem_num, int plan_num){
		Map<String, Integer> map = new HashMap<>();
		map.put("mem_num", mem_num);
		map.put("plan_num", plan_num);
		
		if((int)(getSqlSession().selectOne("group.check_group", map)) > 0){
			return "duplicated";
		}
		
		try {
			getSqlSession().insert("plan.makePlanRequest", map);
			return "check";
		} catch (Exception e) {
			return "duplicated";
		}		
	}
	
	//동행 신청 삭제
	public void deletePlanRequest(int plan_num, int mem_num){
		Map<String, Integer> map = new HashMap<>();
		map.put("plan_num", plan_num);
		map.put("mem_num", mem_num);
		
		getSqlSession().delete("plan.deletePlanRequest", map);
	}
	
	//동행 요청 수락
	public void acceptPlanRequest(int plan_num, int mem_num){
		Map<String, Integer> map = new HashMap<>();
		map.put("plan_num", plan_num);
		map.put("mem_num", mem_num);
		
		getSqlSession().insert("group.acceptPlanRequest", map);	//그룹 생성
		deletePlanRequest(plan_num, mem_num);					//요청에서 삭제
	}
	
	//계획 삭제
	public void delete_plan(int plan_num){
		getSqlSession().delete("plan.delete_plan", plan_num);
	}
	
	//계획 수정
	public void update_plan(PlanDTO planDTO){
		getSqlSession().update("plan.update_plan", planDTO);
	}
	
	//계획 여행 스타일 삭제
	public void delete_travelStyle(int plan_num){
		getSqlSession().delete("preferlist.delete_travelStyle", plan_num);
	}
	
	//계획 일정 삭제
	public void delete_planInfo(int plan_num){
		getSqlSession().delete("plan.delete_planInfo", plan_num);
	}
	
	//계획 검색하기
	public List<PlanDTO> search_plan(SearchDTO searchDTO){
		return getSqlSession().selectList("plan.search_plan",searchDTO);
	}
	//시간순
	public List<PlanDTO> search_plan_recent(SearchDTO searchDTO){
		return getSqlSession().selectList("plan.search_plan_recent",searchDTO);
	}
	//인기순
	public List<PlanDTO> search_plan_popular(SearchDTO searchDTO){
		return getSqlSession().selectList("plan.search_plan_popular",searchDTO);
	}
	
	//계획 리스트 보기
	public List<PlanDTO> select_planList(int listBlock){
		return getSqlSession().selectList("plan.select_planList",listBlock);
	}																			//120~127
	//시간순
	public List<PlanDTO> select_planList_recent(int listBlock){
		return getSqlSession().selectList("plan.select_planList_recent",listBlock);
	}
	//인기순
	public List<PlanDTO> select_planList_popular(int listBlock){
		return getSqlSession().selectList("plan.select_planList_popular",listBlock);
	}
	
	//조회수 증가
	public void planHitup(int plan_num){
		getSqlSession().update("plan.planHitup", plan_num);
	}
	
	
	//만료된 계획을 검색
	public List<Integer> searchExpired(){
		System.out.println("dao in");
		List<Integer> aa = getSqlSession().selectList("plan.searchExpired");
		System.out.println(aa);
		return aa;
	}
	
	//만료된 계획을 만료 테이블로 이동
	public void movePlan(int plan_num){
		getSqlSession().update("plan.exePlanMove", plan_num);
	}
	
	//내가 동행 요청한 리스트
	public List<MyRequestDTO> myRequest(int mem_num){
		return getSqlSession().selectList("plan.myRequest", mem_num);
	}
	
	//다른 사용자에게 동행 요청받은 리스트
	public List<MemberDTO> waitAccept(int mem_num){
		return getSqlSession().selectList("plan.waitAccept", mem_num);
	}
	
	//그룹 가져오기 mem_num으로
	public List<GroupDTO> select_group_mem(int mem_num){
		return getSqlSession().selectList("group.select_mem", mem_num);
	}
	
	
	//----------------------추천 -------------------------------
	//추천하기 지역
	public List<PlanJoinDTO> recommand_plan_loc(String loc_name){
		return getSqlSession().selectList("plan.recommand_plan_loc", loc_name);
	}
	//추천하기 스타일
	public List<PlanJoinDTO> recommand_plan_style(int style_num){
		return getSqlSession().selectList("plan.recommand_plan_style", style_num);
	}
	
	//출발일
	public Date select_start_date(int plan_num){
		return getSqlSession().selectOne("plan.get_start_date", plan_num);
	}
	//종료일
	public Date select_end_date(int plan_num){
		return getSqlSession().selectOne("plan.get_end_date", plan_num);
	}
	
	//추천하기 조회순
    public List<PlanJoinDTO> recommand_plan_hit(){
       return getSqlSession().selectList("plan.recommand_plan_hit");
    }

	//상세보기
	public PlanJoinDTO select_planJoin(int plan_num){
	   return getSqlSession().selectOne("plan.select_planJoin", plan_num);
	}

	
}
