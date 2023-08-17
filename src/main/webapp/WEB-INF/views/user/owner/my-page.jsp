<%--TODO: 1. Sorting and pagination over registered stores --%>
<%--TODO: 2. Store detail modification page --%>
<%--TODO: 3. Socials drop and replace with another content --%>
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
    <div class="row my-4">
        <div class="col-md-5 my-2">
            <div class="card shadow overflow-auto" style="max-height: 900px;">
                <div class="fw-lighter m-3 p-1">
                    <div class="row">
                        <div class="col-8 fs-4">My Stores</div>
                        <div class="col-4 d-flex justify-content-end">
                            <div class="my-2">
                                <div id="registerStorePopover"
                                     data-bs-container="body"
                                     data-bs-toggle="popover"
                                     data-bs-placement="bottom"
                                     data-bs-html="true"
                                     data-bs-content="<a class='link-secondary m-1 link-underline-opacity-0' href='/owner/register'>Let's go register your store!</a>">
                                    <i type="button" class="bi bi-plus-circle" style="color: #838383"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <c:if test="${not empty stores}">
                        <ol class="list-group list-group-numbered">
                            <c:forEach items="${stores}" var="store">
                                <li class="list-group-item d-flex justify-content-between align-items-start">
                                    <div class="ms-2 me-auto">
                                        <div class="fw-bold">${store.name}</div>
                                        <c:choose>
                                            <c:when test="${store.description.length() gt 50}">
                                                ${store.description.substring(0, 50)} ...
                                            </c:when>
                                            <c:otherwise>
                                                ${store.description}
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <i type="button" class="bi bi-pencil-square"></i>
                                </li>
                            </c:forEach>
                        </ol>
                    </c:if>
                    <c:if test="${empty stores}">
                        <p class="my-1">No stores registered yet.</p>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="col-md-7 my-2">
            <div class="card shadow mb-3">
                <div class="fw-lighter m-3 p-1">
                    <div class="row">
                        <div class="col-8 fs-4">About Me</div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row m-2">
                        <div class="col-sm-3 my-1 fw-lighter">
                            <label for="nickname" class="col-sm-2 col-form-label"><span
                                    style="white-space: nowrap">Nickname</span></label>
                        </div>
                        <div class="col-sm-9 my-1">
                            <p class="form-control-plaintext" id="nickname"> ${owner.nickname} </p>
                        </div>
                    </div>
                    <div class="row m-2">
                        <div class="col-sm-3 my-1 fw-lighter">
                            <label for="email" class="col-sm-2 col-form-label"><span
                                    style="white-space: nowrap">Email</span></label>
                        </div>
                        <div class="col-sm-9 my-1">
                            <p class="form-control-plaintext" id="email"> ${owner.email} </p>
                        </div>
                    </div>
                    <div class="row m-2">
                        <div class="col-sm-3 my-1 fw-lighter">
                            <label for="create-date" class="col-sm-2 col-form-label"><span style="white-space: nowrap">Joined Date</span></label>
                        </div>
                        <div class="col-sm-9 my-1">
                            <p class="form-control-plaintext" id="create-date">
                                <fmt:formatDate value="${ owner.createDate }" pattern="yyyy-MM-dd"/>
                            </p>
                        </div>
                    </div>
                    <div class="row m-2">
                        <div class="col-sm-3 my-1 fw-lighter">
                            <label for="type" class="col-sm-2 col-form-label"><span
                                    style="white-space: nowrap">User Type</span></label>
                        </div>
                        <div class="col-sm-9 my-1">
                            <p class="form-control-plaintext" id="type"> ${ owner.type } </p>
                        </div>
                    </div>
                </div>
            </div>
            <span class="fw-li"></span>
            <div class="card shadow">
                <div class="fw-lighter m-3 p-1">
                    <div class="row align-items-center">
                        <div class="col fs-4">
                            Socials
                        </div>
                        <div class="col text-end">
                            <div class="badge text-bg-secondary position-relative mx-2"
                                 id="followersPopover"
                                 type="button"
                                 data-bs-container="body"
                                 data-bs-toggle="popover"
                                 data-bs-placement="bottom"
                                 data-bs-html="true"
                                 data-bs-content="<p class='link-secondary m-1' id='follow-list'>Here's your followers</p>">
                                followers
                                <%--                                <c:if test="${not empty follwers}">--%>
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                    99+
                                </span>
                                <%--                                </c:if>--%>
                            </div>
                            <div class="badge text-bg-secondary position-relative mx-2"
                                 id="followingsPopover"
                                 type="button"
                                 data-bs-container="body"
                                 data-bs-toggle="popover"
                                 data-bs-placement="bottom"
                                 data-bs-html="true"
                                 data-bs-content="<p class='link-secondary m-1' id='follow-list'>Here's your followers</p>">
                                followings
                                <%--                                <c:if test="${not empty followings}">--%>
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                    99+
                                </span>
                                <%--                                </c:if>--%>
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
    </div>
    <div class="toast-container position-fixed bottom-0 end-0 p-4">
        <div id="successfulToast" class="toast text-bg-primary" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body">
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto"
                        data-bs-dismiss="toast" aria-label="Close"></button>
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

        const params = new URLSearchParams(window.location.search);

        const registerStoreIcon = new bootstrap.Popover(document.querySelector('#registerStorePopover'))
        const followersPopover = new bootstrap.Popover(document.querySelector('#followersPopover'), {
            trigger: 'manual',
            content: "init",
        });
        const followingsPopover = new bootstrap.Popover(document.querySelector('#followingsPopover'), {
            trigger: 'manual',
            content: "init",
        });

        // window.location.href = "/owner/my-page?registration=success"
        if (params.get("registration") === "success") {
            showMessagingToast("Successfully registered :)");
        }

        let followersPopoverVisible = false;
        document.body.addEventListener('click', function (event) {
            if (event.target.matches('#followersPopover')) {
                if (followersPopoverVisible) {
                    followersPopover.hide();
                } else {
                    // TODO: Fetch followers and replace the below dummy users
                    // Load the content

                    followersPopover.setContent({
                        '.popover-body': `
                            <div class="row">
                                <div class="col-12 my-1">
                                    <div class="d-flex align-items-start">
                                        <img class="rounded-circle" src="/resources/image/user.png"  width="30" height="30" alt="User Image">
                                        <p class="mx-2 my-1">John Doe</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 my-1">
                                    <div class="d-flex align-items-start">
                                        <img class="rounded-circle" src="/resources/image/user.png"  width="30" height="30" alt="User Image">
                                        <p class="mx-2 my-1">Alice Smith</p>
                                    </div>
                                </div>
                            </div>
                        `
                    });
                    followersPopover.show();
                }

                followersPopoverVisible = !followersPopoverVisible;
            }
        });

        let followingsPopoverVisible = false;
        document.body.addEventListener('click', function (event) {

            if (event.target.matches('#followingsPopover')) {
                if (followingsPopoverVisible) {
                    followingsPopover.hide();
                } else {
                    // TODO: Fetch followers and replace the below dummy users
                    // Load the content
                    followingsPopover.setContent({
                        '.popover-body': `
                            <div class="row">
                                <div class="col-12 my-1">
                                    <div class="d-flex align-items-start">
                                        <img class="rounded-circle" src="/resources/image/user.png"  width="30" height="30" alt="User Image">
                                        <p class="mx-2 my-1">John Doe</p>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12 my-1">
                                    <div class="d-flex align-items-start">
                                        <img class="rounded-circle" src="/resources/image/user.png"  width="30" height="30" alt="User Image">
                                        <p class="mx-2 my-1">Alice Smith</p>
                                    </div>
                                </div>
                            </div>
                        `
                    });
                    followingsPopover.show();
                }

                followingsPopoverVisible = !followingsPopoverVisible;
            }
        });

        function showMessagingToast(message) {
            const successfulToast = document.getElementById('successfulToast');
            const toastBody = successfulToast.querySelector('.toast-body');

            toastBody.textContent = message;

            const successfulToastBootstrap = bootstrap.Toast.getOrCreateInstance(successfulToast);
            successfulToastBootstrap.show();
        }
    });
</script>
</html>
