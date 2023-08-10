<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>애플리케이션</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
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
		<div class="row row-cols-5" style="cursor: pointer;">
			<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="Thumbnail 1" onclick="openModal(this)"> 
			<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="Thumbnail 2" onclick="openModal(this)"> 
			<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="Thumbnail 3" onclick="openModal(this)"> 
			<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="Thumbnail 4" onclick="openModal(this)"> 
			<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="Thumbnail 5" onclick="openModal(this)">
		</div>
		<div id="myModal" class="modal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.6); overflow: auto; z-index: 1000;">
			<span class="close" onclick="closeModal()" style="position: absolute; top: 10px; right: 10px; font-size: 32px; color: white; cursor: pointer;">&times;</span>
			<div class="row d-flex justify-content-center align-items-center" style="height: 100%;">
				<div class="col-2 d-flex justify-content-center align-items-center">
					<button class="modal-nav-button" id="prevButton" onclick="changeImage(-1)" style="font-size: 2em; background: none; border: none; cursor: pointer; color: white;">&#10094;</button>
				</div>
				<div class="col-6 text-center" style="background-color: black;">
					<img class="modal-content" id="modalImg" style="max-width: 90%; max-height: 80vh; margin: auto; display: block;">
				</div>
				<div class="col-2">
				    <div class="card" style="width:100%; height: 80vh; overflow: hidden;">
				        <div class="card-body d-flex flex-column align-items-start">
				            <div class="d-flex align-items-center mb-2">
				                <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle" style="width: 60px; height: 60px;" alt="...">
				                <div class="ml-2">
				                    <span style="font-size: medium; font-weight: bold;">정손님</span>
				                    <p style="font-size: small; color: #adb5bd;">회원 등급</p>
				                </div>
				                <div class="p-2 ml-auto">
				                    <span class="badge text-bg-success fw-lighter">맛있어요!</span>
				                </div>
				            </div>
				            <div>
				                처음 와봤는데 너무 맛있어요 다음에 재방문 100%입니다! 처음 와봤는데 너무 맛있어요 다음에 재방문 100%입니다! 처음 와봤는데 너무 맛있어요 다음에 재방문 100%입니다!
				            </div>
				        </div>
				    </div>
				</div>
				<div class="col-2 d-flex justify-content-center align-items-center">
					<button class="modal-nav-button" id="nextButton" onclick="changeImage(1)" style="font-size: 2em; background: none; border: none; cursor: pointer; color: white;">&#10095;</button>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-8">
				<div>
					<header>
						<div class="row">
							<div class="col-8">
								<p class="restaurants_name my-3">
									<span class="fs-4 fw-lighter">가게제목</span> 
									<span class="rate-point mx-3 fs-3 fw-lighter">평점</span>
								</p>
							</div>
							<div class="col-4">
								<span class="my-2 float-end">
									<button type="button" class="btn" style="color: orange;" onclick="location.href='/review'">
										리뷰<i class="bi bi-brush"></i>
									</button>
									<button class="btn" id="box">
										<i id="star" class="bi bi-star" style="color: gold; font-size: 28px;"></i>
									</button>
								</span>
							</div>
						</div>
						<div class="row">
							<table class="table">
								<tr>
									<th><i class="bi bi-geo-alt"></i><span class="fw-lighter mx-2">주소</span></th>
									<td></td>
								</tr>
								<tr>
									<th><i class="bi bi-telephone"></i><span class="fw-lighter mx-2">전화번호</span></th>
									<td></td>
								</tr>
								<tr>
									<th><i class="bi bi-shop"></i><span class="fw-lighter mx-2">가게 소개</span></th>
									<td></td>
								</tr>
								<tr>
									<th><i class="bi bi-tag"></i><span class="fw-lighter mx-2">음식 종류</span></th>
									<td></td>
								</tr>
								<tr>
									<th><i class="bi bi-alarm"></i><span class="fw-lighter mx-2">영업시간</span></th>
									<td></td>
								</tr>
								<tr>
									<th><i class="bi bi-calendar-week"></i><span class="fw-lighter mx-2">휴일</span></th>
									<td></td>
								</tr>

								<tr>
									<th><i class="bi bi-list"></i><span class="fw-lighter mx-2">메뉴</span></th>
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
			    <div id="map" style="width: 400px; height: 350px; cursor: pointer;"></div>
			</div>	
			<!-- 지도 모달 -->
			<div class="row">
				<div class="modal fade" id="mapModal" tabindex="-1" role="dialog" aria-labelledby="mapModalLabel" aria-hidden="true">
					<div class="col-12">
						<span class="close" onclick="closeMapModal()" style="position: absolute; top: 10px; right: 10px; font-size: 32px; color: white; cursor: pointer;">&times;</span>
					    <div class="modal-dialog modal-xl">
					        <div class="modal-content">
					            <div class="modal-header">
						            <div class="modal-body">
						                <div id="largeMap" style="width: 100%; height: 800px;"></div>
						            </div>
					            </div>
					        </div>
					    </div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-8">
				<span class="fs-4 fw-lighter">리뷰</span> 
				<span class="fs-4 fw-lighter" style="color: #adb5bd;">(3)</span>
				<div class="btn-group p-1 float-end">
					<button type="button" class="btn border-opacity-10" style="background: none; border: none;">전체(3)</button>
					<button type="button" class="btn border-opacity-10 " style="background: none; border: none;">
						<span class="visually-hidden">Button</span> 맛있다(1)
					</button>
					<button type="button" class="btn border-opacity-10" style="background: none; border: none;">
						<span class="visually-hidden">Button</span> 괜찮다(1)
					</button>
					<button type="button" class="btn border-opacity-10" style="background: none; border: none;">
						<span class="visually-hidden">Button</span> 별로(1)
					</button>
				</div>
			</div>
			<div class="row">
				<div class="col-8">
					<div class="card mb-3" style="border-left: none; border-right: none; border-radius: 0; box-shadow: none;">
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
										<div class="col-9">
											<p class="col card-text" style="font-size: small; color: #adb5bd;">리뷰 작성일</p>
											<p class="col card-text">리뷰 내용</p>
										</div>
										<div class="col-3 text-end">
											<span class="badge text-bg-success fw-lighter">맛있어요!</span>
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
											<button type="button" class="btn btn-light btn-sm" style="color: #838383">
												<i class="bi bi-pencil-square"></i> <span class="visually-hidden">수정</span>
											</button>
											<button type="button" class="btn btn-light btn-sm" style="color: #838383">
												<i class="bi bi-trash3"></i> <span class="visually-hidden">삭제</span>
											</button>
											<span class="float-end">
												<button type="button" class="btn btn-light btn-sm text-danger">
													<i id="recomened" class="bi bi-heart" style="font-size: 15px;"></i> <span class="visually-hidden">추천</span>
												</button>
											</span>
										</div>
										<div class="row">
										    <div class="col-12">
										        <div class="card">
										            <div class="card-body d-flex flex-row justify-content-between align-items-start">
										                <textarea class="form-control" placeholder="리뷰에 대한 답글을 작성해주세요" aria-label="Recipient's username" aria-describedby="button-addon2"></textarea>
										                <button class="btn btn-outline-secondary submit-reply-button" type="button" id="button-addon2"><i class="bi bi-pencil"></i></button>
										            </div>
										        </div>
										    </div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="input-group mb-3">
							</div>
						</div>
					</div>
					<div class="card mb-3" style="border-top: none; border-left: none; border-right: none; border-radius: 0; box-shadow: none;">
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
										<div class="col-9">
											<p class="col card-text" style="font-size: small; color: #adb5bd;">리뷰 작성일</p>
											<p class="col card-text">리뷰 내용</p>
										</div>
										<div class="col-3 text-end">
											<span class="badge text-bg-success fw-lighter">괜찮아요!</span>
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
											<button type="button" class="btn btn-light btn-sm" style="color: #838383">
												<i class="bi bi-pencil-square"></i> <span class="visually-hidden">수정</span>
											</button>
											<button type="button" class="btn btn-light btn-sm" style="color: #838383">
												<i class="bi bi-trash3"></i> <span class="visually-hidden">삭제</span>
											</button>
											<span class="float-end">
												<button type="button" class="btn btn-light btn-sm text-danger">
													<i id="recomened" class="bi bi-heart" style="font-size: 15px;"></i> <span class="visually-hidden">추천</span>
												</button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card mb-3" style="border-top: none; border-left: none; border-right: none; border-radius: 0; box-shadow: none;">
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
										<div class="col-9">
											<p class="col card-text" style="font-size: small; color: #adb5bd;">리뷰 작성일</p>
											<p class="col card-text">리뷰 내용</p>
										</div>
										<div class="col-3 text-end">
											<span class="badge text-bg-success fw-lighter">별로에요!</span>
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
											<button type="button" class="btn btn-light btn-sm" style="color: #838383">
												<i class="bi bi-pencil-square"></i> <span class="visually-hidden">수정</span>
											</button>
											<button type="button" class="btn btn-light btn-sm" style="color: #838383">
												<i class="bi bi-trash3"></i> <span class="visually-hidden">삭제</span>
											</button>
											<span class="float-end">
												<button type="button" class="btn btn-light btn-sm text-danger">
													<i id="recomened" class="bi bi-heart" style="font-size: 15px;"></i> <span class="visually-hidden">추천</span>
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
						    <div class="card-img-overlay">
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
	
	document.getElementById('map').addEventListener('click', function () {
        $('#mapModal').modal('show');
    });

    // 모달 열릴 때 큰 지도 초기화 및 표시
    $('#mapModal').on('shown.bs.modal', function () {
        var container = document.getElementById('largeMap');
        var options = {
            center: new kakao.maps.LatLng(37.5729587735263, 126.992241734889), // 지도 중심 좌표
            level: 3 // 지도 확대 레벨
        };
        var map = new kakao.maps.Map(container, options);        
        // 마커 추가 (예시)
        var markerPosition = new kakao.maps.LatLng(37.5699451391001, 126.988087440713);
        
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });
        
        marker.setMap(map);
    });
    
    function closeMapModal() {
        $('#mapModal').modal('hide');
    }
    
    // 모달 닫힐 때 큰 지도 초기화
    $('#mapModal').on('hidden.bs.modal', function () {
        // 지도를 삭제하여 초기화
        var mapContainer = document.getElementById('largeMap');
        mapContainer.innerHTML = '';
    });

	$('#star').click(function() {
		if ($(this).hasClass('bi-star-fill')) {
			$(this).removeClass('bi-star-fill').addClass('bi-star')
		} else {
			$(this).removeClass('bi-star').addClass('bi-star-fill')
		}
	})

	$('.bi-heart').click(function() {
	    if ($(this).hasClass('bi-heart-fill')) {
	        $(this).removeClass('bi-heart-fill').addClass('bi-heart');
	    } else {
	        $(this).removeClass('bi-heart').addClass('bi-heart-fill');
	    }
	});

	$(function() {
		// '.emoji-btn' 클래스를 가진 버튼을 클릭할 때 실행되는 함수를 정의합니다.
		$('.border-opacity-10').click(function() {
			// 모든 버튼에 있는 'active' 클래스를 제거합니다.
			$('.border-opacity-10').removeClass('active');
			// 클릭한 버튼에만 'active' 클래스를 추가합니다.
			$(this).addClass('active');
		});

		let previewModal = new bootstrap.Modal("#previewModal");
	});

	var modal = document.getElementById("myModal");
	var modalImg = document.getElementById("modalImg");
	var images = document.getElementsByClassName("img-thumbnail");
	var currentIndex;

	function openModal(image) {
		modal.style.display = "block";
		modalImg.src = image.src;
		currentIndex = Array.from(images).indexOf(image);
		updateNavButtons();
	}

	function closeModal() {
		modal.style.display = "none";
	}

	function changeImage(n) {
		currentIndex += n;
		if (currentIndex < 0) {
			currentIndex = images.length - 1;
		} else if (currentIndex >= images.length) {
			currentIndex = 0;
		}
		modalImg.src = images[currentIndex].src;
		updateNavButtons();
	}

	function updateNavButtons() {
		var prevButton = document.getElementById("prevButton");
		var nextButton = document.getElementById("nextButton");
		if (images.length <= 1) {
			prevButton.style.display = "none";
			nextButton.style.display = "none";
		} else {
			prevButton.style.display = "block";
			nextButton.style.display = "block";
		}
	}

	document.addEventListener("keydown", function(event) {
		if (event.keyCode === 27) {
			closeModal();
		} else if (event.keyCode === 37) {
			changeImage(-1);
		} else if (event.keyCode === 39) {
			changeImage(1);
		}
	});
</script>
</body>
</html>