<%@page import="vo.Store"%>
<%@page import="dao.StoreDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	/* int storeId = int.parseint request.getParameter("storeId");
 */
/* 	

	String storeName = request.getParameter("name");

	StoreDao storeDao = StoreDao.getInstance();
	Store store = storeDao.getStoreByName(storeName);
	
	session.setAttribute("storeName", store.getName()); */
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
                                <p class="restaurants_name my-3"><span style="font-size: x-large; font-weight: bold"> 가게이름 </span><span class="rate-point mx-3" style="font-weight: bold; font-size: large">4.5</span></p>
                            </div>
                            <div class="col-4">
  								<button type="button" class="btn btn-outline-primary my-3" onclick="location.href='review.jsp'">리뷰작성</button>
                            </div>
                        </div>
                        <table class="table">
                            <tr>
                                <th>주소</th>
                                <td>"서울특별시 성동구 xxxx길 xx"</td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>0507-1111-1111</td>
                            </tr>
                            <tr>
                                <th>음식 종류</th>
                                <td>이탈리안</td>
                            </tr>
                            <tr>
                                <th>가격대</th>
                                <td>만원-2만원</td>
                            </tr>
                            <tr>
                                <th>주차</th>
                                <td>주차공간없음</td>
                            </tr>
                            <tr>

                                <th>영업시간</th>
                                <td>
                                    "월-금: 11:00 - 21:00"
                                    <br>
                                    "토-일: 13:00 - 23:00"
                                </td>
                            </tr>
                            <tr>
                                <th>휴일</th>
                                <td>연중무휴</td>
                            </tr>
                            <tr>
                                <th>메뉴</th>
                                <td>
                                    <div class="restaurant_menuList">
                                        <div class="col my-2">
                                            <span class="">알리올리오</span>
                                            <span class="">13,000원</span>
                                        </div>
                                        <div class="col my-2">
                                            <span class="restaurant_menu">까르보나라</span>
                                            <span class="restaurant_menuPrice">13,000원</span>
                                        </div>
                                        <div class="col my-2">
                                            <span class="restaurant_menu">라자냐</span>
                                            <span class="restaurant_menuPrice">20,000원</span>
                                        </div>
                                        <div class="col my-2">
                                            <span class="restaurant_menu">투움바파스타</span>
                                            <span class="restaurant_menuPrice">14,000원</span>
                                        </div>
                                        <div class="col my-2">
                                            <span class="restaurant_menu">마르게리따피자</span>
                                            <span class="restaurant_menuPrice">16,000원</span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
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
    <div class="card mb-3">
        <div class="card-body">
            <div class="row">
                <div class="col-2">
                    <div class="text-center card-title my-1"><span style="font-size: medium; font-weight: bold;"> 고객 이름 </span></div>
                </div>
                <div class="col-10">
                    <p class="card-text"> 리뷰 내용 </p>
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
    const hiddenReviewCount = reviewCount - 5; // 보이지 않는 리뷰 개수를 계산합니다.

    // 처음에는 처음 5개의 리뷰를 제외한 나머지 리뷰를 숨깁니다.
    for (let i = 5; i < reviewCount; i++) {
        reviews[i].style.display = 'none';
    }

    // 리뷰 개수가 10개 이상인 경우에만 "더보기" 버튼을 보이도록 처리합니다.
    if (reviewCount > 10) {
        showMoreButtonContainer.style.display = 'block';
    } else {
        showMoreButtonContainer.style.display = 'none';
    }

    // "더보기" 버튼을 클릭했을 때 숨겨진 리뷰를 보여주는 함수를 정의합니다.
    function showHiddenReviews() {
        for (let i = 5; i < reviewCount; i++) {
            reviews[i].style.display = 'block';
        }
        showMoreButtonContainer.style.display = 'none'; // "더보기" 버튼을 숨깁니다.
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
