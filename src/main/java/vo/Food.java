package vo;

public class Food {
	private int id;
	private String name;
	private int price;
	private String category;
	private String soldout;
	private String pictureLocation;
	private Store store;
	
	public Food() {}
	
	public Food(int id, String name, int price, String category, String soldout, String pictureLocation, int storeId) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.category = category;
		this.soldout = soldout;
		this.pictureLocation = pictureLocation;
		this.store = StoreDao.getStoreById(storeId);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSoldout() {
		return soldout;
	}

	public void setSoldout(String soldout) {
		this.soldout = soldout;
	}

	public String getPictureLocation() {
		return pictureLocation;
	}

	public void setPictureLocation(String pictureLocation) {
		this.pictureLocation = pictureLocation;
	}

	public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}
	
	
}
