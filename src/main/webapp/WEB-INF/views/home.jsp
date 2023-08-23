<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ include file="common/navbar.jsp"%>      
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Application</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
    	.wrap{
    		position: relative;
  			min-height: 100%;
  			padding-bottom: 100px;
    	}
    	
    	.card-img-overlay{
    		position: absolute;
  			top: 30%;
  			font-size: 22px;
    	}
    	
    	img{
    		width: 100%;
    		height: 200px;
    		object-fit:cover;
    		filter: brightness(70%);
    	}
    	
    	.search-bar {
      		width: 800px;
    }
</style>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    
</head>
<body>
<div class="wrap">
	<div class="container">
		<div class= "row ">
			<div class= "col-12">
				<div class="row border-bottom">
					<div class="col-12 mt-4">
						<form action="/store/search" method="GET">
							<div class="mx-auto my-5 search-bar input-group">
								<input name="keyword" type="text"
									class="form-control rounded-pill" placeholder="지역 또는 가게명 입력"
									aria-label="Recipient's username"
									aria-describedby="button-addon2">
								<div class="input-group-append"></div>
								<!--  <button class="btn btn-search btn-dark rounded-pill ms-2">검색</button> -->
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col">
				<h4 class="my-3">팔로워의 포스트</h4>
			</div>
			<div class="col text-end">
				<button type="button" class="btn btn-outline-secondary my-3" onclick="location.href='/post/followerPost'"> more</button>
			</div>
		</div>
		<div class="row mb-3 border-bottom">
			
				<div class="col-4 mb-4">
					<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post/followerPost/detail?id=76'" style=" cursor: pointer;">
						<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">
	
						<div class="card-img-overlay">
							<p><strong>인생 카페 10선</strong></p>
						</div>
					</div>
				</div>
			
			<div class="col-4">
				<div class="card text-center text-light shadow" >
					<a href=""><img src="../resources/image/unagidon.jpg" class="card-img-top rounded" alt="..."></a>
					<div class="card-img-overlay">
						<p>인생 카페 10선</p>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card shadow" >
					<a href=""><img src="../resources/image/cafe2.jpg" class="card-img-top rounded" alt="..."></a>
				</div>
			</div>
		</div>
		
		<div class="row mt-3">
			<div class="col">
				<h4 class="my-3">팔로워의 리뷰</h4>
			</div>
			<div class="col text-end">
				<button type="button" class="btn btn-outline-secondary my-3" onclick="location.href='/review/follower'"> more</button>
			</div>
		</div>
		<div class="row mb-3 border-bottom">
			<div class="col-4 mb-4">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">

					<div class="card-img-overlay">
						<p><strong>인생 카페 10선</strong></p>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card text-center text-light shadow" >
					<a href=""><img src="../resources/image/unagidon.jpg" class="card-img-top rounded" alt="..."></a>
					<div class="card-img-overlay">
						<p>인생 카페 10선</p>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card shadow" >
					<a href=""><img src="../resources/image/cafe2.jpg" class="card-img-top rounded" alt="..."></a>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col">
				<h4 class="my-3">인기 맛집</h4>
			</div>
			<div class="col text-end">
				<button type="button" class="btn btn-outline-secondary my-3"> more</button>
			</div>
		</div>
		<div class="row mb-3 border-bottom">
			<div class="col-4 mb-4">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">

					<div class="card-img-overlay">
						<p><strong>인생 카페 10선</strong></p>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card text-center text-light shadow" >
					<a href=""><img src="../resources/image/unagidon.jpg" class="card-img-top rounded" alt="..."></a>
					<div class="card-img-overlay">
						<p>인생 카페 10선</p>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card shadow" >
					<a href=""><img src="../resources/image/cafe2.jpg" class="card-img-top rounded" alt="..."></a>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col">
				<h4 class="my-3">인기 리뷰</h4>
			</div>
			<div class="col text-end">
				<button type="button" class="btn btn-outline-secondary my-3"> more</button>
			</div>
		</div>
		<div class="row mb-3 border-bottom">
			<div class="col-4 mb-4">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">

					<div class="card-img-overlay">
						<p><strong>인생 카페 10선</strong></p>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card text-center text-light shadow" >
					<a href=""><img src="../resources/image/unagidon.jpg" class="card-img-top rounded" alt="..."></a>
					<div class="card-img-overlay">
						<p>인생 카페 10선</p>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card shadow" >
					<a href=""><img src="../resources/image/cafe2.jpg" class="card-img-top rounded" alt="..."></a>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col">
				<h4 class="my-3">최근에 찾아본 맛집</h4>
			</div>
			<div class="col text-end">
				<button type="button" class="btn btn-outline-secondary my-3"> more</button>
			</div>
		</div>
		<div class="row mb-3 border-bottom">
			<div class="col-4 mb-4">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">

					<div class="card-img-overlay">
						<p><strong>인생 카페 10선</strong></p>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card text-center text-light shadow" >
					<a href=""><img src="../resources/image/unagidon.jpg" class="card-img-top rounded" alt="..."></a>
					<div class="card-img-overlay">
						<p>인생 카페 10선</p>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card shadow" >
					<a href=""><img src="../resources/image/cafe2.jpg" class="card-img-top rounded" alt="..."></a>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col">
				<h4 class="my-3">최근에 찾아본 맛집</h4>
			</div>
			<div class="col text-end">
				<button type="button" class="btn btn-outline-secondary my-3"> more</button>
			</div>
		</div>
		<div class="row mb-3 border-bottom">
			<div class="col-4 mb-4">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">

					<div class="card-img-overlay">
						<p><strong>인생 카페 10선</strong></p>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card text-center text-light shadow" >
					<a href=""><img src="../resources/image/unagidon.jpg" class="card-img-top rounded" alt="..."></a>
					<div class="card-img-overlay">
						<p>인생 카페 10선</p>
					</div>
				</div>
			</div>
			<div class="col-4">
				<div class="card shadow" >
					<a href=""><img src="../resources/image/cafe2.jpg" class="card-img-top rounded" alt="..."></a>
				</div>
			</div>
		</div>
	
	</div>
	<%@ include file="common/footer.jsp" %>
</div>

<script type="text/javascript">
	document.getElementById("form-navbar-search").style.display = "none";
</script>
</body>
</html>