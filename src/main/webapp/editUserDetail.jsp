<%@page import="vo.Admin"%>
<%@page import="dao.AdminDao"%>
<%@page import="vo.Owner"%>
<%@page import="dao.OwnerDao"%>
<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@page import="utils.DateUtils"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	OwnerDao ownerDao = OwnerDao.getInstance();
	CustomerDao customerDao = CustomerDao.getInstance();

	// 1. 세션에서 로그인된 사용자 정보 조회하기
	String loginType = (String) session.getAttribute("loginType");
	Integer loginId = (Integer)session.getAttribute("loginId");
	
	// 2. 로그인된 상태인지 체크하기
	if (loginType == null) {
		response.sendRedirect("/loginformPage.jsp");
		return;
	}


	// 요청값 획득
	String password = request.getParameter("password");
	String name = request.getParameter("name"); 
	String email = request.getParameter("email"); 
	String phone = request.getParameter("phone"); 
	
	int id = loginId;

	if ("customer".equals(loginType)) { 	
		
	 	Customer customer = customerDao.getCustomerById(id); 
	 	customer.setPassword(password); 
	 	customer.setName(name); 
	 	customer.setEmail(email); 
	 	customer.setPhone(phone); 
	 	
		customerDao.updateCustomer(customer);
		
		response.sendRedirect("userDetail.jsp");
		
	} else if ("owner".equals(loginType)) {
		
		Owner owner = ownerDao.getOwnerById(id); 
		owner.setPassword(password); 
		owner.setName(name); 
	 	owner.setEmail(email); 
	 	owner.setPhone(phone); 
		
		ownerDao.updateOwner(owner); 
		
		response.sendRedirect("userDetail.jsp");
	}

%>