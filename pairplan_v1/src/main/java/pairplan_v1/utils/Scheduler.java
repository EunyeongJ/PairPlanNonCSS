package pairplan_v1.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import pairplan_v1.service.plan.PlanService;

@Component
public class Scheduler {
	
	@Autowired
	private PlanService planService; 
	
	//종료된 계획을 만료계획 테이블로 이동
	@Scheduled(cron = "50 14 12 * * *")
	public void scheduler(){
		System.out.println("스케줄러 작동");
		planService.movePlan();
		System.out.println("만료 계획 처리 완료");
	}
}