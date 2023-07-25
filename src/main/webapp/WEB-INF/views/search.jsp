<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>검색결과</title>
   <style type="text/css">
   
	img {
		object-fit: cover;
		width: 200px;
		height: 150px;
	}
	
	.category {
		padding: 10px;
		font-size: 16px;
		text-align: center;
		margin-bottom: 40px;
	}
	
	
	.card-body{
		cursor: pointer; 
		font-weight:bold; 
	}
	
	.card-text{
		margin-left: 20px; 
		margin-bottom:0px; 
		margin-right: 20px;
		font-size: 25px; 
		display: flex; 
		align-items: center;
	}
</style>
   
   
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>

<jsp:include page="nav.jsp">
	<jsp:param name="menu" value="search"/>
</jsp:include>	

<div class="container text-center">
	<header></header>
		<h4 class="title">카테고리</h4>					
				<a class="btn" role="button" href="searchByCategory.jsp">전체</a>
				<a class="btn" role="button" href="searchByCategory.jsp?category=korean">한식</a>
				<a class="btn" role="button" href="searchByCategory.jsp?category=chinese">중식</a>
				<a class="btn" role="button" href="searchByCategory.jsp?category=japanese">일식</a>
				<a class="btn" role="button" href="searchByCategory.jsp?category=western">양식</a>
				<a class="btn" role="button" href="searchByCategory.jsp?category=fastFood">패스트푸드</a>
				<a class="btn" role="button" href="searchByCategory.jsp?category=snack">분식</a>
				<a class="btn" role="button" href="searchByCategory.jsp?category=asian">아시안</a>
				<a class="btn" role="button" href="searchByCategory.jsp?category=dessert">디저트</a>
		<div class="row mb-3">
			<div class="col-1"></div>
			<div class="col-7">
				<div class="row mb-3">
				
<%
					for(int i=0; i<4; i++){
%>
					<div class="col-5">
						<div class="card m-2 sm-14 shadow bg-body rounded ">
							<div class="embed-responsive embed-responsive-4by3">
								 <img src="/jhta-restaurants-sns-service/src/main/resources/image/검색결과 col.png">
							</div>
							<div class="card-body">
								<p class="card-text">${store }</p>
								<p class="card-text" style="color: #FFC107;">평점</p>
							</div>
						</div>
					</div>
<%
					}
%>
				</div>
			</div>


			<div class="col-1"></div>
			
			<div class="col-3">
				<div class="card m-2 sm-14 shadow bg-body rounded ">
					<p>지도</p>
				</div>
				<div class="card m-2 sm-14 shadow bg-body rounded ">
					<p>맛집 리스트</p>
				</div>
				
				
				
			</div>
		</div>

	</div>
	
	<jsp:include page="footer.jsp">
		<jsp:param name="menu" value="search"/>
	</jsp:include>	
	
</body>
</html>