package vo;

import java.util.Date;

public class Review {

	private int id;
	private int rating;
	private String text;
	private Date createDate;
	private Date updateDate;
	private int customerId;
	private int storeId;
	
	public Review() {
		
	}
	

	public Review(int id, int rating, String text, Date createDate, Date updateDate, int customerId, int storeId) {
		super();
		this.id = id;
		this.rating = rating;
		this.text = text;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.customerId = customerId;
		this.storeId = storeId;
	}
	
	public Review(int id, int rating, String text, int customerId, int storeId) {
		super();
		this.id = id;
		this.rating = rating;
		this.text = text;
		this.customerId = customerId;
		this.storeId = storeId;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}
	
	
	
	
}
