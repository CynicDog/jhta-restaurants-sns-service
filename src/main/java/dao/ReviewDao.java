package dao;

import utils.DaoHelper;
import vo.Customer;
import vo.Review;
import vo.Store;

public class ReviewDao {

	public static Review getReviewById(int id) {
		return DaoHelper.selectOne("ReviewDao.getReviewById", rs -> {
			
			Review review = new Review();
			
			review.setId(rs.getInt(1)); 
			review.setRating(rs.getInt(2));
			review.setText(rs.getString(3)); 
			review.setCreateDate(rs.getDate(4)); 
			review.setUpdateDate(rs.getDate(5)); 
			
			Customer customer = CustomerDao.getCustomerById(rs.getInt(6));
			review.setCustomer(customer); 
			
			Store store = StoreDao.getStoreById(rs.getInt(7)); 
			review.setStore(store);
			
			return review;
			
		}, id);
	}
	
	public static void insertReview(Review review) {
		DaoHelper.update("reviewDao.insertReview",
							review.getRating(),
							review.getText(),
							review.getCustomer().getId(),
							review.getStore().getId());
	}
	
	public static void updateReview(Review review) {
		DaoHelper.update("reviewDao.updateReview",
				review.getRating(),
				review.getText(),
				review.getUpdateDate(),
				review.getCustomer().getId(),
				review.getStore().getId());
	}
	
}
