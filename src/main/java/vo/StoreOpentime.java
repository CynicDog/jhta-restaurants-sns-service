package vo;

import dao.StoreDao;

public class StoreOpentime {
	
	private int id;
	private String operationTime;
	private Store store;

	public StoreOpentime() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOperationTime() {
		return operationTime;
	}

	public void setOperationTime(String operationTime) {
		this.operationTime = operationTime;
	}

	public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}	
}
