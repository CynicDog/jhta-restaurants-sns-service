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
    
    <style type="text/css">
		.card-text {
			white-space: normal;
			overflow: hidden;
			text-overflow: ellipsis;
			display: -webkit-box;
					 -webkit-line-clamp: 3;
					 -webkit-box-orient: vertical;
		}
	</style>
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
									aria-label="Recipient's username" aria-describedby="button-addon2">
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
	                        <a class="nav-link my-3 text-secondary" href="/contents">컨텐츠</a>
		                    <a class="nav-link my-3 text-secondary" href="/message">메시지</a>
	                        <a class="nav-link my-3 text-secondary" href="/user/logout">로그아웃</a>
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
			
			<div class="col-4 mb-3 me-3" id="home-content"></div>
			
			<div class="col-3 pt-3 home-side-contents" >
				<h4 class="mb-4">인기 포스트</h4>
				<c:forEach var="post" items="${postList}">
					<div class="card mb-3" style="border: none; cursor: pointer;" onclick="location.href='/post/detail?id=${post.id}'">
						<div class="row d-flex justify-content-start">
							<div class="col-7" style="display:block; overflow:hidden; white-space:nowrap; text-overflow:epllipsis;">
								<p>${post.title}</p>
								<p class="text-secondary" >${post.subTitle}</p>
							</div>
							<div class="col-3">
								<img src="/images/post/png/${post.pictureFile}" class="img-fluid rounded-end" alt="..." style="object-fit: cover; height:70px;">
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<%@ include file="common/footer.jsp" %>
</div>

<script type="text/javascript">
	document.getElementById("form-navbar-search").style.display = "none";
	
	let pageOnFeed = 1;
    let isFeedsFetching = false;
	let isFeedsLast = false;
	
	//로그인 확인
	var isLogin;
	isLogin = ${pageContext.request.userPrincipal != null} ? true : false;
	getFeed();
	
	//Click Listener - bookmark star 
	$("#home-content").on('click', '[id^="star-"]', function(){
			//로그인 했을 때
    	if (isLogin) {
    	let storeId = $(this).attr('store-id');
		console.log("storeId :" , storeId);
		//star- fill -> blank
		if ($(this).hasClass('bi-star-fill')) {
				$(this).removeClass('bi-star-fill').addClass('bi-star')
				$.getJSON('/bookmark/delete', {storeId : storeId});
		//star- blank -> fill		
		} else {
			$(this).removeClass('bi-star').addClass('bi-star-fill')
			$.getJSON('/bookmark/insert', {storeId : storeId});
			}
	    } else {
	       // 로그인되지 않은 경우, 로그인 페이지 열기
	       	alert("로그인이 필요합니다");
	        window.location.href = "/user/login?error=anonymous";
	    }
	});
	
	//Click Listener - Review Like 
	$("#home-content").on('click', '[id^="like-"]', function(){
		
	    // Spring Security에서 제공하는 principal을 사용하여 로그인 상태 확인
	    if (isLogin) {
			//로그인 했을 때
	    	let reviewId = $(this).attr('review-id');
			//like- fill -> blank
			if ($(this).hasClass('bi-heart-fill')) {
					$(this).removeClass('bi-heart-fill').addClass('bi-heart')
					$.getJSON('/like/delete', {reviewId : reviewId});
			//like- blank -> fill		
			} else {
				$(this).removeClass('bi-heart').addClass('bi-heart-fill')
				$.getJSON('/like/insert', {reviewId : reviewId});

			}
	    } else {
	       // 로그인되지 않은 경우, 로그인 페이지 열기
	       	alert("로그인이 필요합니다");
	        window.location.href = "/user/login?error=anonymous";
	    }
	});
	
	function getFeed() {
		isFeedsFetching = true;
		const url = isLogin ? '/feed' : '/anofeed'; 
		
		$.getJSON(url ,{page : pageOnFeed, limit:5}, function(result) {
			
	        if (result.length < 5) {
	            isFeedsLast = true;
	        }
			
			result.forEach(function(feed){
				let star = feed.isBookmarked==='y' ? 'bi-star-fill' : 'bi-star';
				let like = feed.isLiked==='y' ? 'bi-heart-fill' : 'bi-heart';
				
				let content = `
					<div id=home-content-header class="d-flex justify-content-between mb-2" >
						<div id="home-feed-writer" class="">
							<div class="d-flex justify-content-start">
								<span class="me-2 fw-bold">\${feed.username} </span>
								\${generateRating(feed.rating)}
							</div>					
						</div>
						<div id="home-feed-follow" class="">
						</div>
					</div>
					<div id="store-card" index-id ="" class="card mb-5" style="border: none;">
						<div id="carouselHomeFeedIndicators-\${feed.id}" class="carousel slide">
						  <div class="carousel-indicators" id="carousel-indicators-\${feed.id}">
						 	\${generateIndicator(feed.reviewPictures,feed)}
						  </div>
						  <div class="carousel-inner" id ="carousel-inner-\${feed.id}">
							\${generatePicture(feed.reviewPictures,feed)}
						  </div>
						  \${generateControlButton(feed.reviewPictures,feed)}
						</div>
						
						<div class="card-body pt-1 ps-1" >
							<p class="card-text mb-1" onclick="location.href='/review/detail?id=\${feed.reviewId}'" style="cursor: pointer;">\${feed.content}</p>
							<i class="bi \${like} fs-4" id="like-\${feed.id}" review-id="\${feed.reviewId}" style="cursor: pointer; color: red;"></i>
							<div class="border d-flex justify-content-between mt-2" >
								<div class="row" onclick="location.href='/store/detail?id=\${feed.storeId}'" style="cursor: pointer;">
									<div class="col ms-1">
							           <p class="mb-0"><strong>\${feed.storeName}</strong></p>	
							           <p class="text-secondary mb-0"><small>\${feed.address}</small></p>	
									</div>
								</div>
								<div class="d-flex align-items-center px-2">
									<i class="bi \${star} fs-4" id="star-\${feed.id}" store-id="\${feed.storeId}" style="cursor: pointer; color: gold;"></i>
								</div>
							</div>		
						</div>
					</div>
			`;
				$("#home-content").append(content);
			});
		});
		isFeedsFetching = false;
	}
	
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
		if(pictures.length<=1){
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
	
	function generatePicture(pictures,feed) {
		let images = "";
		pictures.forEach(function(picture, index) {
			
			let activeClass="";
			if(index==0){activeClass = "active";}
			
			let imgContent = `
			    <div class="carousel-item \${activeClass}">
			      <img src="/images/review/png/\${picture.pictureName}" class="card-img-top rounded " 
			      alt="..." style="object-fit: cover; height:400px; cursor: pointer;"
		    	  onclick="location.href='/review/detail?id=\${feed.reviewId}'">
			    </div>			
				`
			images += imgContent;
		})
		
		return images;
	}
	
	function generateControlButton(pictures,feed){
		let buttons=""
		
		if (pictures.length<=1){
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
	
	
    window.onscroll = function () {
        if ((window.innerHeight + window.scrollY +1) >= document.body.offsetHeight) {

            if (isFeedsFetching || isFeedsLast) {
                // do nothing
            } else {
            	console.log("onScroll");
             	pageOnFeed += 1;
            	getFeed();        	    
            }
        }
    }

</script>
</body>
</html>