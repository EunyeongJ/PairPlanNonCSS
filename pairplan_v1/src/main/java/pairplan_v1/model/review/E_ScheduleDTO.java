package pairplan_v1.model.review;

import java.sql.Date;

public class E_ScheduleDTO {
	private int e_plan_num;
	private int e_sche_order;
	private double e_sche_lng;
	private double e_sche_lat;
	private String e_sche_addr;
	private String e_sche_title;
	private Date e_sche_start;
	private Date e_sche_end;
	
	public int getE_plan_num() {
		return e_plan_num;
	}
	public void setE_plan_num(int e_plan_num) {
		this.e_plan_num = e_plan_num;
	}
	public int getE_sche_order() {
		return e_sche_order;
	}
	public void setE_sche_order(int e_sche_order) {
		this.e_sche_order = e_sche_order;
	}
	public double getE_sche_lng() {
		return e_sche_lng;
	}
	public void setE_sche_lng(double e_sche_lng) {
		this.e_sche_lng = e_sche_lng;
	}
	public double getE_sche_lat() {
		return e_sche_lat;
	}
	public void setE_sche_lat(double e_sche_lat) {
		this.e_sche_lat = e_sche_lat;
	}
	public String getE_sche_addr() {
		return e_sche_addr;
	}
	public void setE_sche_addr(String e_sche_addr) {
		this.e_sche_addr = e_sche_addr;
	}
	public String getE_sche_title() {
		return e_sche_title;
	}
	public void setE_sche_title(String e_sche_title) {
		this.e_sche_title = e_sche_title;
	}
	public Date getE_sche_start() {
		return e_sche_start;
	}
	public void setE_sche_start(Date e_sche_start) {
		this.e_sche_start = e_sche_start;
	}
	public Date getE_sche_end() {
		return e_sche_end;
	}
	public void setE_sche_end(Date e_sche_end) {
		this.e_sche_end = e_sche_end;
	}
	
}
