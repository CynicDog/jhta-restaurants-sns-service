package dao;

import java.util.List;

import utils.DaoHelper;
import vo.Store;
import vo.StorePicture;

public class StorePictureDao {

	StoreDao storeDao = StoreDao.getInstance();
	
	private static StorePictureDao instance = new StorePictureDao();
	private StorePictureDao() {}
	public static StorePictureDao getInstance() {
		return instance;
	}
	
	public StorePicture getStorePictureById(int id) {
		return DaoHelper.selectOne("StorePictureDao.getStorePictureById", rs -> {
			StorePicture storePicture = new StorePicture();
			
			storePicture.setId(rs.getInt(1));
			storePicture.setFileLocation(rs.getString(2));
			
			Store store = storeDao.getStoreById(rs.getInt(3)); 
			storePicture.setStore(store);
			
			return storePicture;
		}, id);
	}
	
	public List<StorePicture> getAllStorePictures(){
		return DaoHelper.selectList("StorePictureDao.getAllStorePictures", rs->{
			StorePicture storePicture = new StorePicture();
			
			storePicture.setId(rs.getInt(1));
			storePicture.setFileLocation(rs.getString(2));
			
			Store store = storeDao.getStoreById(rs.getInt(3)); 
			storePicture.setStore(store);
			
			return storePicture;
		});
	}
	
	public void insertStorePicture(StorePicture storePicture) {
		DaoHelper.update("StorePictureDao.insertStorePicture",
				storePicture.getFileLocation(),
				storePicture.getStore().getId());
	}
	
	public void updateStorePicture(StorePicture storePicture) {
		DaoHelper.update("StorePictureDao.updateStorePicture",
			storePicture.getFileLocation(),
			storePicture.getStore().getId(),
			storePicture.getId());
	}
	
	public void deleteStorePicture(int id) {
		DaoHelper.update("StorePictureDao.deleteStorePictureById", id);
	}
}
