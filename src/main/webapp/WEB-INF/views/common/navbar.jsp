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
        padding-bottom: 100px;
    }

    .search-bar {
        width: 1000px;
    }
</style>
<nav class="navbar navbar-expand-lg border-bottom">
    <div class="container">
        <a class="navbar-brand" href="/">🧑🏻‍💻</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <ul class="collapse navbar-collapse my-1" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/stores/list">Stores</a>
                </li>
            </ul>
            <form class="w-25 me-3">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            </form>
            <ul class="navbar-nav">
                <sec:authorize access="isAnonymous()">
                    <li class="nav-item">
                        <a class="nav-link" href="/user/login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"
<%--                           href="/user/signup"--%>
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
                    <li class="nav-item">
                        <a class="nav-link" href="/user/my-page">My Page</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/logout">Logout</a>
                    </li>
                </sec:authorize>
            </ul>
            <div class="form-check form-switch m-1">
                <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked
                       value="" onclick="toggleDarkMode()">
            </div>
        </ul>
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