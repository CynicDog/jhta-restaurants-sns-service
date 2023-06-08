package dao;

import utils.DaoHelper;
import vo.Admin;

public class AdminDao {
	
	private static AdminDao instance = new AdminDao();
	
	private AdminDao() {}
	
	public static AdminDao getInstance() {
		return instance;
	}
	
	public Admin getAdminByName(String name) {
		return DaoHelper.selectOne("AdminDao.getAdminByName", rs -> {
			Admin admin = new Admin();
			
			admin.setId(rs.getInt(1));
			admin.setAdminId(rs.getString(2));
			admin.setPassword(rs.getString(3));
			admin.setName(rs.getString(4));
			admin.setEmail(rs.getString(5));
			admin.setPhone(rs.getString(6));
			admin.setBirthday(rs.getDate(7));
			admin.setGender(rs.getString(8));
			admin.setCreateDate(rs.getDate(9));
			admin.setUpdateDate(rs.getDate(10));
		
			return admin;
		}, name);
	} 
	
	public Admin getAdminById(int id) {
		return DaoHelper.selectOne("AdminDao.getAdminById", rs -> {
			Admin admin = new Admin();
			
			admin.setId(rs.getInt(1));
			admin.setAdminId(rs.getString(2));
			admin.setPassword(rs.getString(3));
			admin.setName(rs.getString(4));
			admin.setEmail(rs.getString(5));
			admin.setPhone(rs.getString(6));
			admin.setBirthday(rs.getDate(7));
			admin.setGender(rs.getString(8));
			admin.setCreateDate(rs.getDate(9));
			admin.setUpdateDate(rs.getDate(10));
		
			return admin;
		}, id);
	}
	
	public Admin getAdminByName(String name) {
		return DaoHelper.selectOne("AdminDao.getAdminByName", rs -> {
			Admin admin = new Admin();
			
			admin.setId(rs.getInt(1));
			admin.setAdminId(rs.getString(2));
			admin.setPassword(rs.getString(3));
			admin.setName(rs.getString(4));
			admin.setEmail(rs.getString(5));
			admin.setPhone(rs.getString(6));
			admin.setBirthday(rs.getDate(7));
			admin.setGender(rs.getString(8));
			admin.setCreateDate(rs.getDate(9));
			admin.setUpdateDate(rs.getDate(10));
		
			return admin;
		}, name);
	}
	
	public void insertAdmin(Admin admin) {
		DaoHelper.update("adminDao.insertAdmin",
				admin.getAdminId(),
				admin.getPassword(),
				admin.getName(),
				admin.getEmail(),
				admin.getPhone(),
				admin.getBirthday(),
				admin.getGender());
	}
	
	public void updateAdmin(Admin admin) {
		DaoHelper.update("adminDao.updateAdmin",
				admin.getAdminId(),
				admin.getPassword(),
				admin.getName(),
				admin.getEmail(),
				admin.getPhone(),
				admin.getBirthday(),
				admin.getGender(),
				admin.getUpdateDate(), 
				admin.getId());
	}
	
	public void deleteAdminById(int id) {
		DaoHelper.update("AdminDao.deleteAdminById", id);
	}
	
	public void deleteAdminByName(String name) {
		DaoHelper.update("AdminDao.deleteAdminByName", name);
	}
	
	public void deleteAdminById(int id) {
		DaoHelper.update("AdminDao.deleteAdminById", id);
	}
	
	public void deleteAdminByName(String name) {
		DaoHelper.update("AdminDao.deleteAdminByName", name);
	}
}
