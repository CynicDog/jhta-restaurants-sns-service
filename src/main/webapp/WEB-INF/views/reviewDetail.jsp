<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
						<img src="/images/user/png/${review.review.customer.username}" onerror="this.onerror=null; this.src='/images/user/png/user-default-image.png';" alt="User Image" class="img-thumbnail rounded-circle" onclick="location.href='/user/details?id=${review.review.customer.id}'" style="cursor: pointer;">
					</div>
					<div class="col-3">
						<p class="mb-5 my-5" style="font-size:30px;"><strong>
						<c:choose>
							<c:when test="${not empty review.review.customer.nickname }">${review.review.customer.nickname }</c:when>
							<c:otherwise>${review.review.customer.username }</c:otherwise>
						</c:choose>
						</strong><span style="color: #ffc107;"><fmt:formatNumber value="${review.reviewRatingByCustomerId}" pattern="(#.#)" /></span></p>
					</div>
					<div class="col-7">
						<div class="row float-end">

							<c:choose>
								<c:when test="${review.review.rating eq 5}">
									 <span class="badge rounded-pill text-dark fs-6" style="background-color: rgba(255, 131, 7, 0.3);">맛있어요</span>
								</c:when>
								<c:when test="${review.review.rating eq 3}">
									 <span class="badge rounded-pill text-dark fs-6" style="background-color: rgba(255, 131, 7, 0.3);">괜찮아요</span>
								</c:when>
								<c:when test="${review.review.rating eq 1}">
									 <span class="badge rounded-pill text-dark fs-6" style="background-color: rgba(255, 131, 7, 0.3);">별로에요</span>
								</c:when>
							</c:choose>

						</div>
					</div>
					<sec:authorize access="hasRole('ROLE_CUSTOMER')">
					<form action="reviewReport" method="post" id="reportForm">
					<input type="hidden" name="reviewId" value="${review.review.id }"/>
					<sec:authentication property="principal.user.id" var="userId" />
					<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
       					<div class="modal-dialog">
                    		<div class="modal-content">
                            	<div class="modal-header">
                            		<h1 class="modal-title fs-5" id="reportModalLabel">신고하기</h1>
                              			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                       			</div>
                          		<div class="modal-body">
                             		<div class="col-md">
                                   		<div class="form-floating">
                                         	<select class="form-select" id="floatingSelectGrid" name="category">
                                               	<option selected>신고사유를 선택해 주세요</option>
                                                <option value="PROFANITY">욕설</option>
                                                <option value="FALSEHOOD">비방</option>
                                                <option value="PROMOTIONAL">허위</option>
                                          	</select>
                                          	<label for="floatingSelectGrid">신고사유</label>
                                       	</div>
                                 	</div>
                                  	<div class="mb-3">
                                      	<label for="message-text" class="col-form-label">Message:</label>
                                    	<textarea class="form-control" id="message-text" name="content"></textarea>
                                	</div>
                         		</div>
                          		<div class="modal-footer">
                               		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                              		<button type="submit" class="btn btn-primary">Send message</button>
                              	</div>
               				</div>
             			</div>
              		</div>
					</form>
					</sec:authorize>
				</div>
				<div class="row col-3 m-3">
					<a href="/store/detail?id=${review.review.store.id}"class="mx-3">@${review.review.store.name}-${review.review.store.address}</a>
				</div>	
				<div class="row m-3">
						<span style="font-size: 15px;">
							<i id="recomened" class="bi bi-heart-fill text-danger" ></i>
							<a>${review.review.likedCount }</a>
							<a class="float-end pt-1 mt-1 text-secondary"><fmt:formatDate value="${review.review.createDate }" pattern="yyyy-M-d" /></a>
						</span>
					<p class="border border-secondary border-opacity-50 rounded p-3" style="font-size:20px;">${review.review.content }</p>
				</div>
				<div class="row" id="image-row">
				<c:forEach var="picture" items="${review.reviewPicturesByReviewId }" varStatus="loop">
					<c:choose>
					<c:when test="${loop.index lt 2}">
					<div class="col-4 " >
						<img class="img-thumbnail object-fit-cover" data-image-index="${loop.index}" src="/images/review/png/${picture.pictureName }" alt="..."  style="width: 100%; height: 450px; cursor: pointer;">
					</div>
					</c:when>
					<c:when test="${loop.index eq 2}">
					<div class="col-4">
						<div class="card bg-dark text-center text-white fs-1">
							<img class="img-thumbnail card-img opacity-50 object-fit-cover" data-image-index="${loop.index}" src="/images/review/png/${picture.pictureName }" alt="..." style="width: 100%; height: 450px; cursor: pointer;">
							<div class="col-1 card-img-overlay position-absolute top-50 start-50 translate-middle" >
							<p id="review-count" class="position-absolute top-50 start-50 translate-middle">+</p>
							</div>
						</div>
					</div>
					</c:when>
					<c:when test="${loop.index ge 3}">
					<div class="col-4 visually-hidden" >
						<img class="img-thumbnail card-img object-fit-cover" data-image-index="${loop.index}" src="/images/review/png/${picture.pictureName }" alt="..." style="width: 100%; height: 450px;">
						<p id="hidden-review-count">+${loop.count - 2}</p>
					</div>
					</c:when>
					</c:choose>
				</c:forEach>
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
							            <img class="modal-content object-fit-cover" id="modalImg" style="width: 100%; height: 1000px;">
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
			<c:forEach var="keyword" items="${review.reviewKeywords }">
					<span class="badge bg-secondary-subtle text-secondary-emphasis rounded-pill fw-lighter fs-6 text-white m-2 p-1">${keyword.keyword }</span>
			</c:forEach>
				<span class="float-end">
					<button type="button" class="btn btn-light btn-sm text-danger mb-4" data-bs-toggle="modal" data-bs-target="#reportModal" data-bs-whatever="@mdo">
		          		<i class="bi bi-flag-fill" style="color:red; font-size:20px;"></i>
		              	<span class="visually-hidden">신고</span>
					</button>
				</span>
			</div>
		</div>
		<div class="h4 pb-2 mb-4 border-bottom border-secondary"></div>
		<div class="row">
			<div class="col-12" id="review-comment">
					<form id="reviewCommentForm" method="post" action="register">
					<div class="col-12  border-bottom my-3">
						<input type="hidden" name="reviewId" value="${review.review.id}"/>
						<input type="hidden" name="storeId" value="${review.review.store.id }"/>
						<div class="form-floating text-start">
							<p>댓글을 작성하세요</p>
			     			<textarea placeholder="댓글을 작성하세요" class="form-control-plaintext" id="comment-textarea" name="content" style="min-height:2rem"></textarea>
		               	</div>
					</div>
					<div class="row m-3">
					<div class="col-8"></div>
					<div class="col-4">
   						<button id="button-add-comment" type="submit" class="btn btn-light float-end btn-lg" style="color: #838383">
                       		<i class="bi bi-pencil-square"></i> <span class="visually-hidden">작성</span>
                    	</button>
					</div>
					</div>
					</form>
		<c:forEach var="comment" items="${review.reviewCommentsByReviewId }" >
			<div class="col-12 border-bottom my-3">
			<div class="row my-3">
				<div class="col-1"><i class="bi bi-arrow-return-right d-flex justify-content-end align-items-center" style="color: #ff792a; font-size: 45px;"></i></div>
				<div class="col-1">
					<img src="/images/user/png/${comment.username}" onerror="this.onerror=null; this.src='/images/user/png/user-default-image.png';" alt="User Image" class="img-thumbnail rounded-circle" onclick="location.href='/user/details?id=${comment.userId}'" style="cursor: pointer;">
					<div class="text-center card-title my-1">
						<span style="font-size: medium; font-weight: bold; color: #FFC107;"><fmt:formatNumber value="${comment.reviewAvg}" pattern="#.#" /></span>
					</div>
				</div>
				<div class="col-10 position-relative">
				<div class="row mb-2">
					<div class="col-9 text-start">
					<div class="card-text text-muted" style="font-size: small; ">  
						<span><fmt:formatDate value="${comment.createDate }" pattern="yyyy-M-d" /></span>
					</div>
					<div class="card-text">
						<span> 
							<c:choose>
								<c:when test="${not empty comment.nickname }">
									<span class="btn badge text-bg-success bg-opacity-50 text-secondary-emphasis rounded-pill" onclick="location.href='/user/details?id=${comment.userId}'"><strong >${comment.nickname }</strong></span>
								</c:when>
								<c:otherwise>
									<span class="btn badge text-bg-success bg-opacity-50 text-secondary-emphasis rounded-pill" onclick="location.href='/user/details?id=${comment.userId}'"><strong >${comment.username }</strong></span>
								</c:otherwise>
							</c:choose>
						</span>
					</div>
					<div class="card-text">
						<span>${comment.content}</span>
					</div>
					</div>
					<div class="col-3 d-flex justify-content-end align-items-center">
					</div>
				</div>
				<div class="row position-absolute" style="bottom:0;right:20px;">
					<div class="col">
						<span class="text-end">
							<a href="/review/comment/del?reviewId=${comment.reviewId}&reviewCommentId=${comment.id}" class="btn btn-light btn-sm" style="color: #838383">
								<i class="bi bi-trash3"></i>
								<span class="visually-hidden">삭제</span>
							</a>
						</span>
					</div>
				</div>
			</div>
			</div>	
			</div>
		</c:forEach>		
			</div>
		</div>
</div>
<%@ include file="common/footer.jsp"%>
</div>
<script>
$(document).ready(function () {

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
	
	 var hiddenReviewCount = parseInt($("#hidden-review-count").text());
	 if (hiddenReviewCount > 0) {
	     $("#review-count").text("+" + hiddenReviewCount);
	 } else {
	     $("#review-count").hide();
	 }
	
	
	$("#comment-textarea").keyup(function() {
			
	    let totalContentLength = $(this).val().trim().length;
	
	    if (totalContentLength === 0) {
	        $("#button-add-comment").attr("disabled", true);
	    } else {
	        $("#button-add-comment").attr("disabled", false);
	    }
	});


});

</script>
</body>
</html>