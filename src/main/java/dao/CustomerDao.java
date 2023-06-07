package dao;

import utils.DaoHelper;
import vo.Customer;

public class CustomerDao {

	public void insertCustomer(Customer customer) {
		
		DaoHelper.update("CustomerDao.insertCustomer", 
                     
					customer.getName()
				);
	} 
	
}
