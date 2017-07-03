package pairplan_v1.model.preferlist;

public class Travel_StyleDTO {
	private int style_num;
	private String style_name;
	
	public Travel_StyleDTO(){
		
	}
	public Travel_StyleDTO(int style_num, String style_name) {
		this.style_num = style_num;
		this.style_name = style_name;
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

	@Override
	public String toString() {
		return "Travel_StyleDTO [style_number=" + style_num + ", style_name=" + style_name + "]";
	}
	
	
	
}
