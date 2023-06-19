package dto;

import java.util.Date;

public class ReviewPictureRecent {

	private int reviewId;
	private int pictureId;
	private int storeId;
	private Date createDate;
	private String fileLocation;
	
	public ReviewPictureRecent() {}
	
	public ReviewPictureRecent(int reviewId, int pictureId, int storeId, Date createDate, String fileLocation) {
		this.reviewId = reviewId;
		this.pictureId = pictureId;
		this.storeId = storeId;
		this.createDate = createDate;
		this.fileLocation = fileLocation;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public int getPictureId() {
		return pictureId;
	}

	public void setPictureId(int pictureId) {
		this.pictureId = pictureId;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getFileLocation() {
		return fileLocation;
	}

	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}
	
	
}
