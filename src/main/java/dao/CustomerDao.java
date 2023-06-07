package dao;

import utils.DaoHelper;
import vo.Customer;

public class CustomerDao {

	public static void insertCustomer(Customer customer) {
		
		DaoHelper.update("CustomerDAO.insertCustomer", 
					customer.getName()
				);
	} 
	
}
