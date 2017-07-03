package pairplan_v1.model.plan;

import java.sql.Date;

public class ScheduleDTO {
	
	private int plan_num;
	private int sche_order;
	private double sche_lng;
	private double sche_lat;
	private String sche_addr ;
	private String sche_title;
	private Date sche_start;
	private Date sche_end;
	
	public ScheduleDTO() {}
	public ScheduleDTO(int plan_num, String sche_addr, String sche_title, double sche_lng, double sche_lat,
			Date sche_start, Date sche_end, int sche_order) {
		
		this.plan_num = plan_num;
		this.sche_addr = sche_addr;
		this.sche_title = sche_title;
		this.sche_lng = sche_lng;
		this.sche_lat = sche_lat;
		this.sche_start = sche_start;
		this.sche_end = sche_end;
		this.sche_order = sche_order;
	}

	public int getSche_order() {
		return sche_order;
	}
	
	public void setSche_order(int sche_order) {
		this.sche_order = sche_order;
	}
	
	public int getPlan_num() {
		return plan_num;
	}

	public void setPlan_num(int plan_num) {
		this.plan_num = plan_num;
	}

	public String getSche_addr() {
		return sche_addr;
	}

	public void setSche_addr(String sche_addr) {
		this.sche_addr = sche_addr;
	}

	public String getSche_title() {
		return sche_title;
	}

	public void setSche_title(String sche_title) {
		this.sche_title = sche_title;
	}

	public double getSche_lng() {
		return sche_lng;
	}

	public void setSche_lng(double sche_lng) {
		this.sche_lng = sche_lng;
	}

	public double getSche_lat() {
		return sche_lat;
	}

	public void setSche_lat(double sche_lat) {
		this.sche_lat = sche_lat;
	}

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


	
	
}
