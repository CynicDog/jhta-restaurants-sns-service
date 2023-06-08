package dao;

import utils.DaoHelper;
import vo.Store;
import vo.StoreOpentime;

public class StoreOpenTimeDao {
	
	StoreDao storeDao = StoreDao.getInstance();
	
	private static StoreOpenTimeDao instance = new StoreOpenTimeDao();
	private StoreOpenTimeDao() {}
	public static StoreOpenTimeDao getInstance() {
		return instance;
	}
	
	public StoreOpentime getStoreOpenTimeById(int id) {
		return DaoHelper.selectOne("StoreOpenTimeDao.getStoreOpenTimeById", rs -> {
			StoreOpentime storeOpenTime = new StoreOpentime();

			storeOpenTime.setId(rs.getInt(1));
			storeOpenTime.setCategory(rs.getString(2));
			storeOpenTime.setDay(rs.getString(3));
			storeOpenTime.setOpenTime(rs.getString(4));
			storeOpenTime.setCloseTime(rs.getString(5));
			Store store = storeDao.getStoreById(rs.getInt(6));
			storeOpenTime.setStore(store);

			return storeOpenTime;
		}, id);
	}
	
	public StoreOpentime getStoreOpenTimeByName(String name) {
		return DaoHelper.selectOne("StoreOpenTimeDao.getStoreOpenTimeByName", rs -> {
			StoreOpentime storeOpenTime = new StoreOpentime();

			storeOpenTime.setId(rs.getInt(1));
			storeOpenTime.setCategory(rs.getString(2));
			storeOpenTime.setDay(rs.getString(3));
			storeOpenTime.setOpenTime(rs.getString(4));
			storeOpenTime.setCloseTime(rs.getString(5));
			Store store = storeDao.getStoreById(rs.getInt(6));
			storeOpenTime.setStore(store);

			return storeOpenTime;
		}, name);
	}

	public void insertStoreOpenTime(StoreOpentime storeOpentime) {
		DaoHelper.update("StoreOpenTimeDao.insertStoreOpenTime",
				storeOpentime.getCategory(),
				storeOpentime.getDay(),
				storeOpentime.getOpenTime(), 
				storeOpentime.getCloseTime(), 
				storeOpentime.getStore().getId());
	}

	public void updateStoreOpenTime(StoreOpentime storeOpentime) {
		DaoHelper.update("StoreOpenTimeDao.updateStoreOpenTime", 
				storeOpentime.getId(), 
				storeOpentime.getCategory(),
				storeOpentime.getDay(), 
				storeOpentime.getOpenTime(), 
				storeOpentime.getCloseTime(),
				storeOpentime.getStore().getId(), 
				storeOpentime.getId());
	}
	
	public void deleteStoreOpenTime(int id) {
		DaoHelper.update("StoreOpenTimeDao.deleteStoreOpenTimeById", id);
	}
}
