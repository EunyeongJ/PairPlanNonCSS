package pairplan_v1.model.plan;

public class MyRequestDTO {
	private int plan_num;
	private int mem_num;
	private int boss_num;
	private String boss_nick;
	
	public String getBoss_nick() {
		return boss_nick;
	}
	public void setBoss_nick(String boss_nick) {
		this.boss_nick = boss_nick;
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
	public int getBoss_num() {
		return boss_num;
	}
	public void setBoss_num(int boss_num) {
		this.boss_num = boss_num;
	}
	
}
