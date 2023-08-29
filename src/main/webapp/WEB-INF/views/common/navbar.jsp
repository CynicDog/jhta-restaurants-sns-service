<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
    /*html, body {*/
    /*    height: 100%;*/
    /*}*/

    .wrap {
        position: relative;
        /*min-height: 100%;*/
        padding-top: 70px;
        /*padding-bottom: 100px;*/
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84"></script>

<!-- 모달 -->
<div class="modal fade" id="bookmarkModal" tabindex="-1"
	aria-labelledby="bookmarkModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable z-3" style="position: fixed; right: 10px; top: 25px; width: 320px; height:500px ">
		<div class="modal-content">
			<div class="modal-body">
				<ul class="nav nav-pills mb-3" id="bookmarkTab" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="history-tab" data-toggle="tab" href="#history-tab-content" role="tab"
						aria-controls="history-tab" aria-selected="true">최근 본 맛집</a></li>
					<li class="nav-item"><a class="nav-link" id="bookmark-tab"
						data-toggle="tab" href="#bookmark" role="tab"
						aria-controls="bookmark-tab" aria-selected="false">찜한 맛집</a></li>
				</ul>
				<div class="tab-content" id="bookmarkTabContent">
					<div class="tab-pane fade show active" id="history-tab-content" role="tabpanel" aria-labelledby="history-tab-content">
						<div id="historyLoadingSpinner" class="spinner-border text-primary"
							role="status" style="margin: 0 auto;">
							<span class="visually-hidden" style="display: none;">Loading...</span>
						</div>
					</div>
					<div class="tab-pane fade" id="bookmark" role="tabpanel" aria-labelledby="bookmark-tab">
						<div id="bookmarkLoadingSpinner" class="spinner-border text-primary" role="status" style="margin: 0 auto;">
							<span class="visually-hidden" style="display: none;">Loading...</span>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>

<nav class="navbar navbar-expand-lg border-bottom bg-light fixed-top shadow-sm py-0 z-2">
    <div class="container-fluid">
		<a class="navbar-brand px-4" href="/">🧑🏻‍💻</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <ul class="collapse navbar-collapse my-1" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto">
            </ul>
            <form class="w-25 me-3" id="form-navbar-search" action="/store/search">
                <input class="form-control me-2" name="keyword" value="${keyword}" type="search" placeholder="Search" aria-label="Search" >
            </form>
            <ul class="navbar-nav px-4">
                <sec:authorize access="isAnonymous()">
					<li class="nav-item py-0 px-2">
                        <a type="button"
                           id="signupPopover"
                           tabindex="0" 
                           class="nav-link"
                           data-bs-container="body"
                           data-bs-toggle="popover"
                           data-bs-placement="bottom"
                           data-bs-trigger="focus"
                           data-bs-html="true"
                           data-bs-content="
                           <div class='fw-light'>
                               <div class='row text-center mx-1'>
                                   <a class='link-secondary text-center link-underline-opacity-0 py-2' href='/user/login'>로그인</a>
                               </div>
                               <div class='row text-center mx-1'>
                                   <a class='link-secondary text-center link-underline-opacity-0 py-2' href='/customer/signup'>손님 회원가입</a>
                               </div>
                               <div class='row text-center mx-1'>
                                   <a class='link-secondary text-center link-underline-opacity-0 py-2' href='/owner/signup'>사장님 회원가입</a>
                               </div>
                           </div>
                           "
                        ><i class="bi bi-person-circle fs-4" style="color:#838383;"></i></a>
                    </li>
                    <script>
                        new bootstrap.Popover(document.querySelector('#signupPopover'))
                    </script>
                     <li class="nav-item py-0 px-2">
                     	<a id="customerBookmark" class="nav-link" data-bs-toggle="modal" data-bs-target="#bookmarkModal" href=""><i class="bi bi-bookmark-star-fill fs-4" style="color:#838383;"></i></a>
                     </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <sec:authorize access="hasRole('ROLE_CUSTOMER')">
                        <li class="nav-item py-0 px-2">
                            <a type="button"
                               id="signupPopover"
                               tabindex="0" 
                               class="nav-link"
                               data-bs-container="body"
                               data-bs-toggle="popover"
                               data-bs-placement="bottom"
                               data-bs-trigger="focus"
                               data-bs-html="true"
                               data-bs-content="
                               <div>
                                   <div class='row text-center mx-1'>
                                       <a id='ownerMyPage' class='link-secondary text-center link-underline-opacity-0 py-2' href='/customer/my-page'>My Page</a>
                                   </div>
                                   <div class='row text-center mx-1'>
                                       <a class='link-secondary text-center link-underline-opacity-0 py-2' href='/user/logout'>Logout</a>
                                   </div>
                               </div>
                               "
                            ><i class="bi bi-person-circle fs-4" style="color:#838383;"></i></a>
                        </li>
                        <script>
                            new bootstrap.Popover(document.querySelector('#signupPopover'))
                        </script>
	                     <li class="nav-item py-0 px-2">
                            <a id="customerBookmark" class="nav-link" data-bs-toggle="modal" data-bs-target="#bookmarkModal" href=""><i class="bi bi-bookmark-star-fill fs-4" style="color:#838383;"></i></a>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_OWNER')">
                        <li class="nav-item px-4 py-0">
                            <a type="button"
                               id="signupPopover"
                               tabindex="0" 
                               class="nav-link"
                               data-bs-container="body"
                               data-bs-toggle="popover"
                               data-bs-placement="bottom"
                          	   data-bs-trigger="focus"
                               data-bs-html="true"
                               data-bs-content="
                               <div>
                                   <div class='row text-center mx-1'>
                                       <a id='ownerMyPage' class='link-secondary text-center link-underline-opacity-0 py-2' href='/owner/my-page'>My Page</a>
                                   </div>
                                   <div class='row text-center mx-1'>
                                       <a class='link-secondary text-center link-underline-opacity-0 py-2' href='/user/logout'>Logout</a>
                                   </div>
                               </div>
                               "
                            ><i class="bi bi-person-circle fs-4" style="color:#838383;"></i></a>
                        </li>
                        <script>
                            new bootstrap.Popover(document.querySelector('#signupPopover'))
                        </script>
                    </sec:authorize>
                </sec:authorize>
            </ul>
        </ul>
    </div>	
</nav>
<script>
	//bookmark star click listener
	$(".modal-body").on('click', '[id^="star-"]', function(){
		
	    // Spring Security에서 제공하는 principal을 사용하여 로그인 상태 확인
	    if (${pageContext.request.userPrincipal != null}) {

	    	let bookmarkId = $(this).attr('index-id');
			//fill -> blank
			if ($(this).hasClass('bi-star-fill')) {
					$(this).removeClass('bi-star-fill').addClass('bi-star')
					$.getJSON('/bookmark/delete', {storeId : bookmarkId},function(){
						getBookmarkedStores();
						
					});
			///blank -> fill		
			} else {
				$(this).removeClass('bi-star').addClass('bi-star-fill')
				$.getJSON('/bookmark/insert', {storeId : bookmarkId});

			}
	    } else {
	       // 로그인되지 않은 경우, 로그인 페이지 열기
	        window.location.href = "/user/login";
	    }
	});
	
	//Bookmark tab  - show modal
    $('#bookmarkTab a').click(function(e) {
        e.preventDefault();
        $(this).tab('show');
    });
	
	//Bookmark nav - click event
	$("#customerBookmark").click(function() {
		  getVisitedStores();
	   	  if (${pageContext.request.userPrincipal != null}) {
	        // 로그인된 경우
	    	getBookmarkedStores();
	      }
	});

	//history-tab - click event
	$("#history-tab").click(function() {
		  getVisitedStores();
	});
	//bookmark-tab - click event
	$("#bookmark-tab").click(function() {
	    // Spring Security에서 제공하는 principal을 사용하여 로그인 상태 확인
	    if (${pageContext.request.userPrincipal != null}) {
	        // 로그인된 경우, 다른 창 열기 또는 특별한 동작 수행
	    	getBookmarkedStores();
	    } else {
	    	alert("로그인이 필요합니다");
	        // 로그인되지 않은 경우, 로그인 페이지 열기
	        window.location.href = "/user/login";
	    }
		  
	});
	
	function getVisitedStores(){
           $("#historyLoadingSpinner").css("display", "block");
		//방문한 가게 불러오기
		let histories = JSON.parse(localStorage.getItem("store_history"));
		let data = histories.map(function(storeId) {
			return "id=" + storeId;
		}).join("&");
		console.log("data : ",data);
		  
		$("#history-tab-content").find(".history_card").remove();
		
		$.getJSON('/store/history',  data, function(stores) {
			console.log("ajax getVisitedStores start");

			// histories = [23, 10]
			// stores = [{no:10, name:aa}, {no:23, name:bbb}]
			histories.forEach(function(id, index) {
				store = stores.find(function(store) {
					return store.id == id;
				})
				store['index'] = index;
			})
			// stores = [{no:10, name:aa, index:1}, {no:23, name:bbb, index:0}]
			
			stores.sort(function(store1, store2) {
				return store1.index - store2.index;
			})
			
			// html 태그 생성
			stores.forEach(function(store){
			console.log("result stores : ", store.id);
			let ynStar;
			 
			if(store.isBookmarked==='y'){
				ynStar = 'bi-star-fill';
			}
		
			if(store.isBookmarked==='n'){
				ynStar = 'bi-star';
			}
			
			let content = `
				<div class="card history_card mb-3">
					<div class="row g-0">
						<div class="col-md-4">
							<img src="/resources/image/cafe1.jpg" class="img-fluid rounded-start" alt="...">
						</div>
					<div class="col-md-8">
						<div class="card-body">
							<div class="row">
								<div class="col-9">
									<p class="card-title">\${store.name}</p>
									<p class="card-text"><small class="text-body-secondary">\${store.category}</small></p>
								</div>
								<div class="col-3 star-container d-flex justify-content-center ">
									<button class="btn" id="box-\${store.id}"> 
										<i id="star-\${store.id}" index-id ="\${store.id}" class="bi \${ynStar}" style="color: gold; font-size: 25px;"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			`;
            $("#historyLoadingSpinner").css("display", "none");
			$("#history-tab-content").append(content);

			})
		console.log("ajax getVisitedStores done");
		})

	}
	
	function getBookmarkedStores() {
           $("#bookmarkLoadingSpinner").css("display", "block");
		//북마크 가게 불러오기
		$("#bookmark").find(".bookmark_card").remove();
		$.getJSON('/store/bookmark' , function(stores) {
			console.log("ajax getBookmarkedStores start");
	
				// html 태그 생성
			stores.forEach(function(store) {
				console.log("result stores : ", store.id);
				
				let content = `
					<div class="card bookmark_card mb-3">
						<div class="row g-0">
							<div class="col-md-4">
								<img src="/resources/image/cafe1.jpg" class="img-fluid rounded-start" alt="...">
							</div>
						<div class="col-md-8">
							<div class="card-body">
								<div class="row">
									<div class="col-9">
										<p class="card-title">\${store.name}</p>
										<p class="card-text"><small class="text-body-secondary">\${store.category}</small></p>
									</div>
									<div class="col-3 star-container d-flex justify-content-center ">
										<button class="btn" id="box-\${store.id}"> 
											<i id="star-\${store.id}" index-id ="\${store.id}" class="bi bi-star-fill" style="color: gold; font-size: 25px;"></i>
										</button>
									</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				`;
				$("#bookmark").append(content);
			})
	    	$("#bookmarkLoadingSpinner").css("display", "none");
				
		})
		console.log("ajax getBookmarkedStores done");

	}

	
</script>			