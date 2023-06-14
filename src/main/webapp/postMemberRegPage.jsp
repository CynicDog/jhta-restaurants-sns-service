<%@page import="vo.Owner"%>
<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@page import="dao.OwnerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	CustomerDao customerDao = CustomerDao.getInstance();
	OwnerDao ownerDao = OwnerDao.getInstance();

	int loginId = (int) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");

	String memberName = null;

	if (loginType.equals("customer")) {
		Customer customer = customerDao.getCustomerById(loginId);
		memberName = customer.getName();
	} else if (loginType.equals("owner")) {
		Owner owner = ownerDao.getOwnerById(loginId);
		memberName = owner.getName();
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <style>
		.container-pt{
			padding-top: 10%;
		}
		
        .button-container {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
<jsp:include page="nav.jsp">
    <jsp:param name="menu" value="홈"/>
</jsp:include>
<div class="container container-pt">
    <div class="row justify-content-center align-items-center mt-5">
        <div class="col-md-6">
            <div class="card shadow p-3 mb-5 bg-white rounded">
                <div class="card-body">
                    <p class="text-center"><%=memberName%>님, 환영합니다!</p>
                    <% if (loginType.equals("owner")) { %>
                    <div class="button-container mt-3">
                        <button class="btn btn-light" type="button"
                                onclick="location.href='storeLegalInfoRegFormPage.jsp'">가게 등록하러 가기
                        </button>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

