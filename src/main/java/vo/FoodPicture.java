package vo;

public class FoodPicture {
	
	private int id; 
	private String file_location; 
	private Food food;
	
	public FoodPicture() {
	}

	// for fetching 
	public FoodPicture(int id, String file_location, int foodId) {
		this.id = id;
		this.file_location = file_location;
		this.food = FoodDao.getFoodById(foodId); 
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFile_location() {
		return file_location;
	}
	public void setFile_location(String file_location) {
		this.file_location = file_location;
	}
	public Food getFood() {
		return food;
	}
	public void setFood(Food food) {
		this.food = food;
	}
}
