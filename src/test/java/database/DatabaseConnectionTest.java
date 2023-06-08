package database; 

import java.util.Date;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import dao.CustomerDao;
import dao.OwnerDao;
import dao.ReviewDao;
import dao.StoreDao;
import utils.DaoHelper;
import vo.Customer;
import vo.Owner;
import vo.Review;
import vo.Store;

public class DatabaseConnectionTest {
	
	CustomerDao customerDao = CustomerDao.getInstance();
	OwnerDao ownerDao = OwnerDao.getInstance(); 
	StoreDao storeDao = StoreDao.getInstance();
	ReviewDao reviewDao = ReviewDao.getInstance();

//	@Test
//	public void customserOwnerInsertTest() {
//		
//		Customer customer = new Customer();
//		customer.setUserId("test_id");
//		customer.setPassword("test_password");
//		customer.setName("test_name");
//		customer.setEmail("test_email");
//		customer.setPhone("test_phone");
//		customer.setBirthday(new Date());
//		customer.setGender("test_gender");
//		customer.setGrade("test_grade");
//		
//		customerDao.insertCustomer(customer); 
//		
//		Owner owner = new Owner(); 
//		owner.setOwnerId("test_id");
//		owner.setPassword("test_password");
//		owner.setName("test_name");
//		owner.setEmail("test_email");
//		owner.setPhone("test_phone");
//		owner.setBirthday(new Date());
//		owner.setGender("test_gender");
//		owner.setGrade("test_grade");
//		owner.setSubscription("test_subs");
//		
//		ownerDao.insertOwner(owner);
//		
//		Customer foundCustomer = customerDao.getCustomerByName("test_name");
//		Assertions.assertEquals("test_name", foundCustomer.getName());
//		
//		Owner foundOwner = ownerDao.getOwnerByName("test_name"); 
//		Assertions.assertEquals("test_name", foundOwner.getName());
//	}
	
	@Test 
	public void storeInsertTest() {
		
		Owner owner = ownerDao.getOwnerByName("test_name"); 
		
		Store store = new Store(); 
		store.setName("test_name");
		store.setBusinessLicenseNumber(1);
		store.setAddress("test_address");
		store.setZipcode(11111);
		store.setLatitude(9.9f);
		store.setLongitude(9.9f);
		store.setText("test_text");
		store.setPhone("test_phone");
		store.setOwner(owner);
		
		storeDao.insertStore(store);
		
		Store found = storeDao.getStoreByName("test_name"); 	
		Assertions.assertEquals(11111, found.getZipcode());
	}
	
//	@Test
//	public void reviewInsertTest() {
//		
//		Customer customer = customerDao.getCustomerByName("test_name"); 
//		Store store = storeDao.getStoreByName("test_name");
//		
//		Review review = new Review(); 
//		review.setRating(5);
//		review.setText("test_text");
//		review.setCustomer(customer);
//		review.setStore(store);
//		
//		reviewDao.insertReview(review);
//		
//		Review found = reviewDao.getReviewByText("test_text"); 
//		Assertions.assertEquals(5, found.getRating());
//	}
}
