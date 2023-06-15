//package dao;
//
//import oracle.security.crypto.core.RSA;
//import utils.DaoHelper;
//import vo.Food;
//import vo.FoodPicture;
//
//public class FoodPictureDao {
//	
//	FoodDao foodDao = FoodDao.getInstance();
//	
//	private static FoodPictureDao instance = new FoodPictureDao();
//	private FoodPictureDao() {}
//	public static FoodPictureDao getInstance() {
//		return instance;
//	}
//	
//	public FoodPicture getFoodPictureById(int id) {
//		
//		return DaoHelper.selectOne("FoodPictureDao.getFoodPictureById", rs->{
//			FoodPicture foodPicture = new FoodPicture();
//			
//			foodPicture.setId(rs.getInt(1));
//			foodPicture.setFileLocation(rs.getString(2));
//
//			Food food = foodDao.getFoodById(rs.getInt(3));
//			foodPicture.setFood(food);
//			
//			return foodPicture;
//		}, id);
//	}
//	
//	public void insertFoodPicture(FoodPicture foodPicture) {
//		DaoHelper.update("FoodPictureDao.insertFoodPicture",
//				foodPicture.getFileLocation(),
//				foodPicture.getFood().getId());
//	}
//	
//	public void updateFoodPicture(FoodPicture foodPicture) {
//		DaoHelper.update("FoodPictureDao.updateFoodPicture", 
//				foodPicture.getFileLocation(),
//				foodPicture.getFood().getId(),
//				foodPicture.getId());
//		
//	}
//	
//	public void deleteFoodPictureById(int id) {
//		DaoHelper.update("FoodPictureDao.deleteFoodPictureById", id);
//	}
//}
