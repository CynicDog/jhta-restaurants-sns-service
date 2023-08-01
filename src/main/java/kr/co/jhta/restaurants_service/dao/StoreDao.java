package kr.co.jhta.restaurants_service.dao;

import java.util.List;
import java.util.Map;

import kr.co.jhta.restaurants_service.vo.Store;

public interface StoreDao {

	void insertStore(Store store);
	
	List<Store> getStores(Map<String,Object>param);
	
	Store getStoreByNo();
	
	void updateStore(Store store);
	
	List<Store> getAllStores();
	
	int getTotalRows(Map<String,Object> param);
	
}
