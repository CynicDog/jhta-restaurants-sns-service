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
	int loginId = (int) session.getAttribute("loginId");
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
	
	List<Review> reviews = reviewDao.getReviewsByStoreId(storeId); // fk 조회 -> 여러개
		
	List<Food> foods = foodDao.getFoodsByStoreId(storeId); // fk 조회 -> 여러개
			
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
	
	// `월요일 ~ 월요일 : 06:00 ~ 06:00.화요일 ~ 목요일 : 06:00 ~ 08:00....` -> comma(`.`) 기준 parsing 
	List<String> storeOpenTimesParsed = Arrays.asList(
				storeOpentimes.stream()
								.map(storeOpentime -> storeOpentime.getOperationTime())
								.collect(Collectors.joining("\\."))
								.split("\\.")
				);
	
%><!doctype html>
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
    </style>
</head>
<body>
<div class="container-fluid p-0">
    <jsp:include page="nav.jsp">
        <jsp:param name="menu" value="홈"/>
    </jsp:include>

    <div class="container">
        <div class="row row-cols-5">
            <div class="col">
                <img src="https://mp-seoul-image-production-s3.mangoplate.com/688135_1508733757417689.jpg?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" class="img-fluid" alt="...">
            </div>
            <div class="col">
                <img src="https://mp-seoul-image-production-s3.mangoplate.com/332683/569295_1680599766207_1000011436?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" class="img-fluid" alt="...">
            </div>
            <div class="col">
                <img src="https://mp-seoul-image-production-s3.mangoplate.com/332683/569295_1680599766207_1000011435?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" class="img-fluid" alt="...">
            </div>
            <div class="col">
                <img src="https://mp-seoul-image-production-s3.mangoplate.com/332683/569295_1680599766207_1000011438?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" class="img-fluid" alt="...">
            </div>
            <div class="col">
                <img src="https://mp-seoul-image-production-s3.mangoplate.com/332683/569295_1680599766207_1000011433?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" class="img-fluid" alt="...">
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-8">
                <div>
                    <header>
                        <div class="row">
                            <div class="col-8">
                                <p class="restaurants_name my-3"><span style="font-size: x-large; font-weight: bold"><%=store.getName() %></span><span class="rate-point mx-3" style="font-weight: bold; font-size: large"><%=avgRating %></span></p>
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
                                <th>음식 종류</th>
                                <td><%=foodsCategory %></td>
                            </tr>
                           <tr>
                                <th>영업시간</th>
                                <%-- <% for (StoreOpentime storeOpenTime : storeOpentimes) { %> --%>
                                <% for (String parsed : storeOpenTimesParsed) { %>
                                <td>
                                    <%=parsed %> <br> <!-- TODO: new line each time adding `parsed` -->
                                </td>
                                <% } %>
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
<% for (Review review : reviews) { 
	List<ReviewPicture> reviewPictures = reviewPictureDao.getReviewPictureByReviewId(review.getId());
%>    
    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
                <div class="col-2">
                    <div class="text-center card-title my-1"><span style="font-size: medium; font-weight: bold;"><%=review.getCustomer().getName() %></span></div>
                </div>
                <div class="col-10">
                    <p class="card-text"><%=review.getText() %></p>
                    <%-- <% if (reviewPicture.fileLocation != null) { %> --%>
                    <% for (ReviewPicture reviewPicture : reviewPictures) { %>                    	
       				 <img src="<%=reviewPicture.getFileLocation() %>" alt="Review Photo" class="img-fluid">
                    <% } %>
    				<%-- <% } %> --%>
                </div>
            </div>
        </div>
    </div>
<% } %>    
    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
                <div class="col-1">
                    <div class="card-title"><span style="font-size: large; font-weight: bold">사용자</span></div>
                </div>
                <div class="col-11">
                    <p class="card-text">리뷰 텍스트</p>
                </div>
            </div>
        </div>
    </div>
    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
                <div class="col-1">
                    <div class="card-title"><span style="font-size: large; font-weight: bold">사용자</span></div>
                </div>
                <div class="col-11">
                    <p class="card-text">리뷰 텍스트</p>
                </div>
            </div>
        </div>
    </div>
    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
                <div class="col-1">
                    <div class="card-title"><span style="font-size: large; font-weight: bold">사용자</span></div>
                </div>
                <div class="col-11">
                    <p class="card-text">리뷰 텍스트</p>
                </div>
            </div>
        </div>
    </div>
    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
                <div class="col-1">
                    <div class="card-title"><span style="font-size: large; font-weight: bold">사용자</span></div>
                </div>
                <div class="col-11">
                    <p class="card-text">리뷰 텍스트</p>
                </div>
            </div>
        </div>
    </div>

    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title">사용자7</h5>
            <p class="card-text">분위기가 좋고 서비스도 만족스러웠습니다.</p>
        </div>
    </div>
    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title">사용자8</h5>
            <p class="card-text">분위기가 좋고 서비스도 만족스러웠습니다.</p>
        </div>
    </div>
    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title">사용자9</h5>
            <p class="card-text">분위기가 좋고 서비스도 만족스러웠습니다.</p>
        </div>
    </div>
    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title">사용자10</h5>
            <p class="card-text">분위기가 좋고 서비스도 만족스러웠습니다.</p>
        </div>
    </div>
    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title">사용자11</h5>
            <p class="card-text">분위기가 좋고 서비스도 만족스러웠습니다.</p>
        </div>
    </div>
    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title">사용자12</h5>
            <p class="card-text">분위기가 좋고 서비스도 만족스러웠습니다.</p>
        </div>
    </div>
    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title">사용자13</h5>
            <p class="card-text">분위기가 좋고 서비스도 만족스러웠습니다.</p>
        </div>
    </div>
    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title">사용자14</h5>
            <p class="card-text">분위기가 좋고 서비스도 만족스러웠습니다.</p>
        </div>
    </div>
    <div class="card mb-3">
        <div class="card-body">
            <h5 class="card-title">사용자15</h5>
            <p class="card-text">분위기가 좋고 서비스도 만족스러웠습니다.</p>
        </div>
    </div>
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84"></script>
<script>
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(37.572846, 126.992302),
        level: 3
    };

    var map = new kakao.maps.Map(container, options);

    // 키워드 검색 완료 시 호출되는 콜백함수입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
            for (var i = 0; i < data.length; i++) {
                displayMarker(data[i]);
            }
        }
    }
</script>

</body>
</html>
