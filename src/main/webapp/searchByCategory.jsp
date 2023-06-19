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

	String category = null; 
	if (request.getParameter("category") != null) { 
	 	category = request.getParameter("category");
	}
	
	if ("null".equals(category)) {
		category = null; 
	}
 
	List<StoreByRating> storeList = null;

	FoodDao foodDao = FoodDao.getInstance();
	StoreDao storeDao = StoreDao.getInstance();
	StorePictureDao storePictureDao = StorePictureDao.getInstance();
	StoreOpenTimeDao storeOpenTimeDao = StoreOpenTimeDao.getInstance();
	ReviewDao reviewDao = ReviewDao.getInstance();

	//pagination + categorization
		int pageNo = -1; 
		if (request.getParameter("page") != null) { 
			pageNo = Integer.parseInt(request.getParameter("page"));
		} else {
			pageNo = 1; 							
		}
		
		int totalRows = storeDao.getTotalRowsByFoodCategory(category); 
		System.out.println("totalRows:"+totalRows);

		Pagination pagination = new Pagination(pageNo, totalRows); 
		
		int start = pagination.getStartingRow(); 
		System.out.println("start:"+start);

		int end = pagination.getEndingRow();	 
		System.out.println("end:"+end);

		
		storeList = storeDao.getStoresPaginatedByCategory(start, end, category);

		storeList.stream()
				.map(store -> store.getId())
				.forEach(System.out::println); // 4 
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
	      		<h3 class="title">카테고리</h3>
	      						
				<a class="btn" role="button" href="searchByCategory.jsp">전체</a>
				<a class="btn" role="button" href="searchByCategory.jsp?category=korean">한식</a>
				<a class="btn" role="button" href="searchByCategory.jsp?category=chinese">중식</a>
				<a class="btn" role="button" href="searchByCategory.jsp?category=japanese">일식</a>
				<a class="btn" role="button" href="searchByCategory.jsp?category=western">양식</a>
				<a class="btn" role="button" href="searchByCategory.jsp?category=fastFood">패스트푸드</a>
				<a class="btn" role="button" href="searchByCategory.jsp?category=snack">분식</a>
				<a class="btn" role="button" href="searchByCategory.jsp?category=asian">아시안</a>
				<a class="btn" role="button" href="searchByCategory.jsp?category=disert">디저트</a>
		   	     	
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
		                        	<%
		                        	// System.out.println("storeId :"+ storeId);
		                        	if(storePicture != null){%>
			                            <a href="storeDetail.jsp?storeId=<%=storeId %>">
			                            <img src="resources/storePicture/<%=storePicture.getFileLocation() %>"
			                                            class="card-img-top embed-responsive-item" alt="..." ></a>
		                            <%}else { 
		                             
		                            %>
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
 <nav>
				<ul class="pagination justify-content-center">
					<li class="page-item <%=pageNo <= 1 ? "disabled" : ""%>">
						<a href="searchByCategory.jsp?page=<%=pageNo - 1%>" class="page-link">이전</a>
					</li>
<%
	for (int num = pagination.getStartingPage(); num <= pagination.getEndingPage(); num++) {
%>
					<li class="page-item <%=pageNo == num? "active" : ""%>">
	
					
						<a href="searchByCategory.jsp?page=<%=num%>&category=<%=category %>" class="page-link"><%=num%></a> 
					</li>
<%
	}
%>
					<li class="page-item <%=pageNo >= pagination.getTotalPages() ? "disabled" : ""%>">
						<a href="searchByCategory.jsp?page=<%=pageNo + 1%>" class="page-link">다음</a>
					</li>
				</ul>
			</nav>
</body>
</html>