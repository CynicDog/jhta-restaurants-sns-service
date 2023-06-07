package vo;

import java.util.Date;


public class Review {

	private int id;
	private int rating;
	private String text;
	private Date createDate;
	private Date updateDate;
	private Customer customer;
	private Store store;
	
	public Review() {
		
	}

	public Review(int id, int rating, String text, Date createDate, Date updateDate, int customerId, int StoreId) {
		this.id = id;
		this.rating = rating;
		this.text = text;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.customer = CustomerDao.getCustomerById(customerId);
		this.store = StoreDao.getStoreById(StoreId);
	}

	
	public Review(int id, int rating, String text, int customerId, int StoreId) {
		super();
		this.id = id;
		this.rating = rating;
		this.text = text;
		this.customer = CustomerDao.getCustomerById(customerId);
		this.store = StoreDao.getStoreById(StoreId);;
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

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}
	
	
	
	
	
	
	
}
