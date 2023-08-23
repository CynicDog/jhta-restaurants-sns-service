<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>         
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Application</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<style type="text/css">
		#offcanvasExample {
		    width: 40%;
		}
	</style>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="wrap"> 
	<div class="container border-top mt-3" >
		<div class="row text-center border-bottom">
			<div class="col-12 my-5">
				<h2>${post.post.title}</h2>
				<h4 class="text-secondary">( ${post.post.subTitle} )</h4>
			</div>
		</div>
	</div>
	<div class="container mt-2" >
		<c:forEach var="data" items="${post.postData }">
			<div class="row border-bottom">
				<div class="col-1"></div>
				<div class="col-3 my-5">
					<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
						<img src="../../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">
					</div>
				</div>
				<div class="col-6 my-5 text-left">
					<div class="d-flex">
						<h3>${data.store.id }</h3>
						<h3 class="text-warning ms-3">5.0</h3>
					</div>
					<p class="text-secondary">서울특별시 동대문구 망우로 30</p>
					<p>${data.content }</p>
				</div>
				<div class="col-2 my-5 position-relative">
					<button class="btn ms-3 position-absolute" id="box">
						<i class="bi bi-star" style="color:gold; font-size:28px;" ></i>
					</button>
				</div>
			</div>
		</c:forEach>
		
		<div class="row my-3 justify-content-center">
			<div class="col-11 text-end">
				<div class="" style="bottom:0;right:0;">
					<button class="btn btn-lg" name="showReviewsButton" style="bottom:0;" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample" data-store-id="${data.store.id}">
						<i class="bi bi-chat-text"></i>
						<span class="visually-hidden">댓글</span>
					</button>
					<div class="offcanvas offcanvas-end offcanvas-size-xl" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
					  	<div class="offcanvas-header">
					    	<h5 class="offcanvas-title" id="offcanvasExampleLabel">댓글</h5>
					    	<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
					  	</div>
					  	<div class="offcanvas-body">
							<div class="col-12 border-top  my-3"></div>
								<div class="col-12  border-bottom my-3">
									<form id="postComment" method="post" action="/post/CommentRegister">
										<input type="hidden" name="postingId" value="${param.postingId }"/>
										<sec:authentication property="principal.user.id" var="userId"/>
										<div class="form-floating text-start">
											<p>댓글을 작성하세요</p>
		                                    <textarea placeholder="댓글을 작성하세요" class="form-control-plaintext"
		                                                          name="content" style="min-height:2rem"></textarea>
	                                    </div> 
	                                    <button class="btn btn-outline-secondary btn-sm my-2">작성</button>
									</form>
								</div>
							
							<c:forEach var="comment" items="${post.postComments }">
								<div class="col-12  border-bottom my-3">
									
									<div class="row my-3">
										<div class="col-2">
											<a id="Popover" tabindex="0" class="btn border-opacity-10 ratio ratio-1x1" role="button" data-bs-toggle="popover" data-bs-trigger="focus" data-bs-title="정손님(회원등급) 평균별점" data-bs-content="Follow">
												<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle" alt="...">
											</a>
											<div class="text-center card-title my-1">
												<span style="font-size: medium; font-weight: bold; color: #FFC107;">5.00</span>
											</div>
										</div>
										
											<div class="col-10 position-relative ">
												<div class="row mb-2">
													<div class="col-9 text-start">
														<div class="card-text text-muted" style="font-size: small; ">  
															<span>${comment.updateDate }</span>
														</div>
														<div class="card-text">
															<span> ${comment.customer.id }</span>
														</div>
														<div class="card-text">
															<span>${comment.content }</span>
														</div>
														
													</div>
													
													<div class="col-3 d-flex justify-content-end align-items-center">
												    </div>
												</div>
												<div class="row position-absolute" style="bottom:0;right:20px;">
													<div class="col">
														<span class="text-end">
															<button type="button" class="btn btn-outline-secondary btn-sm">수정</button>
													        <button type="button" class="btn btn-outline-secondary btn-sm">
													            <i id="recomened" class="bi bi-hand-thumbs-up" style="font-size: 15px;"></i>
													            <span class="visually-hidden">추천</span>
													        </button>
															<button type="button" class="btn btn-outline-danger btn-sm">
																<i class="bi bi-trash3"></i>
																<span class="visually-hidden">삭제</span>
															</button>
															<button type="button" class="btn btn-outline-danger btn-sm">
													            <i id="recomened" class="bi bi-flag-fill" style="font-size: 15px;"></i>
													            <span class="visually-hidden">신고</span>
													        </button>
														</span>
													</div>
												</div>
											</div>
									</div>	
								</div>
							</c:forEach>
					  	</div>
					</div>
					<button type="button" class="btn btn-lg">
			            <i id="recomened" class="bi bi-hand-thumbs-up" style="font-size: 15px;"></i>
			            <span class="visually-hidden">추천</span>
			        </button>
			        <button type="button" class="btn btn-lg">
			            <i id="recomened" class="bi bi-flag-fill" style="font-size: 15px; color:#EB0000"></i>
			            <span class="visually-hidden">신고</span>
			        </button>
				</div>
			</div>
			
		</div>
	</div>
	<%-- <%@ include file="../common/footer.jsp" %> --%>
</div>

<script type="text/javascript">
	$('#box i').click(function(){
		if($(this).hasClass('bi-star-fill')){
			$(this).removeClass('bi-star-fill')
					.addClass('bi-star')
		}else {
			$(this).removeClass('bi-star')
					.addClass('bi-star-fill')
		}
	})

	/* document.addEventListener("DOMContentLoaded", function() {
        var showReviewsButtons = document.querySelectorAll('button[name="showReviewsButton"]');
        
        showReviewsButtons.forEach(function(button) {
            button.addEventListener("click", function() {
                var storeId = button.getAttribute("data-store-id");
                loadReviews(storeId);
            });
        });
        
        function loadReviews(storeId) {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        var data = JSON.parse(xhr.responseText);
                        console.log(data)
                        renderReviews(data);
                    } else {
                        console.error("Error fetching review data:", xhr.status, xhr.statusText);
                    }
                }
            };
            
            xhr.open("GET", "/path-to-review-data?store_id=" + storeId, true);
            xhr.setRequestHeader("Content-Type", "application/json");
            xhr.send();
        }
        
        function renderReviews(data) {
        	  var offcanvasBody = document.querySelector('.offcanvas-body');
        	    offcanvasBody.innerHTML = ""; // Clear existing content
        	    
        	    data.forEach(function(review) {
        	        var reviewContent = document.createElement('div');
        	        reviewContent.className = 'col-9';
        	        
        	        var reviewDate = document.createElement('div');
        	        reviewDate.className = 'card-text text-muted';
        	        reviewDate.style.fontSize = 'small';
        	        reviewDate.textContent = '리뷰 작성일: ' + review.createDate; // Assuming 'date' is a property in your review object
        	        
        	        var reviewerName = document.createElement('div');
        	        reviewerName.className = 'card-text';
        	        reviewerName.textContent = '리뷰어명: ' + review.customerName; // Assuming 'reviewer' is a property in your review object
        	        
        	        var reviewText = document.createElement('div');
        	        reviewText.className = 'card-text';
        	        reviewText.textContent = '리뷰내용: ' + review.content; // Assuming 'content' is a property in your review object
        	        
        	        reviewContent.appendChild(reviewDate);
        	        reviewContent.appendChild(reviewerName);
        	        reviewContent.appendChild(reviewText);
        	        
        	        offcanvasBody.appendChild(reviewContent);
        	    });
        }
    }); */

	/* document.addEventListener("DOMContentLoaded", function() {
	    var showReviewsButtons = document.querySelectorAll('.show-reviews-button');
	    var reviewsTableBody = document.querySelector('.reviews-table-body');
	    
	    showReviewsButtons.forEach(function(button) {
	        button.addEventListener("click", function() {
	            var storeId = button.getAttribute("data-store-id");
	            fetchReviews(storeId);
	        });
	    });
	    
	    function fetchReviews(storeId) {
	        var xhr = new XMLHttpRequest();
	        xhr.onreadystatechange = function() {
	            if (xhr.readyState === 4) {
	                if (xhr.status === 200) {
	                    var data = JSON.parse(xhr.responseText);
	                    renderReviews(data);
	                } else {
	                    console.error("Error fetching review data:", xhr.status, xhr.statusText);
	                }
	            }
	        };
	        
	        xhr.open("GET", "/path/to/review/data?store_id=" + encodeURIComponent(storeId), true);
	        xhr.setRequestHeader("Content-Type", "application/json");
	        xhr.send();
	    }
	    
	    function renderReviews(data) {
	        reviewsTableBody.innerHTML = ""; // 기존 데이터 삭제
	        
	        data.forEach(function(review) {
	            var row = document.createElement("tr");
	            var titleCell = document.createElement("td");
	            var authorCell = document.createElement("td");
	            var contentCell = document.createElement("td");
	            
	            titleCell.textContent = review.title;
	            authorCell.textContent = review.author;
	            contentCell.textContent = review.content;
	            
	            row.appendChild(titleCell);
	            row.appendChild(authorCell);
	            row.appendChild(contentCell);
	            
	            reviewsTableBody.appendChild(row);
	        });
	    }
	}); */
</script>
</body>
</html>