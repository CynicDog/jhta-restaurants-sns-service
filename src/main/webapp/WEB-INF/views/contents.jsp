<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
<%@ include file="common/navbar.jsp" %>

<div class="wrap">
	<div class="container">
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
		</div>
	</div>	
</div>
</body>
</html>