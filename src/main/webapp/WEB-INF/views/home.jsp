<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  
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
									aria-describedby="button-addon2">
								<div class="input-group-append"></div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class= "row d-flex justify-content-between mt-3">
			<div class="col-2">
	            <nav id="home-left-navbar" class="h-100 flex-column align-items-stretch pe-4 border-end">
	                <nav class="nav nav-pills flex-column fw-lighter ps-3">
                        <sec:authorize access="isAuthenticated()">
	                    	<sec:authorize access="hasRole('ROLE_OWNER')">
		                    	<a class="nav-link my-3 text-secondary" href="/owner/my-page">마이페이지</a>
		                	</sec:authorize>
	                    	<sec:authorize access="hasRole('ROLE_CUSTOMER')">
		                    	<a class="nav-link my-3 text-secondary" href="/customer/my-page">마이페이지</a>
		                    	<a class="nav-link my-3 text-secondary" href="/post/register">새 포스트</a>
		                	</sec:authorize>
		                    <a class="nav-link my-3 text-secondary" href="">메시지</a>
	                        <a class="nav-link my-3 text-secondary" href="/user/logout">로그아웃</a>
	                        <a class="nav-link my-3 text-secondary" href="/contents">컨텐츠</a>
	                    </sec:authorize>
	                    <sec:authorize access="isAnonymous()">
    			           	<a class="nav-link my-3 text-secondary" href="/user/login">로그인</a>
    			           	<a class="nav-link my-3 text-secondary" href="/customer/signup">회원가입(일반)</a>
    			           	<a class="nav-link my-3 text-secondary" href="/owner/signup">회원가입(사장님)</a>
	                        <a class="nav-link my-3 text-secondary" href="/contents">컨텐츠</a>
	                    </sec:authorize>
	                </nav>
	            </nav>
			</div>
			
			<div class="col-4 mb-3 me-3" id="home-content">
			</div>
			
			<div class="col-3 pt-3" >
				<div class="card mb-3" style="border: none;">
					<div class="row d-flex justify-content-between">
						<div class="col-7">
							<p>리스트 top 10</p>
							<p>가게 이름 평균평점</p>
						</div>
						<div class="col-4">
							<img src="resources/image/cafe1.jpg" class="img-fluid rounded-end" alt="..." style="object-fit: cover; height:80px;">
						</div>
					</div>
				</div>
				<div class="card mb-3" style="border: none;">
					<div class="row d-flex justify-content-between">
						<div class="col-7">
							<p>리스트 top 10</p>
							<p>가게 이름 평균평점</p>
						</div>
						<div class="col-4">
							<img src="resources/image/cafe1.jpg" class="img-fluid rounded-end" alt="..." style="object-fit: cover; height:80px;">
						</div>
					</div>
				</div>
				<div class="card mb-3" style="border: none;">
					<div class="row d-flex justify-content-between">
						<div class="col-7">
							<p>리스트 top 10</p>
							<p>가게 이름 평균평점</p>
						</div>
						<div class="col-4">
							<img src="resources/image/cafe1.jpg" class="img-fluid rounded-end" alt="..." style="object-fit: cover; height:80px;">
						</div>
					</div>
				</div>
				<div class="card mb-3" style="border: none;">
					<div class="row d-flex justify-content-between">
						<div class="col-7">
							<p>리스트 top 10</p>
							<p>가게 이름 평균평점</p>
						</div>
						<div class="col-4">
							<img src="resources/image/cafe1.jpg" class="img-fluid rounded-end" alt="..." style="object-fit: cover; height:80px;">
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
	
	//로그인 확인
	if (${pageContext.request.userPrincipal != null}) {
			getFeed();
		} else{
			
		}
	
	function getFeed() {
		$.getJSON('/feed', function(result) {
			result.forEach(function(feed){
				let content = `
					<div id=home-content-header class="d-flex justify-content-between mb-2" >
						<div id="home-feed-writer" class="">
							<div class="d-flex justify-content-start">
								<span class="me-2">\${feed.username} </span>
								\${generateRating(feed.rating)}
							</div>					
						</div>
						<div id="home-feed-follow" class="">
						</div>
					</div>
					<div id="store-card" index-id ="" class="card mb-5" style="border: none;" onclick="" style="cursor: pointer;">
						<div id="carouselHomeFeedIndicators-\${feed.id}" class="carousel slide">
						  <div class="carousel-indicators" id="carousel-indicators-\${feed.id}">
						 	\${generateIndicator(feed.reviewPictures,feed)}
						  </div>
						  <div class="carousel-inner" id ="carousel-inner-\${feed.id}">
							\${generatePicture(feed.reviewPictures)}
						  </div>
						  \${generateControlButton(feed.reviewPictures,feed)}
						</div>
						
						<div class="card-body pt-1 ps-1" >
							<p class="card-text mb-1">\${feed.content}</p>
							<i class="bi bi-heart fs-4"></i>
							<div class="border d-flex justify-content-between mt-2" 
								onclick="location.href='/store/detail?id=\${feed.storeId}'" style="cursor: pointer;">
								<div class="row">
									<div class="col ms-1">
							           <p class="mb-0"><strong>\${feed.storeName}</strong></p>	
							           <p class="text-secondary mb-0"><small>\${feed.address}</small></p>	
									</div>
								</div>
								<div class="d-flex align-items-center px-2">
									<i class="bi bi-star fs-4"></i>
								</div>
							</div>		
						</div>
					</div>
			`;
				$("#home-content").append(content);
			});
			
		});
		
		function generateRating(rating){
			let badge = ""
			if(rating==5){
				let content =  `<span class="badge bg-warning-subtle text-warning-emphasis rounded-pill">맛있어요!</span> `;
				badge += content;
				
			}else if(rating==3){
				let content =  `<span class="badge bg-warning-subtle text-warning-emphasis rounded-pill">괜찮아요</span> `;
				badge += content;

			}else if(rating==1){
				let content =  `<span class="badge bg-warning-subtle text-warning-emphasis rounded-pill">별로에요</span> `;
				badge += content;

			}else{
				return badge;
			}
			
			let content =  `<span class="badge rounded-pill" style="color: #ff792a; font-size:20px; ">맛있어요</span> `;
			return badge;
		}
		
		function generateIndicator(pictures,feed){
			let indicators = "";
			if(pictures.length==1){
				return indicators;
			}
			pictures.forEach(function(picture, index) {
				

					if (index==0){
						let indicator = `
							<button type="button" data-bs-target="#carouselHomeFeedIndicators-\${feed.id}" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
						`
						indicators += indicator;
					}else{
						let indicator = `
						    <button type="button" data-bs-target="#carouselHomeFeedIndicators-\${feed.id}" data-bs-slide-to="\${index}" aria-label="Slide \${index}"></button>
						`
							indicators += indicator;
					}
			})
			return indicators;

		}
		
		function generatePicture(pictures) {
			let images = "";
			pictures.forEach(function(picture, index) {
				console.log("index : ", index);
				if(index==0){
					console.log("first pic ");

					let imgContent = `
					    <div class="carousel-item active">
					      <img src="resources/image/\${picture.pictureName}" class="card-img-top rounded " alt="..." style="object-fit: cover; height:400px;">
					    </div>			
						`
					images += imgContent;

				}else{
					let imgContent = `
					    <div class="carousel-item">
					      <img src="resources/image/\${picture.pictureName}" class="card-img-top rounded " alt="..." style="object-fit: cover; height:400px;">
					    </div>			
						`
					images += imgContent;
				}
			})
			
			return images;
		}
		
		function generateControlButton(pictures,feed){
			
			let buttons=""
			
			if (pictures.length==1){
				return buttons;
			}
			let button = `
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselHomeFeedIndicators-\${feed.id}" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselHomeFeedIndicators-\${feed.id}" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			`
			buttons+= button;
			return buttons;
		}
	}
</script>
</body>
</html>