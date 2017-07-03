package pairplan_v1.model.plan;

import java.sql.Date;

public class PlanJoinDTO {
	
	private int plan_num;		//계획 번호
	private int mem_num;		//회원 번호
	private int plan_people;	//계획 최대 인원
	private String plan_cont;	//계획 내용
	private String plan_title;		//계획 제목
	private Date plan_date;			//계획 만든 날짜
	private String plan_img;		//계획 썸네일 사진
	private int plan_hit;			//계획 조회수
	
	private int plan_style[];		//여행 스타일
	private String plan_infos;		//일정 정보
	
	private Date sche_start;
	private Date sche_end;
	private int count;
	
	public Date getSche_start() {
		return sche_start;
	}
	public void setSche_start(Date sche_start) {
		this.sche_start = sche_start;
	}
	public Date getSche_end() {
		return sche_end;
	}
	public void setSche_end(Date sche_end) {
		this.sche_end = sche_end;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPlan_num() {
		return plan_num;
	}
	public void setPlan_num(int plan_num) {
		this.plan_num = plan_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getPlan_people() {
		return plan_people;
	}
	public void setPlan_people(int plan_people) {
		this.plan_people = plan_people;
	}
	public String getPlan_cont() {
		return plan_cont;
	}
	public void setPlan_cont(String plan_cont) {
		this.plan_cont = plan_cont;
	}
	public String getPlan_title() {
		return plan_title;
	}
	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}
	public Date getPlan_date() {
		return plan_date;
	}
	public void setPlan_date(Date plan_date) {
		this.plan_date = plan_date;
	}
	public String getPlan_img() {
		return plan_img;
	}
	public void setPlan_img(String plan_img) {
		this.plan_img = plan_img;
	}
	public int getPlan_hit() {
		return plan_hit;
	}
	public void setPlan_hit(int plan_hit) {
		this.plan_hit = plan_hit;
	}
	public int[] getPlan_style() {
		return plan_style;
	}
	public void setPlan_style(int[] plan_style) {
		this.plan_style = plan_style;
	}
	public String getPlan_infos() {
		return plan_infos;
	}
	public void setPlan_infos(String plan_infos) {
		this.plan_infos = plan_infos;
	}
	
	
	
	
	
	
	
}
