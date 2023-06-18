<%@page import="utils.StringUtils"%>
<%@page import="dto.StoreByRating"%>
<%@page import="utils.Pagination"%>
<%@page import="vo.Review"%>
<%@page import="dao.ReviewDao"%>
<%@page import="vo.StoreOpentime"%>
<%@page import="dao.StoreOpenTimeDao"%>
<%@page import="dao.StorePictureDao"%>
<%@page import="vo.StorePicture"%>
<%@page import="vo.Food"%>
<%@page import="dao.FoodDao"%>
<%@page import="dao.StoreDao"%>
<%@page import="java.util.List"%>
<%@page import="vo.Store"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// ----------------------------------미구현
	String keyword = StringUtils.nullToBlank(request.getParameter("keyword"));
	List<StoreByRating> storeList = null;

	FoodDao foodDao = FoodDao.getInstance();
	StoreDao storeDao = StoreDao.getInstance();
	StorePictureDao storePictureDao = StorePictureDao.getInstance();
	StoreOpenTimeDao storeOpenTimeDao = StoreOpenTimeDao.getInstance();
	ReviewDao reviewDao = ReviewDao.getInstance();

	//pagination
		int pageNo = -1; 
		if (request.getParameter("page") != null) { 
			pageNo = Integer.parseInt(request.getParameter("page"));
		} else {
			pageNo = 1; 							
		}
		
// 		int totalRows = storeDao.getTotalRowsByFoodCategory(category); 

// 		Pagination pagination = new Pagination(pageNo, totalRows); 
		
// 		int start = pagination.getStartingRow(); 	
// 		int end = pagination.getEndingRow();	 
		
// 		storeList = storeDao.getStoresPaginatedByCategory(start, end, category);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 카테고리별 맛집</title>
<style type="text/css">
img {
	object-fit: cover;
	width: 400px;
	height: 300px;
}

.category {
	padding: 10px;
	font-size: 16px;
	text-align: center;
	margin-bottom: 40px;
}

.card {
	/*
 	width: 100%; 
 	height: 100%; 
 	display: flex; 
 	flex-direction: column; 
 	justify-content: center;
 	align-items: center;
 	*/
	
}

.card-body {
	cursor: pointer;
	display: flex;
	justify-content: center;
}
</style>
</head>
<body>

<jsp:include page="nav.jsp">
	<jsp:param name="menu" value="searchFood"/>
</jsp:include>	

<div class="container text-center">
	<header class="category">
	      		<h3 class="title">검색 결과</h3>
	</header>	
	<div class="row">
<% 
			for (StoreByRating store : storeList) {
	                	int storeId = store.getId();
	                	StorePicture storePicture = storePictureDao.getStorePictureByStoreId(storeId);
	                	StoreOpentime storeOpenTime = storeOpenTimeDao.getStoreOpenTimeById(storeId);
	                	List<Review> reviews = reviewDao.getReviewsByStoreId(storeId); 
	                	
	                	double avgRating = reviews.stream()
	                			.mapToDouble(review -> review.getRating())
	                			.average()
	                			.orElse(0.0);
	                    String avgRatingStr = String.format("%.2f", avgRating);


	                %>
		                <div class="col-4" style="margin-bottom: 30px">
		               
		                    <div class="card m-2 sm-14 shadow bg-body rounded " >
		                        <div class="embed-responsive embed-responsive-4by3">
		                        	<% if(storePicture != null){%>
			                            <a href="storeDetail.jsp?storeId=<%=storeId %>">
			                            <img src="resources/storePicture/<%=storePicture.getFileLocation() %>"
			                                            class="card-img-top embed-responsive-item" alt="..." ></a>
		                            <%}else {%>
									    <a href="storeDetail.jsp?storeId=<%=storeId %>">
									    <img src="resources/storePicture/Color.png"
									    			class="card-img-top embed-responsive-item" alt="..."></a>
									<% } %>
		                        </div>
		                        
		                        <div class="card-body"  onclick="location.href='storeDetail.jsp?storeId=<%=storeId %>';">
		                            <p class="card-text" style="margin-left: 20px; margin-bottom:0px; margin-right: 20px; font-size: 25px; display: flex; align-items: center;"><%=store.getName() %></p>
		                            <p class="card-text" style="margin-left: 20px; margin-bottom:0px; margin-right: 20px; font-size: 25px; display: flex; align-items: center;"><%=avgRatingStr %></p>
		                        </div>
		                    </div>
		                </div>
	                <%
	                }
	                %>
	</div>
				
</div>


</body>
</html>