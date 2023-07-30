<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84&libraries=services,clusterer,drawing"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84"></script>
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="common/navbar.jsp" %>
<div class="container">
    <div class="restaurant-name">
        <strong>맛집</strong> <span>에 대한 솔직한 리뷰를 써주세요.</span>
    </div>
    <div class="review-section">
        <div class="emoji-buttons" style="text-align: center;">
            <ul style="list-style-type: none; padding: 0;">
                <li style="display: inline-block;">
                    <button class="emoji-btn" data-recommend-type="3" style="background: none; border: none;">
                        <i class="bi bi-emoji-heart-eyes"></i> <span>맛있다</span>
                    </button>
                </li>
                <li style="display: inline-block;">
                    <button class="emoji-btn" data-recommend-type="2" style="background: none; border: none;">
                        <i class="bi bi-emoji-smile"></i> <span>괜찮다</span>
                    </button>
                </li>
                <li style="display: inline-block;">
                    <button class="emoji-btn" data-recommend-type="1" style="background: none; border: none;">
                        <i class="bi bi-emoji-frown"></i> <span>별로</span>
                    </button>
                </li>
            </ul>
        </div>
        <textarea style="width: 100%; height: 150px; margin-top: 10px;"></textarea>
    </div>
    <div class="photo-section" style="text-align: center;">
        <div class="upload-btn">
            <span>사진을 여기에 놓으세요.</span>
        </div>
    </div>
    <div class="buttons" style="text-align: right;">
        <button style="background-color: #f0f0f0; border: none; padding: 10px 20px; margin-right: 10px;">취소</button>
        <button style="background-color: #007bff; color: #fff; border: none; padding: 10px 20px;">리뷰 올리기</button>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>