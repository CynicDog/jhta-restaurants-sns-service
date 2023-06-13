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
        html, body {
            height: 100%;
        }

        body {
            display: flex;
            align-items: center;
            justify-content: center;
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
<div class="container">
    <div class="row justify-content-center align-items-center mt-5">
        <div class="col-md-6">
            <div class="card shadow p-3 mb-5 bg-white rounded">
                <div class="card-header">
                    <p class="my-2">메뉴 등록</p>
                </div>
                <form>
                    <div class="card-body">
                        <div class="my-3">
                            <label for="name" class="form-label">메뉴 이름</label>
                            <input type="text" class="form-control" id="name" required>
                        </div>
                        <div class="form-group my-3">
                            <label for="text">메뉴 소개글</label>
                            <textarea class="form-control" id="text" rows="3"></textarea>
                        </div>
                        <div class="my-3">
                            <label for="price" class="form-label">메뉴 가격</label>
                            <input type="number" class="form-control" id="price" min="0" required>
                        </div>
                        <div class="mt-3">
                            <label class="text-center" for="categories"><span style="white-space: nowrap">메뉴 카테고리</span></label>
                            <select id="categories" class="form-control">
                                <option value="korean">한식</option>
                                <option value="chinese">중식</option>
                                <option value="japanese">일식</option>
                                <option value="fastfood">패스트푸드</option>
                                <option value="stew">찜, 탕, 찌개</option>
                                <option value="meat">육고기</option>
                                <option value="street">분식</option>
                                <option value="asian">아시안</option>
                                <option value="dessert">디저트</option>
                                <option value="etc">기타</option>
                            </select>
                        </div>
					<!--  TODO: Picture upload -->
                    </div>
                    <div class="button-container">
                        <button class="btn btn-primary" type="submit" onclick="fn1()">입력</button>
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