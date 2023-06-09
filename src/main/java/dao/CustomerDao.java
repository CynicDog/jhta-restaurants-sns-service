package dao;

import java.util.Date;

import utils.DaoHelper;
import vo.Customer;
import vo.Owner;

public class CustomerDao {
	
	private static CustomerDao instance = new CustomerDao();
	
	private CustomerDao() {}
	
	public static CustomerDao getInstance() {
		return instance;
	}
	
	public Customer getCustomerByName(String name) {
		return DaoHelper.selectOne("CustomerDao.getCustomerByName", rs->{
			Customer customer = new Customer();
			
			customer.setId(rs.getInt(1));
			customer.setUserId(rs.getString(2));
			customer.setPassword(rs.getString(3));
			customer.setName(rs.getString(4));
			customer.setEmail(rs.getString(5));
			customer.setPhone(rs.getString(6));
			customer.setBirthday(rs.getDate(7));
			customer.setGender(rs.getString(8));
			customer.setGrade(rs.getString(9));
			customer.setCreateDate(rs.getDate(10));
			customer.setUpdateDate(rs.getDate(11));
			
			return customer; 
			
		}, name);
	}
	
	public Customer getCustomerById(int id) {
		return DaoHelper.selectOne("CustomerDao.getCustomerById", rs->{
			Customer customer = new Customer();
			
			customer.setId(rs.getInt(1));
			customer.setUserId(rs.getString(2));
			customer.setPassword(rs.getString(3));
			customer.setName(rs.getString(4));
			customer.setEmail(rs.getString(5));
			customer.setPhone(rs.getString(6));
			customer.setBirthday(rs.getDate(7));
			customer.setGender(rs.getString(8));
			customer.setGrade(rs.getString(9));
			customer.setCreateDate(rs.getDate(10));
			customer.setUpdateDate(rs.getDate(11));
			
			return customer; 
			
		}, id);
	}
	
	public void insertCustomer(Customer customer) {
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
	
	public void updateCustomer(Customer customer) {
		DaoHelper.update("CustomerDao.updateCustomer",
					
					customer.getUserId(),
					customer.getPassword(),
					customer.getName(),
					customer.getEmail(),
					customer.getPhone(),
					customer.getGender(), 
					customer.getGrade(), 
					customer.getUpdateDate(), 
					customer.getId()
				);
	}
	
	public void deleteCustomerById(int id) {
		DaoHelper.update("CustomerDao.deleteCustomerById", id); 
	} 
	
	public void deleteCustomerByName(String name) {
		DaoHelper.update("CustomerDao.deleteCustomerByName", name);
	} 
	

}
