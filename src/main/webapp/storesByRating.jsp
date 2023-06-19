<%@page import="dao.StorePictureDao"%>
<%@page import="vo.StorePicture"%>
<%@page import="dto.StoreByRating"%>
<%@page import="vo.Review"%>
<%@page import="dao.ReviewDao"%>
<%@page import="vo.Food"%>
<%@page import="dao.FoodDao"%>
<%@page import="vo.Store"%>
<%@page import="java.util.List"%>
<%@page import="utils.Pagination"%>
<%@page import="dao.StoreDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ReviewDao reviewDao = ReviewDao.getInstance();
	StoreDao storeDao = StoreDao.getInstance(); 
	StorePictureDao storePictureDao = StorePictureDao.getInstance();
	
	int pageNo = -1; 
	if (request.getParameter("page") != null) { 
		pageNo = Integer.parseInt(request.getParameter("page"));
	} else {
		pageNo = 1; 							
	}
	
	int totalRows = storeDao.getTotalRows(); 

	Pagination pagination = new Pagination(pageNo, totalRows); 
	
	int start = pagination.getStartingRow(); 	
	int end = pagination.getEndingRow();	 
	
	List<StoreByRating> stores = storeDao.getStoresPaginated(start, end);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <style>
    	.a-tag-no-dec {
    	 	color: black;
    	 	text-decoration: none;
    	 	font-size: large; 
    		font-weight: bold
    	}
    	img {
            	height: 380px;
                object-fit: cover;
            }  
    	
    </style>
</head>
<body>
    <jsp:include page="nav.jsp">
        <jsp:param name="menu" value="홈"/>
    </jsp:include>
<div class="container-fluid text-center">
	<h3 class="title my-3">평점순</h3>
	<div class=row> 
	<div class=col-2></div>
		<div class=col>
	    	<div class="row my-4">
	            <div class="row mx-1" >
	<% for (StoreByRating store : stores) { 
		int storeId = store.getId();
		StorePicture storePicture = storePictureDao.getStorePictureByStoreId(storeId);
		
		String avgRatingStr = String.format("%.2f", store.getReviewAvg());
	%>              
	                
	                <div class="col-4">
	                    <div class="card m-2 sm-14 shadow bg-body rounded">
	                        <div class="embed-responsive embed-responsive-4by3">
	                            <% if(storePicture != null){%>
				                            <a href="storeDetail.jsp?storeId=<%=storeId %>"><img src="resources/storePicture/<%=storePicture.getFileLocation() %>"
				                                            class="card-img-top embed-responsive-item" alt="..." ></a>
			                    <%}%>
	                        </div>
	                        <div class="card-body" style="cursor: pointer; font-weight:bold; font-size:x-large;" onclick="">
	                        	<p class="card-text" style="margin-left: 20px; margin-bottom:0px; margin-right: 20px; font-size: 25px; display: flex; align-items: center; font-weight:bold;"><%=store.getName() %></p>
		                        <p class="card-text" style="margin-left: 20px; margin-bottom:0px; margin-right: 20px; font-size: 25px; display: flex; align-items: center; color: #FFC107; font-weight:bold;"><%=avgRatingStr %></p>
	                        
	                            <%-- <a class="card-title a-tag-no-dec" href="storeDetail.jsp?storeId=<%=store.getId() %>"><%=store.getName() %></a>
	                            <p class="card-text" style="color: #FFC107;"><%=avgRatingStr %></p> --%>
	                        </div>
	                    </div>
	                </div>
	                
	<% } %>              
	            </div>
	        </div>
		</div>
	<div class=col-2></div>	        
    </div>
        <div class="col-1"></div>
    </div>
    <nav>
				<ul class="pagination justify-content-center">
					<li class="page-item <%=pageNo <= 1 ? "disabled" : ""%>">
						<a href="storesByRating.jsp?page=<%=pageNo - 1%>" class="page-link">이전</a>
					</li>
<%
	for (int num = pagination.getStartingPage(); num <= pagination.getEndingPage(); num++) {
%>
					<li class="page-item <%=pageNo == num? "active" : ""%>">
						<a href="storesByRating.jsp?page=<%=num%>" class="page-link"><%=num%></a> 
					</li>
<%
	}
%>
					<li class="page-item <%=pageNo >= pagination.getTotalPages() ? "disabled" : ""%>">
						<a href="storesByRating.jsp?page=<%=pageNo + 1%>" class="page-link">다음</a>
					</li>
				</ul>
			</nav>
</div>
</body>
</html>