package database; 

import java.util.Date;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import dao.CustomerDao;
import dao.OwnerDao;
import dao.ReviewDao;
import dao.ReviewPictureDao;
import dao.StoreDao;
import dao.StorePictureDao;
import utils.DaoHelper;
import vo.Customer;
import vo.Owner;
import vo.Review;
import vo.ReviewPicture;
import vo.Store;
import vo.StorePicture;

public class DatabaseConnectionTest {
	
	CustomerDao customerDao = CustomerDao.getInstance();
	OwnerDao ownerDao = OwnerDao.getInstance(); 
	StoreDao storeDao = StoreDao.getInstance();
	ReviewDao reviewDao = ReviewDao.getInstance();
	ReviewPictureDao reviewPicturesDao = ReviewPictureDao.getInstance();
	StorePictureDao storePictureDao = StorePictureDao.getInstance();

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
	
//	@Test 
//	public void storeInsertTest() {
//		
//		Owner owner = ownerDao.getOwnerByName("test_name"); 
//		
//		Store store = new Store(); 
//		store.setName("test_name");
//		store.setBusinessLicenseNumber(1);
//		store.setAddress("test_address");
//		store.setZipcode(11111);
//		store.setLatitude(9.9999);
//		store.setLongitude(9.9999);
//		store.setText("test_text");
//		store.setPhone("test_phone");
//		store.setOwner(owner);
//		
//		storeDao.insertStore(store);
//		
//		Store found = storeDao.getStoreByName("test_name"); 	
//		Assertions.assertEquals(11111, found.getZipcode());
//	}
//	
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
//		Review found = reviewDao.getReviewById(25001); 
//		Assertions.assertEquals(5, found.getRating());
//	}
	
//	@Test 
//	public void entitiesUpdateTest() {
//		
//		{
//			Customer found = customerDao.getCustomerByName("test_name"); 
//			found.setName("test_name_modified");
//			
//			customerDao.updateCustomer(found);
//			
//			Customer modified = customerDao.getCustomerByName("test_name_modified"); 
//			
//			Assertions.assertEquals("test_name_modified", modified.getName());
//		}
//		
//		{
//			Owner found = ownerDao.getOwnerByName("test_name"); 
//			found.setName("test_name_modified");
//			
//			ownerDao.updateOwner(found);
//			
//			Owner modified = ownerDao.getOwnerByName("test_name_modified"); 
//			
//			Assertions.assertEquals("test_name_modified", modified.getName());
//		}
//		
//		{
//			Store found = storeDao.getStoreByName("test_name"); 
//			found.setName("test_name_modified"); 
//			
//			storeDao.updateStore(found);
//			
//			Store modified = storeDao.getStoreByName("test_name_modified"); 
//			
//			Assertions.assertEquals("test_name_modified", modified.getName());
//		}
//		
//		{
//			Review found = reviewDao.getReviewByText("test_text"); 
//			found.setText("test_text_modified");
//			
//			reviewDao.updateReview(found); 
//			
//			Review modified = reviewDao.getReviewByText("test_text_modified"); 
//			
//			Assertions.assertEquals("test_text_modified", modified.getText());
//		}
//	} 
//	
//	@Test
//	public void entitiesDeleteTest() {
//		
//		reviewDao.deleteReviewById(25002);
//		Assertions.assertThrows(NullPointerException.class, () -> {
//			
//			Review found = reviewDao.getReviewById(25002); 
//			found.getId();
//		});  
//		
//		storeDao.deleteStoreById(35005);
//		Assertions.assertThrows(NullPointerException.class, () -> {
//			
//			Store found = storeDao.getStoreById(35005); 
//			found.getId(); 
//		});
//		
//		ownerDao.deleteOwnerById(20004);
//		Assertions.assertThrows(NullPointerException.class, () -> {
//			
//			Owner found = ownerDao.getOwnerById(20004); 
//			found.getId(); 
//		});
//		
//		customerDao.deleteCustomerById(47); 
//		Assertions.assertThrows(NullPointerException.class, () -> {
//			
//			Customer found = customerDao.getCustomerById(47);
//			found.getId();
//		});
//	}	
	
	@Test
	public  void reviewPictureInsertTest () {
		
		Review review = reviewDao.getReviewById(25001);
		
		ReviewPicture reviewPicture = new ReviewPicture();
		
		reviewPicture.setFileLocation("test_location");
		reviewPicture.setReview(review);
		
		reviewPicturesDao.insertReviewPicture(reviewPicture);
	
	}	
	
	@Test
	public void storePictureInsertTest() {
		
		Store store = storeDao.getStoreById(35003);
		
		StorePicture storePicture = new StorePicture();
		
		storePicture.setFileLocation("test_location");
		storePicture.setStore(store);
		
		storePictureDao.insertStorePicture(storePicture);				
	}
}
