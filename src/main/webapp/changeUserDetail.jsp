<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!doctype html>
<html lang="ko">
<head>

<style>
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
		<jsp:param name="menu" value="changeUserDetail" />
	</jsp:include>
	<div class="container-fluid">

		<div class="row justify-content-center align-items-center mt-2">
			<div class="col-md-6">
				<div class="card shadow p-3 mb-5 bg-white rounded">
					<div class="card-header">
						<p class="my-2">회원 정보 수정</p>
					</div>

					<div class="card-body">
						<form>
							<div class="mb-3">
								<label for="user_id" class="form-label">아이디</label> <input
									type="text" class="form-control" id="user_id"
									value="customer.getUserId()" readonly>
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">새 비밀번호</label> <input
									type="password" class="form-control" id="password" required>
							</div>
							<div class="mb-3">
								<label for="password_check" class="form-label">비밀번호 확인</label> <input
									type="password" class="form-control" id="password_check"
									required>
							</div>
							<div class="mb-3">
								<label for="name" class="form-label">이름</label> <input
									type="text" class="form-control" id="name" placeholder="이름"
									value="customer.getName()" readonly>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">이메일</label> <input
									type="email" class="form-control" id="email"
									placeholder="foo@bar.com" required>
							</div>
							<div class="mb-3">
								<label for="phone" class="form-label">휴대전화 번호</label> <input
									type="text" class="form-control" id="phone"
									placeholder="010-0000-0000" required>
							</div>
							<div class="mb-3">
								<label for="birthday" class="form-label">생년월일</label> <input
									type="text" class="form-control" id="birthday"
									placeholder="YYYY-MM-DD" required>
							</div>
							<div class="mb-3">
								성별
								<div class="row">
									<div class="col-2 my-1 ml-4">
										<input class="form-check-input" type="radio" name="gender"
											id="gridRadios1" value="male" checked> <label
											class="form-check-label" for="gridRadios1"> 남 </label>
									</div>
									<div class="col-2 my-1">
										<input class="form-check-input" type="radio" name="gender"
											id="gridRadios2" value="female"> <label
											class="form-check-label" for="gridRadios2"> 여 </label>
									</div>
									<div class="col-6">
										<input type="text" class="form-control" id="gender"
											placeholder="직접 입력" required>
									</div>
								</div>
							</div>

							<div class="button-container col my-1 mt-5" style="text-align: right; ">
								<button type="button" class="btn btn-primary btn m-1"
									onclick="generateResult()">완료</button>
								<button type="button" class="btn btn-secondary btn m-1"
									onclick="deleteResult()">취소</button>
							</div>

						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>