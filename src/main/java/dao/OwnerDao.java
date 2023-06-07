package dao;

import java.util.Date;

import utils.DaoHelper;
import vo.Owner;

public class OwnerDao {

	public static Owner getOwnerById(int ownerId) {
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
	
}
