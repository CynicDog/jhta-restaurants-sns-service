package dao;

import utils.DaoHelper;
import vo.Owner;
import vo.Store;

public class StoreDao {

	private static StoreDao instance = new StoreDao();
	
	private StoreDao() {}
	
	public static StoreDao getInstance() {
		return instance;
	}
	
	public Store getStoreById(int storeId) { 
		return DaoHelper.selectOne("StoreDao.getStoreById", rs->{
			Store store = new Store(
					rs.getInt(1), 
					rs.getInt(2),
					rs.getString(3),
					rs.getInt(4),
					rs.getFloat(5),
					rs.getFloat(6),
					rs.getString(7),
					rs.getString(8),
					rs.getInt(9));

			return store; 
		}, storeId);
	}
	
	public void insertStore(Store store){
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
	
}
