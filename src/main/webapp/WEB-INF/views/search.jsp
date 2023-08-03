<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>검색 결과</title>
<style type="text/css">
img {
	object-fit: cover;
	width: 300px;
	height: 200px;
}

.card-text {
	margin-left: 20px;
	margin-bottom: 0px;
	margin-right: 20px;
	font-size: 15px;
	display: flex;
	align-items: center;
}
</style>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84&libraries=services,clusterer,drawing"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84"></script>

</head>
<body>
	<%@ include file="common/navbar.jsp"%>
	<div class="wrap">
		<div class="container text-center ">
			<div class="row mt-3">
				<div class="col-9 d-flex justify-content-between">
					<h4 class="title" >검색 결과</h4>
					<select class="form-select me-3" style="width: 150px;" name="sort"
						onchange="changeSort()">
						<option value="rating"
							${param.sort eq 'rating' ? 'selected' : '' }>평점 순</option>
						<option value="favorite"
							${param.sort eq 'favorite' ? 'selected' : '' }>즐겨찾기 순</option>
						<option value="reviews"
							${param.sort eq 'reviews' ? 'selected' : '' }>리뷰수 순</option>
						<option value="distance"
							${param.sort eq 'distance' ? 'selected' : '' }>거리 순</option>
					</select>
				</div>
				
			</div>
			<div class="row mb-3">
				<div class="col-12 " style="text-align: left;">
					<a class="btn" role="button" href="searchByCategory.jsp">전체</a> 
					<a class="btn" role="button" href="searchByCategory.jsp?category=korean">한식</a>
					<a class="btn" role="button" href="searchByCategory.jsp?category=chinese">중식</a>
					<a class="btn" role="button" href="searchByCategory.jsp?category=japanese">일식</a> 
					<a class="btn" role="button" href="searchByCategory.jsp?category=western">양식</a> 
					<a class="btn" role="button" href="searchByCategory.jsp?category=fastFood">패스트푸드</a>
					<a class="btn" role="button" href="searchByCategory.jsp?category=snack">분식</a> 
					<a class="btn" role="button" href="searchByCategory.jsp?category=asian">아시안</a> 
					<a class="btn" role="button" href="searchByCategory.jsp?category=dessert">디저트</a>
				</div>
			</div>

			<div class="row mb-3">
				<div class="col-7">
					<div class="row mb-3">
						<c:forEach var="store" items="${stores}">
							<div class="col-5">
								<div class="card m-2 sm-14 shadow bg-body rounded ">
									<div class="embed-responsive embed-responsive-4by3">
										<img src="resources/image/example.jpg"
											class="card-img-top embed-responsive-item">
									</div>
									<div class="card-body" style="cursor: pointer; font-weight: bold;">
										<p class="card-text">${store.name}</p>
										<p class="card-text" style="color: #FFC107;">평점</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

				<div class="col-2"></div>

				<div class="col-3">
					<!-- 지도 -->
					<div id="map"
						style="width: 300px; height: 400px; margin-bottom: 30px;"></div>

					<div class="card m-2 sm-14 shadow bg-body rounded ">
						<div class="card-header" style="text-align: left;">관련 콘텐츠</div>
						<div class="card m-2 sm-14 shadow bg-body rounded ">
							<div class="embed-responsive embed-responsive-4by3">
								<img src="resources/image/example.jpg"
									class="card-img-top embed-responsive-item">
							</div>
							<div class="card-body"
								style="cursor: pointer; font-weight: bold;">
								<p class="card-text">콘텐츠 설명</p>
							</div>
						</div>
					</div>
					<div class="card m-2 sm-14 shadow bg-body rounded ">
						<div class="card-header" style="text-align: left;">관련 콘텐츠</div>
						<div class="card m-2 sm-14 shadow bg-body rounded ">
							<div class="embed-responsive embed-responsive-4by3">
								<img src="resources/image/example.jpg"
									class="card-img-top embed-responsive-item">
							</div>
							<div class="card-body"
								style="cursor: pointer; font-weight: bold;">
								<p class="card-text">콘텐츠 설명</p>
							</div>
						</div>
					</div>

					<div class="card m-2 sm-14 shadow bg-body rounded ">
						<div class="card-header" style="text-align: left;">관련 콘텐츠</div>
						<div class="card m-2 sm-14 shadow bg-body rounded ">
							<div class="embed-responsive embed-responsive-4by3">
								<img src="resources/image/example.jpg"
									class="card-img-top embed-responsive-item">
							</div>
							<div class="card-body"
								style="cursor: pointer; font-weight: bold;">
								<p class="card-text">콘텐츠 설명</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-12">
					<nav>
						<ul class="pagination justify-content-center">
							<li class="page-item ${first ? 'disabled' : ''}"><a
								href="list?page=${prePage }" class="page-link">이전</a></li>
							<c:forEach var="num" begin="${beginPage }" end="${endPage }">
								<li class="page-item ${currentPage eq num ? 'active' : '' }">
									<a href="list?page=${num }" class="page-link">${num }</a>
								</li>
							</c:forEach>
							<li class="page-item ${last ? 'disabled' : ''}"><a
								href="list?page=${nextPage }" class="page-link">다음</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<script type="text/javascript">
	
		function changeSort() {
			let sort = document.querySelector("select[name=sort]").value;	
// 			let sort = $(select[name=sort]).val();
// 			$(select[name=sort]).val(sort);
			
			document.querySelector("input[name=sort]").value = sort;	
			document.querySelector("input[name=page]").value = 1;		
			document.querySelector("#form-employee-search").submit();	
		}
	
		var container = document.getElementById('map');
		var options = {
// 										  latitude,longitude 순으로 입력
			center: new kakao.maps.LatLng(37.5729587735263, 126.992241734889),
			level: 4
		};

		var map = new kakao.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(37.5729587735263, 126.992241734889); 
		var markerPosition2  = new kakao.maps.LatLng(37.5699451391001, 126.988087440713); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		var marker2 = new kakao.maps.Marker({
		    position: markerPosition2
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		marker2.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
		
	</script>

		<%@ include file="common/footer.jsp"%>
	</div>


</body>
</html>