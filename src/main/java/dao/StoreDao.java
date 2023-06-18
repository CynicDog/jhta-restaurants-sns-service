package dao;

import java.util.List;

import dto.StoreByRating;
import dto.StoreHome;
import utils.DaoHelper;
import vo.Owner;
import vo.Store;

public class StoreDao {
	
	OwnerDao ownerDao = OwnerDao.getInstance();
	StoreDao storeDao = StoreDao.getInstance();
	
	private static StoreDao instance = new StoreDao();
	private StoreDao() {}
	public static StoreDao getInstance() {
		return instance;
	}
	
	public List<Store> getStoresByOwnerId(int ownerId) {
		return DaoHelper.selectList("StoreDao.getStoresByOwnerId", rs -> {
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
			store.setDayOffs(rs.getString(10));
			Owner owner = ownerDao.getOwnerById(rs.getInt(11)); 		
			store.setOwner(owner); 
					
			return store;
			
		}, ownerId);
	}
	
	public List<StoreByRating> getStoresPaginated(int start, int end) { 
		return DaoHelper.selectList("StoreDao.getStoresPaginated", rs -> {
			StoreByRating storeByRating = new StoreByRating(
						rs.getInt(1), 
						rs.getDouble(2),
						rs.getString(3),
						rs.getInt(4)
					);
			return storeByRating;
			
		}, start, end); 
	}
	

	public List<StoreByRating> getStoresPaginatedByCategory(int start, int end, String category) { 
		
		if(category==null) {
			return getStoresPaginated(start, end);
		}else {
		
			return DaoHelper.selectList("StoreDao.getStoresPaginatedByCategory", rs -> {
				StoreByRating storeByRating = new StoreByRating(
						rs.getInt(1), 
						rs.getDouble(2),
						rs.getString(3),
						rs.getInt(4)
						);
				return storeByRating;
				
			},category,start, end); 
		
		}
	}

	public List<StoreHome> getStoresHomePaginated(int start, int end){
		return DaoHelper.selectList("StoreDao.getStoresHomePaginated", rs -> {
			StoreHome storeHome = new StoreHome(
						rs.getInt(1),
						rs.getInt(2),
						rs.getString(3)
					);
			return storeHome;
		}, start, end);

	}
	
	public int getTotalRows() {
		return DaoHelper.selectOne("StoreDao.getTotalRows", 
				rs -> rs.getInt(1));
	};
	
	public int getTotalRowsByFoodCategory(String category) {
		if (category==null) {
			return getTotalRows();
		}else {
		return DaoHelper.selectOne("StoreDao.getTotalRowsByFoodCategory", 
				rs -> {
					int rows = rs.getInt(1);
					return rows;
					},category);
		}
	};
	
	
	
	public Store getStoreByBusinessLicenseNumber(int businessLicenseNumber) {
		return DaoHelper.selectOne("StoreDao.getStoreByBusinessLicenseNumber", rs -> {
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
			store.setDayOffs(rs.getString(10));
			Owner owner = ownerDao.getOwnerById(rs.getInt(11)); 		
			store.setOwner(owner); 
					
			return store;
			
		}, businessLicenseNumber);
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
			store.setDayOffs(rs.getString(10));
			Owner owner = ownerDao.getOwnerById(rs.getInt(11)); 		
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
			store.setDayOffs(rs.getString(10));
			Owner owner = ownerDao.getOwnerById(rs.getInt(11)); 	
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
				store.getDayOffs(),
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
				store.getDayOffs(),
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
		return DaoHelper.selectList("StoreDao.getAllStores", rs -> {
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
			store.setDayOffs(rs.getString(10));
			Owner owner = ownerDao.getOwnerById(rs.getInt(11)); 		
			store.setOwner(owner); 
					
			return store;
			
		});
	}
	
	public  List<Store> getStoresByFoodCategory(String category) {
		
		return DaoHelper.selectList("StoreDao.getStoresByFoodCategory", rs -> {
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
			store.setDayOffs(rs.getString(10));
			Owner owner = ownerDao.getOwnerById(rs.getInt(11)); 		
			store.setOwner(owner); 
			
			return store;
			
		}, category);
	}
	
// 키워드로 검색용 Dao 	
//	public List<StoreByRating> getStoresByKeyword(int begin, int end, String keyword) {
//		String sql = "select * ";
//		sql += "      from ( ";
//		sql += "            select A.*, row_number() over (order by A.id) row_number ";
//		sql += "            from stores A ";
//		sql += "        where store_name like '%' || ? || '%' ";
//		sql +=       ") ";
//		sql +=       "where row_number between ? and ? ";
//		
//		return DaoHelper.selectList(sql, rs -> {
//			StoreByRating storeByRating = new StoreByRating(
//					rs.getInt(1), 
//					rs.getDouble(2),
//					rs.getString(3),
//					rs.getInt(4)
//					);
//			return storeByRating;
//		}, keyword, begin, end);
//	}
	
	
	
	
}
