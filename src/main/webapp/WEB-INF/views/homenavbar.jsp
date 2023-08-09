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
<nav class="navbar navbar-expand-lg">
    <div class="container">
				<a class="navbar-brand" href="/">🧑🏻‍💻</a>
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
				            <a class="nav-link" href="/stores/list">Stores</a>
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
								>Signup</a>
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
    <script>
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
<div class="container">
    <div class="row border-bottom">
    	<div class="col-12">
    		<form action="https://www.google.com/search" method="GET">
				<div class="mx-auto my-5 search-bar input-group">
  					<input name="q" type="text" class="form-control rounded-pill" placeholder="지역 또는 가게명 입력" aria-label="Recipient's username" aria-describedby="button-addon2">
  					<div class="input-group-append"></div>
					<!--  <button class="btn btn-search btn-dark rounded-pill ms-2">검색</button> -->
				</div>
			</form>
    	</div>
    </div>
</div>