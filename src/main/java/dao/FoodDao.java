package dao;

import utils.DaoHelper;
import vo.Food;

public class FoodDao {
	
	public static Food getFoodById(int storeId) {
		return DaoHelper.selectOne("FoodDao.getFoodById", rs->{
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
	
	public static void insertFood(Food food) {
		DaoHelper.update("FoodDao.insertFood", 
				food.getName(),
				food.getPrice(),
				food.getCategory(),
				food.getSoldOut(),
				food.getPictureLocation(),
				food.getStore().getId());
	}
	
	public static void updateFood(Food food) {
		DaoHelper.update("FoodDao.updateFood", 
				food.getName(),
				food.getPrice(),
				food.getCategory(),
				food.getSoldOut(),
				food.getPictureLocation(),
				food.getStore().getId());
	}
}
