<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style type="text/css">
    	html, body{
    		height:100%;
    	}	
    	
    	.wrap{
    		position: relative;
  			min-height: 100%;
  			padding-bottom: 100px;
    	}
    	
    	.card-img-overlay{
    		position: absolute;
  			top: 30%;
  			font-size: 22px;
    	}
    	
    	img{
    		width: 100%;
    		height: 200px;
    		object-fit:cover;
    		filter: brightness(70%);
    	}
    	
    	.search-bar {
      width: 800px;
    }
</style>
<!-- 모달 -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog z-3" style="position: fixed; right: 10px; top: 25px; width: 320px;">
				<div class="modal-content">
			<div class="modal-body">
				<ul class="nav nav-pills" id="bookmarkTab" role="tablist">
					<li class="nav-item">
					<a class="nav-link active" id="history-tab"
						data-toggle="tab" href="#history" role="tab" aria-controls="history" aria-selected="true">최근 본 맛집</a>
					</li>
					<li class="nav-item">
					<a class="nav-link" id="bookmark-tab"
						data-toggle="tab" href="#bookmark" role="tab" aria-controls="bookmark" aria-selected="false">가고싶은 맛집</a>
						</li>

				</ul>
				<div class="tab-content" id="bookmarkTabContent">
					<div class="tab-pane fade show active" id="history" role="tabpanel" aria-labelledby="history-tab">
						<div class="card mb-3">
						  <div class="row g-0">
						    <div class="col-md-4">
						      <img src="/resources/image/cafe1.jpg" class="img-fluid rounded-start" alt="...">
						    </div>
						    <div class="col-md-8">
						      <div class="card-body">
						        <h5 class="card-title">Card title</h5>
						        <p class="card-text">This is a  card </p>
						        <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
						      </div>
						    </div>
						  </div>
						</div>
						<div class="card mb-3">
						  <div class="row g-0">
						    <div class="col-md-4">
						      <img src="/resources/image/cafe1.jpg" class="img-fluid rounded-start" alt="...">
						    </div>
						    <div class="col-md-8">
						      <div class="card-body">
						        <h5 class="card-title">Card title</h5>
						        <p class="card-text">This is a  card </p>
						        <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
						      </div>
						    </div>
						    
						  </div>
						</div>
					</div>
					<div class="tab-pane fade" id="bookmark" role="tabpanel"
						aria-labelledby="bookmark-tab">
						<p>이곳에 두 번째 탭의 내용을 입력하세요.</p>
					</div>
				</div>

			</div>
			<div class="modal-footer"></div>
				</div>
			</div>
		</div>
<nav class="navbar navbar-expand-lg bg-light fixed-top">
    <div class="container-fluid">
		<a class="navbar-brand ms-2" href="/">🧑🏻‍💻</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				    <span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
				    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
				        <li class="nav-item">
				            <a class="nav-link" href="/">Home</a>
				        </li>
				        <li class="nav-item">
				            <a class="nav-link" href="/store/search">Stores</a>
				        </li>
				        <li class="nav-item">
				        	<a class="nav-link" href="/post/register">RegPost</a>
				        </li>
				    </ul>
				    <ul class="navbar-nav">
				        <sec:authorize access="isAnonymous()">
				            <li class="nav-item">
				                <a class="nav-link" href="/user/login">Login</a>
				            </li>
							<li class="nav-item">
								<a class="nav-link"
								   data-bs-container="body"
								   data-bs-toggle="popover"
								   data-bs-placement="bottom"
								   data-bs-html="true"
								   data-bs-content="
									   <a class='link-secondary m-1 text-center link-underline-opacity-0' href='/customer/signup'>손님</a> /
									   <a class='link-secondary m-1 text-center link-underline-opacity-0' href='/owner/signup'>사장님</a>
								   "
								   style=" cursor: pointer;"
								>Signup</a>
							</li>
							
							<li class="nav-item">
                           		<a id="customerBookmark" class="nav-link" data-bs-toggle="modal" data-bs-target="#exampleModal" style="cursor: pointer;">Bookmark</a>
                       		</li>
                       		
				        </sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<sec:authorize access="hasRole('ROLE_CUSTOMER')">
								<li class="nav-item">
									<a class="nav-link" href="/customer/my-page">My Page</a>
								</li>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_OWNER')">
								<li class="nav-item">
									<a class="nav-link" href="/owner/my-page">My Page</a>
								</li>
							</sec:authorize>
							<li class="nav-item">
								<a class="nav-link" href="/user/logout">Logout</a>
							</li>
						</sec:authorize>
				    </ul>
				    <div class="form-check form-switch m-1">
				        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked value="" onclick="toggleDarkMode()">
				    </div>
				</div>
    		</div>
    		
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>  		
    <script>
			
    
//     	Bookmark
	    $(document).ready(function () {
	        $('#bookmarkTab a').click(function (e) {
	            e.preventDefault();
	            $(this).tab('show');
	        });
	    });
    
        function toggleDarkMode() {
            const htmlElement = document.querySelector('html');
            if (htmlElement.getAttribute('data-bs-theme') === 'dark') {
                htmlElement.removeAttribute('data-bs-theme');
                setColorModePreference('light');
            } else {
                htmlElement.setAttribute('data-bs-theme', 'dark');
                setColorModePreference('dark');
            }
        }

        function setColorModePreference(mode) {
            localStorage.setItem('colorMode', mode);
        }

        function applyColorModePreference() {
            const colorMode = localStorage.getItem('colorMode');

            if (colorMode === 'dark') {
                document.getElementById("flexSwitchCheckChecked").checked = false;
                document.documentElement.setAttribute('data-bs-theme', 'dark');
            } else {
                document.getElementById("flexSwitchCheckChecked").checked = true;
                document.documentElement.removeAttribute('data-bs-theme');
            }
        }
        applyColorModePreference();

		let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
		let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
			return new bootstrap.Popover(popoverTriggerEl)
		});
    </script>
</nav>
<div class="container-fluid">
    <div class="row border-bottom">
    	<div class="col-12 mt-4">
    		<form action="/store/search" method="GET">
				<div class="mx-auto my-5 search-bar input-group">
  					<input name="keyword" type="text" class="form-control rounded-pill" placeholder="지역 또는 가게명 입력" 
  						   aria-label="Recipient's username" aria-describedby="button-addon2" >
  					<div class="input-group-append"></div>
					<!--  <button class="btn btn-search btn-dark rounded-pill ms-2">검색</button> -->
				</div>
			</form>
    	</div>
    </div>
</div>