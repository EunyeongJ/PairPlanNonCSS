package pairplan_v1.service.preferlist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import pairplan_v1.model.preferlist.LocationDTO;
import pairplan_v1.model.preferlist.M_OuterJoinTravel_StyleDTO;
import pairplan_v1.model.preferlist.OuterJoinLocationDTO;
import pairplan_v1.model.preferlist.PreferListDAO;
import pairplan_v1.model.preferlist.Travel_StyleDTO;

@Component
public class PreferListService {

	@Autowired
	PreferListDAO preferListDAO;
	
	//지역
	//@Override
	public void Location(Model model) {
		List<LocationDTO> list = preferListDAO.location();
		model.addAttribute("location", list);
	}
	
	//여행 스타일
	//@Override
	public void travel_style(Model model) {	
		List<Travel_StyleDTO> list = preferListDAO.travel_style();
		model.addAttribute("travel_style", list);
	}
	
	//회원 선호 지역 뽑아오기
	//@Override
	public void memberWishLocation(int mem_num, Model model) {
		List<OuterJoinLocationDTO> list = preferListDAO.memberWishLocation(mem_num);
		model.addAttribute("memberWishLocation", list);
	}
	
	//회원 선호 여행스타일 뽑아오기	
	//@Override
	public void memberWishTravelStyle(int mem_num, Model model) {
		List<M_OuterJoinTravel_StyleDTO> list = preferListDAO.memberWishTravelStyle(mem_num);
		model.addAttribute("memberWishTravelStyle", list);
	}
	
	//계획 여행스타일 선택항목 뽑아오기
	public void selectPlanStyle(int plan_num, Model model){
		model.addAttribute("plan_style", preferListDAO.selectPlanStyle(plan_num));
	}
	
	//계획 여행스타일 전체 뽑아오기
	public void selectPlanAllStyle(Model model , int plan_number){
		model.addAttribute("plan_allStyle", preferListDAO.selectPlanAllStyle(plan_number));
	}
}
