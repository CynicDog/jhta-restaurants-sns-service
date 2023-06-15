package dao;

import java.util.List;

import utils.DaoHelper;
import vo.Review;
import vo.ReviewPicture;


public class ReviewPictureDao {

	ReviewDao reviewDao = ReviewDao.getInstance();

	private static ReviewPictureDao instance = new ReviewPictureDao();
	private ReviewPictureDao() {}
	public static ReviewPictureDao getInstance() {
		return instance;
	}
	
	public List<ReviewPicture> getReviewPictureByReviewId(int reviewId) {
		return DaoHelper.selectList("ReviewPictureDao.getReviewPictureByReviewId", rs -> {
			ReviewPicture reviewPicture = new ReviewPicture();

			reviewPicture.setId(rs.getInt(1));
			reviewPicture.setFileLocation(rs.getString(2));
			Review review = reviewDao.getReviewById(rs.getInt(3));
			reviewPicture.setReview(review);

			return reviewPicture;
		}, reviewId);
	}
	
	public ReviewPicture getReviewPictureById(int id) {
		return DaoHelper.selectOne("ReviewPictureDao.getReviewPictureById", rs -> {
			ReviewPicture reviewPicture = new ReviewPicture();

			reviewPicture.setId(rs.getInt(1));
			reviewPicture.setFileLocation(rs.getString(2));
			Review review = reviewDao.getReviewById(rs.getInt(3));
			reviewPicture.setReview(review);

			return reviewPicture;
		}, id);
	}
	
	public  void insertReviewPicture (ReviewPicture reviewPicture){
		DaoHelper.update("ReviewPictureDao.insertReviewPicture",
				reviewPicture.getFileLocation(),
				reviewPicture.getReview().getId());
	}
	
	public void updateReviewPicture (ReviewPicture reviewPicture) {
		DaoHelper.update("ReviewPictureDao.updateReviewPicture", 
				reviewPicture.getFileLocation());

	}
	
	public void deleteReviewPictureById(int id) {
		DaoHelper.update("ReviewPictureDao.deleteReviewPictureById", id);
	}
	
	
}

