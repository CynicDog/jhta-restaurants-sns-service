<%@page import="vo.Review"%>
<%@page import="utils.Pagination"%>
<%@page import="dto.StoreHome"%>
<%@page import="dao.ReviewDao"%>
<%@page import="vo.ReviewPicture"%>
<%@page import="dao.StoreDao"%>
<%@page import="vo.Store"%>
<%@page import="java.util.List"%>
<%@page import="vo.StorePicture"%>
<%@page import="dao.StorePictureDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	StoreDao storeDao = StoreDao.getInstance();
	//List<Store> stores = storeDao.getAllStores();
	ReviewDao reviewDao = ReviewDao.getInstance();
	
	StorePictureDao storePictureDao = StorePictureDao.getInstance();
	// List<StorePicture> storePictures = storePictureDao.getAllStorePictures(); 
	String projectHome = System.getenv("PROJECT_HOME");
	String saveDirectory = projectHome + "/src/main/webapp/resources/reviewPicture";
	
	int pageNo = -1;
	if(request.getParameter("page") != null){
		pageNo = Integer.parseInt(request.getParameter("page"));
	}else {
		pageNo = 1;
	}
	
	int totalRows = storeDao.getTotalRows();
	
	Pagination pagination = new Pagination(pageNo, 4, totalRows);
	
	int start = pagination.getStartingRow();
	int end = pagination.getEndingRow();
	
	List<StoreHome> stores = storeDao.getStoresHomePaginated(start, end);
	
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
/*             #test_btn_group {
                boarder: 1px solid skyblue;
                background-color: rgba(0, 0, 25, 0);
                color: skyblue;
                padding: 5px;
                margin-left: 12px;
            } */

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

/*             .btn {
                margin-right: 15px;
                margin-left: 15px;
                padding: 10px;
                background-color: rgb(125, 185, 182);
            } */

            img {
            	height: 380px;
                object-fit: cover;
            }
            
		    .card-container {
/* 		        display: grid;
		        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
		        justify-items: center;
		        align-items: center;
		        gap: 20px; */
		    }
		    .card {
/* 		        width: 100%;
		        height: 100%;
		        display: flex;
		        flex-direction: column;
		        justify-content: center;
		        align-items: center; */
		    }
		    
		    .card-body{
		    	cursor: pointer; 
		    	font-weight:bold; 
		    }
		    
		    .card-text{
		    	margin-left: 20px; 
		    	margin-bottom:0px; 
		    	margin-right: 20px;
		    	font-size: 25px; 
		    	display: flex; 
		    	align-items: center;
		    }
        </style>

    </head>
    <body>
    <jsp:include page="nav.jsp">
        <jsp:param name="menu" value="홈"/>
    </jsp:include>
    <div class="container-fluid text-center">
		<div class="row">
			<div class="col-1"></div>
	        <div class="col-6">
	            <div class="row">
	                <div id="test_btn_group">
	                    <a class="btn btn-light my-2 mx-2" role="button" onclick="location.href='storesByRating.jsp?page=1'">평점순</a>
	                    <a href="searchByCategory.jsp" class="btn btn-light my-2 mx-2" role="button">카테고리별</a>
	                </div>
	            </div>
	            <!-- <div class="card-container"> -->
				<div class="row">
	                <%
	                for(StoreHome store : stores){
	                	int storeId = store.getId();
	                	StorePicture storePicture = storePictureDao.getStorePictureByStoreId(storeId);
	                	List<Review> reviews = reviewDao.getReviewsByStoreId(storeId);
	                	
	                	double avgRating = reviews.stream()
	                			.mapToDouble(review -> review.getRating())
	                			.average()
	                			.orElse(0.0);
	                	String avgRatingStr = String.format("%.2f", avgRating);
	                %>
	               		<!-- <div class="col"></div> -->
		                <div class="col-6">
		                    <div class="card m-2 sm-14 shadow bg-body rounded">
		                        <div class="embed-responsive embed-responsive-4by3">
		                        	<% if(storePicture != null){%>
			                            <a href="storeDetail.jsp?storeId=<%=storeId %>"><img src="resources/storePicture/<%=storePicture.getFileLocation() %>"
			                                            class="card-img-top embed-responsive-item" alt="..." ></a>
		                            <%}%>
									<%--<%else {%>
									    <a href="storeDetail.jsp?storeId=<%=storeId %>"><img src="resources/storePicture/Color.png"
									    			class="card-img-top embed-responsive-item" alt="..."></a>
									<% } %> --%>
		                        </div>
		                        
		                        <div class="card-body" onclick="location.href='storeDetail.jsp?storeId=<%=storeId %>';">
		                            <p class="card-text" ><%=store.getName() %></p>
		                            <p class="card-text" style="color: #FFC107;"><%=avgRatingStr %></p>
		                        </div>
		                    </div>
		                </div>
	                <%
	                }
	                %>
				
	            </div>
                <!-- </div> -->
                    <nav class="my-3">
				<ul class="pagination justify-content-center">
					<li class="page-item <%=pageNo <= 1 ? "disabled" : ""%>">
						<a href="home.jsp?page=<%=pageNo - 1%>" class="page-link">이전</a>
					</li>
<%
	for (int num = pagination.getStartingPage(); num <= pagination.getEndingPage(); num++) {
%>
					<li class="page-item <%=pageNo == num? "active" : ""%>">
						<a href="home.jsp?page=<%=num%>" class="page-link"><%=num%></a> 
					</li>
<%
	}
%>
					<li class="page-item <%=pageNo >= pagination.getTotalPages() ? "disabled" : ""%>">
						<a href="home.jsp?page=<%=pageNo + 1%>" class="page-link">다음</a>
					</li>
				</ul>
			</nav>
	        </div>
			<div class="col-1"></div>
			
	        <script type="text/javascript"
	                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84&libraries=services,clusterer,drawing"></script>
	        <script type="text/javascript"
	                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84"></script>
		       <div class="col">
		           <div id="map" style="z-index:0">
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

    </div>
    </body>
    </html>