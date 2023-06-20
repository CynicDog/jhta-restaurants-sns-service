<%@page import="java.util.Comparator"%>
<%@page import="dto.ReviewPictureRecent"%>
<%@page import="utils.EngKorConverter"%>
<%@page import="vo.ReviewPicture"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="vo.Food"%>
<%@page import="vo.Review"%>
<%@page import="vo.StoreOpentime"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="dao.FoodDao"%>
<%@page import="dao.ReviewPictureDao"%>
<%@page import="dao.ReviewDao"%>
<%@page import="dao.StoreOpenTimeDao"%>
<%@page import="dao.CustomerDao"%>
<%@page import="vo.Store"%>
<%@page import="dao.StoreDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginType = (String) session.getAttribute("loginType");
	int storeId = Integer.parseInt(request.getParameter( "storeId"));
	
	CustomerDao customerDao = CustomerDao.getInstance();
	StoreDao storeDao = StoreDao.getInstance();
	StoreOpenTimeDao storeOpenTimeDao = StoreOpenTimeDao.getInstance();
	ReviewDao reviewDao = ReviewDao.getInstance();
	ReviewPictureDao reviewPictureDao = ReviewPictureDao.getInstance();
	FoodDao foodDao = FoodDao.getInstance();
	
	Store store = storeDao.getStoreById(storeId); // pk 조회 -> 하나만
	List<StoreOpentime> storeOpentimes = storeOpenTimeDao.getStoreOpenTimeByStoreId(storeId); // fk -> 여러개
	
	List<Review> reviews = reviewDao.getRecentReviewsByStoreId(storeId); // fk 조회 -> 여러개

/* 	List<Review> reviewsStream = reviewDao.getReviewsByStoreId(storeId);
	List<Review> reviews = reviewsStream.stream()
										 .sorted(
											// functional interface -> functional 인터페이스는 abstract 메소드를 하나만 가지는 인터페이스다! 
											// [ Comparator ] 
											
											// abstract method -> abstract 메소드는 람다식으로 구현한다! (람다란 인자, 로직 구현, 반환값만 맞추면 됨)
											// [ int compare​(T o1, T o2) ]  
											(review1, review2) -> { 
												int review1Int = -1; 
												int review2Int = -1; 
												
												review1Int = (int) review1.getCreateDate().getTime();  
												review2Int = (int) review2.getCreateDate().getTime();  
													
												return review1Int - review2Int; 
											}
										).collect(Collectors.toList()); */
							
		
	List<Food> foods = foodDao.getFoodsByStoreId(storeId); // fk 조회 -> 여러개
	
	List<ReviewPictureRecent> recentPictures = reviewPictureDao.getRecentPicturesByStoreId(storeId);
	
	// Food -> String 이후 영어 ->한글 (korean, chinese... -> 한식, 중식, ...)
	String foodsCategory = foods.stream()
								.map(food -> food.getCategory())
								.distinct()
								.map(category -> EngKorConverter.foodCategoryToKorean(category))
								.collect(Collectors.toList())
								.toString(); 
	
	// 영어 -> 한글 (day1, day2... -> 월요일, 화요일...)
	String dayOffs = Arrays.asList(store.getDayOffs().split(",")).stream()
			.map(dayOff -> EngKorConverter.dayOffsToKorean(dayOff))
			.collect(Collectors.toList())
			.toString(); 
	
	double avgRating = reviews.stream()
			.mapToDouble(review -> review.getRating())
			.average()
			.orElse(0.0);
	String avgRatingStr = String.format("%.2f", avgRating);
	
	// `월요일 ~ 월요일 : 06:00 ~ 06:00.화요일 ~ 목요일 : 06:00 ~ 08:00....` -> comma(`.`) 기준 parsing 
	List<String> storeOpenTimesParsed = Arrays.asList(
				storeOpentimes.stream()
								.map(storeOpentime -> storeOpentime.getOperationTime())
								.collect(Collectors.joining("\\."))
								.split("\\.")
				); 
%>
<!doctype html>
<html lang="ko">
<head>
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <style type="text/css">
        .col-8 {
            flex-basis: auto;
        }

        .title {
            display: flex;
            align-items: center;
        }

        .title h1 {
            margin-right: 500px; /* 가게 이름과 버튼 사이의 간격 조정 */
        }

        .rate-point {
            color: #FFC107; /* 밝은 색상 코드를 설정합니다. 예시로는 노란색 (#FFC107)을 사용했습니다. */
        }
        .button-container {
            display: flex;
            justify-content: flex-end;
        }
        
        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.9);
        }
        
        .modal-content {
            margin: auto;
            display: block;
            width: 80%;
            max-width: 700px;
        }
        
        .modal-content img {
            width: 100%;
            height: auto;
        }
        
        .close {
            position: absolute;
            top: 15px;
            right: 35px;
            color: #f1f1f1;
            font-size: 40px;
            font-weight: bold;
            transition: 0.3s;
        }
        
        .close:hover,
        .close:focus {
            color: #bbb;
            text-decoration: none;
            cursor: pointer;
        }
        
        .row-cols-5 {
	        display: flex;
	        flex-wrap: wrap;
	        justify-content: flex-start;
    	}
    
    	.row-cols-5 img {
	        flex-basis: 20%;
	        max-width: 100%;
	        height: 100%;
	        object-fit: cover;
	        box-sizing: border-box;
	        padding: 5px;
    	}
    </style>
</head>
<body>
<div class="container-fluid p-0">
    <jsp:include page="nav.jsp">
        <jsp:param name="menu" value="홈"/>
    </jsp:include>

    <div class="container">
    	<div>
    		<input hidden=true id=longitude value=<%=store.getLongitude() %>>
    		<input hidden=true id=latitude value=<%=store.getLatitude() %>>
    	</div>
        <div class="row row-cols-5"> 
        	<% for (ReviewPictureRecent recentPicture : recentPictures) { %>                 	
            	<img class="img-thumbnail" src="resources/reviewPicture/<%= recentPicture.getFileLocation() %>" style="max-width: 100%; height: auto;" alt="..." onclick="openModal(this)">
            <% } %>          
        </div>
    </div>

    <!-- 모달 창 -->
<div id="myModal" class="modal">
    <span class="close" onclick="closeModal()">&times;</span>
    <div class="row">
        <div class="col-4 d-flex justify-content-center align-items-center">
            <button class="modal-nav-button" id="prevButton" onclick="changeImage(-1)">&#10094;</button>
        </div>
        <div class="col-4 text-center">
            <img class="modal-content" id="modalImg">
        </div>
        <div class="col-4 d-flex justify-content-center align-items-center">
            <button class="modal-nav-button" id="nextButton" onclick="changeImage(1)">&#10095;</button>
        </div>
    </div>
</div>

<script>
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
	        changeImage(-1); // 왼쪽으로 이동
	    } else if (event.keyCode === 39) {
	        changeImage(1); // 오른쪽으로 이동
	    }
	});
</script>

    <div class="container">
        <div class="row">
            <div class="col-8">
                <div>
                    <header>
                        <div class="row">
                            <div class="col-8">
                                <p class="restaurants_name my-3"><span style="font-size: x-large; font-weight: bold"><%=store.getName() %></span><span class="rate-point mx-3" style="font-weight: bold; font-size: large"><%=avgRatingStr %></span></p>
                            </div>
                            <div class="col-4">
                            <% if ("customer".equals(loginType)) { %>
  								<button type="button" class="btn btn-outline-primary my-3" onclick="location.href='review.jsp?storeId=<%=storeId %>'">리뷰작성</button>
                            <% } %>
                            </div>
                        </div>
                        <div class="row"> 
                        <table class="table">
                            <tr>
                                <th>주소</th>
                                <td><%=store.getAddress() %></td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td><%=store.getPhone() %></td>
                            </tr>
                            <tr>
                                <th>가게 소개</th>
                                <td><%=store.getText() %></td>
                            </tr>
                            <tr>
                                <th>음식 종류</th>
                                <td><%=foodsCategory %></td>
                            </tr>
                           <tr>
                                <th>영업시간</th>
                                <%-- <% for (StoreOpentime storeOpenTime : storeOpentimes) { %> --%>
                                <td>
                                <% for (String parsed : storeOpenTimesParsed) { %>
                                    <%=parsed %> <br> <!-- TODO: new line each time adding `parsed` -->
                                <% } %>
                                </td>
                                <%-- <% } %> --%>
                            </tr>
                            <tr>
                                <th>휴일</th>
                                <td><%=dayOffs %></td>
                            </tr>

                              <tr>
                                <th>메뉴</th>
                                <td>
                                    <div>
<% for (Food food : foods) { %>
                                        <div class="col my-2">
                                            <span class="food-name"><%=food.getName() %></span>
                                            <span class="food-price"><%=food.getPrice() %></span>
                                        </div>
<% } %>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        </div>
                    </header>
                </div>
            </div>
            <div class="col-4">
                <div id="map" style="width:400px; height:350px;"></div>
            </div>
        </div>
    </div>
</div>

<!-- 리뷰 컨테이너 -->
<div class="container">
    <div class="my-2">
        <span style="font-size: x-large; font-weight: bold">리뷰</span>
    </div>
<% 
   for (int i = reviews.size() - 1; i >= 0; i--) { 
       Review review = reviews.get(i);
       List<ReviewPicture> reviewPictures = reviewPictureDao.getReviewPictureByReviewId(review.getId());        
%>
        <div class="card mb-3">
            <div class="card-body">
                <div class="row">
                    <div class="col-2">
                        <div class="text-center card-title my-1">
                            <span style="font-size: medium; font-weight: bold;"><%=review.getCustomer().getName() %></span>
                        </div>
                        <div class="text-center card-title my-1">
                            <span style="font-size: medium; font-weight: bold; color: #FFC107;"><%=review.getRating() %></span>                            
                        </div>
                    </div>
                    <div class="col-10">
                        <div class="row mb-2">
                            <div class="col-11">
                                <p class="col card-text"><%=review.getText() %></p>
                            </div>
                            <div class="col-1">
                                <%                 
                                if (session.getAttribute("loginId") != null) { 
                                    int loginId = (int) session.getAttribute("loginId");
                                    if ("customer".equals(loginType) && review.getCustomer().getId() == loginId) { 
                                %>
                                <a href="deleteReview.jsp?reviewId=<%=review.getId() %>&storeId=<%=store.getId() %>" class="btn btn-danger">삭제</a>
                                <% 		
                                    }
                                }
                                %>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <% for (ReviewPicture reviewPicture : reviewPictures) { %>                 	
                                <img class="img-thumbnail" src="resources/reviewPicture/<%=reviewPicture.getFileLocation() %>" style="width: 320px; max-width: 320px;" alt="...">
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <% 
       }
	%>   
</div>

    
<div class="container">
    <div id="reviewContainer">
        <!-- 리뷰 카드들이 여기에 동적으로 추가될 예정입니다. -->
    </div>
    <div id="showMoreButtonContainer" style="display: none;">
        <button id="showMoreButton" class="btn btn-primary">더보기</button>
    </div>
</div>
<script type="text/javascript">
    const reviewContainer = document.getElementById('reviewContainer');
    const showMoreButtonContainer = document.getElementById('showMoreButtonContainer');
    const showMoreButton = document.getElementById('showMoreButton');
    const reviews = document.getElementsByClassName('card mb-3'); // 리뷰 카드들을 모두 선택합니다.

    const reviewCount = reviews.length; // 현재 리뷰 개수를 가져옵니다.
    let visibleReviewCount = 5; // 보여지는 리뷰 개수를 초기화합니다.
    const hiddenReviewCount = reviewCount - visibleReviewCount; // 숨겨진 리뷰 개수를 계산합니다.

    // 처음에는 처음 5개의 리뷰만 보이도록 설정합니다.
    for (let i = visibleReviewCount; i < reviewCount; i++) {
        reviews[i].style.display = 'none';
    }

    // 리뷰 개수가 5개 이상인 경우에만 "더보기" 버튼을 보이도록 처리합니다.
    if (hiddenReviewCount > 0) {
        showMoreButtonContainer.style.display = 'block';
    } else {
        showMoreButtonContainer.style.display = 'none';
    }

    // "더보기" 버튼을 클릭했을 때 추가적인 리뷰를 보여주는 함수를 정의합니다.
    function showHiddenReviews() {
        // 추가적인 5개의 리뷰를 보여줍니다.
        for (let i = visibleReviewCount; i < visibleReviewCount + 5; i++) {
            if (reviews[i]) {
                reviews[i].style.display = 'block';
            }
        }

        visibleReviewCount += 5; // 보여지는 리뷰 개수를 업데이트합니다.
        if (visibleReviewCount >= reviewCount) {
            showMoreButtonContainer.style.display = 'none'; // 모든 리뷰가 보여졌으므로 "더보기" 버튼을 숨깁니다.
        }
    }

    // "더보기" 버튼에 클릭 이벤트 리스너를 추가합니다.
    showMoreButton.addEventListener('click', showHiddenReviews);
</script>

<script type="text/javascript"
	                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84"></script>
<script>
    var container = document.getElementById('map');
    var longitude = document.getElementById("longitude").value;
    var latitude = document.getElementById("latitude").value;
    var options = {
        center: new kakao.maps.LatLng(latitude, longitude),
        level: 3
    };
    

    var map = new kakao.maps.Map(container, options);
    var geocoder = new kakao.maps.services.Geocoder();
    
    var coords = new kakao.maps.LatLng(latitude, longitude);

    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });
    
    
    marker.setMap(map);
    
</script>

</body>
</html>
