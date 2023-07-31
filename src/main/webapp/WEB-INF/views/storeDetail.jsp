<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>애플리케이션</title>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84&libraries=services,clusterer,drawing"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84"></script>
   <style type="text/css">
   		html, body{
    		height:100%;
    	}	
    	
    	.wrap{
    		position: relative;
  			min-height: 100%;
  			padding-bottom: 70px;
    	}
   </style>
</head>
<body>
<%@ include file="common/navbar.jsp" %>
<div class="wrap">
<div class="container">
	<div class="row row-cols-5">
		<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" style="max-width: 100%; height: auto;" alt="..." >
		<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" style="max-width: 100%; height: auto;" alt="..." >
		<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" style="max-width: 100%; height: auto;" alt="..." >
		<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" style="max-width: 100%; height: auto;" alt="..." >
		<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" style="max-width: 100%; height: auto;" alt="..." >
    </div>
		<div class="row">
			<div class="col-8">
				<div>
					<header>
						<div class="row">
							<div class="col-8">
								<p class="restaurants_name my-3"><span style="font-size: x-large; font-weight: bold">가게제목</span><span class="rate-point mx-3" style="font-weight: bold; font-size: large">평점</span></p>
							</div>
							<div class="col-4">
								<button type="button" class="btn btn-outline-primary my-3">리뷰작성</button>
								<button type="button" class="btn btn-outline-warning" >
								<span class="visually-hidden">즐겨찾기</span>
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
  								 <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
								</svg>
								</button>
							</div>
						</div>
						<div class="row">
							<table class="table">
								<tr>
									<th>주소</th>
									<td></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td></td>
								</tr>
								<tr>
									<th>가게 소개</th>
									<td></td>
								</tr>
								<tr>
									<th>음식 종류</th>
									<td></td>
								</tr>
								<tr>
									<th>영업시간</th>
									<td></td>
								</tr>
								<tr>
									<th>휴일</th>
									<td></td>
								</tr>

								<tr>
									<th>메뉴</th>
									<td>
										<div>
											<div class="col my-2">
												<span class="food-name"></span> <span class="food-price"></span>
											</div>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</header>
				</div>
			</div>
			<div class="col-4">
				<div id="map" style="width: 400px; height: 350px;"></div>
			</div>
		</div>
	    <div class="row">
	    <div class="col-8">
			<span style="font-size: x-large; font-weight: bold">리뷰</span>
			<span style="font-size: x-large; font-weight: bold; color:#adb5bd; ">(3)</span>
			<span class="p-1 float-end">
					<button type="button" class="btn btn-outline-warning" >전체(3)</button>
					<button type="button" class="btn btn-outline-warning" >
                 	 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-heart-eyes" viewBox="0 0 16 16">
					  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
					  <path d="M11.315 10.014a.5.5 0 0 1 .548.736A4.498 4.498 0 0 1 7.965 13a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .548-.736h.005l.017.005.067.015.252.055c.215.046.515.108.857.169.693.124 1.522.242 2.152.242.63 0 1.46-.118 2.152-.242a26.58 26.58 0 0 0 1.109-.224l.067-.015.017-.004.005-.002zM4.756 4.566c.763-1.424 4.02-.12.952 3.434-4.496-1.596-2.35-4.298-.952-3.434zm6.488 0c1.398-.864 3.544 1.838-.952 3.434-3.067-3.554.19-4.858.952-3.434z"/>
					</svg>
                  	<span class="visually-hidden">Button</span> 맛있다(3)
                	</button>
					<button type="button" class="btn btn-outline-secondary" >
                 	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-smile" viewBox="0 0 16 16">
					  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
					  <path d="M4.285 9.567a.5.5 0 0 1 .683.183A3.498 3.498 0 0 0 8 11.5a3.498 3.498 0 0 0 3.032-1.75.5.5 0 1 1 .866.5A4.498 4.498 0 0 1 8 12.5a4.498 4.498 0 0 1-3.898-2.25.5.5 0 0 1 .183-.683zM7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5zm4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5z"/>
					</svg>
                  	<span class="visually-hidden">Button</span> 괜찮다(0)
                	</button>
					<button type="button" class="btn btn-outline-warning" >
                 	 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-angry" viewBox="0 0 16 16">
 					 <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"></path>
  					 <path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zm6.991-8.38a.5.5 0 1 1 .448.894l-1.009.504c.176.27.285.64.285 1.049 0 .828-.448 1.5-1 1.5s-1-.672-1-1.5c0-.247.04-.48.11-.686a.502.502 0 0 1 .166-.761l2-1zm-6.552 0a.5.5 0 0 0-.448.894l1.009.504A1.94 1.94 0 0 0 5 6.5C5 7.328 5.448 8 6 8s1-.672 1-1.5c0-.247-.04-.48-.11-.686a.502.502 0 0 0-.166-.761l-2-1z"></path>
					</svg>
                  	<span class="visually-hidden">Button</span> 별로(0)
                	</button>
			</span>
	    </div>
	    <div class="row">
	    	<div class="col-8">
		        <div class="card mb-3">
		            <div class="card-body">
		                <div class="row">
		                    <div class="col-2">
		                        <div class="text-center card-title my-1">
		                        	<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle" alt="...">
		                            <span style="font-size: medium; font-weight: bold;">정손님</span>
		                            <p style="font-size: small; color:#adb5bd;">회원 등급</p>
		                        </div>
		                        <div class="text-center card-title my-1">
		                            <span style="font-size: medium; font-weight: bold; color: #FFC107;">5.00</span>                            
		                        </div>
		                    </div>
		                    <div class="col-10">
		                        <div class="row mb-2">
		                            <div class="col-10">
		                                <p class="col card-text" style="font-size: small; color:#adb5bd;">리뷰 작성일 </p>
		                                <p class="col card-text">리뷰 내용</p>
		                            </div>
		                            <div class="col-1">
			                           	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-angry" viewBox="0 0 16 16">
	  										<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
	  										<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zm6.991-8.38a.5.5 0 1 1 .448.894l-1.009.504c.176.27.285.64.285 1.049 0 .828-.448 1.5-1 1.5s-1-.672-1-1.5c0-.247.04-.48.11-.686a.502.502 0 0 1 .166-.761l2-1zm-6.552 0a.5.5 0 0 0-.448.894l1.009.504A1.94 1.94 0 0 0 5 6.5C5 7.328 5.448 8 6 8s1-.672 1-1.5c0-.247-.04-.48-.11-.686a.502.502 0 0 0-.166-.761l-2-1z"/>
										</svg>
		                            </div>
		                            <div class="col-1">
					            		<button type="button" class="btn btn-outline-danger" >
					                 		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
			  									<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
											</svg>
											<span class="visually-hidden">삭제</span>
					                  	</button>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-12">
		                                <img class="img-thumbnail" src="" style="width: 320px; max-width: 320px;" alt="...">
		                            </div>
		                        </div>
		                    </div>
		                </div>
	            	</div>
	    		</div>
		        <div class="card mb-3">
		            <div class="card-body">
		                <div class="row">
		                    <div class="col-2">
		                        <div class="text-center card-title my-1">
		                        	<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle" alt="...">
		                            <span style="font-size: medium; font-weight: bold;">정손님</span>
		                        </div>
		                        <div class="text-center card-title my-1">
		                            <span style="font-size: medium; font-weight: bold; color: #FFC107;">5.00</span>                            
		                        </div>
		                    </div>
		                    <div class="col-10">
		                        <div class="row mb-2">
		                            <div class="col-11">
		                                <p class="col card-text">간판이 없어 찾아오기 힘들지만 맛은 최고입니다 ! 추천해요 ~ </p>
		                            </div>
		                            <div class="col-1">
		                                <a href="" class="btn btn-danger">삭제</a>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-12">
		                                <img class="img-thumbnail" src="" style="width: 320px; max-width: 320px;" alt="...">
		                            </div>
		                        </div>
		                    </div>
		                </div>
	            	</div>
	    		</div>
		        <div class="card mb-3">
		            <div class="card-body">
		                <div class="row">
		                    <div class="col-2">
		                        <div class="text-center card-title my-1">
		                        	<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle" alt="...">
		                            <span style="font-size: medium; font-weight: bold;">정손님</span>
		                        </div>
		                        <div class="text-center card-title my-1">
		                            <span style="font-size: medium; font-weight: bold; color: #FFC107;">5.00</span>                            
		                        </div>
		                    </div>
		                    <div class="col-10">
		                        <div class="row mb-2">
		                            <div class="col-11">
		                                <p class="col card-text">간판이 없어 찾아오기 힘들지만 맛은 최고입니다 ! 추천해요 ~ </p>
		                            </div>
		                            <div class="col-1">
		                                <a href="" class="btn btn-danger">삭제</a>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-12">
		                                <img class="img-thumbnail" src="" style="width: 320px; max-width: 320px;" alt="...">
		                            </div>
		                        </div>
		                    </div>
		                </div>
	            	</div>
	    		</div>
	        </div>
		    <div class="col-4 p-4" >
				<div class="row">
					<div class="card text-center" id="cardId">
						<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="card-img" alt="관리자 추천 맛집">
						<div class="card-img-overlay ">
							<h1 class="card-title p-5">관리자 추천 맛집</h1>
						</div>
					</div>
	             	<div class="card text-center" id="cardId">
						<img src="https://modo-phinf.pstatic.net/20201111_129/1605070060305fWkBj_JPEG/mosaScFYx5.jpeg?type=w720" class="card-img" alt="관리자 추천 맛집">
						<div class="card-img-overlay">
							<h1 class="card-title p-5">관리자 추천 맛집</h1>
						</div>
					</div>
	         	</div>
			</div>
   		</div>
   	</div>
</div>   	
<%@ include file="common/footer.jsp" %>
</div>
<script>
	var container = document.getElementById('map');
	var options = {
		// 										  latitude,longitude 순으로 입력
		center : new kakao.maps.LatLng(37.5729587735263, 126.992241734889),
		level : 4
	};

	var map = new kakao.maps.Map(container, options);

	// 마커가 표시될 위치입니다 
	var markerPosition = new kakao.maps.LatLng(37.5729587735263,
			126.992241734889);
	var markerPosition2 = new kakao.maps.LatLng(37.5699451391001,
			126.988087440713);

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});
	var marker2 = new kakao.maps.Marker({
		position : markerPosition2
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	marker2.setMap(map);

	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);
</script>
</body>
</html>