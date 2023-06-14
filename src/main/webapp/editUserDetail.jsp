<%@page import="vo.Owner"%>
<%@page import="dao.OwnerDao"%>
<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@page import="utils.DateUtils"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
//테스트용 세션 데이터
String type = "customer";
int testId = 21;
session.setAttribute("loginType", type);
session.setAttribute("loginId", testId);

// 1. 세션에서 로그인된 사용자 정보 조회하기
String loginType = (String) session.getAttribute("loginType");
int loginId = (int)session.getAttribute("loginId");

// 2. 로그인된 상태인지 체크하기
if (loginType == null) {
	response.sendRedirect("/loginformPage.jsp");
	return;
}

// // 3. 로그인된 유저의 객체 획득
// CustomerDao customerDao = CustomerDao.getInstance();
// Customer customer = customerDao.getCustomerById(loginId);

// 요청값 획득
	String memberType = request.getParameter("member");
	String memberId = request.getParameter("member-id"); 
	String password = request.getParameter("password");
	String name = request.getParameter("name"); 
	String email = request.getParameter("email"); 
	String phone = request.getParameter("phone"); 
	Date birthday = DateUtils.stringToDate(request.getParameter("birthday")); 
	String gender = request.getParameter("gender"); 
	String grade = "basic°"; 
	int id = loginId;

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
		customer.setId(id);
	
		customerDao.updateCustomer(customer);
		
		response.sendRedirect("userDetail.jsp");
		
	} else if (memberType.equals("owner")) {
		
		String subscription = "basic";
		
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
		
		ownerDao.updateOwner(owner); 
		
		response.sendRedirect("userDetail.jsp");
	}

%>