package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.Store;

@MultipartConfig
@WebServlet(urlPatterns = "/storePictureInsert")
public class StoreServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Store store = (Store) request.getSession().getAttribute("storeComplete");
		// ... 
		
		response.sendRedirect("menuRegFormPage.jsp");
	}
}
