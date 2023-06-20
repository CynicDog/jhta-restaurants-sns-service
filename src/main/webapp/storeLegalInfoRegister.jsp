<%@page import="vo.Store"%>
<%
	session.removeAttribute("storePartial"); 

	int businessLicenseNumber = Integer.parseInt(request.getParameter("business-license-number"));
	String phone = request.getParameter("phone"); 
	int zipCode = Integer.parseInt(request.getParameter("zipcode")); 
	String address = request.getParameter("address");
	Store store = new Store();
	store.setBusinessLicenseNumber(businessLicenseNumber);
	store.setAddress(address); 
	store.setZipcode(zipCode);
	store.setPhone(phone);
	
	if(!request.getParameter("longitude").isEmpty() && !request.getParameter("latitude").isEmpty()){
		double longitude = Double.parseDouble(request.getParameter("longitude"));
		double latitude = Double.parseDouble(request.getParameter("latitude"));
		store.setLongitude(longitude);
		store.setLatitude(latitude);
	}
	
	session.setAttribute("storePartial", store);	
	
	response.sendRedirect("storeDetailsRegFormPage.jsp");
%>