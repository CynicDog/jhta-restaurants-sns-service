<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="common/navbar.jsp" %>
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

<div class="wrap">
	<div class="container">
		<div class="row mt-3">
			<div class="col">
				<h4 class="my-3 text-secondary"><strong>Recent Post</strong></h4>
			</div>
			<div class="col text-end">
				<button type="button" class="btn text-muted my-3" onclick="location.href='/post/allPosts'"> more</button>
			</div>
		</div>
		<div class="row mb-3 border-bottom">
			
			<c:forEach var="data" items="${recentPosts }" >
				<div class="col-4 mb-4">
					<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='allPost/detail?id=${data.id}'" style=" cursor: pointer;">
						<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">
	
						<div class="card-img-overlay">
							<div><strong>${data.title }</strong></div>
							<div class="text-white" style="opacity:80%;">( ${data.subTitle } )</div>
						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
		
		<sec:authorize access="isAuthenticated()">
			<div class="row mt-3">
				<div class="col">
					<h4 class="my-3 text-secondary"><strong>Follower Post</strong></h4>
				</div>
				<div class="col text-end">
					<button type="button" class="btn text-muted my-3" onclick="location.href='/post/followerPosts'"> more</button>
				</div>
			</div>
			<div class="row mb-3 border-bottom">
				
				<c:forEach var="followerPostData" items="${recentPostsOfFollower }" >
					<div class="col-4 mb-4">
						<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='followerPost/detail?id=${data.id}'" style=" cursor: pointer;">
							<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">
		
							<div class="card-img-overlay">
								<div><strong>${followerPostData.title }</strong></div>
								<div class="text-white" style="opacity:80%;">( ${followerPostData.subTitle } )</div>
							</div>
						</div>
					</div>
				</c:forEach>
				
			</div>
			
			<div class="row mt-3">
				<div class="col">
					<h4 class="my-3 text-secondary"><strong>Follower Review</strong></h4>
				</div>
				<div class="col text-end">
					<button type="button" class="btn text-muted my-3" onclick="location.href='/review/follower'"> more</button>
				</div>
			</div>
			<div class="row mb-3 border-bottom">
				<c:forEach var="data" items="${posts }" >
					<div class="col-4 mb-4">
						<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='/review/detail?id=${data.review.id}'" style=" cursor: pointer;">
							<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">
		
							<div class="card-img-overlay">
								<div><strong>${data.title }</strong></div>
								<div class="text-white" style="opacity:80%;">( ${data.subTitle } )</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</sec:authorize>
		
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