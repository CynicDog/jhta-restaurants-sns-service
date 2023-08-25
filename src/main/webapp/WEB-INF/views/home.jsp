<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
  
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

<%@ include file="common/navbar.jsp"%>

<div class="wrap">
	<div class="container-fluid">
		<div class= "row ">
			<div class= "col-12">
				<div class="row border-bottom">
					<div class="col-12">
						<form action="/store/search" method="GET">
							<div class="mx-auto my-5 search-bar input-group" style="width: 60%;" >
								<input name="keyword" type="text"
									class="form-control rounded-pill" placeholder="지역 또는 가게명 입력"
									aria-label="Recipient's username"
									aria-describedby="button-addon2" ">
								<div class="input-group-append"></div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class= "row d-flex justify-content-between mt-3">
			<div class="col-2">
				<div class="row">
					<div class="col">
						<div class="card text-center text-light font-weight-bold shadow mt-3" onclick="location.href='/post'" style="cursor: pointer;">
							<img src="resources/image/cafe1.jpg" class="card-img-top rounded" alt="..." 
								 style="width: 100%; height: 100px; object-fit:cover; filter: brightness(70%);">
							<div class="card-img-overlay d-flex justify-content-center align-items-center">
								<p class="fs-3"><strong>관련 콘텐츠</strong></p>
							</div>
						</div>
						<div class="card text-center text-light font-weight-bold shadow mt-3" onclick="location.href='/post'" style="cursor: pointer;">
							<img src="resources/image/cafe1.jpg" class="card-img-top rounded" alt="..." 
								 style="width: 100%; height: 100px; object-fit:cover; filter: brightness(70%);">
							<div class="card-img-overlay d-flex justify-content-center align-items-center">
								<p class="fs-3"><strong>관련 콘텐츠</strong></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-4 mb-3 me-3" id="home-content">
				<div id=home-content-header class="d-flex justify-content-between" >
					<div id="home-content-writer" class="">
						<div class="d-flex justify-content-start">
							<p class="me-2">작성자 </p>
							<p class="text-secondary"><small> 3.5</small></p>
						</div>					
					</div>
					<div id="home-content-follow" class="">
						<button class="btn btn-secondary">팔로우</button>
					</div>
				</div>
				<div id="store-card-\${store.id}" index-id ="\${i}" class="card "style="border: none;" onclick="location.href='/store/detail?id=\${store.id}'" style="cursor: pointer;">
					<img src="resources/image/cafe1.jpg" class="card-img-top rounded " alt="..." style="object-fit: cover; height:400px;">
					<div class="card-body pt-1" >
						<i class="bi bi-heart fs-4"></i>
						<p class="card-text ">Some quick example text to build on
							the card title and make up the bulk of the card's content.</p>
						<div class="border d-flex justify-content-between">
							<p class="card-text p-2">가게이름</p>	
							
							<i class="bi bi-star fs-4"></i>
							
						</div>		
					</div>
				</div>
			</div>
			<div class="col-4 mb-3 me-3" id="home-content">
				<div id=home-content-header class="d-flex justify-content-between" >
					<div id="home-content-writer" class="">
						<div class="d-flex justify-content-start">
							<p class="me-2">작성자 </p>
							<p class="text-secondary"><small> 3.5</small></p>
						</div>					
					</div>
					<div id="home-content-follow" class="">
						<button class="btn btn-secondary">팔로우</button>
					</div>
				</div>
				<div id="store-card-\${store.id}" index-id ="\${i}" class="card "style="border: none;" onclick="location.href='/store/detail?id=\${store.id}'" style="cursor: pointer;">
					<img src="resources/image/cafe1.jpg" class="card-img-top rounded " alt="..." style="object-fit: cover; height:400px;">
					<div class="card-body pt-1" >
						<i class="bi bi-heart fs-4"></i>
						<p class="card-text ">Some quick example text to build on
							the card title and make up the bulk of the card's content.</p>
						<div class="border d-flex justify-content-between">
							<p class="card-text p-2">가게이름</p>	
							
							<i class="bi bi-star fs-4"></i>
							
						</div>		
					</div>
				</div>
			</div>
			
			<div class="col-2">
				<div class="row">
					<div class="col">
						<div class="card text-center text-light font-weight-bold shadow mt-3" onclick="location.href='/post'" style="cursor: pointer;">
							<img src="resources/image/cafe1.jpg" class="card-img-top rounded" alt="..." 
								 style="width: 100%; height: 100px; object-fit:cover; filter: brightness(70%);">
							<div class="card-img-overlay d-flex justify-content-center align-items-center">
								<p class="fs-3"><strong>관련 콘텐츠</strong></p>
							</div>
						</div>
						<div class="card text-center text-light font-weight-bold shadow mt-3" onclick="location.href='/post'" style="cursor: pointer;">
							<img src="resources/image/cafe1.jpg" class="card-img-top rounded" alt="..." 
								 style="width: 100%; height: 100px; object-fit:cover; filter: brightness(70%);">
							<div class="card-img-overlay d-flex justify-content-center align-items-center">
								<p class="fs-3"><strong>관련 콘텐츠</strong></p>
							</div>
						</div>
					</div>
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