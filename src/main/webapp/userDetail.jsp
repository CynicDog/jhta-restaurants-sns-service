<%@page import="vo.Review"%>
<%@page import="dao.ReviewDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Store"%>
<%@page import="java.util.List"%>
<%@page import="dao.StoreDao"%>
<%@page import="java.util.Date"%>
<%@page import="dao.AdminDao"%>
<%@page import="vo.Admin"%>
<%@page import="vo.Owner"%>
<%@page import="dao.OwnerDao"%>
<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
	CustomerDao customerDao = CustomerDao.getInstance();
	StoreDao storeDao = StoreDao.getInstance(); 
	ReviewDao reviewDao = ReviewDao.getInstance(); 
	OwnerDao ownerDao = OwnerDao.getInstance();
	AdminDao adminDao = AdminDao.getInstance(); 

// 1. 세션에서 로그인된 사용자 정보 조회하기
	String loginType = (String) session.getAttribute("loginType");
	Integer loginId = (Integer)session.getAttribute("loginId");
	
	// 2. 로그인된 상태인지 체크하기
	if (loginType == null) {
		response.sendRedirect("/loginFormPage.jsp");
		return;
	}
	
	Customer customer = null; 
	customer = customerDao.getCustomerById(loginId);
	
	Owner owner = null; 
	owner = ownerDao.getOwnerById(loginId);
	
	Admin admin = null; 
	admin = adminDao.getAdminById(loginId); 
	
	String memberId = null;
	String name = null; 
	String email = null; 
	String phone = null; 
	Date birthday = null; 
	String grade = null;
	String subscription = null;
	String gender = null; 
	
	List<Store> stores = new ArrayList<Store>();
	List<Review> reviews = new ArrayList<Review>();
			
	if (customer != null) {
		memberId = customer.getUserId(); 
		name = customer.getName();
		email = customer.getEmail();
		phone = customer.getPhone();
		birthday = customer.getBirthday();
		gender = customer.getGender();
		grade = customer.getGrade();
		
		reviews = reviewDao.getReviewByCustomerId(customer.getId()); 
		
	} else if (owner != null) {
		memberId = owner.getOwnerId(); 
		name = owner.getName();
		email = owner.getEmail();
		phone = owner.getPhone();
		birthday = owner.getBirthday(); 
		grade = owner.getGrade();
		gender = owner.getGender();
		subscription = owner.getSubscription();
		
		stores = storeDao.getStoresByOwnerId(owner.getId());
		
	} else if (admin != null) {
		memberId = admin.getAdminId(); 
		name = admin.getName();
		email = admin.getEmail();
		phone = admin.getPhone();
		birthday = owner.getBirthday();
		gender = admin.getGender();
		
	} {
		// exception handling (customer == null && owner == null && admin == null) 
	}
	 
%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Detail</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <style type="text/css">

    </style>
</head>
<body>

<jsp:include page="nav.jsp">
    <jsp:param name="menu" value="userDetail"/>
</jsp:include>

<div class="container container-pt">
    <div class="row justify-content-center align-items-center mt-5">
        <div class="col-md-7">
            <div class="card shadow p-3 mb-5 bg-white rounded">
                <div class="card-header">
                    <p class="my-2">사용자 상세 화면</p>
                </div>
                    <div class="card-body">
                        <div class="row mb-3">
                            <label for="user-id" class="col-sm-2 col-form-label"><span style="white-space: nowrap">아이디</span></label>
                            <div class="col-sm-10">
                                <p class="form-control" id="user-id"> <%=memberId %> </p>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="user-name" class="col-sm-2 col-form-label"><span style="white-space: nowrap">이름</span></label>
                            <div class="col-sm-10">
                                <p class="form-control" id="user-name"> <%=name %> </p>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="gender" class="col-sm-2 col-form-label"><span style="white-space: nowrap">성별</span></label>
                            <div class="col-sm-10">
                                <p class="form-control" id="gender"> <%=gender %> </p>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="email" class="col-sm-2 col-form-label"><span style="white-space: nowrap">이메일</span></label>
                            <div class="col-sm-10">
                                <p class="form-control" id="email"> <%=email %> </p>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="phone" class="col-sm-2 col-form-label"><span style="white-space: nowrap">전화번호</span></label>
                            <div class="col-sm-10">
                                <p class="form-control" id="phone"> <%=phone %> </p>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="birthday" class="col-sm-2 col-form-label"><span style="white-space: nowrap">생년월일</span></label>
                            <div class="col-sm-10">
                                <p class="form-control" id="birthday"> <%=birthday %> </p>
                            </div>
                        </div>
<% if (grade != null ) { %>                        
                        <div class="row mb-3">
                            <label for="grade" class="col-sm-2 col-form-label"><span style="white-space: nowrap">등급</span></label>
                            <div class="col-sm-10">
                                <p class="form-control" id="grade"> <%=grade %> </p>
                            </div>
                        </div>
<% } %>                       
<% if (subscription !=null) { %> 
                        <div class="row mb-3">
                            <label for="subscription" class="col-sm-2 col-form-label"><span style="white-space: nowrap">구독</span></label>
                            <div class="col-sm-10">
                                <p class="form-control" id="subscription"> <%=subscription %> </p>
                            </div>
                        </div>
<% } %>                        
                        <div class="d-flex justify-content-end mt-4 mb-1 w-100">
                            <div>
<% if (owner != null) { %>                            
                                <button class="btn btn-light mx-2" type="button" onclick="location.href='storeLegalInfoRegFormPage.jsp'">가게 등록</button>
<% } %>                                
                                <button type="button" class="btn btn-primary" onclick="location.href='editUserDetailPage.jsp'">수정</button>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>

<% 
	if (!stores.isEmpty()) {		
%>                    
    <div class="row justify-content-center align-items-center mt-3">
        <div class="col-md-7">
            <div class="card shadow p-3 mb-5 bg-white rounded">
                <div class="card-header">
                    <p class="my-2">가게 목록</p>
                </div>
                <div class="card-body">
                    <ol class="list-group list-group-numbered">
<%  
		for (Store store : stores) {  
%>
                        <li class="list-group-item d-flex justify-content-between align-items-start">
                            <div class="ms-2 me-auto">
                                <div class="fw-bold"><%=store.getName() %></div>
                                <%=store.getBusinessLicenseNumber() %>
                            </div>
                            <a href="menuRegFormPage.jsp?storeId=<%=store.getId() %>&&fromUserDetails=true"  class="btn btn-light btn-sm my-3 mx-2" >메뉴 등록</a>
                            <a href="deleteStore.jsp?storeId=<%=store.getId() %>"  class="btn btn-danger btn-sm my-3" >삭제</a>
                        </li>
<%  
		}   
%>
                    </ol>
                </div>
            </div>
        </div>
    </div>
<% 
	} 
%>
<% 
	if (!reviews.isEmpty()) {		
%>                    
    <div class="row justify-content-center align-items-center mt-3">
        <div class="col-md-7">
            <div class="card shadow p-3 mb-5 bg-white rounded">
                <div class="card-header">
                    <p class="my-2">리뷰 목록</p>
                </div>
                <div class="card-body">
                    <ol class="list-group list-group-numbered">
<%  
		for (Review review : reviews) {  
%>
                        <li class="list-group-item d-flex justify-content-between align-items-start">
                            <div class="ms-2 me-auto">
                                <div class="fw-bold">가게명: <%=review.getStore().getName() %></div>
                                <%=review.getText() %> 
                            </div>
                            <a href="deleteReview.jsp?storeId=<%=review.getStore().getId() %>&reviewId=<%=review.getId() %>&fromUserDetails=true"  class="btn btn-danger btn-sm my-3" >삭제</a>
                        </li>
<%  
		}   
%>
                    </ol>
                </div>
            </div>
        </div>
    </div>
<% 
	} 
%>




</div>
</body>
</html>