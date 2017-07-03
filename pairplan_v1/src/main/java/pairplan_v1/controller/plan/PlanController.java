package pairplan_v1.controller.plan;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import pairplan_v1.model.plan.PlanDTO;
import pairplan_v1.model.plan.SearchDTO;
import pairplan_v1.service.plan.PlanService;
import pairplan_v1.service.preferlist.PreferListService;

@Controller
public class PlanController  {
	
	@Autowired
	PreferListService preferListService;
	
	@Autowired
	PlanService planService;
	
	//plan insert form
	@RequestMapping("/planInsertForm")
	public String insertForm(Model model ){
		preferListService.travel_style(model);
		return "plan/planInsertForm";
	}
	
	//plan insert
	@RequestMapping(method = RequestMethod.POST, value="/insert", produces="application/text; charset=UTF-8")
	public String insertPro(@RequestParam("thumbnail") MultipartFile multipartFile, PlanDTO planDTO){
		int plan_num = planService.insert_plan(multipartFile, planDTO);
		return "redirect: select_plan/" + plan_num;
	}
	
	//상세보기
	@RequestMapping("/select_plan/{plan_num}")
	public String content_plan(@PathVariable int plan_num, Model model){
		planService.planHitup(plan_num);					//조회수 증가
		planService.select_everyInfo(plan_num, model);
		preferListService.selectPlanStyle(plan_num, model);
		return "plan/plan_content";
	}
	
	//리스트 요청
	@RequestMapping("/planList")
	public String selectPlanList(Model model, HttpSession session){
		planService.recommand_list(model,session);
		planService.select_list(model);
		return "plan/planList";
	}
	//검색하기
	@RequestMapping("/search_plan")
	public String searchList(SearchDTO searchDTO, Model model, HttpSession session){
		planService.recommand_list(model,session);
		planService.search_plan(model, searchDTO);
		return "plan/planList";
	}	
	//페이지로 리스트 요청
	@RequestMapping("/addList")
	public String addList(SearchDTO searchDTO, Model model){
		planService.add_list(model, searchDTO);
		return "plan/morePlan";
	}
	
	//동행 신청 생성
	@RequestMapping("/makePlanRequest")
	@ResponseBody
	public String makePlanRequest(@RequestParam("mem_num") int mem_num,	@RequestParam("plan_num") int plan_num){
		return planService.makePlanRequest(mem_num, plan_num);
	}
	
	//동행 신청 삭제	
	@RequestMapping("deletePlanRequest/{plan_num}/{mem_num}")
	@ResponseBody
	public String deletePlanRequest(@PathVariable int plan_num, @PathVariable int mem_num){
		planService.deletePlanRequest(plan_num, mem_num);
		return "ok";
	}
	
	//동행 요청 수락
	@RequestMapping("acceptPlanRequest/{plan_num}/{mem_num}")
	@ResponseBody
	public String acceptPlanRequest(@PathVariable int plan_num, @PathVariable int mem_num){
		planService.acceptPlanRequest(plan_num, mem_num);
		return "ok";
	}
	
	//삭제
	@RequestMapping("/planDelete/{plan_num}")
	public String delete_plan(@PathVariable int plan_num){
		planService.delete_plan(plan_num);
		return "redirect: ../planList";
	}

	//수정폼
	@RequestMapping("/planUpdateForm/{plan_num}")
	public String updateForm(@PathVariable int plan_num, Model model ){
		preferListService.selectPlanAllStyle(model, plan_num);
		planService.select_everyInfo(plan_num, model);
		return "plan/planUpdateForm";
	}
	
	//수정
	@RequestMapping(method = RequestMethod.POST, value="/update", produces="application/text; charset=UTF-8")
	public String updatePro(@RequestParam("thumbnail") MultipartFile multipartFile, PlanDTO planDTO){
		int plan_num = planService.update_plan(multipartFile, planDTO);
		return "redirect: select_plan/" + plan_num;
	}
	
}
