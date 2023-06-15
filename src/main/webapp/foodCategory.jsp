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
	if (category == null) {	// search.jsp : 전체
		storeList = storeDao.getAllStores();
		
	} else {				// search.jsp?foodCategory=한식
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
	padding-top: 20px;
	font-size: 16px;
	text-align: center;
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
	      						
		    <div id="test_btn_group" >	
				<a class="btn" role="button" href="search.jsp">전체</a>
				<a class="btn" role="button" href="search.jsp?foodCategory=한식">한식</a>
				<a class="btn" role="button" href="search.jsp?foodCategory=중식">중식</a>
				<a class="btn" role="button" href="search.jsp?foodCategory=일식">일식</a>
				<a class="btn" role="button" href="search.jsp?foodCategory=패스트푸드">패스트푸드</a>
				<a class="btn" role="button" href="search.jsp?foodCategory=찜, 탕, 찌개">찜, 탕, 찌개</a>
				<a class="btn" role="button" href="search.jsp?foodCategory=양식">양식</a>
				<a class="btn" role="button" href="search.jsp?foodCategory=분식">분식</a>
				<a class="btn" role="button" href="search.jsp?foodCategory=아시안">아시안</a>
				<a class="btn" role="button" href="search.jsp?foodCategory=디저트">디저트</a>
				<a class="btn" role="button" href="search.jsp?foodCategory=기타">기타</a>
		    </div>	     	
	</header>	
	<div class="row">
<% 
			for (Store stores : storeList) {
	                	int storeId = store.getId();
	                	StorePicture storePicture = storePictureDao.getStorePictureByStoreId(storeId);
	                %>
	               		<!-- <div class="col"></div> -->
		                <div class="col-9">
		                    <div class="card m-2 sm-14 shadow bg-body rounded">
		                        <div class="embed-responsive embed-responsive-4by3">
		                        	<% if(storePicture != null){%>
			                            <a href="storeDetail.jsp?storeId=<%=storeId %>"><img src="resources/reviewPicture/<%=storePicture.getFileLocation() %>"
			                                            class="card-img-top embed-responsive-item" alt="..." ></a>
		                            <%}else {%>
									    <a href="storeDetail.jsp?storeId=<%=storeId %>"><img src="resources/reviewPicture/스크린샷 2023-03-24 124359.png"
									    			class="card-img-top embed-responsive-item" alt="..."></a>
									<% } %>
		                        </div>
		                        
		                        <div class="card-body" style=" cursor: pointer;" onclick="location.href='storeDetail.jsp?storeId=<%=storeId %>';">
		                            <h5 class="card-title"><%=store.getName() %></h5>
		                            <p class="card-text"><%=store.getPhone() %></p>
		                        </div>
		                    </div>
		                </div>
	                <%
	                }
	                %>
					
	 
	</div>
	
	
	
	
	<div class=store_list>
		<div class=store_img>
			<a href="/resources/reviewPicture/pizza.jpg">				
				<img alt="이미지텍스트대체" src=""  width=250px height=250px; >
			</a>
		</div>
		
		<ol class=textbox style="text-align: left">
			<li>
				<span>
					<a href="/storeDetail.jsp"><strong><%=stores.getName() %></strong></a>
				</span>
					<p><%=stores.getAddress() %></p>
					<p><%=stores.getText() %></p>
			
			</li>
		</ol>
	</div>		
<%
	}
%>	
			
</div>
</body>
</html>