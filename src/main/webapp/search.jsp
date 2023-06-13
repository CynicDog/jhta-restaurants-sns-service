<%@page import="vo.Food"%>
<%@page import="dao.FoodDao"%>
<%@page import="dao.StoreDao"%>
<%@page import="java.util.List"%>
<%@page import="vo.Store"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	FoodDao foodDao = FoodDao.getInstance();
	List<Food> foodList = foodDao.getFoodByCategory("test_category");
													// 응답값 														
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 맛집 베스트 순위</title>
<style type="text/css">
header,h1 {

    font-size: 100%
}

.basic-info-list {
	padding-top: 100px;
	font-size: 16px;
	text-align: center;
}

.store_img {
    display:inline-block;
}

.textbox {
    display:inline;
 	width: 250px;
 	height: 250px;
 	border-left: 1px solid #dbdbdb;
}

.store_list {
    display:flex;
    justify-content: center;
}

</style>
</head>
<body>

<jsp:include page="nav.jsp">
	<jsp:param name="menu" value="홈"/>
</jsp:include>	

<article class="contents">
	<header class="basic-info-list">
	    	<div class="inner" style="padding-bottom: 10px">
	      		<h1 class="title"><%=foodList.get(0).getCategory() %> 맛집 베스트 순위</h1>
	      							<!-- 응답값 넣을 때 바꾸기 -->
	     	</div>
	</header>
<% 
	for (Food food : foodList) {
%>
	<div class=store_list>
		<div class=store_img>
			<a href="/storeDetail.jsp">				
				<img alt="이미지텍스트대체" src="<%=food.getPictureLocation() %>"  width=250px height=250px; >
			</a>
		</div>
		<ol class=textbox style="text-align: left">
			<li>
				<span>
					<a href="/storeDetail.jsp"><strong><%=food.getStore().getName() %></strong></a>
				</span>
					<p><%=food.getStore().getAddress() %></p>
					<p><%=food.getStore().getText() %></p>
					<div style="text-align: right">
						<a href="/storeDetail.jsp">리뷰 보러가기></a>
					</div>
			</li>
		</ol>
	</div>		
<%
}
%>	
			
</article>
</body>
</html>