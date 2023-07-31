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
<%@ include file="common/navbar.jsp" %>
<div class="wrap">
	<div class="container border-top mt-3" >
		<div class="row text-center border-bottom">
			<div class="col-12 my-5">
				<h2>내가 뽑은 맛있는 카페 10선</h2>
				<h4 class="text-secondary">( 종로에서 내가 가고 싶었던 인생 카페 )</h4>
			</div>
		</div>
	</div>
	<div class="container mt-2" >
		<div class="row border-bottom">
			<div class="col-1"></div>
			<div class="col-3 my-5">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">
				</div>
			</div>
			<div class="col-6 my-5 text-left">
				<div class="d-flex">
					<h3>1. 망우로30</h3>
					<button class="btn-type-icon ms-3" >
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
	  						<path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
						</svg>
					</button>
				</div>
				<p class="text-secondary">서울특별시 동대문구 망우로 30</p>
			</div>
			<div class="col-2 my-5">
				<h3 class="text-warning">5.0</h3>
			</div>
		</div>
	</div>
	<div class="container mt-2" >
		<div class="row text-center border-bottom">
			<div class="col-12 my-5">
				
			</div>
		</div>
	</div>
	<%@ include file="common/footer.jsp" %>
</div>
</body>
</html>