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
			Owner owner = new Owner();
			owner.setId(rs.getInt(8));
			Store store = new Store(
					rs.getInt(1), 
					rs.getInt(2),
					rs.getString(3),
					rs.getInt(4),
					rs.getFloat(5),
					rs.getFloat(6),
					rs.getString(7),
					owner
					);

			return store; 
		}, storeId);
	}
	
}
