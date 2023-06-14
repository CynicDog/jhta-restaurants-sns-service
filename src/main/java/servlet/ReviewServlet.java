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
		String custName = (String)session.getAttribute("custName");
		
		if (loginId == null) {
			response.sendRedirect("home.jsp");
		}
		

		String reviewText = request.getParameter("review_text");

		Part part = request.getPart("pictureFiles");
		String fileLocation = part.getSubmittedFileName();

		InputStream in = part.getInputStream();
		OutputStream out = new FileOutputStream(
				new File(request.getServletContext().getRealPath("/resources/images"), fileLocation));
		IOUtils.copy(in, out);

		ReviewDao reviewDao = ReviewDao.getInstance();
		int seq = reviewDao.getSeq();

		Review review = new Review();
		review.setRating(5);
		review.setText(reviewText);
		
		Customer customer = customerDao.getCustomerByName(custName);
		review.setCustomer(customer);
		Store store = storeDao.getStoreByName();
		review.setStore(store);

		ReviewPictureDao reviewPictureDao = ReviewPictureDao.getInstance();

		ReviewPicture rp = new ReviewPicture();
		rp.setId(seq);
		rp.setFileLocation(fileLocation);
		rp.setReview(review);

		reviewPictureDao.insertReviewPicture(rp);

		reviewDao.insertReview(review);

		response.sendRedirect("storeDetail.jsp");
	}
}

//@WebServlet(urlPatterns = "/review")
//@MultipartConfig
//public class ReviewServlet extends HttpServlet {
//
//	@Override
//	protected void service(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		/*
//		 * HttpSession session = request.getSession(); String loginId = (String)
//		 * session.getAttribute("loginId"); if (loginId == null) {
//		 * response.sendRedirect("home.jsp"); return; }
//		 */
//
//		String reviewText = request.getParameter("review_text");
//
//		Part part = request.getPart("pictureFiles");
//		String fileLocation = part.getSubmittedFileName();
//
//		InputStream in = part.getInputStream();
//		OutputStream out = new FileOutputStream(new File("../../webapp/resourses/images", fileLocation));
//		byte[] buffer = new byte[1024];
//		int bytesRead;
//		while ((bytesRead = in.read(buffer)) != -1) {
//			out.write(buffer, 0, bytesRead);
//		}
//		out.close();
//		in.close();
//
//		ReviewDao reviewDao = ReviewDao.getInstance();
//		int seq = reviewDao.getSeq();
//
//		Review review = new Review();
//		review.setId(seq);
//		review.setText(reviewText);
//
//		ReviewPictureDao reviewPictureDao = ReviewPictureDao.getInstance();
//
//		ReviewPicture rp = new ReviewPicture();
//		rp.setId(seq);
//		rp.setFileLocation(fileLocation);
//		rp.setReview(review);
//
//		reviewPictureDao.insertReviewPicture(rp);
//
//		reviewDao.insertReview(review);
//
//		response.sendRedirect("storeDetail.jsp");
//	}
//}
