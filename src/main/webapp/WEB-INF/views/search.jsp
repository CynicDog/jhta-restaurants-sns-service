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
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
							<div class="col-5 mb-5">
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
					<div>
					
						<div id="map"
							style="width: 300px; height: 400px;">
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
	
		<!--카카오 지도 -->
		var container = document.getElementById('map');
		
		// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
		var bounds = new kakao.maps.LatLngBounds();    
		var options = {
			//latitude,longitude 순으로 입력
			center: new kakao.maps.LatLng(37.5729587735263, 126.992241734889),
			level: 3
		};
		// map 생성
		var map = new kakao.maps.Map(container, options);
		
		// 지도에 표시할 좌표 목록
		var points = [
		    new kakao.maps.LatLng(37.5729587735263, 126.992241734889),
		    new kakao.maps.LatLng(37.5699451391001, 126.988087440713)
		];
		
		var i, marker;
		for (i = 0; i < points.length; i++) {
		    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
		    marker = new kakao.maps.Marker({ position : points[i] });
		    marker.setMap(map);
		    
		    // LatLngBounds 객체에 좌표를 추가합니다
		    bounds.extend(points[i]);
		}		
		setBounds();
		
		
		var customOverlay; 
		
 		// 마우스 드래그로 지도 이동/ 지도 확대,축소가 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'bounds_changed', function() {      
			
			setButton();

		});

 		
		function setBounds() {
    	// LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
  	 	 // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
  	 		map.setBounds(bounds);
		}
		
		function setButton(){
			  if (customOverlay) {
			        customOverlay.setMap(null);
			    }
			
		   		// 지도 중심좌표를 얻어옵니다 
		   		let center = map.getCenter();
		   		let mapBounds = map.getBounds();
			    // 영역의 중앙 좌표를 얻어옵니다 
			    // 영역의 남서쪽 좌표를 얻어옵니다 
			    let swLatLng = mapBounds.getSouthWest(); 
			    // 영역의 북동쪽 좌표를 얻어옵니다 
			    let neLatLng = mapBounds.getNorthEast(); 
			    let distance =  neLatLng.getLat() - swLatLng.getLat();
			    
				// 커스텀 오버레이가 표시될 위치입니다 
		   		var position = new kakao.maps.LatLng(swLatLng.getLat() + (0.1)*distance, center.getLng());  

				var content = '<button type="button" id="search-button" class="btn btn-primary">이 지역 검색</button>';
				
					customOverlay = new kakao.maps.CustomOverlay({
				    position: position,
				    content: content   
				});
				
				customOverlay.setMap(map);
				
		        // 커스텀 오버레이의 버튼에 이벤트를 추가
		        var button = document.getElementById('search-button');
		        button.addEventListener('click', showOverlayMessage);
			
		        // 오버레이를 클릭하면 메시지를 띄우도록 이벤트 처리
		        function showOverlayMessage() {
		          alert("이 지역 검색");
		        }
		}
		
		
	</script>

		<%@ include file="common/footer.jsp"%>
	</div>


</body>
</html>