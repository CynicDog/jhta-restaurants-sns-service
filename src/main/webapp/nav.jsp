<%@page import="vo.Admin"%>
<%@page import="vo.Owner"%>
<%@page import="vo.Customer"%>
<%@page import="dao.AdminDao"%>
<%@page import="dao.OwnerDao"%>
<%@page import="dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	CustomerDao customerDao = CustomerDao.getInstance();
	OwnerDao ownerDao = OwnerDao.getInstance();
	AdminDao adminDao = AdminDao.getInstance();
 
 	// 세션에 저장된 로그인타입, 로그인아이디 조회하기
	String loginType = (String) session.getAttribute("loginType");
 	Integer loginId = (Integer) session.getAttribute("loginId");
 	
	String memberName = ""; 
	if (loginType != null && loginId != null){

		if ("customer".equals(loginType)){
			Customer customer = customerDao.getCustomerById(loginId);
			memberName = customer.getName(); 
		} else if("owner".equals(loginType)){
			Owner owner = ownerDao.getOwnerById(loginId); 
			memberName = owner.getName();
		} else if("admin".equals(loginType)){ 
			Admin admin = adminDao.getAdminById(loginId); 
			memberName = admin.getName();
		} else {
			// exception handling  
		}
	}

%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="">
    <nav class="navbar navbar-expand-lg bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
                    </li>
<% if (loginId == null) { %>                    
                    <li class="nav-item">
                        <a class="nav-link" href="loginFormPage.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="memberRegFormPage.jsp">Sign up</a>
                    </li>
<% } %>                    
<% if (loginId != null) { %>
					<li class="nav-item">
                        <a class="nav-link" href="userDetail.jsp">My Page</a>
                    </li>                    
                    <li class="nav-item">
                        <a class="nav-link" href="logout.jsp">Logout</a>
                    </li>
<% } %>                    
                </ul>
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
</body>
</html>
