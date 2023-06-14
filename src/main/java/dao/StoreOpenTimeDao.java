package dao;

import java.util.List;

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
			storeOpenTime.setOperationTime(rs.getString(2));
			Store store = storeDao.getStoreById(rs.getInt(3));
			storeOpenTime.setStore(store);

			return storeOpenTime;
		}, id);
	}
	
	public StoreOpentime getStoreOpenTimeByName(String name) {
		return DaoHelper.selectOne("StoreOpenTimeDao.getStoreOpenTimeByName", rs -> {
			StoreOpentime storeOpenTime = new StoreOpentime();

			storeOpenTime.setId(rs.getInt(1));
			storeOpenTime.setOperationTime(rs.getString(2));
			Store store = storeDao.getStoreById(rs.getInt(3));
			storeOpenTime.setStore(store);

			return storeOpenTime;
		}, name);
	}

	public void insertStoreOpenTime(StoreOpentime storeOpentime) {
		DaoHelper.update("StoreOpenTimeDao.insertStoreOpenTime",
				storeOpentime.getOperationTime(), 
				storeOpentime.getStore().getId());
	}

	public void updateStoreOpenTime(StoreOpentime storeOpentime) {
		DaoHelper.update("StoreOpenTimeDao.updateStoreOpenTime", 
				storeOpentime.getOperationTime(), 
				storeOpentime.getId());
	}
	
	public void deleteStoreOpenTime(int id) {
		DaoHelper.update("StoreOpenTimeDao.deleteStoreOpenTimeById", id);
	}
	
	public List<StoreOpentime> getStoreOpenTimeByStoreId() {
		return DaoHelper.selectList("StoreOpenTimeDao.getStoreOpenTimeByStoreId", rs -> {
			StoreOpentime storeOpenTime = new StoreOpentime();

			storeOpenTime.setId(rs.getInt(1));
			storeOpenTime.setOperationTime(rs.getString(2));
			Store store = storeDao.getStoreById(rs.getInt(3));
			storeOpenTime.setStore(store);

			return storeOpenTime;
		});
	}
	
	public List<StoreOpentime> getStoreOpentimeByStoreId() {
		return DaoHelper.selectList("StoreOpenTimeDao.getStoreOpentimeByStoreId", rs -> {
			StoreOpentime storeOpenTime = new StoreOpentime();

			storeOpenTime.setId(rs.getInt(1));
			storeOpenTime.setOperationTime(rs.getString(2));
			Store store = storeDao.getStoreById(rs.getInt(3));
			storeOpenTime.setStore(store);

			return storeOpenTime;
		});
	}
}
