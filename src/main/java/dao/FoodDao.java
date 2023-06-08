package dao;

import utils.DaoHelper;
import vo.Food;
import vo.Store;

public class FoodDao {
	
	StoreDao storeDao = StoreDao.getInstance();
	
	private static FoodDao instance = new FoodDao();
	private FoodDao() {}
	public static FoodDao getInstance() {
		return instance;
	}
	
	public Food getFoodById(int id) {
		return DaoHelper.selectOne("FoodDao.getFoodById", rs->{
			Food food = new Food();
			
			food.setId(rs.getInt(1));
			food.setName(rs.getString(2));
			food.setPrice(rs.getInt(3));
			food.setCategory(rs.getString(4));
			food.setSoldOut(rs.getString(5));
			food.setPictureLocation(rs.getString(6));
			
			Store store = storeDao.getStoreById(rs.getInt(7));
			food.setStore(store);
			
			return food;
		}, id);
	}
	
	public void insertFood(Food food) {
		DaoHelper.update("FoodDao.insertFood", 
				food.getName(),
				food.getPrice(),
				food.getCategory(),
				food.getSoldOut(),
				food.getPictureLocation(),
				food.getStore().getId());
	}
	
	public void updateFood(Food food) {
		DaoHelper.update("FoodDao.updateFood", 
				food.getName(),
				food.getPrice(),
				food.getCategory(),
				food.getSoldOut(),
				food.getPictureLocation(),
				food.getStore().getId());
	}
}
