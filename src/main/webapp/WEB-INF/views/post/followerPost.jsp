<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    
    <style type="text/css">
    	img{
    		width: 100%;
    		height: 250px;
    		object-fit:cover;
    		filter: brightness(70%);
    	}
    	.card-img-overlay{
    		position: absolute;
  			top:30%;
  			font-size: 22px;
    	}
    </style>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="wrap">
	<div class="container border-top mt-3" >
		<div class="row text-center border-bottom">
			<div class="col-12 my-5">
				<h2>Follower Post</h2>
				<h4 class="text-secondary">( 내가 팔로우한 사람들의 포스팅 확인해보세요! )</h4>
			</div>
		</div>
	</div>
	<div class="container justify-content-center align-items-center">
		<div class="row mt-4 mb-3">
			<div class="col-4 my-3">
       			<p class="my-2"><strong>리뷰어 닉네임</strong></p>
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">

					<div class="card-img-overlay">
						<p><strong>인생 카페 10선</strong></p>
					</div>
					
				</div>
				<p class="text-end text-secondary" style="margin: 0;">3분전</p>
			</div>
			<div class="col-4 my-3">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<div class="card-header text-end " onclick="location.href='post'">
	          			<p class="my-2">리뷰어 닉네임</p>
	        		</div>
					
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">

					<div class="card-img-overlay">
						<p><strong>인생 카페 10선</strong></p>
					</div>
					
				</div>
				<p class="text-end text-secondary" style="margin: 0;">3분전</p>
			</div>
			<div class="col-4 my-3">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<div class="card-header text-end " onclick="location.href='post'">
	          			<p class="my-2">리뷰어 닉네임</p>
	        		</div>
					
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">

					<div class="card-img-overlay">
						<p><strong>인생 카페 10선</strong></p>
					</div>
					
				</div>
				<p class="text-end text-secondary" style="margin: 0;">3분전</p>
			</div>
			<div class="col-4 my-3">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<div class="card-header text-end " onclick="location.href='post'">
	          			<p class="my-2">리뷰어 닉네임</p>
	        		</div>
					
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">

					<div class="card-img-overlay">
						<p><strong>인생 카페 10선</strong></p>
					</div>
					
				</div>
				<p class="text-end text-secondary" style="margin: 0;">3분전</p>
			</div>
			<div class="col-4 my-3">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<div class="card-header text-end " onclick="location.href='post'">
	          			<p class="my-2">리뷰어 닉네임</p>
	        		</div>
					
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">

					<div class="card-img-overlay">
						<p><strong>인생 카페 10선</strong></p>
					</div>
					
				</div>
				<p class="text-end text-secondary" style="margin: 0;">3분전</p>
			</div>
			<div class="col-4 my-3">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<div class="card-header text-end " onclick="location.href='post'">
	          			<p class="my-2">리뷰어 닉네임</p>
	        		</div>
					
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">

					<div class="card-img-overlay">
						<p><strong>인생 카페 10선</strong></p>
					</div>
					
				</div>
				<p class="text-end text-secondary" style="margin: 0;">3분전</p>
			</div>
			<div class="col-4 my-3">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<div class="card-header text-end " onclick="location.href='post'">
	          			<p class="my-2">리뷰어 닉네임</p>
	        		</div>
					
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">

					<div class="card-img-overlay">
						<p><strong>인생 카페 10선</strong></p>
					</div>
					
				</div>
				<p class="text-end text-secondary" style="margin: 0;">3분전</p>
			</div>
			<div class="col-4 my-3">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<div class="card-header text-end " onclick="location.href='post'">
	          			<p class="my-2">리뷰어 닉네임</p>
	        		</div>
					
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">

					<div class="card-img-overlay">
						<p><strong>인생 카페 10선</strong></p>
					</div>
					
				</div>
				<p class="text-end text-secondary" style="margin: 0;">3분전</p>
			</div>
			<div class="col-4 my-3">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<div class="card-header text-end " onclick="location.href='post'">
	          			<p class="my-2">리뷰어 닉네임</p>
	        		</div>
					
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">

					<div class="card-img-overlay">
						<p><strong>인생 카페 10선</strong></p>
					</div>
					
				</div>
				<p class="text-end text-secondary" style="margin: 0;">3분전</p>
			</div>
			<div class="col-4 my-3">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<div class="card-header text-end " onclick="location.href='post'">
	          			<p class="my-2">리뷰어 닉네임</p>
	        		</div>
					
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">

					<div class="card-img-overlay">
						<p><strong>인생 카페 10선</strong></p>
					</div>
					
				</div>
				<p class="text-end text-secondary" style="margin: 0;">3분전</p>
			</div>
		</div>
			
	
	
	</div>
	<%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>