package database; 

import org.junit.jupiter.api.Test;

import dao.CustomerDao;
import vo.Customer;

public class DatabaseConnectionTest {
	
	CustomerDao customerDAO = new CustomerDao(); 

	@Test
	public void customerStoreTest() {
		
		Customer customer = new Customer("simon"); 
		
		customerDAO.insertCustomer(customer);
	}
}
