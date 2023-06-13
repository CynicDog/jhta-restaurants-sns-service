package servlet;

import java.io.IOException;

import dao.ReviewDao;
import dao.ReviewPictureDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import vo.Review;

@MultipartConfig
@WebServlet(urlPatterns = "/reviewInsert")
public class ReviewServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session =request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		if (loginId == null) {
			response.sendRedirect("home.jsp");
		}
		
		String reviewText = request.getParameter("review_text");
		
		Part part = request.getPart("file_location");
		String fileLocation = part.getSubmittedFileName();
		
		int seq = dao.getSeq();
		
		Review review = new Review();
		review.setId(seq);
		review.setText(reviewText);
		reviewDao.insertReview(review);
	}
}
