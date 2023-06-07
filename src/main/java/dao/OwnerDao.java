package dao;

import java.util.Date;

import utils.DaoHelper;
import vo.Owner;

public class OwnerDao {

	private static OwnerDao instance = new OwnerDao();
	private OwnerDao() {}
	public static OwnerDao getInstance() {
		return instance;
	}
	
	public Owner getOwnerById(int ownerId) {
		return DaoHelper.selectOne("OwnerDao.getOwnerById", rs->{
			Owner owner = new Owner(
					rs.getInt(1), 
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getString(5),
					rs.getString(6),
					rs.getDate(7),
					rs.getString(8),
					rs.getString(9),
					rs.getString(10),
					rs.getDate(11),
					rs.getDate(12));

			return owner; 
		}, ownerId);
	}
	
	public void insertOwner(Owner owner) {
		DaoHelper.update("OwnerDao.insertOwner", 
				owner.getOwnerId(),
				owner.getPassword(),
				owner.getName(),
				owner.getEmail(),
				owner.getPhone(),
				owner.getBirthday(),
				owner.getGender(),
				owner.getGrade(),
				owner.getSubscription());
	}
	
	public void updateOwner(Owner owner) {
		DaoHelper.update("OwnerDao.updateOwner",
				owner.getOwnerId(),
				owner.getPassword(),
				owner.getName(),
				owner.getEmail(),
				owner.getPhone(),
				owner.getBirthday(),
				owner.getGender(),
				owner.getGrade(),
				owner.getSubscription());
	}
	
}
