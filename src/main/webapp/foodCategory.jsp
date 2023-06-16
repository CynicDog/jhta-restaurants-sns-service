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
	String category = request.getParameter("foodCategory");
	System.out.println(category);
	List<Store> storeList = null;

	FoodDao foodDao = FoodDao.getInstance();
	StoreDao storeDao = StoreDao.getInstance();
	StorePictureDao storePictureDao = StorePictureDao.getInstance();
	StoreOpenTimeDao storeOpenTimeDao = StoreOpenTimeDao.getInstance();
	ReviewDao reviewDao = ReviewDao.getInstance();

	if (category == null) {	// search.jsp : 전체
		storeList = storeDao.getAllStores();
		
	} else {				// search.jsp?foodCategory=한식
			System.out.println("category:"+category);
		storeList = storeDao.getStoresByFoodCategory(category);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 카테고리별 맛집</title>
<style type="text/css">

img {
	object-fit: cover;
}

.card-container {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	justify-items: center;
	align-items: center;
	gap: 20px;
}

.category {
	padding: 10px;
	font-size: 16px;
	text-align: center;
	margin-bottom: 40px; 
}

.card {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}



</style>
</head>
<body>

<jsp:include page="nav.jsp">
	<jsp:param name="menu" value="searchFood"/>
</jsp:include>	

<div class="container text-center">
	<header class="category">
	      		<h3 class="title">카테고리</h3>
	      						
				<a class="btn" role="button" href="foodCategory.jsp">전체</a>
				<a class="btn" role="button" href="foodCategory.jsp?foodCategory=korean">한식</a>
				<a class="btn" role="button" href="foodCategory.jsp?foodCategory=chinese">중식</a>
				<a class="btn" role="button" href="foodCategory.jsp?foodCategory=japanese">일식</a>
				<a class="btn" role="button" href="foodCategory.jsp?foodCategory=western">양식</a>
				<a class="btn" role="button" href="foodCategory.jsp?foodCategory=faseFood">패스트푸드</a>
				<a class="btn" role="button" href="foodCategory.jsp?foodCategory=snack">분식</a>
				<a class="btn" role="button" href="foodCategory.jsp?foodCategory=asian">아시안</a>
				<a class="btn" role="button" href="foodCategory.jsp?foodCategory=disert">디저트</a>
		   	     	
	</header>	
	<div class="row">
<% 
			for (Store store : storeList) {
	                	int storeId = store.getId();
	                	StorePicture storePicture = storePictureDao.getStorePictureByStoreId(storeId);
	                	StoreOpentime storeOpenTime = storeOpenTimeDao.getStoreOpenTimeById(storeId);
	                	List<Review> reviews = reviewDao.getReviewsByStoreId(storeId); 
	                	
	                	double avgRating = reviews.stream()
	                			.mapToDouble(review -> review.getRating())
	                			.average()
	                			.orElse(0.0);

	                %>
		                <div class="col-4">
		               
		                    <div class="card m-2 sm-14 shadow bg-body rounded">
		                        <div class="embed-responsive embed-responsive-4by3">
		                        	<% if(storePicture != null){%>
			                            <a href="storeDetail.jsp?storeId=<%=storeId %>"><img src="resources/storePicture/<%=storePicture.getFileLocation() %>"
			                                            class="card-img-top embed-responsive-item" alt="..." ></a>
		                            <%}else {%>
									    <a href="storeDetail.jsp?storeId=<%=storeId %>"><img src="resources/storePicture/Color.png"
									    			class="card-img-top embed-responsive-item" alt="..."></a>
									<% } %>
		                        </div>
		                        
		                        <div class="card-body" style=" cursor: pointer;" onclick="location.href='storeDetail.jsp?storeId=<%=storeId %>';">
		                            <h5 class="card-title"><%=store.getName() %></h5>
		                            <p class="card-text"><%=store.getPhone() %></p>
		                            <p class="card-text"><%=avgRating %></p>
		                            <p class="card-text"><%=store.getPhone() %></p>
		                            
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