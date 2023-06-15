<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    </style>
</head>
<body>
<jsp:include page="nav.jsp">
    <jsp:param name="menu" value="홈"/>
</jsp:include>
<div class="container container-pt">
    <div class="row justify-content-center align-items-center mt-5">
        <div class="col-md-7">
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
                            <p class="text-center m-2"><span style="font-weight: bold; white-space: nowrap">가게 사진 등록</span></p>
                        </div>
                        <div class="col-3">
                            <p class="text-center m-2"><span style="color:#808080; white-space: nowrap; font-size: small">메뉴 등록</span></p>
                        </div>
                    </div>
                </div>
                    <div class="card-body">
                        <form method="post" action="storePictureInsert" enctype="multipart/form-data">
                            <div class="card-body">
                                <label for="picture" class="form-label">메뉴 사진 첨부</label>
                                <input type="file" class="form-control" id="picture" min="0" name="picture" required>
                            </div>
                            <div class="button-container">
                                <button class="btn btn-primary" type="submit">입력</button>
                            </div>
                        </form>
                    </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>