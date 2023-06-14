<%@page import="dao.StoreDao"%>
<%@page import="vo.Store"%>
<%@page import="java.util.List"%>
<%@page import="vo.StorePicture"%>
<%@page import="dao.StorePictureDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	StoreDao storeDao = StoreDao.getInstance();
	List<Store> stores = storeDao.getAllStores();
	
	StorePictureDao storePictureDao = StorePictureDao.getInstance();
	/* List<StorePicture> storePictures = storePictureDao.getAllStorePictures();  */
	String projectHome = System.getenv("PROJECT_HOME");
	String saveDirectory = projectHome + "/src/main/webapp/resources/reviewPicture";
	
%>
    <!doctype html>
    <html lang="ko">
    <head>
        <title></title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <style type="text/css">
            #test_btn_group {
                boarder: 1px solid skyblue;
                background-color: rgba(0, 0, 25, 0);
                color: skyblue;
                padding: 5px;
                margin-left: 12px;
            }

            .test_btn_group {
                boarder: 1px solid skyblue;
                background-color: rgba(0, 0, 25, 0);
                color: skyblue;
                padding: 5px;
                margin-left: 12px;
            }

            #map {
                width: 33%;
                height: 100%;
                position: fixed;
                bottom: 0px;
                right: 0px;
            }

            body {
                /* padding:55px; */
            }

            .btn {
                margin-right: 15px;
                margin-left: 15px;
                padding: 10px;
                background-color: rgb(125, 185, 182);
            }

            img {
                object-fit: cover;
            }

        </style>

    </head>
    <body>
    <jsp:include page="nav.jsp">
        <jsp:param name="menu" value="홈"/>
    </jsp:include>

    <div class="container-fluid text-center">
        <div class="col-8">
            <div class="row">
                <div id="test_btn_group">
                    <a class="btn" role="button">추천 맛집</a>
                    <a class="btn" role="button">한식</a>
                    <a class="btn" role="button">중식</a>
                    <a class="btn" role="button">일식</a>
                    <a class="btn" role="button">양식</a>
                </div>
            </div>


            <div class="row">

                <%
                for(Store store : stores){
                	int storeId = store.getId();
                	StorePicture storePicture = storePictureDao.getStorePictureById(storeId);
                %>
                <div class="col-6">
                    <div class="card m-2 sm-14 shadow bg-body rounded">
                        <div class="embed-responsive embed-responsive-4by3">
                        <% if (storePicture != null) { %>
                            <a href="" onclick="createLoginId('<%= storeId %>')"><img src="<%=saveDirectory + storePicture.getFileLocation()%>"
                                            class="card-img-top embed-responsive-item" alt="..." name=></a>
                        <% } %>
                        </div>
                        <script type="text/javascript">
                        	function createLoginId(storeId){
                        		 sessionStorage.setItem("storeId", storeId);
                        	}
                        </script>
                        
                        <div class="card-body">
                            <h5 class="card-title"><%=store.getName() %></h5>
                            <p class="card-text"><%=store.getPhone() %></p>
                        </div>
                    </div>
                </div>
                <%
                }
                %>

            </div>

        </div>


        <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84&libraries=services,clusterer,drawing"></script>
        <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84"></script>
        <div class="col">
            <div id="map">
                <script>
                    var container = document.getElementById('map');
                    var options = {
                        // 										  latitude,longitude 순으로 입력
                        center: new kakao.maps.LatLng(37.5729587735263, 126.992241734889),
                        level: 4
                    };

                    var map = new kakao.maps.Map(container, options);

                    // 마커가 표시될 위치입니다 
                    var markerPosition = new kakao.maps.LatLng(37.5729587735263, 126.992241734889);
                    var markerPosition2 = new kakao.maps.LatLng(37.5699451391001, 126.988087440713);

                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        position: markerPosition
                    });
                    var marker2 = new kakao.maps.Marker({
                        position: markerPosition2
                    });

                    // 마커가 지도 위에 표시되도록 설정합니다
                    marker.setMap(map);
                    marker2.setMap(map);

                    // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
                    // marker.setMap(null);    

                </script>
            </div>
        </div>
    </div>
    </body>
    </html>