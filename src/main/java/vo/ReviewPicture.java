package vo;

public class ReviewPicture {

	private int id; 
	private String file_location; 
	private Review review;
	
	public ReviewPicture() {
	}
	
	// for fetching 
	public ReviewPicture(int id, String file_location, int reviewId) {
		super();
		this.id = id;
		this.file_location = file_location;
		this.review = ReviewDao.getReviewById(reviewId); 
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
	public Review getReview() {
		return review;
	}
	public void setReview(Review review) {
		this.review = review;
	}	
}
