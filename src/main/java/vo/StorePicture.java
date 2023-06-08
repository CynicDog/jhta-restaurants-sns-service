package vo;

import dao.StoreDao;

public class StorePicture {

	private int id;
	private String fileLocation; 
	private Store store;
	
	// for fetching 
	public StorePicture(int id, String fileLocation, int storeId) {
		
		this.id = id;
		this.fileLocation = fileLocation;
		this.store = StoreDao.getStoreById(storeId); 
	}
	
	// for storing  
	public StorePicture(String fileLocation, int storeId) {
	
		this.fileLocation = fileLocation;
		this.store = StoreDao.getStoreById(storeId);
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
	public Store getStore() {
		return store;
	}
	public void setStore(Store store) {
		this.store = store;
	} 	
}
