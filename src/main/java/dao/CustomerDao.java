package dao;

import utils.DaoHelper;
import vo.Customer;
import vo.Owner;

public class CustomerDao {

	private static CustomerDao instance = new CustomerDao();
	private CustomerDao() {}
	public static CustomerDao getInstance() {
		return instance;
	}
	
	
	public void insertCustomer(Customer customer) {
		
		DaoHelper.update("CustomerDao.insertCustomer", 
					customer.getName(),
					customer.getUserId(),
					customer.getPassword(),
					customer.getEmail(),
					customer.getPhone(),
					customer.getBirthday(),
					customer.getGender(),
				);
	}
	public Customer getCustomerById(int customerId) {
		return null;
	} 
	
	public void updateCustomer(Customer customer) {
		DaoHelper.update("customerDao.updateCustomer",
					customer.getUserId(),
					customer.getPassword(),
					customer.getEmail(),
					customer.getPhone(),
					customer.getGrade(),
				);
	}
	
	public Customer getCustomerById(int customerId) {
		return DaoHelper.selectOne("OwnerDao.getCustomerById", rs->{
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
