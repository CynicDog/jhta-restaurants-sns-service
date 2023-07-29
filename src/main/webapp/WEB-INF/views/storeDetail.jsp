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
</head>
<body>
<%@ include file="common/navbar.jsp" %>
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
	</div>
	<div class="my-2">
		<div class="col-2">
			<span style="font-size: x-large; font-weight: bold">리뷰</span>
		</div>
	</div>
	<div class="card mb-3">
		<div class="card-body">
			<div class="row">
				<div class="col-2">
					<div class="text-center card-title my-1">
						<span style="font-size: medium; font-weight: bold;"></span>
					</div>
					<div class="text-center card-title my-1">
						<span
							style="font-size: medium; font-weight: bold; color: #FFC107;"></span>
					</div>
				</div>
				<div class="col-10">
					<div class="row mb-2">
						<div class="col-11">
							<p class="col card-text"></p>
						</div>
						<div class="col-1">

							<a href="" class="btn btn-danger">삭제</a>

						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<img class="img-thumbnail" src=""
								style="width: 320px; max-width: 320px;" alt="...">
						</div>
					</div>
				</div>
			</div>
		</div>
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
<%@ include file="common/footer.jsp" %>
</body>
</html>