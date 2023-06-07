package dao;

import utils.DaoHelper;
import vo.Review;

public class ReviewDao {
	
	private static ReviewDao instance = new ReviewDao();
	
	private ReviewDao() {}
	
	public static ReviewDao getInstance() {
		return instance;
	}

	public Review getReviewById(int id) {
		return DaoHelper.selectOne("ReviewDao.getReviewById", rs -> {
			Review review = new Review(
					rs.getInt(1),
					rs.getInt(2),
					rs.getString(3),
					rs.getDate(4),
					rs.getDate(5),
					rs.getInt(6),
					rs.getInt(7));
			
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
				review.getStore().getId());
	}
	
}
