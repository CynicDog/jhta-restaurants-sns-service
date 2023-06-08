package dao;

import java.util.Date;

import utils.DaoHelper;
import vo.Owner;

public class OwnerDao {

	public static Owner getOwnerById(int ownerId) {
		return DaoHelper.selectOne("OwnerDao.getOwnerById", rs->{
			Owner owner = new Owner();
			
			owner.setId(rs.getInt(1));
			owner.setOwnerId(rs.getString(2));
			owner.setPassword(rs.getString(3));
			owner.setName(rs.getString(4));
			owner.setEmail(rs.getString(5));
			owner.setPhone(rs.getString(6));
			owner.setBirthday(rs.getDate(7));
			owner.setGender(rs.getString(8));
			owner.setGrade(rs.getString(9));
			owner.setSubscription(rs.getString(10));
			owner.setCreateDate(rs.getDate(11));
			owner.setUpdateDate(rs.getDate(12));
			

			return owner; 
		}, ownerId);
	}
	
	public static void insertOwner(Owner owner) {
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
	
	public static void updateOwner(Owner owner) {
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
