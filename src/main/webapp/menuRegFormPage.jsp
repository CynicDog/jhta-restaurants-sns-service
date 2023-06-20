<%@page import="vo.Store"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<% 
	int storeId = -1; 
	if (request.getParameter("storeId") != null) {
		storeId = Integer.parseInt(request.getParameter("storeId")); 
	}
	
	String fromUserDetails = null;
	if (request.getParameter("fromUserDetails") != null) {
		fromUserDetails = "true"; 
	}
	
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <style>

		.container-pt {
			padding-top: 10%; 
		}

        .button-container {
            display: flex;
            justify-content: flex-end;
        }

        .clicked {
            background-color: #316cf4;
        }
    </style>
</head>
<body>
    <jsp:include page="nav.jsp">
        <jsp:param name="menu" value="홈"/>
    </jsp:include>
<div class="container container-pt">
    <div class="row justify-content-center align-items-center mt-5">
        <div class="col-md-6">
            <div class="card shadow p-3 mb-5 bg-white rounded">
                <div class="card-header">
                    <div class="row">
                        <div class="col-3">
                            <p class="text-center m-2"><span style="color:#808080; white-space: nowrap; font-size: small">가게 사업 정보 기입</span></p>
                        </div>
                        <div class="col-3">
                            <p class="text-center m-2"><span style="color:#808080; white-space: nowrap; font-size: small">가게 상세 정보 기입</span></p>
                        </div>
						<div class="col-3">
                            <p class="text-center m-2"><span style="color:#808080; white-space: nowrap; font-size: small">가게 사진 등록</span></p>
                        </div>
                        <div class="col-3">
                            <p class="text-center m-2"><span style="font-weight: bold; white-space: nowrap">메뉴 등록</span></p>
                        </div>
                    </div>
                </div>
                <form method="post" action="<%= (fromUserDetails == null) ? "menuReg.jsp" : "menuRegFromUserDetails.jsp" %>">
                    <div class="card-body">
                    	<input type="text" hidden=true name="storeId" value=<%=storeId %>>
                        <div class="my-3">
                            <label for="name" class="form-label">메뉴 이름</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="form-group my-3">
                            <label for="text">메뉴 소개글</label>
                            <textarea class="form-control" id="text" rows="3" name="text"></textarea>
                        </div>
                        <div class="my-3">
                            <label for="price" class="form-label">메뉴 가격</label>
                            <input type="number" class="form-control" id="price" min="0" name="price" required>
                        </div>
                        <div class="mt-3">
                            <label class="text-center" for="categories"><span style="white-space: nowrap">메뉴 카테고리</span></label>
                            <select id="categories" class="form-control" name="category">
                                <option value="korean">한식</option>
                                <option value="chinese">중식</option>
                                <option value="japanese">일식</option>
                                <option value="western">양식</option>
                                <option value="fastfood">패스트푸드</option>
                                <option value="snack">분식</option>
                                <option value="asian">아시안</option>
                                <option value="dessert">디저트</option>
                                
                            </select>
                        </div>
                    </div>
                    <div class="button-container">
                        <button class="btn btn-primary" type="submit">입력</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
</script>
</body>
</html>