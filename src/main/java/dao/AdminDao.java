package dao;

import utils.DaoHelper;
import vo.Admin;

public class AdminDao {
	
	public static Admin getAdminById(int adminId) {
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
	
	public static void insertAdmin(Admin admin) {
		DaoHelper.update("adminDao.insertAdmin",
								admin.getAdminId(),
								admin.getPassword(),
								admin.getName(),
								admin.getEmail(),
								admin.getPhone(),
								admin.getBirthday(),
								admin.getGender());
	}
	
	public static void updateAdmin(Admin admin) {
		DaoHelper.update("adminDao.updateAdmin",
				admin.getAdminId(),
				admin.getPassword(),
				admin.getName(),
				admin.getEmail(),
				admin.getPhone(),
				admin.getBirthday(),
				admin.getGender(),
				admin.getUpdateDate());
	}
}
