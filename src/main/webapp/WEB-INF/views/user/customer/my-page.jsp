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
                <div class="fw-lighter fs-4 m-3 p-1">My Articles</div>
                <div class="card-body">
                    <c:if test="${ not empty posts }">
                        <ol class="list-group list-group-numbered">
                            <c:forEach items="${ posts }" var="post">
                                <li class="list-group-item d-flex justify-content-between align-items-start">
                                    <div class="ms-2 me-auto">
                                        <div class="fw-bold">${ post.title }</div>
                                        <c:choose>
                                            <c:when test="${ post.content.length() gt 50 }">
                                                ${ post.content.substring(0, 50) } ...
                                            </c:when>
                                            <c:otherwise>
                                                ${ post.content }
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <i style="color: #cb444a" class="bi bi-trash m-2"></i>
                                </li>
                            </c:forEach>
                        </ol>
                    </c:if>
                    <c:if test="${empty posts}">
                        <p class="my-1">No posts published yet.</p>
                    </c:if>
                </div>
            </div>
        </div>

        <div class="col-md-7 my-2">
            <div class="card shadow mb-3">
                <div class="fw-lighter m-3 p-1">
                    <div class="row">
                        <div class="col-8 fs-4">About Me</div>
                        <div class="col-4 d-flex justify-content-end"> <!-- Use justify-content-end to align the content to the right -->
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                                <%-- TODO: Behaviors on public / private account --%>
                                <label class="form-check-label" for="flexSwitchCheckDefault">Private</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="row m-2">
                        <div class="col-sm-3 my-1 fw-lighter">
                            <label for="fullName" class="col-sm-2 col-form-label"><span
                                    style="white-space: nowrap">Full Name</span></label>
                        </div>
                        <div class="col-sm-9 my-1">
                            <p class="form-control-plaintext" id="fullName"> ${ customer.fullName } </p>
                        </div>
                    </div>
                    <div class="row m-2">
                        <div class="col-sm-3 my-1 fw-lighter">
                            <label for="nickName" class="col-sm-2 col-form-label"><span
                                    style="white-space: nowrap">Nickname</span></label>
                        </div>
                        <div class="col-sm-9 my-1">
                            <p class="form-control-plaintext" id="nickName"> ${ customer.nickname } </p>
                        </div>
                    </div>
                    <div class="row m-2">
                        <div class="col-sm-3 my-1 fw-lighter">
                            <label for="email" class="col-sm-2 col-form-label"><span
                                    style="white-space: nowrap">Email</span></label>
                        </div>
                        <div class="col-sm-9 my-1">
                            <p class="form-control-plaintext" id="email"> ${ customer.email } </p>
                        </div>
                    </div>
                    <div class="row m-2">
                        <div class="col-sm-3 my-1 fw-lighter">
                            <label for="create-date" class="col-sm-2 col-form-label"><span style="white-space: nowrap">Joined Date</span></label>
                        </div>
                        <div class="col-sm-9 my-1">
                            <p class="form-control-plaintext" id="create-date">
                                <fmt:formatDate value="${ customer.createDate }" pattern="yyyy-MM-dd"/>
                            </p>
                        </div>
                    </div>
                    <div class="row m-2">
                        <div class="col-sm-3 my-1 fw-lighter">
                            <label for="type" class="col-sm-2 col-form-label"><span
                                    style="white-space: nowrap">User Type</span></label>
                        </div>
                        <div class="col-sm-9 my-1">
                            <span class="form-control-plaintext" id="type"> ${ customer.type } </span>
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
                            <div id="followersOffCanvas" type="button" class="badge text-bg-secondary position-relative mx-2">
                                followers
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                    99+
                                </span>
                            </div>
                            <div id="followingsOffCanvas" type="button" class="badge text-bg-secondary position-relative mx-2">
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

    });
</script>
</html>
