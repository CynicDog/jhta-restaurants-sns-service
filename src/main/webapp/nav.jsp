<%@page import="dao.AdminDao"%>
<%@page import="dao.OwnerDao"%>
<%@page import="dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	// 세션에 저장된 로그인타입, 로그인아이디 조회하기
	String loginType = (String) session.getAttribute("loginType");
	int loginId = (int) session.getAttribute("loginId");
	
	// 유저의 userId 획득
	String userId = null;
	if(loginType!=null){
		if ("customer".equals(loginType)){
			userId = CustomerDao.getInstance().getCustomerById(loginId).getUserId();

		}else if("owner".equals(loginType)){
			userId = OwnerDao.getInstance().getOwnerById(loginId).getOwnerId();

		}else if("admin".equals(loginType)){
			userId = AdminDao.getInstance().getAdminById(loginId).getAdminId();
		}
	}
	// 요청파라미터 조회하기
	String menu = request.getParameter("menu");
	
%>   
    
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Mary Blog</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
		<style type="text/css">
			
			.navbar{
				position:fixed;
				top:0px;
				right:0px;
				width:100%;
				height:55px;
				z-index:100;
				background-color:rgb(233, 100, 121);
			}

			.d-flex{
				width:90%;
				position:fixed;
				top:8px;
				right:5px;
				z-index:101;
			}
			
			.nav-button {
				width:8%;
				background-color: rgb(125, 185, 182);
				color:white;
			}
			

		</style>
	</head>
	<body>
	
			<nav class="navbar ">
			  <div class="container-fluid">
			    <form class="d-flex" role="search">
			    <button id="button-home" class="btn nav-button" type="button" onclick="location.href='home.jsp'">Home</button>
			      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			      <button id="button-search" class="btn nav-button" type="submit">Search</button>
<%
	if (loginType != null) {
%>
		<span class="navbar-text me-5">
			<strong class="text-white bolder"><%=userId %></strong>님 환영합니다.
		</span>
<%	
	}
%>


<%
	if ("customer".equals(loginType)) {
%>
				     <button id="button-userDetail" class="btn nav-button" type="button" onclick="location.href='userDetail.jsp'">MyPage</button>
	
<%
	} else if("owner".equals(loginType)){
%>	

<%
	}
%>

<%
	if (loginType == null) {
%>
			      <button id="button-login" class="btn nav-button" type="button" onclick="location.href='loginFormPage.jsp'">Login</button>
			      <button id="button-signUp" class="btn nav-button" type="button" onclick="location.href='memberRegFormPage.jsp'">Sign up</button>
<%
	} else {
%>	
         		<button id="button-logout" class="btn nav-button" type="button" onclick="location.href='logout.jsp'">Logout</button>
<%
	}
%>
			   
			    </form>
			  </div>
			</nav>
	
	</body>
</html>