package servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import dao.ReviewPictureDao;
import dao.StoreDao;
import dao.StorePictureDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import vo.ReviewPicture;
import vo.Store;
import vo.StorePicture;

@MultipartConfig
@WebServlet(urlPatterns = "/storePictureInsert")
public class StoreServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Store store = (Store) request.getSession().getAttribute("storeComplete");
		StorePictureDao storepictureDao = StorePictureDao.getInstance();
		
		HttpSession session =request.getSession();
		int loginId = (int)session.getAttribute("loginId"); 
		
		if (session.getAttribute("loginId") == null) {
			response.sendRedirect("home.jsp");
		}
		
		Part part = request.getPart("picture");
		if (part.getSize() > 0) { 
			String fileName = part.getSubmittedFileName();
			
			String projectHome = System.getenv("PROJECT_HOME");
			String saveDirectory = projectHome + "/src/main/webapp/resources/storePicture";
			
			InputStream in = part.getInputStream();
			OutputStream out = new FileOutputStream(new File(saveDirectory, fileName));
			IOUtils.copy(in, out);

			StorePicture sp = new StorePicture();
			sp.setFileLocation(fileName);
			sp.setStore(store);

			storepictureDao.insertStorePicture(sp);
		}
		
		response.sendRedirect("menuRegFormPage.jsp");
	}
}
