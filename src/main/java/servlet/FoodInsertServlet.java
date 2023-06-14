package servlet;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.tomcat.jakartaee.commons.compress.utils.IOUtils;

import dao.FoodDao;
import dao.StoreDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vo.Food;
import vo.Store;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
@WebServlet(urlPatterns = "/foodInsert")
public class FoodInsertServlet extends HttpServlet{
	
	static {
		System.out.println("Post request got received."); 
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FoodDao foodDao = FoodDao.getInstance();

		// TODO: resolve tightly coupled operations of insertion of `store` and insertion of `food`
		Store store = (Store) request.getSession().getAttribute("storeComplete");   
 
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		String category = request.getParameter("category");
		String soldOut = "F"; // "F" for false, meaning it's on sale. "T" for true, meaning it's sold out. 
		String text = request.getParameter("text");
		
		Part picturePart = request.getPart("picture");
		
		Long size = picturePart.getSize(); 
		
		String pictureFileName = null; 
		if (size > 0) {
			pictureFileName = System.currentTimeMillis() + "-" + picturePart.getSubmittedFileName();
			
			InputStream in = picturePart.getInputStream(); 

			String menuDirectory = getServletContext().getRealPath("../resources/menu");
			OutputStream out = new FileOutputStream(new File(menuDirectory, pictureFileName));
			
			IOUtils.copy(in, out);
		}
		
		Food food = new Food(); 
		food.setName(name); 
		food.setPrice(price); 
		food.setCategory(category); 
		food.setSoldOut(soldOut); 
		food.setPictureLocation(pictureFileName);
		food.setText(text);
		food.setStore(store);
		
		foodDao.insertFood(food); 		
	}
}
