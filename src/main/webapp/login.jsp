<%@page import="vo.Owner"%>
<%@page import="dao.OwnerDao"%>
<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%
	
	String memberType = request.getParameter("member");

	String memberId = request.getParameter("member-id");
	String password = request.getParameter("password"); 
	
	if (memberType.equals("customer")) {
		
		CustomerDao customerDao = CustomerDao.getInstance();
		Customer customer = customerDao.getCustomerByUserId(memberId);
		
		if (customer.getPassword().equals(password)) { // authenticate  
			
			session.setAttribute("loginId", customer.getId()); // int
			session.setAttribute("loginType", "customer"); 
			response.sendRedirect("home.jsp"); 
		}
		
	} else if (memberType.equals("owner")) {
		
		OwnerDao ownerDao = OwnerDao.getInstance();
		Owner owner = ownerDao.getOwnerByOwnerId(memberId);
		
		if (owner.getPassword().equals(password)) { // authenticate 
			
			session.setAttribute("loginId", owner.getId()); // int 
			session.setAttribute("loginType", "owner"); 
			response.sendRedirect("postMemberRegPage.jsp");
		} 
	}
%>