package pairplan_v1.model.review;

import java.sql.Date;

public class ReviewDTO {
	private int re_num;
	private int e_plan_num;
	private int mem_num;
	private String re_title;
	private String re_cont;
	private Date re_date;
	private String re_imgs;
	private String re_mainImg;
	
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
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
	public String getRe_imgs() {
		return re_imgs;
	}
	public void setRe_imgs(String re_imgs) {
		this.re_imgs = re_imgs;
	}
	public String getRe_mainImg() {
		return re_mainImg;
	}
	public void setRe_mainImg(String re_mainImg) {
		this.re_mainImg = re_mainImg;
	}
	
}
