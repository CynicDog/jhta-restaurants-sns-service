<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<style type="text/css">
html, body {
	height: 100%;
}

.wrap {
	position: relative;
	min-height: 100%;
	padding-bottom: 70px;
}

</style>
</head>

<body>
<%@ include file="common/navbar.jsp"%>
<div class="wrap">
	<div class="container">
		<div class="card border border-success p-2 border-opacity-10">
  			<div class="card-body">
				<div class="row m-3">
					<div class="col-2">
						<a id="Popover" tabindex="0" class="btn border-opacity-10 ratio ratio-1x1" role="button" data-bs-toggle="popover" data-bs-trigger="focus" data-bs-title="${review.review.customer.fullName}(회원등급) 평균별점" data-bs-content="Follow">
							<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle" alt="...">
						</a>
					</div>
					<div class="col-2">
						<p class="mb-5 my-5" style="font-size:30px;"><strong>${review.review.customer.fullName }</strong></p>
					</div>
					<div class="col-8">
						<div class="row float-end">
							<c:if test="${review.review.rating eq 5}">
								<span class="badge rounded-pill" style="color: #ff792a; font-size:20px; ">맛있어요</span>
							</c:if>
							<c:if test="${review.review.rating eq 3}">
								<span class="badge rounded-pill" style="color: #ff792a; font-size:20px; ">괜찮아요</span>
							</c:if>
							<c:if test="${review.review.rating eq 1}">
								<span class="badge rounded-pill" style="color: #ff792a; font-size:20px; ">별로에요</span>
							</c:if>
						</div>
					</div>
					<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
       					<div class="modal-dialog">
                    		<div class="modal-content">
                            	<div class="modal-header">
                            		<h1 class="modal-title fs-5" id="reportModalLabel">신고하기</h1>
                              			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                       			</div>
                          		<div class="modal-body">
                             		<form>
                               			<div class="col-md">
                                   			<div class="form-floating">
                                          		<select class="form-select" id="floatingSelectGrid">
                                                 	<option selected>신고사유를 선택해 주세요</option>
                                                  	<option value="1">욕설</option>
                                                  	<option value="2">비방</option>
                                                 	<option value="3">허위</option>
                                              	</select> <label for="floatingSelectGrid">신고사유</label>
                                          	</div>
                                  		</div>
                                   		<div class="mb-3">
                                         	<label for="message-text" class="col-form-label">Message:</label>
                                    		<textarea class="form-control" id="message-text"></textarea>
                                       	</div>
                               		</form>
                         		</div>
                          		<div class="modal-footer">
                               		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                              		<button type="button" class="btn btn-primary">Send message</button>
                              	</div>
               				</div>
             			</div>
              		</div>
				</div>
				<div class="row col-3 m-3">
					<a href="/store/detail"class="mx-3">@${review.review.store.name}-${review.review.store.address}</a>
				</div>	
				<div class="row m-3">
						<span style="font-size: 15px;">
							<i id="recomened" class="bi bi-heart-fill text-danger"></i>
							<a>${review.review.likedCount }</a>
							<a class="float-end pt-1 mt-1 text-secondary"><fmt:formatDate value="${review.review.createDate }" pattern="yyyy-M-d" /></a>
						</span>
					<p class="border border-secondary border-opacity-50 rounded p-3" style="font-size:20px;">${review.review.content }</p>
				</div>
				<div class="row" id="image-row">
					<div class="col-4 " >
						<img class="img-thumbnail" data-image-index="0" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="..."  style="width: 100%; height: 100%; cursor: pointer;">
					</div>
					<div class="col-4" >
						<img class="img-thumbnail" data-image-index="1" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA2MjlfMjI5%2FMDAxNjg4MDAwMDc5OTE4.3bW9-0ndIwGAf1J8XmmnZDEM4fmtlo1rO78I4DcOCxAg.1y7MtQUbq9xy1dcRcvcu_VJ92UqdMyARE3-ynUXiWlgg.PNG.ggguuuiii%2F20230629_095340.png&type=sc960_832" alt="..." style="width: 100%; height: 100%; cursor: pointer;">
					</div>
					<div class="col-4" >
						<div class="card bg-dark text-center text-white fs-1">
							<img class="img-thumbnail card-img opacity-50" data-image-index="2" src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/12e66f74-ca37-4a97-b19e-8e9231541a4a.jpeg" alt="..." style="width: 100%; height: 100%; cursor: pointer;">
							<div class="col-1 card-img-overlay position-absolute top-50 start-50 translate-middle" >
							<p class="position-absolute top-50 start-50 translate-middle">+1</p>
							</div>
						</div>
					</div>
					<div class="col-4 visually-hidden" >
						<img class="img-thumbnail card-img" data-image-index="3" src="https://d20aeo683mqd6t.cloudfront.net/images/imgs/000/015/214/original/image006.jpeg?1561342506&d=750x750" alt="..." style="width: 100%; height: 100%;">
					</div>
					
					<!-- Modal -->
					<div id="Modal" class="modal fade" aria-hidden="true" tabindex="-1">
						<div class="modal-dialog modal-dialog-centered modal-xl">
						 <div class="modal-content justify-content-center" style="background-color: black; display: flex;  height: 90vh;">;
					    		<span id="span-close-modal" class="close position-absolute top-0 end-0 text-white-50" style="font-size:50px;" >&times;</span>
							    <div class="row" >
							        <div class="col-1 d-flex justify-content-center align-items-center">
							            <button class="modal-nav-button" id="prevButton" >&#10094;</button>
							        </div>
							        <div class="col-10 text-center">
							            <img class="modal-content" id="modalImg" style="width: 100%; height: 100%;">
							        </div>
							        <div class="col-1 d-flex justify-content-center align-items-center">
							            <button class="modal-nav-button" id="nextButton" >&#10095;</button>
							        </div>
							    </div>
						  </div> 
						</div>
					</div>	
				</div>
  			</div>
			<div class="m-2">
				<c:if test="${review.taste }">
					<span class="badge text-bg-danger bg-opacity-75 fw-lighter fs-6 m-2 p-1">#음식이 맛있어요</span>
				</c:if>
				<c:if test="${review.parking }">
					<span class="badge text-bg-secondary bg-opacity-75 fw-lighter fs-6 m-2 p-1">#주차가 편해요</span>
				</c:if>
				<c:if test="${review.clean }">
					<span class="badge text-bg-info bg-opacity-75 text-white fw-lighter fs-6 m-2 p-1">#매장이 청결해요</span>
				</c:if>
				<c:if test="${review.wide }">
					<span class="badge text-bg-primary bg-opacity-75 text-white fw-lighter fs-6 m-2 p-1">#매장이 넓어요</span>
				</c:if>
				<c:if test="${review.mood }">
					<span class="badge text-bg-warning bg-opacity-75 text-white fw-lighter fs-6 m-2 p-1">#분위기가 좋아요</span>
				</c:if>
				<c:if test="${review.kind }">
					<span class="badge text-bg-success bg-opacity-75 fw-lighter fs-6 m-2 p-1">#친절해요</span>
				</c:if>
				<span class="float-end">
					<button type="button" class="btn btn-light btn-sm text-danger mb-4" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">
		          		<i class="bi bi-flag-fill" style="color:red; font-size:20px;"></i>
		              	<span class="visually-hidden">신고</span>
					</button>
				</span>
			</div>
		</div>
		<div class="h4 pb-2 mb-4 border-bottom border-secondary"></div>
		<div class="row m-3">
			<div class="card">
  				<div class="card-body">
	  				<div class="form-floating mb-3">
					 <textarea class="form-control" id="floatingTextarea" readOnly="readOnly" style="height: 200px">답글입니다.</textarea>
  					 <label for="floatingTextarea2">${review.review.store.name }</label>
					</div>
    				<span class="float-end">
						<button id="text-button" type="button" class="btn btn-lg" style="color: blue;">
							<i class="bi bi-pencil-square"></i>
						</button>
					</span>
  				</div>
			</div>
		</div>	
	</div>	

<%@ include file="common/footer.jsp"%>
</div>
<script>

	// popover 생성
	document.addEventListener("DOMContentLoaded", () => {
		const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
		const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
	})
	
	
	$("#text-button").click(function() {
		$("#floatingTextarea").prop("readOnly", !$("#floatingTextarea").prop("readOnly"))
	});
	
	
// 모달객체 생성한다. 스크립트로 show, hide 할 수 있다.
let modal = new bootstrap.Modal("#Modal");
// 전체 이미지 갯수를 조회해서 대입한다.
let imgLength = $("#image-row .img-thumbnail").length;
// 현재 모달차에 표시되고 있는 이미지의 인덱스가 대입되는 변수다.
let currentImageIndex;

// 이미지를 클릭했을 때 실행되는 이벤트 핸들러 함수를 등록한다
$("#image-row .img-thumbnail").click(function() {
	// 지금 클릭한 버튼의 인덱스값을 조회해서 currentImageIndex변수에 대입한다. <-- 모달창에서 현재 보고 있는 이미지를 인덱스를 알고 있어야지 이전/다음 버튼으로 이미지를 변경할 수 있음
	currentImageIndex = parseInt($(this).attr("data-image-index"))

	// 지금 클릭한 버튼의 이미지경로를 조회해서 변수에 대입한다.
	let imagepath = $(this).attr("src");
	// 조회된 이미지경로를 모달창의 이미지에 표시되게 한다.<img id="modalImg"> 이 엘리먼트에 src 속성으로 이미지경로로 지정한다.
	$("#modalImg").attr("src", imagepath);
	
	modal.show();
});

// 이전 버튼을 클릭했을 때 실행되는 이벤트 핸들러 함수를 등록한다
$("#prevButton").click(function() {
	// 이전 버튼을 클릭했기 때문에 현재 이미지인덱스값을 1감소시킨다.
	currentImageIndex--;
	// 현재 이미지 인덱스값이 0보다 작아지면 맨 마지막번째 이미지의 인덱스값(전체 이미지 개수 - 1)을 저장한ㄷ
	if (currentImageIndex < 0) {
		currentImageIndex = imgLength - 1
	}
	// 위에서 계산한 이미지 인덱스에 해당하는 이미지 태그를 찾아서 그 이미지태그의 src 속성값을 조회한다.
	let imagepath = $('#image-row .img-thumbnail').eq(currentImageIndex).attr("src");
	// 위에서 조회한 이미지경로를 모달창의 img 태그에 설정한다.
	$("#modalImg").attr("src", imagepath);
});

// 다음 버튼을 클릭했을 때 실행되는 이벤트 핸들러 함수를 등록한다.
$("#nextButton").click(function() {
	// 다음 버튼을 클릭했기 때문에 현재 이미지인덱스값을 1증가시킨다.
	currentImageIndex++;
	if (currentImageIndex > imgLength-1) {
		currentImageIndex = 0;
	}
	let imagepath = $('#image-row .img-thumbnail').eq(currentImageIndex).attr("src");
	$("#modalImg").attr("src", imagepath);
});

$("#span-close-modal").click(function() {
	modal.hide();
});

/*
	var modal = document.getElementById("Modal");
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
*/
</script>
</body>
</html>