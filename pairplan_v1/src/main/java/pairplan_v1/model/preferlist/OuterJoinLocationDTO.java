package pairplan_v1.model.preferlist;

public class OuterJoinLocationDTO {
	private int mem_num;
	private int loc_num;
	private String loc_name;
	
	public OuterJoinLocationDTO(){
		
	}
	public OuterJoinLocationDTO(int mem_num, int loc_num, String loc_name) {
		this.mem_num = mem_num;
		this.loc_num = loc_num;
		this.loc_name = loc_name;
	}

	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getLoc_num() {
		return loc_num;
	}
	public void setLoc_num(int loc_num) {
		this.loc_num = loc_num;
	}
	public String getLoc_name() {
		return loc_name;
	}
	public void setLoc_name(String loc_name) {
		this.loc_name = loc_name;
	}

	@Override
	public String toString() {
		return "OuterJoinLocationDTO [member_number=" + mem_num + ", location_number=" + loc_num
				+ ", location_name=" + loc_name + "]";
	}

		
	
}
