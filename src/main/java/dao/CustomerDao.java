package dao;

import java.util.Date;

import utils.DaoHelper;
import vo.Customer;
import vo.Owner;

public class CustomerDao {
	
	public static void insertCustomer(Customer customer) {
		
		DaoHelper.update("CustomerDao.insertCustomer",
					customer.getUserId(),
					customer.getPassword(),
					customer.getName(),
					customer.getEmail(),
					customer.getPhone(),
					customer.getBirthday(),
					customer.getGender(),
					customer.getGrade()
				);
	}
	
	public static void updateCustomer(Customer customer) {
		DaoHelper.update("CustomerDao.updateCustomer",
					customer.getUserId(),
					customer.getPassword(),
					customer.getName(),
					customer.getEmail(),
					customer.getPhone(),
					customer.getGrade(), 
					customer.getUpdateDate() 
				);
	}
	
	public static Customer getCustomerById(int customerId) {
		return DaoHelper.selectOne("CustomerDao.getCustomerById", rs->{
			Customer customer = new Customer(
					rs.getInt(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getString(5),
					rs.getString(6),
					rs.getDate(7),
					rs.getString(8),
					rs.getString(9),
					rs.getDate(10),
					rs.getDate(11));

			return customer; 
			
		}, customerId);
	}
}
