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
					<select class="form-select me-3" style="width: 150px;" name="sort">
						<option value="rating">평점 순</option>
						<option value="bookmark">즐겨찾기 순</option>
						<option value="review">리뷰수 순</option>

					</select>
				</div>
				
			</div>
			<div class="row mb-3">
				<div class="col-12 mb-2" style="text-align: left;">
					<a id= "" class="cat btn active" role="button" href="list" >전체</a> 
					<a id="KOREAN" class="cat btn" role="button" href="list?category=KOREAN" >한식</a>
					<a id="CHINESE" class="cat btn" role="button" href="list?category=CHINESE" >중식</a>
					<a id="JAPANESE" class="cat btn" role="button" href="list?category=JAPANESE" >일식</a> 
					<a id="CHICKEN" class="cat btn" role="button" href="list?category=CHICKEN" >치킨</a> 
					<a id="PIZZA" class="cat btn" role="button" href="list?category=PIZZA" >피자</a> 
					<a id="FASTFOOD" class="cat btn" role="button" href="list?category=FASTFOOD" >패스트푸드</a>
					<a id="WESTERN" class="cat btn" role="button" href="list?category=WESTERN">양식</a>
					<a id="ITALIAN" class="cat btn" role="button" href="list?category=ITALIAN" >이탈리안</a> 
					<a id="ASIAN" class="cat btn" role="button" href="list?category=ASIAN" >아시안</a> 
					<a id="SNACK" class="cat btn" role="button" href="list?category=SNACK" >분식</a> 
					<a id="CAFE" class="cat btn" role="button" href="list?category=CAFE" >카페</a>
					<a id="BAR" class="cat btn" role="button" href="list?category=BAR" >바</a>
				</div>
			</div>

			<div class="row mb-3">
				<div class="col-8">
					<div id="storeLoadingSpinner" class="spinner-border text-primary mt-5" role="status" style="margin: 0 auto;">
						<span class="visually-hidden" style="display: none;">Loading...</span>
					</div>
					
					<div id="div-stores" class="row mb-3">
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
				<div id = "div-pagination" class="col-12">
						<nav>
							<ul class="pagination justify-content-center">
								<li id = "prepage" class="page-item page-move">
									<a id = "prepage-link" href="" class="page-link" >이전</a>
								</li>
<%-- 								<c:forEach var="num" begin="${beginPage }" end="${endPage }"> --%>
<%-- 									<li class="page-item ${currentPage eq num ? 'active' : '' }"> --%>
<%-- 										<a href="" class="page-link" onclick="changePage(event, ${num})">${num }</a> --%>
<!-- 									</li> -->
<%-- 								</c:forEach> --%>
								<li id = "nextpage" class="page-item page-move">
									<a id = "nextpage-link" href="" class="page-link" >다음</a>
								</li>
							</ul>
						</nav>
					<div class="d-flex justify-content-center">
<!-- 						<form id="form-pagination" class="" method="get" action="list"> -->
<%-- 							<input type="hidden" name="sort" value="${param.sort }"> --%>
<%-- 							<input type="hidden" name="page" value="${param.page }"> --%>
<%-- 							<input type="hidden" name="category" value="${param.category }"> --%>
<%-- 							<input type="hidden" name="keyword" value="${param.keyword }"> --%>
<!-- 						</form> -->
					</div>
					
				</div>
			</div>
		</div>
		<script type="text/javascript">
		
			let sortValue = "rating"; 
			let pageValue = 1; 
			let categoryValue ;
			let keywordValue;
			if($("input[name=keyword]").val()!=null){
				keywordValue = $("input[name=keyword]").val();
			}
			let xStartValue;
			let xEndValue;
			let yStartValue;
			let yEndValue;
			
			getResult();
			
			function changePage(event,page){
				event.preventDefault();
				
				pageValue = page;
				console.log("pageValue : " + pageValue);
				
				getResult();
				
			}
			
			//	카테고리 변경 이벤트 등록
			$(".cat").click(function(event){
				event.preventDefault();
				$(this).siblings().removeClass('active');
				$(this).addClass('active');
				
				categoryValue = $(this).attr("id");
				pageValue = 1;
				
			
				getResult();
			})
			
			
			// 이전/다음 페이지 버튼 눌렀을 때의 이벤트 등록
			$(".page-move").click(function(event) {
				console.log("page-move clicked");
				event.preventDefault();
				console.log("this : {} ", $(this));

				let id = $(this).attr("id");
				console.log("id : {} ", id);

				if(id ==='prepage'){
					pageValue--;
				}else{
					pageValue++;
				}
				console.log("pageValue : ", pageValue);

				getResult();
			})
			
			//정렬 방식 바꿨을 때 이벤트 등록
			$(".form-select").change(function(event){
				event.preventDefault();
			
				pageValue = 1; 
				sortValue = $(this).val();
				
				getResult();
			})		
		

		
		function getResult() {
			$("#div-stores").find(".store").remove();
            $("#storeLoadingSpinner").css("display", "block");
            $("html, body").scrollTop(0);
            
			$.getJSON('/search/stores', {sort:sortValue, page:pageValue, category:categoryValue, keyword:keywordValue,
										 xStart:xStartValue, xEnd:xEndValue, yStart:yStartValue, yEnd:yEndValue }, function(result) {
				console.log("xStartValue : " + xStartValue);
				console.log("xEndValue : " + xEndValue);
				console.log("yStartValue : " + yStartValue);
				console.log("yEndValue : " + yEndValue);
				
				let points = [];
				
				result.stores.forEach(function(store){
					points.push(new kakao.maps.LatLng(store.latitude, store.longitude));
					let content = `
						<div class="col-5 mb-3 me-3 store">
						<div class="card shadow" onclick="" style="cursor: pointer;">
							<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="..." style="object-fit: cover; height: 250px;">
						</div>
						<div class="row">
							<div class="col text-start mt-1">							
								<div class="d-flex justify-content-between">
									<a id="store-name-\${store.id}" class="link-dark fs-4 " style="text-decoration: none;">\${store.name}</a>
									<a id="store-reviewAvg-\${store.id}" class="fs-4" style="color: #FFC107; text-decoration: none;">\${store.reviewAvg.toFixed(1)}</a>
								</div>
								<div class="d-flex justify-content-between">
									<p id="store-category-\${store.id}" class="fs-6 text-secondary">\${store.category}</p>
									<div>
										<i id="store-reviewCnt-\${store.id}" class="bi bi-pencil-square text-secondary">\${store.reviewCnt}</i> 
										<i id="store-bookmarkCnt-\${store.id}" class="bi bi-star text-secondary">\${store.bookmarkCnt}</i>
									</div>
								</div>
							</div>
						</div>
					</div>

					`;
					// store 카드 추가 및 내용 입력
					$("#div-stores").append(content);
					
					$("#store-name-store.id").text(store.name);
					$("#store-reviewAvg-store.id").text(store.reviewAvg);
					$("#store-category-store.id").text(store.category);
					$("#store-reviewCnt-store.id").text(store.reviewCnt);
					$("#store-bookmarkCnt-store.id").text(store.bookmarkCnt);
					
					
				});
				console.log("points : ",points);
				//페이지네이션
				
				//페이지-이전/다음
				if(result.pagination.first){
					$("#prepage").addClass('disabled');
				}
				else{
					$("#prepage").removeClass('disabled');
				}
				
				if(result.pagination.last){
					$("#nextpage").addClass('disabled');
				}
				else{
					$("#nextpage").removeClass('disabled');
				}
	
				//페이지-숫자
				let beginPageNum = result.pagination.beginPage;
				let endPageNum = result.pagination.endPage;
			    let currentPage = result.pagination.page; 
			    
				console.log("log");

				console.log("beginPageNum : "+beginPageNum);
				console.log("endPageNum : "+endPageNum);
				console.log("currentPage : "+currentPage);
			    
				$(".page-num").remove();
				for(let num = beginPageNum; num <= endPageNum; num++){
					
					let isActive;
					if(num==currentPage){
					
						isActive = 'active';
					}else{
						isActive = '';
					}
					
					
				    let content = `
				        <li class="page-item page-num ">
				            <a href="list?page=\${num}" 
				            		class="page-link num-link \${isActive}"
				            		onclick="changePage(event, \${num})">\${num}
				            </a>
				        </li>
				    `;

				    $("#nextpage").before(content);
						
				}
	            $("#storeLoadingSpinner").css("display", "none");

				drawMarker(points);
			})
		}
	

		
	
		
		var container = document.getElementById('map');
		// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
		
		var markers = [];
		var bounds = new kakao.maps.LatLngBounds();    
		var options = {
			//latitude,longitude 순으로 입력
			center: new kakao.maps.LatLng(37.5729587735263, 126.992241734889),
			level: 3
		};
		// map 생성
		var map = new kakao.maps.Map(container, options);
		var customOverlay; 

		function drawMarker(points) {
			
			//마커 지우기 - 새 페이지를 위해 
			if(markers.length!==0){
				markers.forEach(function(marker) {
					marker.setMap(null);
				});
				markers.length = 0;
			}
			
			
			for (let i = 0; i < points.length; i++) {
			    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
			    markers.push (new kakao.maps.Marker({ position : points[i] }));
			    
			    // LatLngBounds 객체에 좌표를 추가합니다
			    bounds.extend(points[i]);
			}		
			    
			markers.forEach(function(marker) {
				marker.setMap(map);
			});
			
			setBounds();
			
			
	 		// 마우스 드래그로 지도 이동/ 지도 확대,축소가 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'bounds_changed', function() {      
				
				setButton();
	
			});
		}
		
	
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
			    // 영역의 남서쪽 좌표를 얻어옵니다 
			    let swLatLng = mapBounds.getSouthWest(); 
			    // 영역의 북동쪽 좌표를 얻어옵니다 
			    let neLatLng = mapBounds.getNorthEast(); 
			    let distance =  neLatLng.getLat() - swLatLng.getLat();
			    
				// 커스텀 오버레이가 표시될 위치입니다 
		   		var position = new kakao.maps.LatLng(swLatLng.getLat() + (0.05)*distance, center.getLng());  

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
			      
				  xStartValue = swLatLng.getLng();
				  xEndValue = neLatLng.getLng();
				  yStartValue = swLatLng.getLat();
				  yEndValue = neLatLng.getLat();
				  
				  pageValue = 1; 

			      getResult();
		          
		        }
		}
		
		
	</script>

		<%@ include file="common/footer.jsp"%>
	</div>


</body>
</html>