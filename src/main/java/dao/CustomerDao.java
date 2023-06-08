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
			Customer customer = new Customer();
			
			customer.setId(rs.getInt("id"));
			customer.setUserId(rs.getString("user_id"));
			customer.setPassword(rs.getString("user_password"));
			customer.setName(rs.getString("user_name"));
			customer.setEmail(rs.getString("user_email"));
			customer.setPhone(rs.getString("user_phone"));
			customer.setBirthday(rs.getDate("user_birthday"));
			customer.setGender(rs.getString("user_gender"));
			customer.setGrade(rs.getString("user_grade"));
			customer.setCreateDate(rs.getDate("user_create_date"));
			customer.setUpdateDate(rs.getDate("user_update_date"));
			
			return customer; 
			
		}, customerId);
	}
}
