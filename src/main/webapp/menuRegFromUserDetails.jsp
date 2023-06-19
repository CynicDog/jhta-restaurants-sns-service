<%@page import="dao.FoodDao"%>
<%@page import="vo.Food"%>
<%@page import="dao.StoreDao"%>
<%@page import="vo.Store"%>
<%
	FoodDao foodDao = FoodDao.getInstance();
	StoreDao storeDao = StoreDao.getInstance();

	int storeId = Integer.parseInt(request.getParameter("storeId"));   
	 
	Store store = storeDao.getStoreById(storeId); 
	
	System.out.println(store.getId()); 
	
 	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	String category = request.getParameter("category");
	String soldOut = "F"; // "F" for false, meaning it's on sale. "T" for true, meaning it's sold out. 
	String text = request.getParameter("text");
	
	Food food = new Food(); 
	food.setName(name); 
	food.setPrice(price); 
	food.setCategory(category); 
	food.setSoldOut(soldOut); 
	food.setText(text);
	food.setStore(store);
	
	foodDao.insertFood(food); 			 
%>
<script>
    alert("Menu got successfully inserted!");
    window.location.href="menuRegFormPage.jsp"
</script>