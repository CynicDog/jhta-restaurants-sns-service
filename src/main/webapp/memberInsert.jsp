<%@page import="vo.Owner"%>
<%@page import="dao.OwnerDao"%>
<%@page import="java.util.Date"%>
<%@page import="vo.Customer"%>
<%@page import="utils.DateUtils"%>
<%@page import="dao.CustomerDao"%>
<%
	
	String memberType = request.getParameter("member");
	String memberId = request.getParameter("member-id"); 
	String password = request.getParameter("password");
	String name = request.getParameter("name"); 
	String email = request.getParameter("email"); 
	String phone = request.getParameter("phone"); 
	Date birthday = DateUtils.stringToDate(request.getParameter("birthday")); 
	String gender = request.getParameter("gender"); 
	String grade = "basic"; 

	if (memberType.equals("customer")) {
		
		CustomerDao customerDao = CustomerDao.getInstance();
		
		Customer customer = new Customer();
		customer.setUserId(memberId); 
		customer.setPassword(password); 
		customer.setName(name); 
		customer.setEmail(email);
		customer.setPhone(phone); 
		customer.setBirthday(birthday); 
		customer.setGender(gender); 
		customer.setGrade(grade); 
	
		customerDao.insertCustomer(customer);
		
		response.sendRedirect("loginFormPage.jsp");
		
	} else if (memberType.equals("owner")) {
		
		String subscription = "basic˜";
		
		OwnerDao ownerDao = OwnerDao.getInstance();
		
		Owner owner = new Owner();
		owner.setOwnerId(memberId); 
		owner.setPassword(password); 
		owner.setName(name); 
		owner.setEmail(email);
		owner.setPhone(phone); 
		owner.setBirthday(birthday); 
		owner.setGender(gender); 
		owner.setGrade(grade); 
		owner.setSubscription(subscription); 
		
		ownerDao.insertOwner(owner); 
		
		response.sendRedirect("loginFormPage.jsp");
	}
%>