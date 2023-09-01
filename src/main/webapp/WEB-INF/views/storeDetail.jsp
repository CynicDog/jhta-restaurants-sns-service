<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	.border-opacity-10.active {
	    color: #ff792a;
	}
	.img-thumbnail {
        max-height: 250px; /* 원하는 높이로 조절해주세요 */
        object-fit: cover;
    }
</style>
</head>
<body>
<%@ include file="common/navbar.jsp" %>
<div class="wrap">
    <div class="container">
        <div class="row row-cols-5 object-fit-cover border rounded" style="cursor: pointer;">
            <c:forEach var="recentReview" items="${recentReviews}">
                <img class="img-thumbnail" src="/images/review/jpeg/${recentReview.reviewPictures[0].pictureName }" alt="Thumbnail 1" onclick="openModal(this)">
            </c:forEach>
        </div>
        <div id="myModal" class="modal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.6); overflow: auto; z-index: 1000;">
            <span class="close" onclick="closeModal()" style="position: absolute; top: 10px; right: 10px; font-size: 32px; color: white; cursor: pointer;">&times;</span>
            <div class=" d-flex justify-content-center align-items-center" style="height: 100%;">
                <div style="width: 100px;" class=" d-flex justify-content-center align-items-center">
                    <button class="modal-nav-button" id="prevButton" onclick="changeImage(-1)" style="font-size: 2em; background: none; border: none; cursor: pointer; color: white;">
                        &#10094;
                    </button>
                </div>
                <div class="text-center" style="background-color: black; width: 80%;">
				    <div class="fotorama" data-nav="thumbs">
				        <img class="modal-content" id="modalImg" style="width: auto; height: auto; max-width: 100%; max-height: 80vh; margin: auto; display: block;">
				    </div>
				</div>
                <div style="width: 400px;" class="2">
                    <div class="card" style="width:80%; height: 80vh; overflow: hidden;">
                        <div class="card-body d-flex flex-column align-items-start">
                            <div class="d-flex align-items-center mb-2">
<%--                                TODO --%>
                                <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle " style="width: 60px; height: 60px;" alt="...">
                                <div class="ml-2">
                                    <span style="font-size: medium; font-weight: bold;">정손님</span>
                                </div>
                                <div class="p-2 ml-auto">
                                    <span class="badge bg-primary-subtle text-primary-emphasis rounded-pill">맛있어요!</span>
                                </div>
                            </div>
                            <c:forEach var="review" items="${recentReviews}">
							    <div class="review">
							        <p>${review.content}</p>
							    </div>
							</c:forEach>
                        </div>
                    </div>
                </div>
                <div style="width: 100px;" class=" d-flex justify-content-center align-items-center">
                    <button class="modal-nav-button" id="nextButton" onclick="changeImage(1)" style="font-size: 2em; background: none; border: none; cursor: pointer; color: white;">
                        &#10095;
                    </button>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div>
                    <header>
                    <div class="row">
                        <div class="col-8">
                            <p class="restaurants_name my-3">
                                <span class="fs-4 fw-lighter">${store.name}</span>
                                <span class="rate-point mx-3 fs-3 fw-lighter" style="color: #ff792a;"><fmt:formatNumber value="${storeAvg.storeReviewAvg }" pattern="#.#" /></span>
                            </p>
                        </div>
                            <div class="col-4">
						       <span class="float-end">
							       <sec:authorize access="isAuthenticated()">
							            <sec:authentication property="principal.user.id" var="loginId"/>
							            <c:if test="${store.owner.id ne loginId}">
							                <button type="button" class="btn" style="color: #ff792a;" onclick="location.href='/review?storeId=${param.id }'">
							                    리뷰<i class="bi bi-brush"></i>
							                </button>
							                <button class="btn" id="btn-bookmark" data-store-id="${store.id }">
							                    <i id="bookmark-${store.id }" class="bi ${not empty bookmark ? 'bi-star-fill' : 'bi-star'}" style="color: gold; font-size: 28px;"></i>
							                </button>
							            </c:if>
							       </sec:authorize>
							        <sec:authorize access="!isAuthenticated()">
							            <button type="button" class="btn" style="color: #ff792a;" onclick="location.href='/review?storeId=${param.id }'">
							                리뷰<i class="bi bi-brush"></i>
							            </button>
							            <button class="btn" id="btn-bookmark" data-store-id="${store.id }">
							                <i id="bookmark-${store.id }" class="bi ${not empty bookmark ? 'bi-star-fill' : 'bi-star'}" style="color: gold; font-size: 28px;"></i>
							            </button>
							        </sec:authorize>
								</span>
							</div>
						</div>
                        <div>
                            <i class="bi bi-eye-fill" style="color: #C0C0C0;"></i><span style=" display: inline-block; margin: -6px 10px 0 0; vertical-align: middle; color: #C0C0C0;">${store.readCount }</span>
                            <i class="bi bi-pen-fill" style="color: #C0C0C0;"></i><span style=" display: inline-block; margin: -6px 10px 0 0; vertical-align: middle; color: #C0C0C0;">${reviewCount }</span>
                            <i class="bi bi-star-fill" style="color: #C0C0C0;"></i> <span style=" display: inline-block; margin: -6px 10px 0 0; vertical-align: middle; color: #C0C0C0;">${bookmarkCount }</span>
                        </div>
                        <table class="table">
                            <tr>
                                <th style="width: 120px;"><i class="bi bi-geo-alt"></i><span class="fw-lighter mx-2">주소</span></th>
                                <td>${store.address}</td>
                            </tr>
                            <tr>
                                <th><i class="bi bi-telephone"></i><span class="fw-lighter mx-2">전화번호</span></th>
                                <td>${store.phone}</td>
                            </tr>
                            <tr>
                                <th><i class="bi bi-shop"></i><span class="fw-lighter mx-2">가게 소개</span></th>
                                <td>${store.description}</td>
                            </tr>
                            <tr>
                                <th><i class="bi bi-tag"></i><span class="fw-lighter mx-2">음식 종류</span></th>
                                <td>${store.category}</td>
                            </tr>
                            <tr>
                                <th><i class="bi bi-alarm"></i><span class="fw-lighter mx-2">영업시간</span></th>
                                <td id="daysArea">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="bi bi-list"></i><span class="fw-lighter mx-2">메뉴</span></th>
                                <td>
                                    <c:forEach var="food" items="${foods}">
                                        <div class="col my-2">
                                            <span class="food-name d-inline-block" style="width: 150px;"><c:out value="${food.name}"/></span> <span class="food-price badge bg-secondary-subtle text-secondary-emphasis rounded-pill"><c:out value="${food.price}"/>원</span>
                                        </div>
                                    </c:forEach>
                                </td>
                            </tr>
                        </table>
                    </header>
                </div>
                <div class="row">
				    <div class="col-4">
				        <span class="fs-4 fw-lighter">리뷰</span>
				        <span class="fs-4 fw-lighter" style="color: #adb5bd;">(${reviewCount })</span>
				    </div>
				    <div class="col-8 p-1 text-end">
				        <button id="btn-review-all" type="button" class="btn border-opacity-10 active" style="background: none; border: none;">전체(${reviewSummary.total })
				        </button>
				        <button id="btn-review-good" type="button" class="btn border-opacity-10 " style="background: none; border: none;">맛있어요(${reviewSummary.good })
				        </button>
				        <button id="btn-review-soso" type="button" class="btn border-opacity-10" style="background: none; border: none;">괜찮아요(${reviewSummary.soso })
				        </button>
				        <button id="btn-review-bad" type="button" class="btn border-opacity-10" style="background: none; border: none;">별로에요(${reviewSummary.bad })
				        </button>
				    </div>
		            <div id="review-list">
		                <div id="reviewOutputArea">
		                </div>
		            </div>
				</div>
            </div>
            <div class="col-md-4" style="position: relative;">
            	<div style="position: sticky; top: 0;">
	                <div id="map" style="width: 400px; height: 350px; cursor: pointer;"></div>
		                <div class="p-4">
		                <div class="row">
		                	<c:forEach var="closestStore" items="${closestStores }">
		                    <div class="mb-3">
		                        <h5 style="color: #ff792a;"><strong>주변 맛집 추천</strong></h5>
		                        <div class="card m-1" id="cardId" style="border-top: none; border-left: none; border-right: none; height: 120px;">
		                            <div class="d-flex align-items-start">
		                                <img src="https://mp-seoul-image-production-s3.mangoplate.com/1536664_1681452829189041.jpg?fit=around|120:120&crop=120:120;*,*&output-format=jpg&output-quality=80" class="card-img" style="width: 100px; height: 100px; cursor: pointer;" onclick="location.href='/store/detail?id=${closestStore.id }'">
		                                <div class="ml-3">
		                                    <h5 class="card-title mt-0" style="margin-left: 5px; cursor: pointer; color: black; transition: color 0.3s; "onclick="location.href='/store/detail?id=${closestStore.id }'"onmouseover="this.style.color='#ff792a';" onmouseout="this.style.color='black';"> ${closestStore.name } <span></span></h5>
		                                    <p class="card-text text-sm ml-1" style="white-space: nowrap;">
		                                        <span style="font-size: 12px; margin-left: 10px; display: block; height: 25px;"><strong>카테고리:</strong> ${closestStore.category }</span>
		                                        <span style="font-size: 12px; margin-left: 10px; display: block; height: 25px;"><strong>가게주소:</strong> ${closestStore.address }</span>
		                                        <span style="font-size: 12px; margin-left: 10px; display: block; height: 25px;"><strong>전화번호:</strong> ${closestStore.phone } </span>
		                                    </p>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                	</c:forEach>
		                    <!-- <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle" style="width: 75px; height: 60px;" alt="...">
		                    <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle" style="width: 75px; height: 60px;" alt="...">
		                    <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle" style="width: 75px; height: 60px;" alt="...">
		                    <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle" style="width: 75px; height: 60px;" alt="...">
		                    <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle" style="width: 75px; height: 60px;" alt="..."> -->
		                </div>
		            </div>
	            </div>
            </div>
        </div>
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
    <%@ include file="common/footer.jsp" %>
</div>
<script>
    const storeId = ${store.id};
    
    $("#review-list").on('click', '[id^="recommend-"]', function(){
        console.log("heart-clicked");
        // Spring Security에서 제공하는 principal을 사용하여 로그인 상태 확인
        if (${pageContext.request.userPrincipal != null}) {
          //로그인 했을 때
           const reviewId = $(this).attr('review-id');
          //star- fill -> blank
          if ($(this).hasClass('bi-heart-fill')) {
                $(this).removeClass('bi-heart-fill').addClass('bi-heart')
                $.getJSON('/like/delete', {reviewId : reviewId});
          //star- blank -> fill      
          } else {
             $(this).removeClass('bi-heart').addClass('bi-heart-fill')
             $.getJSON('/like/insert', {reviewId : reviewId});

          }
        } else {
           // 로그인되지 않은 경우, 로그인 페이지 열기
              alert("로그인이 필요합니다");
            window.location.href = "/user/login?error=anonymous";
        }
    });
    
	const reviewOutputArea = document.getElementById('reviewOutputArea');

    let pageOnReview = 1;
    let isReviewsFetching = false;
	let isReviewsLast = false;
    let reviewFetchingOption = 'all';
	
	const getReviews = (option, page) => {
	    return fetch(`/store/detail/reviews?id=\${storeId}&page=\${page}&limit=5&option=\${option}`).then(response => response.json());
	}
	
	function fetchAndRenderReviews(reviewFetchingOption, pageOnReview) {

	    isReviewsFetching = true;
	    getReviews(reviewFetchingOption, pageOnReview).then(data => {
	
	        if (data.length < 5) {
	            isReviewsLast = true;
	        }

            data.forEach(datum => {
            	
				let like;
				if(datum.isLiked==='y'){ like = 'bi-heart-fill';}
				if(datum.isLiked==='n'){ like = 'bi-heart';}
				console.info(like);
				
                reviewOutputArea.innerHTML += `
                	<div class="card mb-3" style="border-top: none; border-left: none; border-right: none; border-radius: 0; box-shadow: none;" data-review-rating=\${datum.rating}>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-2">
                                    <div class="text-center card-title my-1">
                                        <div class="ratio ratio-1x1">
                                            <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle" alt="...">
                                        </div>
                                        <span style="font-size: medium; font-weight: bold;">\${datum.nickname !== null ? datum.nickname : datum.customerName}</span>
                                    </div>
                                    <div class="text-center card-title my-1">
                                        <span style="font-size: medium; font-weight: bold; color: #FFC107;">\${datum.reviewAvg === null? '' : datum.reviewAvg.toFixed(1) }</span>
                                    </div>
                                </div>
                                <div class="col-10">
                                    <div class="row mb-2">
                                        <div class="col-9" onclick="location.href='/review/detail?id=\${datum.id}'" style="cursor: pointer;">
                                            <p class="col card-text" style="font-size: small; color: #adb5bd;">\${(new Date(datum.createDate)).toISOString().slice(0, 10)}</p>
                                            <p class="col card-text" >\${datum.content}</p>
                                        </div>
                                        <div class="col-3 text-end" onclick="location.href='/review/detail?id=\${datum.id}'" style="cursor: pointer;">
                                        	<span class="badge rounded-pill text-dark fw-light" style="background-color:#edcfb4">
                                            \${(() => {
                                                switch (datum.rating) {
                                                case 5:
                                                    return '맛있어요';
                                                case 3:
                                                    return '괜찮아요';
                                                case 1:
                                                    return '별로에요';
                                                default:
                                                    return datum.rating;
                                                 }
                                            })()}
                                            </span>
                                        </div>
                                    </div>
                                    <div class="d-flex flex-nowrap overflow-auto" id="picturesOutputArea">
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
                                            <button id="comment" type="button" class="btn btn-light"><span>답글</span></button>
                                                </button>
                                                <button type="button" class="btn btn-light btn-sm text-danger">
                                                    <i id="recommend-\${datum.id}" review-id="\${datum.id}" class="bi \${like}" style="font-size: 15px;"></i> <span class="visually-hidden">추천</span>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="row" id="cardAndTextarea" style="display: none;">
							        <div class="col-12">
							            <div class="card">
							                <div class="card-body d-flex flex-row justify-content-between align-items-start">
							                    <textarea class="form-control" placeholder="리뷰에 대한 답글을 작성해주세요" aria-label="답글 작성란" aria-describedby="button-addon2" id="replyTextarea"></textarea>
							                    <button class="btn btn-outline-secondary submit-reply-button" type="button" id="button-addon2"><i class="bi bi-pencil"></i></button>
							                </div>
							            </div>
							        </div>
							    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    `
                    const picturesOutputArea = document.getElementById('picturesOutputArea')
                    datum.reviewPictures.forEach(picture => {
                        picturesOutputArea.innerHTML += `
                            <img src="/images/review/jpeg/\${picture.pictureName}" alt="Image" class="object-fit-cover img-thumbnail" style="height: 200px; width: 100%; cursor: pointer;" onclick="openModal(this)">
                        `
                    })}
                )
            })
            isReviewsFetching = false;
        }

    // initial fetching
    fetchAndRenderReviews(reviewFetchingOption, pageOnReview);

    document.getElementById('btn-review-all').addEventListener('click', function() {

        reviewOutputArea.innerHTML = '';

        isReviewsLast = false;
        isReviewsFetching = false;
        pageOnReview = 1;
        reviewFetchingOption = 'all';
        fetchAndRenderReviews(reviewFetchingOption, pageOnReview)
    })

    document.getElementById('btn-review-good').addEventListener('click', function() {

        reviewOutputArea.innerHTML = '';

        isReviewsLast = false;
        isReviewsFetching = false;
        pageOnReview = 1;
        reviewFetchingOption = 'good';
        fetchAndRenderReviews(reviewFetchingOption, pageOnReview)
    })

    document.getElementById('btn-review-soso').addEventListener('click', function() {

        reviewOutputArea.innerHTML = '';

        isReviewsLast = false;
        isReviewsFetching = false;
        pageOnReview = 1;
        reviewFetchingOption = 'soso';
        fetchAndRenderReviews(reviewFetchingOption, pageOnReview)
    })

    document.getElementById('btn-review-bad').addEventListener('click', function() {

        reviewOutputArea.innerHTML = '';

        isReviewsLast = false;
        isReviewsFetching = false;
        pageOnReview = 1;
        reviewFetchingOption = 'bad';
        fetchAndRenderReviews(reviewFetchingOption, pageOnReview)
    })

    window.onscroll = function () {
        if ((window.innerHeight + window.scrollY +.5) >= document.body.offsetHeight) {

            if (isReviewsFetching || isReviewsLast) {
                // do nothing
            } else {
                pageOnReview += 1;
                fetchAndRenderReviews(reviewFetchingOption, pageOnReview)
            }
        }
        
        
    	const commentButton = document.getElementById('comment');
    	const cardAndTextarea = document.getElementById('cardAndTextarea');
    	const ownerComment = document.getElementById('ownerComment');

    	// '답글' 버튼에 클릭 이벤트 리스너 추가
    	commentButton.addEventListener('click', () => {
    	    cardAndTextarea.style.display = 'block'; // 답글 작성 영역 보임
    	    ownerComment.style.display = 'none';     // 리뷰 답글 영역 숨김
    	});

    	const submitButton = document.getElementById('button-addon2');

    	// '리뷰 작성' 버튼에 클릭 이벤트 리스너 추가
    	submitButton.addEventListener('click', () => {
    	    cardAndTextarea.style.display = 'none'; // 답글 작성 영역 숨김
    	    ownerComment.style.display = 'block';   // 리뷰 답글 영역 보임
    	});

    }
    
    $("#btn-bookmark").click(function() {
        // 로그인 여부 확인
        if (${pageContext.request.userPrincipal != null}) {
            let storeId = $(this).attr("data-store-id");
            let $icon = $(this).find('i');
            let $bookmark = $("#bookmark-count");
            let currentBookmarkCount = parseInt($bookmark.text());

            let add = "Y";
            if ($icon.hasClass("bi-star-fill")) {
                add = "N";
            } else {
                add = "Y";
            }

            // bookmark?storeId=21&job=Y
            $.post("bookmark", {storeId:storeId, job:add}, function(result) {
                if ($icon.hasClass("bi-star-fill")) {
                    currentBookmarkCount--;
                    $icon.removeClass("bi-star-fill").addClass("bi-star");
                } else {
                    currentBookmarkCount++;
                    $icon.removeClass("bi-star").addClass("bi-star-fill");
                }
                $bookmark.text(currentBookmarkCount);
            });
        } else {
            // 로그인되지 않은 경우, 로그인 페이지 열기
            window.location.href = "/user/login";
        }
    });

    
    
    $("#btn-review-all").click(function () {
        $("#review-list .card").show();
    });
    $("#btn-review-good").click(function () {
        $("#review-list .card").hide();
        $("#review-list .card[data-review-rating=5]").show();
    });
    $("#btn-review-soso").click(function () {
        $("#review-list .card").hide();
        $("#review-list .card[data-review-rating=3]").show();
    });
    $("#btn-review-bad").click(function () {
        $("#review-list .card").hide();
        $("#review-list .card[data-review-rating=1]").show();
    });


    var container = document.getElementById('map');
    var options = {
        // latitude,longitude 순으로 입력
        center: new kakao.maps.LatLng(${store.latitude}, ${store.longitude}),
        level: 4
    };

    var map = new kakao.maps.Map(container, options);

    // 마우스 드래그와 모바일 터치를 이용한 지도 이동을 막는다
    map.setDraggable(false);

    // 마우스 휠과 모바일 터치를 이용한 지도 확대, 축소를 막는다
    map.setZoomable(false);

    // 마커가 표시될 위치입니다
    var markerPosition = new kakao.maps.LatLng(${store.latitude}, ${store.longitude});


    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
    // marker.setMap(null);

    document.getElementById('map').addEventListener('click', function () {
        $('#mapModal').modal('show');
    });

    // 모달 열릴 때 큰 지도 초기화 및 표시
    $('#mapModal').on('shown.bs.modal', function () {
        var container = document.getElementById('largeMap');
        var options = {
            center: new kakao.maps.LatLng(${store.latitude}, ${store.longitude}), // 지도 중심 좌표
            level: 3 // 지도 확대 레벨
        };
        var map = new kakao.maps.Map(container, options);
        // 마커 추가 (예시)
        var markerPosition = new kakao.maps.LatLng(${store.latitude}, ${store.longitude});

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

    $('#star').click(function () {
        if ($(this).hasClass('bi-star-fill')) {
            $(this).removeClass('bi-star-fill').addClass('bi-star')
        } else {
            $(this).removeClass('bi-star').addClass('bi-star-fill')
        }
    })

    $('.bi-heart').click(function () {
        if ($(this).hasClass('bi-heart-fill')) {
            $(this).removeClass('bi-heart-fill').addClass('bi-heart');
        } else {
            $(this).removeClass('bi-heart').addClass('bi-heart-fill');
        }
    });

    $(function() {
        // 페이지 로드 시 초기 선택값을 설정합니다.
        $('.border-opacity-10').first().addClass('active').css('color', '#ff792a');

        // '.emoji-btn' 클래스를 가진 버튼을 클릭할 때 실행되는 함수를 정의합니다.
        $('.border-opacity-10').click(function() {
            // 모든 버튼에 있는 'active' 클래스를 제거하고 색을 초기화합니다.
            $('.border-opacity-10').removeClass('active').css('color', '#000');
            
            // 클릭한 버튼에만 'active' 클래스를 추가하고 텍스트 색을 설정합니다.
            $(this).addClass('active').css('color', '#ff792a'); // 선택한 버튼의 텍스트 색 변경
        });
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

    document.addEventListener("keydown", function (event) {
        if (event.keyCode === 27) {
            closeModal();
        } else if (event.keyCode === 37) {
            changeImage(-1);
        } else if (event.keyCode === 39) {
            changeImage(1);
        }
    });

 /* const commentButton = document.getElementById('comment');
    const cardAndTextarea = document.getElementById('cardAndTextarea');
    const ownerComment = document.getElementById('ownerComment');

    // '답글' 버튼에 클릭 이벤트 리스너 추가
    commentButton.addEventListener('click', () => {
        cardAndTextarea.style.display = 'block'; // 답글 작성 영역 보임
        ownerComment.style.display = 'none';     // 리뷰 답글 영역 숨김
    });

    const submitButton = document.getElementById('button-addon2');

    // '리뷰 작성' 버튼에 클릭 이벤트 리스너 추가
    submitButton.addEventListener('click', () => {
        cardAndTextarea.style.display = 'none'; // 답글 작성 영역 숨김
        ownerComment.style.display = 'block';   // 리뷰 답글 영역 보임
    }); */
    
    // localStorage에 가게 id저장
    let store_id = `${param.id}`
    if (store_id) {

        let value = localStorage.getItem("store_history");
        let store_history = JSON.parse(value); //  JSON 형식의 문자열을 JavaScript 객체로 변환하는 메서드입니다.

        if (store_history != null) {
            let exist = store_history.includes(store_id);

            if (exist) {
                let findIndex = store_history.indexOf(store_id);
                store_history.splice(findIndex, 1);
            }
            store_history.unshift(store_id);
        } else {
            store_history = [];
            store_history.unshift(store_id);
        }
        value = JSON.stringify(store_history);
        localStorage.setItem("store_history", value);

    }

    const daysArea = document.getElementById('daysArea')
    const daysMap = {
        Mon: false,
        Tue: false,
        Wed: false,
        Thu: false,
        Fri: false,
        Sat: false,
        Sun: false
    }

    const days = fetch(`/store/open-times?id=\${store_id}`, {
        method: "GET"
    })
        .then(response => {
            if (response.ok) {
                return response.json();
            }
        })
        .then(data => {
            data.map(datum => {
                daysArea.innerHTML += `
    	            <div>
    	                <span class="d-inline-block" style="width: 50px;">\${datum.day}</span>
    	                <span class="badge bg-secondary-subtle text-secondary-emphasis rounded-pill">\${datum.openTime} ~ \${datum.closeTime}</span>
    	            </div>
    	        `;
                daysMap[datum.day] = true;
                return datum;
            });
        })
        .then(data => {
            Object.keys(daysMap)
                .filter(day => !daysMap[day])
                .forEach(daysOff => {
                    console.log(daysOff);
                    daysArea.innerHTML += `
    	                <div>
    	                    <span class="d-inline-block" style="width: 50px;"> \${daysOff}</span>
    	                    <span class="badge bg-danger-subtle text-danger-emphasis rounded-pill"> 쉬는날</span>
    	                </div>
    	            `;
                });
        });

</script>
</body>
</html>