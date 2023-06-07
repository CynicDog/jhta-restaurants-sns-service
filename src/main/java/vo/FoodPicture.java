package vo;

public class FoodPicture {

	private int id; 
	private String fileLocation; 
	private Food food;
	
	// for fetching 
	public FoodPicture(int id, String fileLocation, int foodId) {
	
		this.id = id;
		this.fileLocation = fileLocation;
		this.food = FoodDao.getInstance().getFoodById(foodId); 
	}
	
	// for storing 
	public FoodPicture(String fileLocation, int foodId) {
		
		this.fileLocation = fileLocation;
		this.food = FoodDao.getInstance().getFoodById(foodId);
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFileLocation() {
		return fileLocation;
	}
	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}
	public Food getFood() {
		return food;
	}
	public void setFood(Food food) {
		this.food = food;
	} 
}



