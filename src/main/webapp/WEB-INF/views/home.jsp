<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Application</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    
</head>
<body>
<%@ include file="homenavbar.jsp" %>
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
				<h4 class="my-3">팔로워의 리뷰</h4>
			</div>
			<div class="col text-end">
				<button type="button" class="btn btn-outline-secondary my-3" onclick="location.href='followerReview'"> more</button>
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

</body>
</html>