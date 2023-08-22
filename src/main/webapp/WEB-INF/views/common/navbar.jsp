<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style type="text/css">
    html, body {
        height: 100%;
    }

    .wrap {
        position: relative;
        min-height: 100%;
        padding-top: 70px;
        padding-bottom: 100px;
    }

    .search-bar {
        width: 1000px;
    }
</style>
<!-- 모달 -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable z-3" style="position: fixed; right: 10px; top: 25px; width: 320px; height:500px ">
			<div class="modal-content">
				<div class="modal-body">
				<ul class="nav nav-pills mb-3" id="bookmarkTab" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="history-tab" data-toggle="tab" href="#history" role="tab"
						aria-controls="history" aria-selected="true">최근 본 맛집</a></li>
					<li class="nav-item"><a class="nav-link" id="bookmark-tab"
						data-toggle="tab" href="#bookmark" role="tab"
						aria-controls="bookmark" aria-selected="false">가고싶은 맛집</a></li>
	
				</ul>
				<div class="tab-content" id="bookmarkTabContent">
					<div class="tab-pane fade show active" id="history" role="tabpanel"
						aria-labelledby="history-tab">
<!-- 						<div class="card mb-3"> -->
<!-- 							<div class="row g-0"> -->
<!-- 								<div class="col-md-4"> -->
<!-- 									<img src="/resources/image/cafe1.jpg" -->
<!-- 										class="img-fluid rounded-start" alt="..."> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-8"> -->
<!-- 									<div class="card-body"> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col-9"> -->
<!-- 												<p class="card-title">맛있는 식당</p> -->
<!-- 												<p class="card-text"><small class="text-body-secondary">한식</small></p> -->
<!-- 											</div> -->
<!-- 											<div class="col-3 d-flex justify-content-center "> -->
<!-- 												<button class="btn" id="box"> -->
<!-- 													<i id="star" class="bi bi-star" style="color: gold; font-size: 25px;"></i> -->
<!-- 												</button> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->



					

					</div>
					<div class="tab-pane fade" id="bookmark" role="tabpanel"
						aria-labelledby="bookmark-tab">
<!-- 						<div class="card mb-3"> -->
<!-- 							<div class="row g-0"> -->
<!-- 								<div class="col-md-4"> -->
<!-- 									<img src="/resources/image/cafe1.jpg" -->
<!-- 										class="img-fluid rounded-start" alt="..."> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-8"> -->
<!-- 									<div class="card-body"> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col-9"> -->
<!-- 												<p class="card-title">맛있는 식당</p> -->
<!-- 												<p class="card-text"><small class="text-body-secondary">한식</small></p> -->
<!-- 											</div> -->
<!-- 											<div class="col-3 d-flex justify-content-center "> -->
<!-- 												<button class="btn" id="box"> -->
<!-- 													<i id="star" class="bi bi-star" style="color: gold; font-size: 25px;"></i> -->
<!-- 												</button> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
				</div>
			</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-expand-lg border-bottom bg-light fixed-top shadow-sm z-2">
	    <div class="container-fluid">
	
			<a class="navbar-brand ms-2" href="/">🧑🏻‍💻</a>
	        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
	                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	        <ul class="collapse navbar-collapse my-1" id="navbarSupportedContent">
	            <ul class="navbar-nav me-auto">
	<!--                 <li class="nav-item"> -->
	<!--                     <a class="nav-link" href="/">Home</a> -->
	<!--                 </li> -->
	<!--                 <li class="nav-item"> -->
	<!--                     <a class="nav-link" href="/store/search">Store</a> -->
	<!--                 </li> -->
	            </ul>
	            <form class="w-25 me-3" id="form-navbar-search" action="/store/search">
	                <input class="form-control me-2" name="keyword" value="${keyword}" type="search" placeholder="Search" aria-label="Search" >
	            </form>
	            <ul class="navbar-nav">
	                <sec:authorize access="isAnonymous()">
	                    <li class="nav-item">
	                        <a class="nav-link" href="/user/login">Login</a>
	                    </li>
	                    <li class="nav-item">
	                        <a id="signupPopover"
	                           class="nav-link"
	                           data-bs-container="body"
	                           data-bs-toggle="popover"
	                           data-bs-placement="bottom"
	                           data-bs-html="true"
	                           data-bs-content="
	                               <a class='link-secondary m-1 text-center link-underline-opacity-0' href='/customer/signup'>손님</a> /
	                               <a class='link-secondary m-1 text-center link-underline-opacity-0' href='/owner/signup'>사장님</a>
	                           "
	                        >Signup</a>
	                    </li>
                        <li class="nav-item">
                            <a id="customerBookmark" class="nav-link" data-bs-toggle="modal" data-bs-target="#exampleModal" href="">Bookmark</a>
                        </li>
	                    
	                    <script>
	                        new bootstrap.Popover(document.querySelector('#signupPopover'))
	                    </script>
	                </sec:authorize>
	                <sec:authorize access="isAuthenticated()">
	                    <sec:authorize access="hasRole('ROLE_CUSTOMER')">
	                        <li class="nav-item">
	                            <a id="customerMyPage" class="nav-link" href="/customer/my-page">My Page</a>
	                        </li>
	                    </sec:authorize>
	                    <sec:authorize access="hasRole('ROLE_OWNER')">
	                        <li class="nav-item">
	                            <a id="ownerMyPage" class="nav-link" href="/owner/my-page">My Page</a>
	                        </li>
	                    </sec:authorize>
	                    <li class="nav-item">
	                        <a class="nav-link" href="/user/logout">Logout</a>
	                    </li>
	                </sec:authorize>
	            </ul>
	        </ul>
	    </div>	
	<script>
	
		//bookmark star click listener
		$(".modal-body").on('click', '[id^="star-"]', function(){
			if ($(this).hasClass('bi-star-fill')) {
				$(this).removeClass('bi-star-fill').addClass('bi-star')
				
			} else {
				let bookmarkId = $(this).attr('index-id');
					console.log("star id : ", bookmarkId);
				$(this).removeClass('bi-star').addClass('bi-star-fill')
				$.getJSON('../bookmark', {customerId : 4, storeId : bookmarkId}, function() {
				});
			}
		});
		
		//Bookmark
	    $('#bookmarkTab a').click(function(e) {
	        e.preventDefault();
	        $(this).tab('show');
	    });
		
		  $("#customerBookmark").click(function() {
			  
			//방문한 가게 불러오기
			let histories = JSON.parse(localStorage.getItem("store_history"));
			let data = histories.map(function(storeId) {
				return "id=" + storeId;
			}).join("&");
			console.log("data : ",data);
			  
			$("#history").find(".history_card").remove();
			$.getJSON('history',  data, function(stores) {
				console.log("ajax succeed");
	
				// html 태그 생성
				stores.forEach(function(store){
				console.log("result stores : ", store.id);
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
											<i id="star-\${store.id}" index-id ="\${store.id}" class="bi bi-star" style="color: gold; font-size: 25px;"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				`;
				$("#history").append(content);
					
				})
			})
			
			//북마크 가게 불러오기
			$("#bookmark").find(".bookmark_card").remove();
			$.getJSON('bookmark',  {customerId : 4}, function(stores) {
				console.log("ajax succeed");
	
				// html 태그 생성
				stores.forEach(function(store){
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
												<i id="star-\${store.id}" index-id ="\${store.id}" class="bi bi-star" style="color: gold; font-size: 25px;"></i>
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
				})
		  });
		
		

		
		
		
	</script>
	</nav>