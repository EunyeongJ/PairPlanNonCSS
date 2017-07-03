package pairplan_v1.service.plan;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
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
import pairplan_v1.model.plan.GroupDTO;
import pairplan_v1.model.plan.PlanDAO;
import pairplan_v1.model.plan.PlanDTO;
import pairplan_v1.model.plan.PlanJoinDTO;
import pairplan_v1.model.plan.ScheduleDTO;
import pairplan_v1.model.plan.SearchDTO;
import pairplan_v1.model.preferlist.M_OuterJoinTravel_StyleDTO;
import pairplan_v1.model.preferlist.OuterJoinLocationDTO;
import pairplan_v1.model.preferlist.PreferListDAO;
import pairplan_v1.utils.UploadFileUtil;

@Component
public class PlanService implements ApplicationContextAware{

	private WebApplicationContext context = null;
	private String uploadPath = null;
	
	//@Resource
	//private String imagePath;
	
	@Autowired
	PlanDAO planDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	PreferListDAO preferListDAO;
	
	// 계획 저장(계획 저장, 여행스타일 저장) , 그룹 생성
	public int insert_plan(MultipartFile multipartFile, PlanDTO planDTO){
		int plan_num = planDAO.plan_num();
		
		String uniquePath = "/plan/" + plan_num + "/";
		if(!multipartFile.isEmpty()){								//multipartFile이 있다면	
			//planDTO.setPlan_img(imagePath + uniquePath + multipartFile.getOriginalFilename());
			planDTO.setPlan_img(uniquePath + multipartFile.getOriginalFilename());
			UploadFileUtil.uploadImage(uploadPath, uniquePath, multipartFile);
		}else{
			String plan_img = planDTO.getPlan_img();
			planDTO.setPlan_img(plan_img.substring(plan_img.indexOf("/plan")));
		}	
		
		planDTO.setPlan_num(plan_num);
		planDAO.insert_plan(planDTO);			//계획 저장
		planDAO.insert_travelStyle(planDTO);	//여행스타일 저장
		planDAO.create_group(planDTO);			//그룹 생성

		insert_schedule_json(planDTO);			//일정 정보 저장
		
		return plan_num;
	}
	
	public void insert_schedule_json(PlanDTO planDTO){		
		JSONArray ja = (JSONArray)JSONValue.parse(planDTO.getPlan_infos());
        
		ScheduleDTO scheduleDTO = null;
		for (int i = 0; i < ja.size(); i++) {
        	JSONObject jo = (JSONObject) ja.get(i);

        	@SuppressWarnings("rawtypes")        	
			JSONObject jo2 = new JSONObject((Map)jo.get("select_position"));
        	scheduleDTO = new ScheduleDTO(planDTO.getPlan_num(),
        			jo.get("location_addr").toString(),
        			jo.get("location_title").toString(),
        			(double)jo2.get("gb"),
        			(double)jo2.get("hb"),
        			Date.valueOf(jo.get("start_date").toString()),
        			Date.valueOf(jo.get("end_date").toString()),i+1);
        	
        	planDAO.insert_planInfo(scheduleDTO);
        }
	}

	// 계획 삭제(계획 삭제, 여행스타일 삭제) , 그룹 삭제
	public void delete_plan(int plan_num){
		String uniquePath = "/plan/" + plan_num + "/";
		UploadFileUtil.deleteDirectory(uploadPath, uniquePath);	//파일삭제
		
		planDAO.delete_plan(plan_num);
	}
	
	//계획불러오기
	public void select_everyInfo(int plan_num, Model model){
		PlanDTO dto = planDAO.select_plan(plan_num);			//계획 정보
		model.addAttribute("plan", dto);
		model.addAttribute("planPeople", planDAO.count_people(plan_num));	//현재인원
		model.addAttribute("planInfo", planDAO.select_planInfo(plan_num));	//일정 정보
		model.addAttribute("member", planDAO.select_member(dto.getMem_num()));//작성자 정보
	}
	
	//동행 신청 생성
	public String makePlanRequest(int mem_num, int plan_num){
		return planDAO.makePlanRequest(mem_num, plan_num);
	}
	
	//동행 신청 삭제
	public void deletePlanRequest(int plan_num, int mem_num){
		planDAO.deletePlanRequest(plan_num, mem_num);
	}
	
	//동행 요청 수락
	public void acceptPlanRequest(int plan_num, int mem_num){
		planDAO.acceptPlanRequest(plan_num, mem_num);
	}
	
	public int update_plan(MultipartFile multipartFile, PlanDTO planDTO){
		
		int plan_num = planDTO.getPlan_num();
		
		String uniquePath = "/plan/" + plan_num + "/";
		if(!multipartFile.isEmpty()){								//multipartFile이 있다면	
			//planDTO.setPlan_img(imagePath + uniquePath + multipartFile.getOriginalFilename());
			planDTO.setPlan_img(uniquePath + multipartFile.getOriginalFilename());
			UploadFileUtil.uploadImage(uploadPath, uniquePath, multipartFile);
		}else{
			String plan_img = planDTO.getPlan_img();
			if(plan_img.indexOf("plan/default")>-1)
				UploadFileUtil.deleteDirectory(uploadPath, uniquePath);
			planDTO.setPlan_img(plan_img.substring(plan_img.indexOf("/plan")));
		}
		
		planDAO.update_plan(planDTO);			//계획 저장
		
		planDAO.delete_travelStyle(plan_num);
		planDAO.delete_planInfo(plan_num);
		
		planDAO.insert_travelStyle(planDTO);	//여행스타일 저장
		insert_schedule_json(planDTO);			//일정 정보 저장
		return plan_num;
	}
	//plan list 처음 띄우기
	public void select_list(Model model){
		model.addAttribute("plan_recent", planDAO.select_planList_recent(0));	
		model.addAttribute("plan_popular", planDAO.select_planList_popular(0));		
		model.addAttribute("plan", planDAO.select_planList(0));
	}
	//plan 검색 
	public void search_plan(Model model, SearchDTO searchDTO){
		model.addAttribute("plan_search", searchDTO);
		model.addAttribute("plan_recent", planDAO.search_plan_popular(searchDTO));
		model.addAttribute("plan_popular", planDAO.search_plan_popular(searchDTO));
		model.addAttribute("plan", planDAO.search_plan_popular(searchDTO));
	}
	
	//페이지 더보기
	public void add_list(Model model, SearchDTO searchDTO){
		
		if(searchDTO.getSearch_text().equals("undefined")){
			model.addAttribute("plan_recent", planDAO.select_planList_recent(searchDTO.getListBlock())); //json 데이터로 변환할 데이터를 DB에서 추출
			model.addAttribute("plan_popular", planDAO.select_planList_popular(searchDTO.getListBlock())); //json 데이터로 변환할 데이터를 DB에서 추출
			model.addAttribute("plan", planDAO.select_planList(searchDTO.getListBlock())); //json 데이터로 변환할 데이터를 DB에서 추출
		}else{
			model.addAttribute("plan_recent", planDAO.search_plan_recent(searchDTO)); //json 데이터로 변환할 데이터를 DB에서 추출
			model.addAttribute("plan_popular", planDAO.search_plan_popular(searchDTO)); //json 데이터로 변환할 데이터를 DB에서 추출
			model.addAttribute("plan", planDAO.search_plan(searchDTO)); //json 데이터로 변환할 데이터를 DB에서 추출
		}
	}	
	//조회수 증가
	public void planHitup(int plan_num){
		planDAO.planHitup(plan_num);
	}
	
	//만료된 계획을 만료 테이블로 이동
	public void movePlan(){
		List<Integer> plan_nums = planDAO.searchExpired();
		for(int i=0; i<plan_nums.size(); i++)
			System.out.println("service=" + i);
		
		for(int i=0; i<plan_nums.size(); i++){
			System.out.println(plan_nums.get(i));
			planDAO.movePlan(plan_nums.get(i));
			}
	}
	
	//동행 현황 조회
	public void planStatus(int mem_num, Model model){
		//내가 동행 요청한 리스트
		model.addAttribute("myRequest", planDAO.myRequest(mem_num));
		//mem_num을 조회
		
		//다른 사용자에게 동행 요청받은 리스트
		model.addAttribute("waitAccept", planDAO.waitAccept(mem_num));
		//나의 plan_num을 조회
	}
	
	//그룹 불러오기 mem으로
	public void select_group(int mem_num, Model model){
		//return planDAO.select_group_mem(mem_num);
		List<GroupDTO> group = planDAO.select_group_mem(mem_num);
		List<List<MemberDTO>> groupInfos = new ArrayList<List<MemberDTO>>();
		List<List<ScheduleDTO>> scheduleInfos = new ArrayList<List<ScheduleDTO>>();
		
		for(int i=0; i<group.size(); i++){						//계획번호로....
			int plan_num = group.get(i).getPlan_num();			//계획번호추출
			groupInfos.add(memberDAO.select_groupMembers(plan_num));
			scheduleInfos.add(planDAO.select_planInfo(plan_num));		//계획의 일정정보를 갖고오기
		}
		model.addAttribute("groupInfos", groupInfos);
		model.addAttribute("scheduleInfos", scheduleInfos);
	}
	
	//추천!
   public void recommand_list(Model model, HttpSession session){
      
	   int mem_num;
	   try {
		   mem_num = (int)session.getAttribute("session_mem_num");
		} catch (Exception e) {
			return;
		}
      
      List<OuterJoinLocationDTO> wish_locations = preferListDAO.memberWishLocationSelect(mem_num);
      List<M_OuterJoinTravel_StyleDTO> wish_styles = preferListDAO.memberWishTravelStyleSelect(mem_num);
      List<PlanJoinDTO> recommands = new ArrayList<PlanJoinDTO>();
      
      for(int i=0; i<wish_locations.size();i++){
         List<PlanJoinDTO> locs = planDAO.recommand_plan_loc(wish_locations.get(i).getLoc_name());
         for(int j=0 ; j < locs.size() ; j++)
            recommands.add(locs.get(j));
      }
      for(int i=0; i<wish_styles.size();i++){
         List<PlanJoinDTO> styles = planDAO.recommand_plan_style(wish_styles.get(i).getStyle_num());
         for(int j=0 ; j < styles.size() ; j++)
            recommands.add(styles.get(j));
      }
      
      if(recommands.size()<10){
         List<PlanJoinDTO> hits = planDAO.recommand_plan_hit();
         for(int j=0 ; j < hits.size() ; j++)
            recommands.add(hits.get(j));
      }
      
      
      
      HashSet <Integer> hs = new HashSet<Integer>();
      
      for(int i=0; i<recommands.size();i++){
         hs.add(recommands.get(i).getPlan_num());
      }
      System.out.println(hs);
      
      recommands = null;
      recommands = new ArrayList<PlanJoinDTO>();
      List<Integer> plan_nums = new ArrayList<Integer>(hs);
      
      for(int i=0; i<plan_nums.size();i++){
         int plan_num = plan_nums.get(i);
         PlanJoinDTO p = planDAO.select_planJoin(plan_num);
         int count = planDAO.count_people(plan_num);
         Date sche_start = planDAO.select_start_date(plan_num);
         Date sche_end = planDAO.select_end_date(plan_num);
         p.setCount(count);
         p.setSche_start(sche_start);
         p.setSche_end(sche_end);
         recommands.add(p);
      }
   
      model.addAttribute("recommand", recommands);
   }

   
   //upload경로 설정
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.context = (WebApplicationContext)applicationContext;
		uploadPath = context.getServletContext().getRealPath("/resources/images");		
	}

}
