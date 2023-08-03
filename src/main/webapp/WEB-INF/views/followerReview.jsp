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
	<div class="container">
		<div class="row mt-4 mb-3">
			<div class="col-4 my-3">
				<div class="card text-bg-light shadow" style=" cursor: pointer;">
					<div class="card-header" onclick="location.href='post'">
	          			<p class="my-2">포스팅의 제목과 소제목을 적어주세요!</p>
	        		</div>
					<img src="../resources/image/cafe1.jpg" alt="...">
					<div class="card-body d-flex">
						<h4>가게이름</h4>
						
					</div>
				</div>
			</div>
			<div class="col-4 my-3">
				<div class="card text-center text-light shadow" >
					<a href=""><img src="../resources/image/unagidon.jpg" class="card-img-top rounded" alt="..."></a>
				</div>
			</div>
			<div class="col-4 my-3">
				<div class="card shadow" >
					<a href=""><img src="../resources/image/cafe2.jpg" class="card-img-top rounded" alt="..."></a>
				</div>
			</div>
			
			<div class="col-4 my-3">
				<div class="card text-bg-light shadow" style=" cursor: pointer;">
					<div class="card-header" onclick="location.href='post'">
	          			<p class="my-2">포스팅의 제목과 소제목을 적어주세요!</p>
	        		</div>
					<img src="../resources/image/cafe1.jpg" alt="...">
					<div class="card-body">
					</div>
				</div>
			</div>
			<div class="col-4 my-3">
				<div class="card text-center text-light shadow" >
					<a href=""><img src="../resources/image/unagidon.jpg" class="card-img-top rounded" alt="..."></a>
				</div>
			</div>
			<div class="col-4 my-3">
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