package dto;

public class StoreHome {
	private int rowNum;
	private int id;
	private String name;
	
	public StoreHome(){}

	public StoreHome(int rowNum, int id, String name) {
		this.rowNum = rowNum;
		this.id = id;
		this.name = name;
	}

	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
