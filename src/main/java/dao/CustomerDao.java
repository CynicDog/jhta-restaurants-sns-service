package dao;

import utils.DaoHelper;
import vo.Customer;

public class CustomerDao {

	private static CustomerDao instance = new CustomerDao();
	private CustomerDao() {}
	public static CustomerDao getInstance() {
		return instance;
	}
	
	
	public void insertCustomer(Customer customer) {
		
		DaoHelper.update("CustomerDao.insertCustomer", 
					customer.getName()
				);
	}
	public Customer getCustomerById(int customerId) {
		return null;
	} 
	
}
