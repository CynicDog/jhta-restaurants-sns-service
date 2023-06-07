package database; 

import org.junit.jupiter.api.Test;

import dao.CustomerDao;
import vo.Customer;

public class DatabaseConnectionTest {
	
	CustomerDao customerDao = CustomerDao.getInstance();


	@Test
	public void customerStoreTest() {
		
		Customer customer = new Customer(""); 
		
		customerDao.insertCustomer(customer);
	}
}
