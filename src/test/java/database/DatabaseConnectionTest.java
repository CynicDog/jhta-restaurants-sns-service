package database; 

import org.junit.jupiter.api.Test;

import dao.CustomerDAO;
import vo.Customer;

public class DatabaseConnectionTest {
	
	CustomerDAO customerDAO = new CustomerDAO(); 

	@Test
	public void customerStoreTest() {
		
		Customer customer = new Customer("simon"); 
		
		customerDAO.insertCustomer(customer);
	}
}
