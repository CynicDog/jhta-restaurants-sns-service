package dao;

import utils.DaoHelper;
import vo.StoreOpentime;

public class StoreOpenTimeDao {
	
	private static StoreOpenTimeDao instance = new StoreOpenTimeDao();
	
	private StoreOpenTimeDao() {}
	
	public static StoreOpenTimeDao getInstance() {
		return instance;
	}
	
	public StoreOpentime getStoreOpenTimeById(int storeId) {
		return DaoHelper.selectOne("StoreOpenTimeDao.getStoreOpenTimeById", rs->{
			StoreOpentime storeOpenTime = new StoreOpentime(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6));
			
				return storeOpenTime;
			}, storeId);
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
		DaoHelper.update("StoreOpenTimeDao.updateStoreOpenTime", storeOpentime.getId(),
							storeOpentime.getCategory(),
							storeOpentime.getDay(),
							storeOpentime.getOpenTime(),
							storeOpentime.getCloseTime(),
							storeOpentime.getStore().getId());
	}
}
