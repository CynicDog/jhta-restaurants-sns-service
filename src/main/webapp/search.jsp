<%@page import="vo.Food"%>
<%@page import="dao.FoodDao"%>
<%@page import="dao.StoreDao"%>
<%@page import="java.util.List"%>
<%@page import="vo.Store"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	FoodDao foodDao = FoodDao.getInstance();
	List<Food> foodList = foodDao.getFoodByCategory();
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

<%
	for (Food food : foodList) {
%>	

<article class="contents">
	<header class="basic-info-list">
	    	<div class="inner" style="padding-bottom: 10px">
	      		<h1 class="title"><%=food.getCategory() %> 맛집 베스트 순위</h1>
	     	</div>
	</header>
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
	<div class=store_list>
		<div class=store_img>
			<a href="/storeDetail.jsp">
				<img alt="이미지텍스트대체" src=""  width=250px height=250px; >
			</a>
		</div>
		<ol class=textbox style="text-align: left">
			<li>
				<span>
					<a href="/storeDetail.jsp"><strong>가게명</strong></a>
				</span>
					<p>가게주소</p>
					<p>가게소개</p>
					<div style="text-align: right">
						<a href="/storeDetail.jsp">리뷰 보러가기></a>
					</div>
			</li>
		</ol>
	</div>		
	<div class=store_list>
		<div class=store_img>
			<a href="/storeDetail.jsp">
				<img alt="이미지텍스트대체" src=""  width=250px height=250px; >
			</a>
		</div>
		<ol class=textbox style="text-align: left">
			<li>
				<span>
					<a href="/storeDetail.jsp"><strong>가게명</strong></a>
				</span>
					<p>가게주소</p>
					<p>가게소개</p>
					<div style="text-align: right">
						<a href="/storeDetail.jsp">리뷰 보러가기></a>
					</div>
			</li>
		</ol>
	</div>		
	<div class=store_list>
		<div class=store_img>
			<a href="/storeDetail.jsp">
				<img alt="이미지텍스트대체" src=""  width=250px height=250px; >
			</a>
		</div>
		<ol class=textbox style="text-align: left">
			<li>
				<span>
					<a href="/storeDetail.jsp"><strong>가게명</strong></a>
				</span>
					<p>가게주소</p>
					<p>가게소개</p>
					<div style="text-align: right">
						<a href="/storeDetail.jsp">리뷰 보러가기></a>
					</div>
			</li>
		</ol>
	</div>		
</article>
</body>
</html>