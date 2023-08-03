<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Application</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
    <div>
        <div class="row my-2 justify-content-center align-items-center">
            <div class="col-md-6">
                <div class="card shadow my-5">
                    <div class="card-header">가입</div>
                    <div class="card-body">
                        <div class="row my-2 p-2">
                            <form:form method="post" action="signup" modelAttribute="userCommand">
                                <div class="form-group my-3">
                                    <form:input type="text" class="form-control" path="username" placeholder="유저 아이디"/>
                                    <form:errors path="username" cssClass="text-danger"/>
                                </div>
                                <div class="form-group my-3">
                                    <form:input type="password" class="form-control" path="password" placeholder="비밀번호"/>
                                    <form:errors path="password" cssClass="text-danger"/>
                                </div>
                                <div class="form-group my-3">
                                    <form:input type="text" class="form-control" path="fullName" placeholder="성함"/>
                                    <form:errors path="fullName" cssClass="text-danger"/>
                                </div>
                                <div class="form-group my-3">
                                    <form:input type="email" class="form-control" path="email" placeholder="이메일"/>
                                    <form:errors path="email" cssClass="text-danger"/>
                                </div>
                                <div class="form-group my-3">
                                    <form:input type="text" class="form-control" path="phone" placeholder="전화번호"/>
                                    <form:errors path="phone" cssClass="text-danger"/>
                                </div>
                                <div class="form-group my-3">
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-8">
                                                    <form:input type="date" class="form-control" path="birthday"/>
                                                </div>
                                                <div class="col-4">
                                                    <form:select class="form-select" path="gender">
                                                        <form:option value="" label="성별"/>
                                                        <form:option value="male" label="남"/>
                                                        <form:option value="female" label="여"/>
                                                        <form:option value="other" label="그 외"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-8">
                                                    <form:errors path="birthday" cssClass="text-danger"/>
                                                </div>
                                                <div class="col-4">
                                                    <form:errors path="gender" cssClass="text-danger"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-end my-2">
                                    <button class="btn btn-outline-secondary btn-sm">submit</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%--    TODO: Instead of the form submission, use ajax communication. After validation on properties, toast for otp validation would show up :) --%>
</div>
</body>
</html>
