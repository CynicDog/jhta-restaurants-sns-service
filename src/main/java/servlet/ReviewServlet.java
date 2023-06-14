package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import dao.CustomerDao;
import dao.ReviewDao;
import dao.ReviewPictureDao;
import dao.StoreDao;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import vo.Customer;
import vo.Review;
import vo.ReviewPicture;
import vo.Store;

@MultipartConfig
@WebServlet(urlPatterns = "/review")
public class ReviewServlet extends HttpServlet {
	
	

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
				
		CustomerDao customerDao = CustomerDao.getInstance();
		StoreDao storeDao = StoreDao.getInstance();

		
		HttpSession session =request.getSession();
		String loginId = (String)session.getAttribute("loginId"); 
		String storeName = "test_name"; /*(String)session.getAttribute("storeName");*/
		
		if (loginId == null) {
			response.sendRedirect("home.jsp");
		}
		
		String reviewText = request.getParameter("review_text");

		Part part = request.getPart("pictureFiles");
		String fileName = part.getSubmittedFileName();
		
//		ServletContext servletContext = request.getServletContext();
//		String fileLocation = servletContext.getRealPath("/JAVA_HOME/PROJECT_HOME/") + File.separator + fileName;
		
//		String fileLocation = request.getServletContext().getRealPath("/resources/images/") + fileName;
		
		InputStream in = part.getInputStream();
		OutputStream out = new FileOutputStream(new File("C:\\Users\\GOTAEHWA\\git\\jhta-restaurants-sns-service\\src\\main\\webapp\\resources\\images", fileName));
//		OutputStream out = new FileOutputStream(
//				new File(request.getServletContext().getRealPath("/JAVA_HOME/PROJECT_HOME/"), fileName));

//		OutputStream out = new FileOutputStream(new File(saveDirectory, fileName));
		IOUtils.copy(in, out);
		

		ReviewDao reviewDao = ReviewDao.getInstance();
		int seq = reviewDao.getSeq();

		Review review = new Review();
		review.setId(seq);
		review.setRating(5);
		review.setText(reviewText);
		
		Customer customer = customerDao.getCustomerByUserId("test_id");
		review.setCustomer(customer);
		Store store = storeDao.getStoreByName(storeName);
		review.setStore(store);

		reviewDao.insertReview(review);
		
		ReviewPictureDao reviewPictureDao = ReviewPictureDao.getInstance();

		
		ReviewPicture rp = new ReviewPicture();
		rp.setFileLocation(fileName);
		rp.setReview(review);

		reviewPictureDao.insertReviewPicture(rp);


//		response.sendRedirect("storeDetail.jsp");
	}
}