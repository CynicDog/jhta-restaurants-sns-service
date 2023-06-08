package dao;

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

	public Store getStoreById(int id) { 
		return DaoHelper.selectOne("StoreDao.getStoreById", rs -> {
			Store store = new Store(); 
			
			store.setId(rs.getInt(1)); 
			store.setBusinessLicenseNumber(rs.getInt(2));  
			store.setAddress(rs.getString(3)); 
			store.setZipcode(rs.getInt(4)); 
			store.setLatitude(rs.getFloat(5)); 
			store.setLongitude(rs.getFloat(6)); 
			store.setText(rs.getString(7)); 
			store.setPhone(rs.getString(8));
			Owner owner = ownerDao.getOwnerById(rs.getInt(9)); 		
			store.setOwner(owner); 
					
			return store;
			
		}, id);
	}
	
	public  void insertStore(Store store){
		DaoHelper.update("storeDao.insertStore", 
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
		DaoHelper.update("storeDao.updateStore", 
				store.getBusinessLicenseNumber(),
				store.getAddress(),
				store.getZipcode(),
				store.getLatitude(),
				store.getLongitude(),
				store.getText(),
				store.getPhone(),
				store.getOwner().getId());
	}
	
}
