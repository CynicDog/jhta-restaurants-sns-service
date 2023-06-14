<%@page import="dao.AdminDao"%>
<%@page import="dao.OwnerDao"%>
<%@page import="dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	// 세션에 저장된 로그인타입, 로그인아이디 조회하기
	String loginType = (String) session.getAttribute("loginType");
 	Integer loginId = (Integer) session.getAttribute("loginId");
 	System.out.println(loginType);
 	System.out.println(loginId);
 	

	// 요청파라미터 조회하기
	String menu = request.getParameter("menu");
	
	// userId 획득
	String userId="";
	CustomerDao customerDao = CustomerDao.getInstance();
	OwnerDao ownerDao = OwnerDao.getInstance();
	AdminDao adminDao = AdminDao.getInstance();
	
	if(loginType!=null&&loginId!=null){

		if ("customer".equals(loginType)){
			try{
				userId = customerDao.getCustomerById(loginId).getUserId();

			}catch(Exception e){
				
			}
		}else if("owner".equals(loginType)){
			userId = OwnerDao.getInstance().getOwnerById(loginId).getOwnerId();

		}else if("admin".equals(loginType)){
			userId = AdminDao.getInstance().getAdminById(loginId).getAdminId();
		}else{
			userId = "";
		}
	}

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

/*  			.d-flex{ */
/*  				width:50%;  */
/*  				position: fixed;  */
/*  				top:8px;  */
/*  				right:5px;  */
/*  				z-index:101;  */
/*  			}  */
			
			.nav-button {
			
				background-color: rgb(125, 185, 182);
				color:white;
			}
			

		</style>
	</head>
	<body>
	<nav class="navbar ">
		<div class="container-fluid" style="justify-content: flex-start">

			<button id="button-home" class="btn nav-button" type="button"
				onclick="location.href='home.jsp'">Home
			</button>

			<form>
				<input type="text" name="search" placeholder="Search..." style="width: 1000px;">
				<button class="btn nav-button" type="submit">Search</button>
			</form>

<%
	if (loginType != null) {
%>

				<span class="navbar-text me-5"> <strong
					class="text-white bolder"><%=userId %></strong>님 환영합니다.
				</span>
<%	
	}
%>


				<%
	if ("customer".equals(loginType)) {
%>
				<button id="button-userDetail" class="btn nav-button" type="button"
					onclick="location.href='userDetail.jsp'">MyPage</button>

				<%
	} else if("owner".equals(loginType)){
%>

				<%
	}
%>

				<%
	if (loginType == null) {
%>
				<button id="button-login" class="btn nav-button" type="button"
					onclick="location.href='loginFormPage.jsp'">Login</button>
				<button id="button-signUp" class="btn nav-button" type="button"
					onclick="location.href='memberRegFormPage.jsp'">Sign up</button>
				<%
	} else {
%>
				<button id="button-logout" class="btn nav-button" type="button"
					onclick="location.href='logout.jsp'">Logout</button>
				<%
	}
%>

		
		</div>
	</nav>

</body>
</html>