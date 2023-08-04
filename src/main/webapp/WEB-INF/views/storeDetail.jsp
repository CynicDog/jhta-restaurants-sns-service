<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>애플리케이션</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84"></script>
<style type="text/css">
	html, body {
		height: 100%;
	}

	.wrap {
		position: relative;
		min-height: 100%;
		padding-bottom: 70px;
	}
	
	.border-opacity-10.active {
  		color: orange;
	}
   
</style>
</head>
<body>
<%@ include file="common/navbar.jsp"%>
<div class="wrap">
	<div class="container">
		<div class="row row-cols-5">
			<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" style="max-width: 100%; height: auto;" alt="..."> 
			<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" style="max-width: 100%; height: auto;" alt="..."> 
			<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" style="max-width: 100%; height: auto;" alt="..."> 
			<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" style="max-width: 100%; height: auto;" alt="..."> 
			<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" style="max-width: 100%; height: auto;" alt="...">
		</div>
		<div class="row">
			<div class="col-8">
				<div>
					<header>
						<div class="row">
							<div class="col-8">
								<p class="restaurants_name my-3">
									<span style="font-size: x-large; font-weight: bold">가게제목</span>
									<span class="rate-point mx-3" style="font-weight: bold; font-size: large">평점</span>
								</p>
							</div>
							<div class="col-4">
								<span class="my-2 float-end">
									<button type="button" class="btn" style="color: orange;" onclick="location.href='/review'">
										리뷰<i class="bi bi-brush"></i>
									</button>
									<button class="btn" id="box">
										<i id="star" class="bi bi-star" style="color:gold; font-size:28px;" ></i>
									</button>
								</span>
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
					<span style="font-size: x-large; font-weight: bold;">리뷰</span> 
					<span style="font-size: x-large; font-weight: bold; color: #adb5bd;">(3)</span>
					<div class="btn-group p-1 float-end">
						<button type="button" class="btn border-opacity-10" style="background: none; border: none;" >전체(3)</button>
						<button type="button" class="btn border-opacity-10 " style="background: none; border: none;" >
							<span class="visually-hidden">Button</span> 맛있다(3)
						</button>
						<button type="button" class="btn border-opacity-10" style="background: none; border: none;" >
							<span class="visually-hidden">Button</span> 괜찮다(0)
						</button>
						<button type="button" class="btn border-opacity-10" style="background: none; border: none;" >
							<span class="visually-hidden">Button</span> 별로(0)
						</button>
					</div>
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
											<p style="font-size: small; color: #adb5bd;">회원 등급</p>
										</div>
										<div class="text-center card-title my-1">
											<span style="font-size: medium; font-weight: bold; color: #FFC107;">5.00</span>
										</div>
									</div>
									<div class="col-10">
										<div class="row mb-2">
											<div class="col-10">
												<p class="col card-text" style="font-size: small; color: #adb5bd;">리뷰 작성일</p>
												<p class="col card-text">리뷰 내용</p>
											</div>
											<div class="col-1">
										        <button class="btn" style="margin-left: 15px;">
										            <i class="bi bi-emoji-angry" style="font-size: 20px;"></i>
										        </button>
										    </div>
										    <div class="col-1">
										        <button type="button" class="btn">
										            <i id="recomened" class="bi bi-hand-thumbs-up" style="font-size: 20px;"></i>
										        </button>
										    </div>
										</div>
										<div class="row">
											<div class="col-4">
												<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="...">
											</div>
											<div class="col-4">
												<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="...">
											</div>
											<div class="col-4">
												<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="...">
											</div>
										</div>
										<div class="row">
											<div class="col">
												<span class="float-end">
													<button type="button" class="btn btn-sm" style="color: blue;">
														<i class="bi bi-pencil-square"></i>
													</button>
													<button type="button" class="btn btn-sm" style="color: red;">
														<i class="bi bi-trash3"></i>
														<span class="visually-hidden">삭제</span>
													</button>
												</span>
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
											<p style="font-size: small; color: #adb5bd;">회원 등급</p>
										</div>
										<div class="text-center card-title my-1">
											<span style="font-size: medium; font-weight: bold; color: #FFC107;">5.00</span>
										</div>
									</div>
									<div class="col-10">
										<div class="row mb-2">
											<div class="col-10">
												<p class="col card-text" style="font-size: small; color: #adb5bd;">리뷰 작성일</p>
												<p class="col card-text">리뷰 내용</p>
											</div>
											<div class="col-1">
										        <button class="btn" style="margin-left: 15px;">
										            <i class="bi bi-emoji-angry" style="font-size: 20px;"></i>
										        </button>
										    </div>
										    <div class="col-1">
										        <button type="button" class="btn">
										            <i id="recomened" class="bi bi-hand-thumbs-up" style="font-size: 20px;"></i>
										        </button>
										    </div>
										</div>
										<div class="row">
											<div class="col-4">
												<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="...">
											</div>
											<div class="col-4">
												<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="...">
											</div>
											<div class="col-4">
												<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="...">
											</div>
										</div>
										<div class="row">
											<div class="col">
												<span class="float-end">
													<button type="button" class="btn btn-sm" style="color: blue;">
														<i class="bi bi-pencil-square"></i>
													</button>
													<button type="button" class="btn btn-sm" style="color: red;">
														<i class="bi bi-trash3"></i>
														<span class="visually-hidden">삭제</span>
													</button>
												</span>
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
											<p style="font-size: small; color: #adb5bd;">회원 등급</p>
										</div>
										<div class="text-center card-title my-1">
											<span style="font-size: medium; font-weight: bold; color: #FFC107;">5.00</span>
										</div>
									</div>
									<div class="col-10">
										<div class="row mb-2">
											<div class="col-10">
												<p class="col card-text" style="font-size: small; color: #adb5bd;">리뷰 작성일</p>
												<p class="col card-text">리뷰 내용</p>
											</div>
											<div class="col-1">
										        <button class="btn" style="margin-left: 15px;">
										            <i class="bi bi-emoji-angry" style="font-size: 20px;"></i>
										        </button>
										    </div>
										    <div class="col-1">
										        <button type="button" class="btn">
										            <i id="recomened" class="bi bi-hand-thumbs-up" style="font-size: 20px;"></i>
										        </button>
										    </div>
										</div>
										<div class="row">
											<div class="col-4">
												<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="...">
											</div>
											<div class="col-4">
												<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="...">
											</div>
											<div class="col-4">
												<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="...">
											</div>
										</div>
										<div class="row">
											<div class="col">
												<span class="float-end">
													<button type="button" class="btn btn-sm" style="color: blue;">
														<i class="bi bi-pencil-square"></i>
													</button>
													<button type="button" class="btn btn-sm" style="color: red;">
														<i class="bi bi-trash3"></i>
														<span class="visually-hidden">삭제</span>
													</button>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				<div class="col-4 p-4">
					<div class="row">
						<div class="card text-center m-3 text-light font-weight-bold shadow" onclick="location.href='post'" id="cardId" style="height: 200px;">
							<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="card-img" alt="관리자 추천 맛집" style="height: 200px;">
							<div class="card-img-overlay ">
								<h3 class="card-title p-5">
									<strong>관리자 추천 맛집</strong>
								</h3>
							</div>
						</div>
						<div class="card text-center m-3 text-light font-weight-bold shadow" onclick="location.href='post'" id="cardId" style="height: 200px;">
							<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="card-img" alt="관리자 추천 맛집" style="height: 200px;">
							<div class="card-img-overlay ">
								<h3 class="card-title p-5">
									<strong>관리자 추천 맛집</strong>
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
<%@ include file="common/footer.jsp"%>
</div>
<script>
	var container = document.getElementById('map');
	var options = {
		// latitude,longitude 순으로 입력
		center : new kakao.maps.LatLng(37.5729587735263, 126.992241734889), level : 4
	};
	
	var map = new kakao.maps.Map(container, options);
	
	// 마커가 표시될 위치입니다 
	var markerPosition = new kakao.maps.LatLng(37.5729587735263, 126.992241734889);
	var markerPosition2 = new kakao.maps.LatLng(37.5699451391001, 126.988087440713);
	
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
	
	
	$('#star').click(function(){
	if($(this).hasClass('bi-star-fill')){
		$(this).removeClass('bi-star-fill')
			   .addClass('bi-star')
	} else {
		$(this).removeClass('bi-star')
			   .addClass('bi-star-fill')
		}
	})
	
	$('#recomened').click(function(){
	if($(this).hasClass('bi-hand-thumbs-up-fill')){
		$(this).removeClass('bi-hand-thumbs-up-fill')
			   .addClass('bi-hand-thumbs-up')
	} else {
		$(this).removeClass('bi-hand-thumbs-up')
			   .addClass('bi-hand-thumbs-up-fill')
		}
	})
	

	$(function() {
            // '.emoji-btn' 클래스를 가진 버튼을 클릭할 때 실행되는 함수를 정의합니다.
            $('.border-opacity-10').click(function() {
                // 모든 버튼에 있는 'active' 클래스를 제거합니다.
                $('.border-opacity-10').removeClass('active');
                // 클릭한 버튼에만 'active' 클래스를 추가합니다.
                $(this).addClass('active');
            });
        });

</script>
</body>
</html>