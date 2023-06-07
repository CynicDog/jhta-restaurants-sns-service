package vo;

public class StoreOpentime {
	
	private int id;
	private String category;
	private String day;
	private String openTime;
	private String closeTime;
	private Store storeId;

	public StoreOpentime() {}
	
	public StoreOpentime(int id, String category, String day, String openTime, String closeTime, Store storeId) {
		super();
		this.id = id;
		this.category = category;
		this.day = day;
		this.openTime = openTime;
		this.closeTime = closeTime;
		this.storeId = StoreDao.getStoreById(storeId);
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

	public Store getStoreId() {
		return storeId;
	}
	
	public void setStoreId(Store storeId) {
		this.storeId = storeId;
	}
	
}
