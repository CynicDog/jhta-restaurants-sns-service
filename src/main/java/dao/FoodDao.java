package dao;

import utils.DaoHelper;
import vo.Food;

public class FoodDao {

	private static FoodDao instance = new FoodDao();
	private FoodDao() {}
	
	public static FoodDao getInstance() {
		return instance;
	}
	
	public Food getFoodById(int storeId) {
		return DaoHelper.selectOne("", rs->{
			Food food = new Food(
					rs.getInt(1),
					rs.getString(2),
					rs.getInt(3),
					rs.getString(4),
					rs.getString(5),
					rs.getString(6),
					rs.getInt(7)
				);
			
			return food;
		}, storeId);
	}
	
	public void insertFood(Food food) {
		DaoHelper.update("", food.getName(),
							food.getPrice(),
							food.getCategory(),
							food.getSoldOut(),
							food.getPictureLocation(),
							food.getStore().getId());
	}
	
	public void updateFood(Food food) {
		DaoHelper.update("", food.getId(), 
							food.getName(),
							food.getPrice(),
							food.getCategory(),
							food.getSoldOut(),
							food.getPictureLocation(),
							food.getStore().getId());
	}
}
