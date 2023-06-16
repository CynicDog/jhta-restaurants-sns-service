package dto;

public class FoodCategory {
	
	private int rowNum; 
	private double reviewAvg; 
	private String name; 
	private int id;
	
	// for fetching 
	public FoodCategory(int rowNum, double reviewAvg, String name, int id) {
		super();
		this.rowNum = rowNum;
		this.reviewAvg = reviewAvg;
		this.name = name;
		this.id = id;
	}
	
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public double getReviewAvg() {
		return reviewAvg;
	}
	public void setReviewAvg(double reviewAvg) {
		this.reviewAvg = reviewAvg;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	} 	
}

