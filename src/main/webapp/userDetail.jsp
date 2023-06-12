<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html lang="ko">
<head>
<style type="text/css">
.container-fluid {
}

#user-activity {
	border: 1px solid rgb(233, 100, 121);
	padding: 10px;
	background-color: rgb(233, 100, 121);
	color: white;
	font-weight: bold;
}

.section {
	width: 200px;
	height: 500px;
	border: 1px solid black;
	background-color: rgb(233, 1, 121);
	
	padding: 10px;
	margin-left: 100px;
	margin-right: 100px;
}
</style>
<title>User Detail</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="nav.jsp">
		<jsp:param name="menu" value="userDetail" />
	</jsp:include>

	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<h1 class="border bg-light fs-4 p-3">개인 정보</h1>
			</div>
		</div>

		<div class="row">
			<div id="user-activity" class="col-12">
				<!-- 첫 번째 영역 -->
				<h3>활동 내역</h3>
				<p>리뷰어 등급</p>
				<p>첫번째 영역 내용</p>
				<p>첫번째 영역 내용</p>
				<p>첫번째 영역 내용</p>
			</div>
		</div>

		<div class="row justify-content-center">

			<div id="user-details" class="section">
				<!-- 두 번째 영역 -->
				<h3>회원 정보</h3>
				<p>아이디</p>
				<p>비밀번호</p>
				<p>이름</p>
				<p>이메일</p>
				<p>휴대폰</p>
				<p>생년월일</p>
				<p>성별</p>
			</div>

		</div>

	</div>

</body>
</html>