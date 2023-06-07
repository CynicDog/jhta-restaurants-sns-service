package dao;

import utils.DaoHelper;
import vo.Admin;

public class AdminDao {

	private static AdminDao instance = new AdminDao();
	private AdminDao() {}
	
	public static AdminDao getInstance() {
		return instance;
	}
	
	public Admin getAdminById(int adminId) {
		return DaoHelper.selectOne("AdminDao.getAdminById", rs -> {
			Admin admin = new Admin(
					rs.getInt(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getString(5),
					rs.getString(6),
					rs.getDate(7),
					rs.getString(8),
					rs.getDate(9),
					rs.getDate(10));
			
			return admin;		
		}, adminId);
	}
}
