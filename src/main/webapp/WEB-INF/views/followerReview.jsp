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
    		height: 300px;
    		object-fit:cover;
    	}
    </style>
<title>Insert title here</title>
</head>
<body>
<%@ include file="common/navbar.jsp" %>
<div class="wrap">
	<div class="container border-top mt-3" >
		<div class="row text-center border-bottom">
			<div class="col-12 my-5">
				<h2>Follower Review</h2>
				<h4 class="text-secondary">( 내가 팔로우한 사람들의 리뷰를 확인해보세요! )</h4>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row mt-4 mb-3">
			
			<div class="col-4 my-3">
				<div class="card text-bg-white shadow" style=" cursor: pointer;">
					<div class="card-header text-end " onclick="location.href='post'">
	          			<p class="my-2">리뷰어 닉네임</p>
	        		</div>
					<img src="../resources/image/cafe1.jpg" alt="...">
					<div class="card-body">
						<div class="row">
							<div class="col-6">
								<p style="font-size:22px;">가게이름</p>
							</div>
							<div class="col-6 text-end ">
								<strong class="text-warning ms-3" style="margin: 0; font-size:22px;">5.0</strong>
							</div>
						</div>
					</div>
				</div>
				<p class="text-end text-secondary" >3분전</p>
			</div>
			<div class="col-4 my-3">
          		<strong class="my-2 text-end" >리뷰어 닉네임</strong>
				<div class="card text-bg-white shadow rounded" style=" cursor: pointer;">
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">
					<div class="card-body">
						<div class="row">
							<div class="col-6">
								<p style="font-size:22px;">가게이름</p>
							</div>
							<div class="col-6 text-end ">
								<strong class="text-warning ms-3" style="margin: 0; font-size:22px;">5.0</strong>
							</div>
						</div>
					</div>
				</div>
				<p class="text-end text-secondary" >3분전</p>
			</div>
			<div class="col-4 my-3">
				<div class="card text-bg-white shadow" style=" cursor: pointer;">
					<div class="card-header text-end " onclick="location.href='post'">
	          			<p class="my-2">리뷰어 닉네임</p>
	        		</div>
					<img src="../resources/image/cafe1.jpg" alt="...">
					<div class="card-body">
						<div class="row">
							<div class="col-6">
								<p style="font-size:22px;">가게이름</p>
							</div>
							<div class="col-6 text-end ">
								<strong class="text-warning ms-3" style="margin: 0; font-size:22px;">5.0</strong>
							</div>
						</div>
					</div>
				</div>
				<p class="text-end text-secondary" >3분전</p>
			</div>
			<div class="col-4 my-3">
				<div class="card text-bg-white shadow" style=" cursor: pointer;">
					<div class="card-header text-end " onclick="location.href='post'">
	          			<p class="my-2">리뷰어 닉네임</p>
	        		</div>
					<img src="../resources/image/cafe1.jpg" alt="...">
					<div class="card-body">
						<div class="row">
							<div class="col-6">
								<p style="font-size:22px;">가게이름</p>
							</div>
							<div class="col-6 text-end ">
								<strong class="text-warning ms-3" style="margin: 0; font-size:22px;">5.0</strong>
							</div>
						</div>
					</div>
				</div>
				<p class="text-end text-secondary" >3분전</p>
			</div>
			<div class="col-4 my-3">
				<div class="card text-bg-white shadow" style=" cursor: pointer;">
					<div class="card-header text-end " onclick="location.href='post'">
	          			<p class="my-2">리뷰어 닉네임</p>
	        		</div>
					<img src="../resources/image/cafe1.jpg" alt="...">
					<div class="card-body">
						<div class="row">
							<div class="col-6">
								<p style="font-size:22px;">가게이름</p>
							</div>
							<div class="col-6 text-end ">
								<strong class="text-warning ms-3" style="margin: 0; font-size:22px;">5.0</strong>
							</div>
						</div>
					</div>
				</div>
				<p class="text-end text-secondary" >3분전</p>
			</div>
			<div class="col-4 my-3">
				<div class="card text-bg-white shadow" style=" cursor: pointer;">
					<div class="card-header text-end " onclick="location.href='post'">
	          			<p class="my-2">리뷰어 닉네임</p>
	        		</div>
					<img src="../resources/image/cafe1.jpg" alt="...">
					<div class="card-body">
						<div class="row">
							<div class="col-6">
								<p style="font-size:22px;">가게이름</p>
							</div>
							<div class="col-6 text-end ">
								<strong class="text-warning ms-3" style="margin: 0; font-size:22px;">5.0</strong>
							</div>
						</div>
					</div>
				</div>
				<p class="text-end text-secondary" >3분전</p>
			</div>
			<div class="col-4 my-3">
				<div class="card text-bg-white shadow" style=" cursor: pointer;">
					<div class="card-header text-end " onclick="location.href='post'">
	          			<p class="my-2">리뷰어 닉네임</p>
	        		</div>
					<img src="../resources/image/cafe1.jpg" alt="...">
					<div class="card-body">
						<div class="row">
							<div class="col-6">
								<p style="font-size:22px;">가게이름</p>
							</div>
							<div class="col-6 text-end ">
								<strong class="text-warning ms-3" style="margin: 0; font-size:22px;">5.0</strong>
							</div>
						</div>
					</div>
				</div>
				<p class="text-end text-secondary" >3분전</p>
			</div>
			<div class="col-4 my-3">
				<div class="card text-bg-white shadow" style=" cursor: pointer;">
					<div class="card-header text-end " onclick="location.href='post'">
	          			<p class="my-2">리뷰어 닉네임</p>
	        		</div>
					<img src="../resources/image/cafe1.jpg" alt="...">
					<div class="card-body">
						<div class="row">
							<div class="col-6">
								<p style="font-size:22px;">가게이름</p>
							</div>
							<div class="col-6 text-end ">
								<strong class="text-warning ms-3" style="margin: 0; font-size:22px;">5.0</strong>
							</div>
						</div>
					</div>
				</div>
				<p class="text-end text-secondary" >3분전</p>
			</div>
			<div class="col-4 my-3">
				<div class="card text-bg-white shadow" style=" cursor: pointer;">
					<div class="card-header text-end " onclick="location.href='post'">
	          			<p class="my-2">리뷰어 닉네임</p>
	        		</div>
					<img src="../resources/image/cafe1.jpg" alt="...">
					<div class="card-body">
						<div class="row">
							<div class="col-6">
								<p style="font-size:22px;">가게이름</p>
							</div>
							<div class="col-6 text-end ">
								<strong class="text-warning ms-3" style="margin: 0; font-size:22px;">5.0</strong>
							</div>
						</div>
					</div>
				</div>
				<p class="text-end text-secondary" >3분전</p>
			</div>
			<div class="col-4 my-3">
	          		<p class="my-2 text-end" >리뷰어 닉네임</p>
				<div class="card text-bg-white shadow" style=" cursor: pointer;">
					<img src="../resources/image/cafe1.jpg" alt="...">
					<div class="card-body">
						<div class="row">
							<div class="col-6">
								<p style="font-size:22px;">가게이름</p>
							</div>
							<div class="col-6 text-end ">
								<strong class="text-warning ms-3" style="margin: 0; font-size:22px;">5.0</strong>
							</div>
						</div>
					</div>
				</div>
				<p class="text-end text-secondary" >3분전</p>
			</div>
			
		</div>
	
	
	</div>
	<%@ include file="common/footer.jsp" %>
</div>
</body>
</html>