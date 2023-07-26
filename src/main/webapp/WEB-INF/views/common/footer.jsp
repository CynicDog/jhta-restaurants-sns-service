<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
    .footer {
        padding: 20px 0;
        position: relative;
        bottom: 0;
        width: 100%;
    }
</style>
<footer class="footer navbar-fixed-bottom border-top">
    <div class="container">
        <div class="row">
            <!-- Navigation links -->
            <div class="col">
                <ul class="nav justify-content-center">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                    <!-- Add more navigation links here -->
                </ul>
            </div>
        </div>
    </div>
    <script>
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
</footer>