package pairplan_v1.model.plan;


public class SearchDTO {
	
	private String search_text;	//검색 시작일
	private String start_date;	//검색 시작일
	private String end_date;		//검색 종료일
	private int listBlock;		//검색 리스트블록
	
	public SearchDTO() {}

	public String getSearch_text() {
		return search_text;
	}

	public void setSearch_text(String search_text) {
		this.search_text = search_text;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public int getListBlock() {
		return listBlock;
	}

	public void setListBlock(int listBlock) {
		this.listBlock = listBlock;
	}
	
	


}
