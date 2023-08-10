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



</style>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84"></script>

</head>
<body>
	<%@ include file="common/navbar.jsp"%>
	<div class="wrap">
		<div class="container-fluid text-center" style="padding-left: 100px;">
			<div class="row my-3">
				<div class="col-8 d-flex justify-content-between">
					<h4 class="title" >검색 결과</h4>
					<select class="form-select me-3" style="width: 150px;" name="sort"
						onchange="changeSort()">
						<option value="rating"
							${param.sort eq 'rating' ? 'selected' : '' }>평점 순</option>
						<option value="bookmark"
							${param.sort eq 'bookmark' ? 'selected' : '' }>즐겨찾기 순</option>
						<option value="review"
							${param.sort eq 'review' ? 'selected' : '' }>리뷰수 순</option>

					</select>
				</div>
				
			</div>
			<div class="row mb-3">
				<div class="col-12 mb-2" style="text-align: left;">
					<a class="cat btn" role="button" href="list">전체</a> 
					<a id="KOREAN" class="cat btn" role="button" href="list?category=KOREAN" >한식</a>
					<a id="CHINESE" class="cat btn" role="button" href="list?category=CHINESE" >중식</a>
					<a id="JAPANESE" class="cat btn" role="button" href="list?category=JAPANESE" >일식</a> 
					<a id="SNACK" class="cat btn" role="button" href="list?category=SNACK" >분식</a> 
					<a id="CAFE" class="cat btn" role="button" href="list?category=CAFE" >카페</a>
					<a id="ITALIAN" class="cat btn" role="button" href="list?category=ITALIAN" >이탈리안</a> 
					<a id="CHICKEN" class="cat btn" role="button" href="list?category=CHICKEN" >치킨</a> 
					<a id="FASTFOOD" class="cat btn" role="button" href="list?category=FASTFOOD" >패스트푸드</a>
					<a id="BAR" class="cat btn" role="button" href="list?category=BAR" >바</a>
					<a id="WESTERN" class="cat btn" role="button" href="list?category=WESTERN">양식</a>
				</div>
			</div>

			<div class="row mb-3">
				<div class="col-8">
					<div class="row mb-3">
						<c:forEach var="store" items="${result.stores }">
							<div class="col-5 mb-3 me-3">
								<div class="card shadow" onclick="" style="cursor: pointer;">
									<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="..." style="object-fit: cover; height: 250px;">
								</div>
								<div class="row">
									<div class="col text-start mt-1">							
										<div class="d-flex justify-content-between">
											<a class="link-dark fs-4 " style="text-decoration: none;"> ${store.name}</a>
											<a class="fs-4" style="color: #FFC107; text-decoration: none;">${store.reviewAvg }</a>
										</div>
										<div class="d-flex justify-content-between">
											<p class="fs-6 text-secondary">${store.category}</p>
											<div>
												<i class="bi bi-pencil-square text-secondary">${store.reviewCnt} </i> 
												<i class="bi bi-star text-secondary">${store.bookmarkCnt}</i>
											</div>
										</div>
									</div>
								</div>
							</div>
							
						</c:forEach>
	
					</div>
				</div>


				<div class="col-3">
					<!-- 지도 -->
					<div>
					
						<div id="map" class="mb-4"
							style="width: 100%; height: 400px;">
						</div>

					
					</div>

					<div class="card text-center text-light font-weight-bold shadow my-3" onclick="location.href='post'" style=" cursor: pointer;">
						<img src="/resources/image/cafe1.jpg" class="card-img-top rounded" alt="..." style="width: 100%; height: 150px; object-fit:cover; filter: brightness(70%);">
						<div class="card-img-overlay d-flex justify-content-center align-items-center">
							<p class="fs-3"><strong>관련 콘텐츠</strong></p>
						</div>
					</div>
					<div class="card text-center text-light font-weight-bold shadow my-3" onclick="location.href='post'" style=" cursor: pointer;">
						<img src="/resources/image/cafe1.jpg" class="card-img-top rounded" alt="..." style="width: 100%; height: 150px; object-fit:cover; filter: brightness(70%);">
						<div class="card-img-overlay d-flex justify-content-center align-items-center">
							<p class="fs-3"><strong>관련 콘텐츠</strong></p>
						</div>
					</div>
					<div class="card text-center text-light font-weight-bold shadow my-3" onclick="location.href='post'" style=" cursor: pointer;">
						<img src="/resources/image/cafe1.jpg" class="card-img-top rounded" alt="..." style="width: 100%; height: 150px; object-fit:cover; filter: brightness(70%);">
						<div class="card-img-overlay d-flex justify-content-center align-items-center">
							<p class="fs-3"><strong>관련 콘텐츠</strong></p>
						</div>
					</div>
					<div class="card text-center text-light font-weight-bold shadow my-3" onclick="location.href='post'" style=" cursor: pointer;">
						<img src="/resources/image/cafe1.jpg" class="card-img-top rounded" alt="..." style="width: 100%; height: 150px; object-fit:cover; filter: brightness(70%);">
						<div class="card-img-overlay d-flex justify-content-center align-items-center">
							<p class="fs-3"><strong>관련 콘텐츠</strong></p>
						</div>
					</div>



<!-- 					<div class="card m-2 sm-14 shadow bg-body rounded "> -->
<!-- 						<div class="card-header" style="text-align: left;">관련 콘텐츠</div> -->
<!-- 						<div class="card m-2 sm-14 shadow bg-body rounded "> -->
<!-- 							<div class="embed-responsive embed-responsive-4by3"> -->
<!-- 								<img src="../resources/image/example.jpg" -->
<!-- 									class="card-img-top embed-responsive-item"> -->
<!-- 							</div> -->
<!-- 							<div class="card-body" -->
<!-- 								style="cursor: pointer; font-weight: bold;"> -->
<!-- 								<p class="card-text">콘텐츠 설명</p> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-12">
					<c:if test="${result.pagination.totalRows gt 0 }">
						<c:set var="currentPage" value="${result.pagination.page }"></c:set>
						<c:set var="first" value="${result.pagination.first }" />
						<c:set var="last" value="${result.pagination.last }" />
						<c:set var="prePage" value="${result.pagination.prePage }" />
						<c:set var="nextPage" value="${result.pagination.nextPage }" />
						<c:set var="beginPage" value="${result.pagination.beginPage }" />
						<c:set var="endPage" value="${result.pagination.endPage }" />
						<nav>
							<ul class="pagination justify-content-center">
								<li class="page-item ${first ? 'disabled' : '' }">
									<a href="list?page=${prePage }" class="page-link" onclick="changePage(event,${prePage})">이전</a>
								</li>
								<c:forEach var="num" begin="${beginPage }" end="${endPage }">
									<li class="page-item ${currentPage eq num ? 'active' : '' }">
										<a href="" class="page-link" onclick="changePage(event, ${num})">${num }</a>
									</li>
								</c:forEach>
								<li class="page-item ${last ? 'disabled' : '' }">
									<a href="list?page=${nextPage }" class="page-link" onclick="changePage(event,${nextPage})">다음</a>
								</li>
							</ul>
						</nav>
					</c:if>
					<div class="d-flex justify-content-center">
						<form id="form-pagination" class="" method="get" action="list">
							<input type="hidden" name="sort" value="${param.sort }">
							<input type="hidden" name="page" value="${param.page }">
							<input type="hidden" name="category" value="${param.category }">
							<input type="hidden" name="keyword" value="${param.keyword }">
						</form>
					</div>
					
				</div>
			</div>
		</div>
		<script type="text/javascript">
		
		$(function(){
			// 카테고리 변경 이벤트 등록
			$(".cat").click(function(event){
				event.preventDefault();
				let category = $(this).attr("id");
				$("input[name=category]").val(category);
				$("input[name=page]").val(1);
				$("input[name=keyword]").val("");
				
				document.querySelector("#form-pagination").submit();
			})
		})
			
			
		function changeSort() {
			// 페이지 새로 가져올 때 바뀌는 부분만 새로 값 설정
			let sort = document.querySelector("select[name=sort]").value;
			document.querySelector("input[name=sort]").value = sort;
			document.querySelector("input[name=page]").value = 1;
			
			document.querySelector("#form-pagination").submit();
		}
		
		function changePage(event, page){
			event.preventDefault();
			
			document.querySelector("input[name=page]").value = page;			
			document.querySelector("#form-pagination").submit();
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
		
		//ajax 처리 필요
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
			      customOverlay.setMap(null);
		          alert("이 지역 검색");
		          
		        }
		}
		
		
	</script>

		<%@ include file="common/footer.jsp"%>
	</div>


</body>
</html>