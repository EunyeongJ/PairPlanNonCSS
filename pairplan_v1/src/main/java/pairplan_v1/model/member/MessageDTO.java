package pairplan_v1.model.member;

import java.sql.Date;

public class MessageDTO {
	private int msg_num;
	private int msg_rcv;
	private int msg_snd;
	private String msg_cont;
	private Date msg_date;
	private String r_nick;
	private String s_nick;
	private String s_img;
	
	
	public String getS_img() {
		return s_img;
	}
	public void setS_img(String s_img) {
		this.s_img = s_img;
	}
	public int getMsg_rcv() {
		return msg_rcv;
	}
	public void setMsg_rcv(int msg_rcv) {
		this.msg_rcv = msg_rcv;
	}
	public int getMsg_snd() {
		return msg_snd;
	}
	public void setMsg_snd(int msg_snd) {
		this.msg_snd = msg_snd;
	}
	public int getMsg_num() {
		return msg_num;
	}
	public void setMsg_num(int msg_num) {
		this.msg_num = msg_num;
	}
	public String getR_nick() {
		return r_nick;
	}
	public void setR_nick(String r_nick) {
		this.r_nick = r_nick;
	}
	public String getS_nick() {
		return s_nick;
	}
	public void setS_nick(String s_nick) {
		this.s_nick = s_nick;
	}
	public Date getMsg_date() {
		return msg_date;
	}
	public void setMsg_date(Date msg_date) {
		this.msg_date = msg_date;
	}
	public String getMsg_cont() {
		return msg_cont;
	}
	public void setMsg_cont(String msg_cont) {
		this.msg_cont = msg_cont;
	}

	
}
