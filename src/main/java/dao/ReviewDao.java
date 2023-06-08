package dao;

import utils.DaoHelper;
import vo.Customer;
import vo.Review;
import vo.Store;

public class ReviewDao {
	
	CustomerDao customerDao = CustomerDao.getInstance();
	StoreDao storeDao = StoreDao.getInstance();

	private static ReviewDao instance = new ReviewDao();
	private ReviewDao() {}
	public static ReviewDao getInstance() {
		return instance;
	}
	
	public Review getReviewByText(String text) {
		return DaoHelper.selectOne("ReviewDao.getReviewByText", rs -> {
			
			Review review = new Review();
			
			review.setId(rs.getInt(1)); 
			review.setRating(rs.getInt(2));
			review.setText(rs.getString(3)); 
			review.setCreateDate(rs.getDate(4)); 
			review.setUpdateDate(rs.getDate(5)); 
			
			Customer customer = customerDao.getCustomerById(rs.getInt(6));
			review.setCustomer(customer); 
			
			Store store = storeDao.getStoreById(rs.getInt(7)); 
			review.setStore(store);
			
			return review;
			
		}, text);
	}
	
	public Review getReviewById(int id) {
		return DaoHelper.selectOne("ReviewDao.getReviewById", rs -> {
			
			Review review = new Review();
			
			review.setId(rs.getInt(1)); 
			review.setRating(rs.getInt(2));
			review.setText(rs.getString(3)); 
			review.setCreateDate(rs.getDate(4)); 
			review.setUpdateDate(rs.getDate(5)); 
			
			Customer customer = customerDao.getCustomerById(rs.getInt(6));
			review.setCustomer(customer); 
			
			Store store = storeDao.getStoreById(rs.getInt(7)); 
			review.setStore(store);
			
			return review;
			
		}, id);
	}
	
	public void insertReview(Review review) {
		DaoHelper.update("reviewDao.insertReview",
							review.getRating(),
							review.getText(),
							review.getCustomer().getId(),
							review.getStore().getId());
	}
	
	public void updateReview(Review review) {
		DaoHelper.update("reviewDao.updateReview",
				review.getRating(),
				review.getText(),
				review.getUpdateDate(),
				review.getCustomer().getId(),
				review.getStore().getId(),
				review.getId());
	}
	
	public void deleteReviewById(int id) {
		DaoHelper.update("ReviewDao.deleteReviewById", id);
	}
	
}
