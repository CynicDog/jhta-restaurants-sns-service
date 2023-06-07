package database; 

import java.util.Date;

import org.junit.jupiter.api.Test;

import dao.CustomerDao;
import vo.Customer;

public class DatabaseConnectionTest {
	
	CustomerDao customerDao = CustomerDao.getInstance();


	@Test
	public void customerStoreTest() {
		
		Customer customer = new Customer(
				"userId_test", 
				"password_test", 
				"name_test", 
				"email_test", 
				"phone_test", 
				new Date(), 
				"gender_test", 
				"grade_test"); 
		
		customerDao.insertCustomer(customer); 
	}
}
