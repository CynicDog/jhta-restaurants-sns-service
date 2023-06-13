<%@page import="vo.Owner"%>
<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@page import="dao.OwnerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CustomerDao customerDao = CustomerDao.getInstance();	
	OwnerDao ownerDao = OwnerDao.getInstance();
	
	String loginId = (String) session.getAttribute("loginId"); 
	
	Customer customer = null;
	Owner owner = null; 
	
	customer = customerDao.getCustomerByUserId(loginId); 
	owner = ownerDao.getOwnerByOwnerId(loginId); 
	
	String memberName = null;
	
	if (customer != null) {
		memberName = customer.getName();
	} else if (owner != null) {
		memberName = owner.getName();
	}
%>>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <style>
    html, body {
      height: 100%;
    }

    body {
      display: flex;
      align-items: center;
      justify-content: center;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="row justify-content-center align-items-center mt-5">
    <div class="col-md-6">
      <div class="card shadow p-3 mb-5 bg-white rounded">
          <div class="card-body">
            <p class="text-center"><%=memberName%>님, 환영합니다!</p>
          </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>

