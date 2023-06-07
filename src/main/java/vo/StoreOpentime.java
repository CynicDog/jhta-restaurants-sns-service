package vo;

public class StoreOpentime {
	
	private int id;
	private String category;
	private String day;
	private String openTime;
	private String closeTime;
	private Store store;

	public StoreOpentime() {}
	
	// for fetching 
	public StoreOpentime(int id, String category, String day, String openTime, String closeTime, int storeId) {
		
		this.id = id;
		this.category = category;
		this.day = day;
		this.openTime = openTime;
		this.closeTime = closeTime;
		this.store = StoreDao.getStoreById(storeId);
	}
	
	// for storing 
	public StoreOpentime(String category, String day, String openTime, String closeTime, int storeId) {
		
		this.category = category;
		this.day = day;
		this.openTime = openTime;
		this.closeTime = closeTime;
		this.store = StoreDao.getStoreById(storeId);
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getOpenTime() {
		return openTime;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}

	public String getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}

	public Store getStore() {
		return store;
	}
	
	public void setStore(Store store) {
		this.store = store;
	}
	
}
