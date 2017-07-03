package pairplan_v1.model.review;

import java.sql.Date;

public class ReviewContentDTO {
	
	//리뷰 정보
	private int re_num;
	private int mem_num;
	private String re_title;
	private String re_cont;
	private Date re_date;
	private int re_hit;
	
	//만료 계획 정보
	private int e_plan_num;
	private int e_plan_people;
	private String e_plan_cont;
	private String e_plan_title;
	private String e_plan_img;
	private Date e_plan_date;
	private int e_plan_hit;
	
	public int getRe_hit() {
		return re_hit;
	}
	public void setRe_hit(int re_hit) {
		this.re_hit = re_hit;
	}
	public int getE_plan_hit() {
		return e_plan_hit;
	}
	public void setE_plan_hit(int e_plan_hit) {
		this.e_plan_hit = e_plan_hit;
	}
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getRe_title() {
		return re_title;
	}
	public void setRe_title(String re_title) {
		this.re_title = re_title;
	}
	public String getRe_cont() {
		return re_cont;
	}
	public void setRe_cont(String re_cont) {
		this.re_cont = re_cont;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public int getE_plan_num() {
		return e_plan_num;
	}
	public void setE_plan_num(int e_plan_num) {
		this.e_plan_num = e_plan_num;
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
	public String getE_plan_img() {
		return e_plan_img;
	}
	public void setE_plan_img(String e_plan_img) {
		this.e_plan_img = e_plan_img;
	}
	public Date getE_plan_date() {
		return e_plan_date;
	}
	public void setE_plan_date(Date e_plan_date) {
		this.e_plan_date = e_plan_date;
	}
}	
