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
					<div class="col-3">
						<p class="m-1 text-center">리뷰추천수</p>
						<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle" alt="...">
					</div>
					<div class="col-2">
						<p class="mb-5 my-5"><strong>정손님</strong></p>
					</div>
					<div class="col-6">
						<span class="float-end">
							<i class="bi bi-emoji-angry" style="font-size:40px;"></i>
							<button type="button" class="btn border-opacity-10 mb-4">
								<i class="bi bi-megaphone" style="color:red; font-size:35px;" ></i>
							</button>
						</span>
					</div>
				</div>
				<div class="row m-3">
					<p class="mx-3">가게명-서울시 종로구</p>
				</div>	
				<div class="row m-3">
					<p>리뷰 내용</p>
				</div>
				<div class="row">
				
					<div class="col-4">
						<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="..." 
						 	onclick="openModal(this)">
					</div>
					<div class="col-4">
						<img class="img-thumbnail" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA2MjlfMjI5%2FMDAxNjg4MDAwMDc5OTE4.3bW9-0ndIwGAf1J8XmmnZDEM4fmtlo1rO78I4DcOCxAg.1y7MtQUbq9xy1dcRcvcu_VJ92UqdMyARE3-ynUXiWlgg.PNG.ggguuuiii%2F20230629_095340.png&type=sc960_832" alt="..." 
							 onclick="openModal(this)">
					</div>
					<div class="col-4">
						<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="..." 
							 onclick="openModal(this)">
					</div>
					
					<!-- Modal -->
					<div id="Modal" class="modal">
					    <span class="close float-end" onclick="closeModal()" style="font-size:50px;">&times;</span>
					    <div class="row m-5"></div>
					    <div class="row m-5">
					        <div class="col-2 d-flex justify-content-center align-items-center">
					            <button class="modal-nav-button" id="prevButton" onclick="changeImage(-1)">&#10094;</button>
					        </div>
					        <div class="col-8 text-center">
					            <img class="modal-content" id="modalImg">
					        </div>
					        <div class="col-2 d-flex justify-content-center align-items-center">
					            <button class="modal-nav-button" id="nextButton" onclick="changeImage(1)">&#10095;</button>
					        </div>
					    </div>
					    <div class="row m-5"></div>
					</div>	
				</div>
  			</div>
		</div>
		<div class="h4 pb-2 mb-4 border-bottom border-secondary"></div>
		<div class="row m-3">
			<div class="card">
  				<div class="card-body">
    				답글입니다
  				</div>
			</div>
		</div>	
	</div>	

<%@ include file="common/footer.jsp"%>
</div>
<script>
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
	
</script>
</body>
</html>