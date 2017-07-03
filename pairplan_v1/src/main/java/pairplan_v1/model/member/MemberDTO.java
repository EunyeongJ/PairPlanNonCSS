package pairplan_v1.model.member;

import java.sql.Date;

public class MemberDTO {
	private int mem_num;
	private String mem_id;
	private String mem_pass;
	private String mem_nick;
	private String mem_img;
	private String mem_name;
	private String mem_gender;
	private int mem_age;
	private String mem_email;
	private int mem_point;
	private Date mem_date;
	private int[] loc_name;
	private int[] style_name;
		
	public MemberDTO(){
		
	}
	public MemberDTO(int mem_num, String mem_id, String mem_pass, String mem_nick, String mem_img, String mem_name,
			String mem_gender, int mem_age, String mem_email, int mem_point, Date mem_date, int[] loc_name,
			int[] style_name) {
		this.mem_num = mem_num;
		this.mem_id = mem_id;
		this.mem_pass = mem_pass;
		this.mem_nick = mem_nick;
		this.mem_img = mem_img;
		this.mem_name = mem_name;
		this.mem_gender = mem_gender;
		this.mem_age = mem_age;
		this.mem_email = mem_email;
		this.mem_point = mem_point;
		this.mem_date = mem_date;
		this.loc_name = loc_name;
		this.style_name = style_name;
	}

	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getMem_img() {
		return mem_img;
	}
	public void setMem_img(String mem_img) {
		this.mem_img = mem_img;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public int getMem_age() {
		return mem_age;
	}
	public void setMem_age(int mem_age) {
		this.mem_age = mem_age;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public int getMem_point() {
		return mem_point;
	}
	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}
	public Date getMem_date() {
		return mem_date;
	}
	public void setMem_date(Date mem_date) {
		this.mem_date = mem_date;
	}
	public int[] getLoc_name() {
		return loc_name;
	}
	public void setLoc_name(int[] loc_name) {
		this.loc_name = loc_name;
	}
	public int[] getStyle_name() {
		return style_name;
	}
	public void setStyle_name(int[] style_name) {
		this.style_name = style_name;
	}		

	
}
