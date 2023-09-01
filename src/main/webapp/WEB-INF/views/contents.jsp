<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="common/navbar.jsp" %>
<style type="text/css">
	.cards {
		position: relative;
		align-text:center;
	}
	
	.card-image-overlay {
		position: absolute;
	}
	
	.title-text {
	   	position: absolute;
	   	width: 100%;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    text-align:center;
	    font-size:18px;
	}
	
	.card-image {
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
			
			<c:forEach var="recentPostdata" items="${recentPosts }" >
				<c:set var="sysYear"><fmt:formatDate value="${recentPostdata.createDate}" pattern="yyyy-MM-dd HH:mm:ss" /></c:set>
				<div class="col-md-4 mb-4">
					<div class="cards text-center text-light font-weight-bold shadow" onclick="location.href='post/detail?id=${recentPostdata.id}'" style=" cursor: pointer;">
						<img src="images/post/jpeg/${recentPostdata.pictureFile}" class="card-image" alt="...">
	
						<div class="card-img-overlay">
							<div class="title-text">
								<strong>${recentPostdata.title }</strong><br>
								<div class="text-white" style="opacity:80%;">( ${recentPostdata.subTitle } )</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<strong >${recentPostdata.userName }</strong>
						</div>
						<div class="col text-end">
							<input type="hidden" id="dateInput-${recentPostdata.id }" type="text" value="${sysYear }" >
							<p class="text-end text-secondary" id="dateValue-${recentPostdata.id }"></p>
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
					<c:set var="sysYear"><fmt:formatDate value="${followerPostData.createDate}" pattern="yyyy-MM-dd HH:mm:ss" /></c:set>
					<div class="col-md-4 mb-4">
						<div class="cards text-center text-light font-weight-bold shadow" onclick="location.href='post/detail?id=${followerPostData.id}'" style=" cursor: pointer;">
							<img src="images/post/jpeg/${followerPostData.pictureFile}" class="card-image" alt="...">
		
							<div class="card-img-overlay">
								<div class="title-text">
									<strong>${followerPostData.title }</strong><br>
									<div class="text-white" style="opacity:80%;">( ${followerPostData.subTitle } )</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<strong >${followerPostData.userName }</strong>
							</div>
							<div class="col text-end">
								<input type="hidden" id="dateInput-${followerPostData.id }" type="text" value="${sysYear }" >
								<p class="text-end text-secondary" id="dateValue-${followerPostData.id }"></p>
							</div>
						</div>
					</div>
				</c:forEach>
				
			</div>
		</sec:authorize>
			<div class="row mt-3">
				<div class="col">
					<h4 class="my-3 text-secondary"><strong>Recent Review</strong></h4>
				</div>
				<div class="col text-end">
					<button type="button" class="btn text-muted my-3" onclick="location.href='/review/allReviews'"> more</button>
				</div>
			</div>
			<div class="row mb-3 border-bottom">
				<c:forEach var="recentReviewData" items="${recentReviews }" >
					<c:set var="sysYear"><fmt:formatDate value="${recentReviewData.createDate}" pattern="yyyy-MM-dd HH:mm:ss" /></c:set> 
					<div class="col-md-4 mb-4">
						<div class="cards text-center text-light font-weight-bold shadow" onclick="location.href='/review/detail?id=${recentReviewData.id}'" style=" cursor: pointer;">
							<img src="/images/review/jpeg/${recentReviewData.pictureName }" class="card-image" alt="...">
		
							<div class="card-img-overlay">
								<div class="title-text">
									<strong>${recentReviewData.storeName }</strong><br>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<strong >${recentReviewData.userName }</strong>
							</div>
							<div class="col text-end">
								<input type="hidden" id="dateInput-${recentReviewData.id }" type="text" value="${sysYear }" >
								<p class="text-end text-secondary" id="dateValue-${recentReviewData.id }"></p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		<sec:authorize access="isAuthenticated()">
			<div class="row mt-3">
				<div class="col">
					<h4 class="my-3 text-secondary"><strong>Follower Review</strong></h4>
				</div>
				<div class="col text-end">
					<button type="button" class="btn text-muted my-3" onclick="location.href='/review/followerReviews'"> more</button>
				</div>
			</div>
			<div class="row mb-3 border-bottom">
				<c:forEach var="recentFollowerReivewData" items="${recentFollowerReivews }" >
					<c:set var="sysYear"><fmt:formatDate value="${recentFollowerReivewData.createDate}" pattern="yyyy-MM-dd HH:mm:ss" /></c:set> 
					<div class="col-md-4 mb-4">
						<div class="cards text-center text-light font-weight-bold shadow" onclick="location.href='/review/detail?id=${recentFollowerReivewData.id}'" style=" cursor: pointer;">
							<img src="/images/review/jpeg/${recentFollowerReivewData.pictureName }" class="card-image" alt="...">
		
							<div class="card-img-overlay">
								<div class="title-text">
									<strong>${recentFollowerReivewData.storeName }</strong><br>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<strong >${recentFollowerReivewData.userName }</strong>
							</div>
							<div class="col text-end">
								<input type="hidden" id="dateInput-${recentFollowerReivewData.id }" type="text" value="${sysYear }" >
								<p class="text-end text-secondary" id="dateValue-${recentFollowerReivewData.id }"></p>
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
			<div class="col-md-4 mb-4">
				<div class="cards text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<img src="../resources/image/cafe1.jpg" class="card-image" alt="...">

					<div class="card-img-overlay">
						<div class="title-text">
							<strong>${recentFollowerReivewData.store.name }</strong><br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</div>
<script type="text/javascript">
	function timeForToday(value) {
	    const today = new Date();
	    const timeValue = new Date(value);
	    const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
	
	    if (betweenTime < 1) return '방금전';
	    if (betweenTime < 60) {
	        return `\${betweenTime}분전`;
	    }
	
	    const betweenTimeHour = Math.floor(betweenTime / 60);
	    if (betweenTimeHour < 24) {
	        return `\${betweenTimeHour}시간전`;
	    }
	
	    const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
	    if (betweenTimeDay < 365) {
	        return `\${betweenTimeDay}일전`;
	    }
	
	    return `\${Math.floor(betweenTimeDay / 365)}년전`;
	}
	
	$("[id^=dateInput]").each(function (index, input) {
	    let value = $(input).val();
	    let elapsed = timeForToday(value);
	    $(input).next().text(elapsed);
	})
</script>
</body>
</html>