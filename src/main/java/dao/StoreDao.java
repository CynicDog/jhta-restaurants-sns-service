package dao;

import java.util.List;

import utils.DaoHelper;
import vo.Owner;
import vo.Store;

public class StoreDao {
	
	OwnerDao ownerDao = OwnerDao.getInstance();
	
	private static StoreDao instance = new StoreDao();
	private StoreDao() {}
	public static StoreDao getInstance() {
		return instance;
	}
	
	public Store getStoreByName(String name) { 
		return DaoHelper.selectOne("StoreDao.getStoreByName", rs -> {
			Store store = new Store(); 
			
			store.setId(rs.getInt(1)); 
			store.setName(rs.getString(2));
			store.setBusinessLicenseNumber(rs.getInt(3));  
			store.setAddress(rs.getString(4)); 
			store.setZipcode(rs.getInt(5)); 
			store.setLatitude(rs.getFloat(6)); 
			store.setLongitude(rs.getFloat(7)); 
			store.setText(rs.getString(8)); 
			store.setPhone(rs.getString(9));
			Owner owner = ownerDao.getOwnerById(rs.getInt(10)); 		
			store.setOwner(owner); 
					
			return store;
			
		}, name);
	}

	public Store getStoreById(int id) { 
		return DaoHelper.selectOne("StoreDao.getStoreById", rs -> {
			Store store = new Store(); 
			
			store.setId(rs.getInt(1)); 
			store.setName(rs.getString(2)); 
			store.setBusinessLicenseNumber(rs.getInt(3));  
			store.setAddress(rs.getString(4)); 
			store.setZipcode(rs.getInt(5)); 
			store.setLatitude(rs.getDouble(6)); 
			store.setLongitude(rs.getDouble(7)); 
			store.setText(rs.getString(8)); 
			store.setPhone(rs.getString(9));
			Owner owner = ownerDao.getOwnerById(rs.getInt(10)); 		
			store.setOwner(owner); 
					
			return store;
			
		}, id);
	}
	
	public  void insertStore(Store store){
		DaoHelper.update("StoreDao.insertStore", 
				store.getName(), 
				store.getBusinessLicenseNumber(),
				store.getAddress(),
				store.getZipcode(),
				store.getLatitude(),
				store.getLongitude(),
				store.getText(),
				store.getPhone(),
				store.getOwner().getId());
	}
	
	public void updateStore(Store store) {
		DaoHelper.update("StoreDao.updateStore", 
				store.getName(),
				store.getBusinessLicenseNumber(),
				store.getAddress(),
				store.getZipcode(),
				store.getLatitude(),
				store.getLongitude(),
				store.getText(),
				store.getPhone(),
				store.getOwner().getId(),
				store.getId());
	}
	
	public void deleteStoreById(int id) {
		DaoHelper.update("StoreDao.deleteStoreById", id);
	}
	
	public void deleteStoreByName(String name) {
		DaoHelper.update("StoreDao.deleteStoreByName", name);
	}
	
	public  List<Store> getAllStores() {
		return DaoHelper.selectList("StoreDao.getAllStores", rs->{
			Store store = new Store();
			
			store.setId(rs.getInt(1)); 
			store.setName(rs.getString(2)); 
			store.setBusinessLicenseNumber(rs.getInt(3));  
			store.setAddress(rs.getString(4)); 
			store.setZipcode(rs.getInt(5)); 
			store.setLatitude(rs.getDouble(6)); 
			store.setLongitude(rs.getDouble(7)); 
			store.setText(rs.getString(8)); 
			store.setPhone(rs.getString(9));
			Owner owner = ownerDao.getOwnerById(rs.getInt(10)); 		
			store.setOwner(owner); 
					
			return store;
			
		});
	}
	
	public  List<Store> getStoresByFoodCategory(String category) {
		return DaoHelper.selectList("StoreDao.getStoresByFoodCategory", rs->{
			Store store = new Store();
			
			store.setId(rs.getInt(1)); 
			store.setName(rs.getString(2)); 
			store.setBusinessLicenseNumber(rs.getInt(3));  
			store.setAddress(rs.getString(4)); 
			store.setZipcode(rs.getInt(5)); 
			store.setLatitude(rs.getDouble(6)); 
			store.setLongitude(rs.getDouble(7)); 
			store.setText(rs.getString(8)); 
			store.setPhone(rs.getString(9));
			Owner owner = ownerDao.getOwnerById(rs.getInt(10)); 		
			store.setOwner(owner); 
			
			return store;
			
		}, category);
	}
	
}
