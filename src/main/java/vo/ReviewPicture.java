package vo;

import dao.ReviewDao;

public class ReviewPicture {

	private int id; 
	private String fileLocation; 
	private Review review;
	
	public ReviewPicture() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFileLocation() {
		return fileLocation;
	}

	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	} 
}
