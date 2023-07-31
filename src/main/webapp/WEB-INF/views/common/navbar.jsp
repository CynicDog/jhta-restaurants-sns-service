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
    	
    	.search-bar {
      width: 500px;
    }
</style>
<nav class="navbar navbar-expand-lg border-bottom">
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
            </ul>
            <ul class="navbar-nav">
                <sec:authorize access="isAnonymous()">
                    <li class="nav-item">
                        <a class="nav-link" href="/user/login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/add">Signup</a>
                    </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="/user/my-page">My Page</a>
                    </li>
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
    </script>
</nav>