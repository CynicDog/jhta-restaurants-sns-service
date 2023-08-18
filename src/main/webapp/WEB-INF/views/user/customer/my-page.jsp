<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Application</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<%@ include file="../../common/navbar.jsp" %>
<div class="container">
    <div class="row my-5">
        <div class="col-md-5 my-5">
            <div class="card shadow my-3">
                <div class="fw-lighter m-3 p-1">
                    <div class="row">
                        <div class="col-8 fs-4">About Me</div>
                        <div class="col-4 d-flex justify-content-end">
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" role="switch"
                                       id="flexSwitchCheckDefault">
                                <%-- TODO: Behaviors on public / private account --%>
                                <label class="form-check-label" for="flexSwitchCheckDefault">Private</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row mx-2">
                        <div class="col-sm-5 my-1 fw-lighter">
                            <label for="fullName" class="col-sm-2 col-form-label"><span style="white-space: nowrap">Full Name</span></label>
                        </div>
                        <div class="col-sm-7 my-1">
                            <p class="form-control-plaintext" id="fullName"> ${ customer.fullName } </p>
                        </div>
                    </div>
                    <div class="row mx-2">
                        <div class="col-sm-5 my-1 fw-lighter">
                            <label for="nickName" class="col-sm-2 col-form-label"><span style="white-space: nowrap">Nickname</span></label>
                        </div>
                        <div class="col-sm-7 my-1">
                            <p class="form-control-plaintext" id="nickName"> ${ customer.nickname } </p>
                        </div>
                    </div>
                    <div class="row mx-2">
                        <div class="col-sm-5 my-1 fw-lighter">
                            <label for="email" class="col-sm-2 col-form-label"><span
                                    style="white-space: nowrap">Email</span></label>
                        </div>
                        <div class="col-sm-7 my-1">
                            <p class="form-control-plaintext" id="email"> ${ customer.email } </p>
                        </div>

                    </div>
                </div>
            </div>
            <span class="fw-li"></span>
            <div class="card shadow">
                <div class="fw-lighter m-3 p-1">
                    <div class="row align-items-center">
                        <div class="col-md-4 fs-4">
                            Socials
                        </div>
                        <div class="col-md-8 text-end">
                            <div id="followersToastButton" type="button"
                                 class="badge text-bg-secondary position-relative mx-2">
                                followers
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                    99+
                                </span>
                            </div>
                            <div id="followingsToastButton" type="button"
                                 class="badge text-bg-secondary position-relative mx-2">
                                followings
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                    99+
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <c:if test="${not empty recipients}">
                        <div class="p-2 m-3">
                            <p class="my-1">Sent requests</p>
                            <hr/>
                            <c:forEach items="${recipients}" var="recipient">
                                <div class="border rounded p-2 my-2 d-flex align-items-center">
                                    <span class="fw-bold mx-1">${recipient.email}</span>
                                    <div class="ms-auto">
                                        <span class="badge bg-secondary my-1">Pending</span>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                    <c:if test="${not empty senders}">
                        <div class="p-2 m-3">
                            <p class="my-1">Arrived requests</p>
                            <hr/>
                            <c:forEach items="${senders}" var="sender">
                                <div class="border rounded p-2 my-2 d-flex align-items-center">
                                    <span class="fw-bold mx-1">${sender.email}</span>
                                    <div class="ms-auto">
                                        <a href="" class="btn btn-outline-secondary btn-sm"
                                           onclick="accept(${sender.id})">accept</a>
                                        <a href="" class="btn btn-outline-danger btn-sm"
                                           onclick="decline()">decline</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="col-md-7 my-5">
            <div class="card shadow overflow-auto my-3" style="max-height: 900px;">
                <div class="d-flex fs-4 m-3 p-1 fw-lighter ">My Posts
                        <div class="btn border border-0 disabled">
                            <div id="postsLoadingSpinner" class="spinner-border spinner-border-sm text-primary m-1" role="status" style="display: none;">
                                <span class="visually-hidden">Loading...</span>
                            </div>
                        </div>
                </div>
                <div class="card-body">
                    <ol id="postOutputArea" class="list-group list-group-numbered fw-light" style="max-height: 300px; overflow: auto">
                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="toast-container position-fixed bottom-0 end-0 p-4">
    <div id="successfulToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body">
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto"
                    data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
    <div id="followersToast" class="toast toast-add-menu" role="alert" aria-live="assertive" aria-atomic="true"
         data-bs-autohide="false">
        <div class="toast-body">
            <div class="row">
                <div class="col">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div class="fw-lighter fs-4">Followers</div>
                        <button id="followersCloseButton" type="button" class="btn-close" data-bs-dismiss="toast"
                                aria-label="Close"></button>
                    </div>
                </div>
            </div>
            <div class="text-center">
                <div class="btn border border-0 disabled">
                    <div id="followersLoadingSpinner"
                         class="spinner-border spinner-border-sm text-primary m-1" role="status" style="display: none;">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
            </div>
            <div id="followersOutputArea" class="my-2 p-1" style="max-height: 200px; overflow-y: auto;">
            </div>
        </div>
    </div>
    <div id="followingsToast" class="toast toast-add-menu" role="alert" aria-live="assertive" aria-atomic="true"
         data-bs-autohide="false">
        <div class="toast-body">
            <div class="row">
                <div class="col">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div class="fw-lighter fs-4">Followings</div>
                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>

    function accept(senderId) {

        let xhr = new XMLHttpRequest();
        xhr.open("POST", "/follow/accept?sender-id=" + senderId, true);
        xhr.responseType = "text";

        xhr.onload = function () {
            if (xhr.status === 200) {
                alert("success message")
                window.location.reload();
            } else {
                alert(xhr.responseText);
            }
        };

        xhr.send();

    }

    function decline(senderId) {

        let xhr = new XMLHttpRequest();
        xhr.open("POST", "/follow/decline?id=" + senderId, true);
        xhr.responseType = "text";

        xhr.onload = function () {
            if (xhr.status === 200) {
                alert("success message")
            } else {
                alert(xhr.responseText);
            }
        };

        xhr.send();
    }

    document.addEventListener("DOMContentLoaded", function () {

        const followersToastButton = document.getElementById('followersToastButton')
        const followersLoadingSpinner = document.getElementById('followersLoadingSpinner')
        const followersCloseButton = document.getElementById('followersCloseButton');

        let followersToast = document.getElementById('followersToast')
        let followersOutputArea = document.getElementById('followersOutputArea');

        const postOutputArea = document.getElementById('postOutputArea');
        const postsLoadingSpinner = document.getElementById('postsLoadingSpinner');

        const getPosts = page => {
            const url = ``;
            return fetch(`/customer/posts?page=\${page}&limit=5`).then(response => response.json());
        }

        let page = 0
        let isFetching = false;
        let isLast = false;
        function fetchAndRenderPosts(page) {
            if (isFetching || isLast) {
                return;
            }
            isFetching = true;
            postsLoadingSpinner.style.display = 'block';
            getPosts(page).then(data => {

                if (data.totalElements === 0) {
                    postOutputArea.innerHTML += `<span class=fw-lighter m-3>No posts published yet.</span>`
                    postsLoadingSpinner.style.display = 'none'
                    isFetching = false;
                }

                isLast = data.last;
                data.content.forEach(datum => {
                    postOutputArea.innerHTML += `
                        <li class="list-group-item d-flex justify-content-between align-items-start">
                            <div class="ms-2 me-auto">
                                <div class="fw-medium"> \${datum.title}</div>
                                \${datum.subTitle}
                            </div>
                            <i style="color: #cb444a" class="bi bi-trash m-2"></i>
                        </li>
                    `;
                    postsLoadingSpinner.style.display = 'none'
                    isFetching = false;
                })
            })
        }

        // initial loading
        fetchAndRenderPosts(page);

        // infinite scrolling (scroll pagination)
        postOutputArea.addEventListener('scroll', function() {
            const scrollPos = this.scrollTop + this.clientHeight;
            const scrollHeight = this.scrollHeight;

            if (scrollPos === scrollHeight) {
                page += 1;
                fetchAndRenderPosts(page);
            }
        })

        followersToastButton.addEventListener("click", function () {
            const followersToastBootstrap = bootstrap.Toast.getOrCreateInstance(followersToast)
            followersLoadingSpinner.style.display = 'block';

            fetch(`/customer/followers`, {
                method: "GET"
            }).then(response => {
                if (response.ok) {
                    followersLoadingSpinner.style.display = 'none';
                    return response.json()
                }
            }).then(data => {
                data.forEach(datum => {
                    followersOutputArea.innerHTML += `
                        <div class="row">
                            <div class="col-12 my-1">
                                <div class="d-flex align-items-start">
                                    <img class="rounded-circle" src="/resources/image/user.png"  width="30" height="30" alt="User Image">
                                    <p class="mx-2 my-1">\${datum.email}</p>
                                </div>
                            </div>
                        </div>
                `;
                });
            })

            followersToastBootstrap.show()
        })

        followersCloseButton.addEventListener("click", function () {
            followersOutputArea.innerHTML = ''
        })

        const followingsToastButton = document.getElementById('followingsToastButton')
        followingsToastButton.addEventListener("click", function () {
            let followingsToast = document.getElementById('followingsToast')
            const followingsToastBootstrap = bootstrap.Toast.getOrCreateInstance(followingsToast)
            followingsToastBootstrap.show()
        })


    });
</script>
</html>
