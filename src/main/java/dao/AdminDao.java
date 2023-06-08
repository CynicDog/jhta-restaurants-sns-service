package dao;

import utils.DaoHelper;
import vo.Admin;

public class AdminDao {
	
	public static Admin getAdminById(int adminId) {
		return DaoHelper.selectOne("AdminDao.getAdminById", rs -> {
			Admin admin = new Admin();
			
			admin.setId(rs.getInt("id"));
			admin.setAdminId(rs.getString("admin_id"));
			admin.setPassword(rs.getString("admin_password"));
			admin.setName(rs.getString("admin_name"));
			admin.setEmail(rs.getString("admin_email"));
			admin.setPhone(rs.getString("admin_phone"));
			admin.setBirthday(rs.getDate("admin_birtyday"));
			admin.setGender(rs.getString("admin_gender"));
			admin.setCreateDate(rs.getDate("admin_create_date"));
			admin.setUpdateDate(rs.getDate("admin_update_date"));
		
			return admin;
		});
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
