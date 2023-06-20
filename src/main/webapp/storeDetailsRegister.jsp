<%@page import="dao.StoreOpenTimeDao"%>
<%@page import="vo.StoreOpentime"%>
<%@page import="dao.StoreDao"%>
<%@page import="dao.OwnerDao"%>
<%@page import="vo.Owner"%>
<%@page import="vo.Store"%>
<%
	OwnerDao ownerDao = OwnerDao.getInstance(); 	
	StoreDao storeDao = StoreDao.getInstance();
	StoreOpenTimeDao storeOpenTimeDao = StoreOpenTimeDao.getInstance(); 

	Store store = (Store) session.getAttribute("storePartial"); 

	String name = request.getParameter("name"); 
	String text = request.getParameter("text"); 
	String dayOffs = request.getParameter("day-offs"); 
	int ownerId = (int) session.getAttribute("loginId");
	 
	String operationTimes = request.getParameter("operation-times"); 
	
	store.setName(name); 
	store.setText(text); 
	store.setDayOffs(dayOffs); 
	
	Owner onwer = ownerDao.getOwnerById(ownerId); 
	store.setOwner(onwer); 
		
	try {
		storeDao.insertStore(store); 
		
		Store store_found = storeDao.getStoreByBusinessLicenseNumber(store.getBusinessLicenseNumber()); 
		
		StoreOpentime storeOpentime = new StoreOpentime();
		storeOpentime.setOperationTime(operationTimes); 
		storeOpentime.setStore(store_found);	

		storeOpenTimeDao.insertStoreOpenTime(storeOpentime);	
		
		session.setAttribute("storeComplete", store_found);	
		response.sendRedirect("storePictureRegFormPage.jsp");
		
	} catch (Exception e) { 
		
		response.sendRedirect("storeLegalInfoRegFormPage.jsp?message=uniqueConstraint");
	}
%>