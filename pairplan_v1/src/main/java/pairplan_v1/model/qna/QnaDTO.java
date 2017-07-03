package pairplan_v1.model.qna;

import java.sql.Date;

public class QnaDTO {
	private int qna_num;
	private String qna_title;
	private String qna_cont;
	private String qna_pass;
	private Date qna_date;
	private int mem_num;
	private String mem_nick;
	private int qna_group;
	private int qna_step;
	
	public QnaDTO(){
		
	}
	
	public QnaDTO(int qna_num, String qna_title, String qna_cont, String qna_pass, Date qna_date, int mem_num,
			String mem_nick, int qna_group, int qna_step) {
		super();
		this.qna_num = qna_num;
		this.qna_title = qna_title;
		this.qna_cont = qna_cont;
		this.qna_pass = qna_pass;
		this.qna_date = qna_date;
		this.mem_num = mem_num;
		this.mem_nick = mem_nick;
		this.qna_group = qna_group;
		this.qna_step = qna_step;
	}
	
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	
	public String getQna_cont() {
		return qna_cont;
	}
	public void setQna_cont(String qna_cont) {
		this.qna_cont = qna_cont;
	}
	
	public String getQna_pass() {
		return qna_pass;
	}
	public void setQna_pass(String qna_pass) {
		this.qna_pass = qna_pass;
	}
	
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	
	public int getQna_group() {
		return qna_group;
	}
	public void setQna_group(int qna_group) {
		this.qna_group = qna_group;
	}
	
	public int getQna_step() {
		return qna_step;
	}
	public void setQna_step(int qna_step) {
		this.qna_step = qna_step;
	}	
	
}
