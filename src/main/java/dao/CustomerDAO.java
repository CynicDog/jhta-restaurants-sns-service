package dao;

import utils.DaoHelper;
import vo.Customer;

public class CustomerDAO {

	public void insertCustomer(Customer customer) {
		
		DaoHelper.update("CustomerDAO.insertCustomer", 
					customer.getName()
				);
	} 
	
}
