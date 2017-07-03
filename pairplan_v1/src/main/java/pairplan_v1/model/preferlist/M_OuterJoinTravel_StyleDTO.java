package pairplan_v1.model.preferlist;

public class M_OuterJoinTravel_StyleDTO {
	private int mem_num;
	private int style_num;
	private String style_name;
	
	public M_OuterJoinTravel_StyleDTO(){
		
	}
	public M_OuterJoinTravel_StyleDTO(int mem_num, int style_num, String style_name) {
		this.mem_num = mem_num;
		this.style_num = style_num;
		this.style_name = style_name;
	}

	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getStyle_num() {
		return style_num;
	}
	public void setStyle_num(int style_num) {
		this.style_num = style_num;
	}
	public String getStyle_name() {
		return style_name;
	}
	public void setStyle_name(String style_name) {
		this.style_name = style_name;
	}
	
}
