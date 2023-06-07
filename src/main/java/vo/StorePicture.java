package vo;

public class StorePicture {
	
	private int id;
	private String file_location; 
	private Store store;
	
	public StorePicture() {
	}

	public StorePicture(int id, String file_location, int storeId) {
		this.id = id;
		this.file_location = file_location;
		this.store = StoreDao.getStoreById(storeId); 
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
	public Store getStore() {
		return store;
	}
	public void setStore(Store store) {
		this.store = store;
	} 
	
	
}
