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
		int loginId = (int)session.getAttribute("loginId"); 
		
		if (session.getAttribute("loginId") == null) {
			response.sendRedirect("home.jsp");
		}
		
		int storeId = Integer.parseInt(request.getParameter("storeId"));
		Double starPoint = Double.parseDouble(request.getParameter("starpoint"));
		String reviewText = request.getParameter("review_text");

		ReviewDao reviewDao = ReviewDao.getInstance();
		int seq = reviewDao.getSeq();

		Review review = new Review();
		review.setId(seq);
		review.setRating(starPoint);
		review.setText(reviewText);
		
		Customer customer = customerDao.getCustomerById(loginId);
		review.setCustomer(customer);
		Store store = storeDao.getStoreById(storeId);
		review.setStore(store);

		reviewDao.insertReview(review);
		
		Part part = request.getPart("pictureFiles");
		if (request.getPart("pictureFiles") != null) { 
			String fileName = part.getSubmittedFileName();
			
			String projectHome = System.getenv("PROJECT_HOME");
			String saveDirectory = projectHome + "/src/main/webapp/resources/reviewPicture/";
			
			InputStream in = part.getInputStream();
			OutputStream out = new FileOutputStream(new File(saveDirectory, fileName));

			IOUtils.copy(in, out);
			
			ReviewPictureDao reviewPictureDao = ReviewPictureDao.getInstance();
			
			ReviewPicture rp = new ReviewPicture();
			rp.setFileLocation(fileName);
			rp.setReview(review);

			reviewPictureDao.insertReviewPicture(rp);
		}

		response.sendRedirect("storeDetail.jsp?storeId=" + storeId);
	}
}