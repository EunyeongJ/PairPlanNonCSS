package pairplan_v1.model.review;

import java.sql.Date;

public class E_PlanDTO {
	private int e_plan_num;
	private int mem_num;
	private int e_plan_people;
	private String e_plan_cont;
	private String e_plan_title;
	private Date e_plan_date;
	private String e_plan_img;
	private int e_plan_hit;
	
	public int getE_plan_num() {
		return e_plan_num;
	}
	public void setE_plan_num(int e_plan_num) {
		this.e_plan_num = e_plan_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getE_plan_people() {
		return e_plan_people;
	}
	public void setE_plan_people(int e_plan_people) {
		this.e_plan_people = e_plan_people;
	}
	public String getE_plan_cont() {
		return e_plan_cont;
	}
	public void setE_plan_cont(String e_plan_cont) {
		this.e_plan_cont = e_plan_cont;
	}
	public String getE_plan_title() {
		return e_plan_title;
	}
	public void setE_plan_title(String e_plan_title) {
		this.e_plan_title = e_plan_title;
	}
	public Date getE_plan_date() {
		return e_plan_date;
	}
	public void setE_plan_date(Date e_plan_date) {
		this.e_plan_date = e_plan_date;
	}
	public String getE_plan_img() {
		return e_plan_img;
	}
	public void setE_plan_img(String e_plan_img) {
		this.e_plan_img = e_plan_img;
	}
	public int getE_plan_hit() {
		return e_plan_hit;
	}
	public void setE_plan_hit(int e_plan_hit) {
		this.e_plan_hit = e_plan_hit;
	}
	
}
