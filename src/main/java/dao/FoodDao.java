package dao;

import java.util.List;

import utils.DaoHelper;
import vo.Food;
import vo.Store;
import vo.StorePicture;

public class FoodDao {
	
	StoreDao storeDao = StoreDao.getInstance();
	
	private static FoodDao instance = new FoodDao();
	private FoodDao() {}
	public static FoodDao getInstance() {
		return instance;
	}
	
	public void deleteFoodById(int id) {
		DaoHelper.update("FoodDao.deleteFoodById", id);
	}
	
	public void deleteFoodByName(String name) {
		DaoHelper.update("FoodDao.deleteFoodByName", name);
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
			food.setText(rs.getString(7));
			
			Store store = storeDao.getStoreById(rs.getInt(8));
			food.setStore(store);
			
			return food;
		}, id);
	}
	
	public Food getFoodByName(String name) {
		return DaoHelper.selectOne("FoodDao.getFoodByName", rs->{
			Food food = new Food();
			
			food.setId(rs.getInt(1));
			food.setName(rs.getString(2));
			food.setPrice(rs.getInt(3));
			food.setCategory(rs.getString(4));
			food.setSoldOut(rs.getString(5));
			food.setPictureLocation(rs.getString(6));
			food.setText(rs.getString(7));
			
			Store store = storeDao.getStoreById(rs.getInt(8));
			food.setStore(store);
			
			return food;
		}, name);
	}
	
	public  List<Food> getFoodByCategory(String category) {
		return DaoHelper.selectList("FoodDao.getFoodByCategory", rs->{
			Food food = new Food();
			
			food.setId(rs.getInt(1));
			food.setName(rs.getString(2));
			food.setPrice(rs.getInt(3));
			food.setCategory(rs.getString(4));
			food.setSoldOut(rs.getString(5));
			food.setPictureLocation(rs.getString(6));
			food.setText(rs.getString(7));
			
			Store store = storeDao.getStoreById(rs.getInt(8));
			food.setStore(store);
			
			return food;
		}, category);
	}
	
	public void insertFood(Food food) {
		DaoHelper.update("FoodDao.insertFood", 
				food.getName(),
				food.getPrice(),
				food.getCategory(),
				food.getSoldOut(),
				food.getPictureLocation(),
				food.getText(),
				food.getStore().getId());
	}
	
	public void updateFood(Food food) {
		DaoHelper.update("FoodDao.updateFood", 
				food.getName(),
				food.getPrice(),
				food.getCategory(),
				food.getSoldOut(),
				food.getPictureLocation(),
				food.getText(), 
				food.getId());
	}
	
	public  List<Food> getFoodsByStoreId() {
		return DaoHelper.selectList("FoodDao.getFoodsByStoreId", rs->{
			Food food = new Food();
			
			food.setId(rs.getInt(1));
			food.setName(rs.getString(2));
			food.setPrice(rs.getInt(3));
			food.setCategory(rs.getString(4));
			food.setSoldOut(rs.getString(5));
			food.setPictureLocation(rs.getString(6));
			food.setText(rs.getString(7));
			
			Store store = storeDao.getStoreById(rs.getInt(8));
			food.setStore(store);
			
			return food;
		});
	}
}
