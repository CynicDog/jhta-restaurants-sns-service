package dao;

import utils.DaoHelper;
import vo.Store;
import vo.StoreOpentime;

public class StoreOpenTimeDao {
	
	public static StoreOpentime getStoreOpenTimeById(int id) {
		return DaoHelper.selectOne("StoreOpenTimeDao.getStoreOpenTimeById", rs->{
			StoreOpentime storeOpenTime = new StoreOpentime(); 
			
			storeOpenTime.setId(rs.getInt(1)); 
			storeOpenTime.setCategory(rs.getString(2)); 
			storeOpenTime.setDay(rs.getString(3)); 
			storeOpenTime.setOpenTime(rs.getString(4)); 
			storeOpenTime.setCloseTime(rs.getString(5)); 
			
			Store store = StoreDao.getStoreById(rs.getInt(6)); 
			storeOpenTime.setStore(store); 
			
				return storeOpenTime;
			}, id);
	}
	
	public static void insertStoreOpenTime(StoreOpentime storeOpentime) {
		DaoHelper.update("StoreOpenTimeDao.insertStoreOpenTime", 
							storeOpentime.getCategory(),
							storeOpentime.getDay(),
							storeOpentime.getOpenTime(),
							storeOpentime.getCloseTime(),
							storeOpentime.getStore().getId());
	}
	
	public static void updateStoreOpenTime(StoreOpentime storeOpentime) {
		DaoHelper.update("StoreOpenTimeDao.updateStoreOpenTime", storeOpentime.getId(),
							storeOpentime.getCategory(),
							storeOpentime.getDay(),
							storeOpentime.getOpenTime(),
							storeOpentime.getCloseTime(),
							storeOpentime.getStore().getId());
	}
}
