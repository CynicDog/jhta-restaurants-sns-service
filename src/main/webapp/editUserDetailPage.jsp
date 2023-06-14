<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	//테스트용 세션 데이터
	String type = "customer";
	int id = 21;
	session.setAttribute("loginType", type);
	session.setAttribute("loginId", id);

	// 1. 세션에서 로그인된 사용자 정보 조회하기
	String loginType = (String) session.getAttribute("loginType");
	int loginId = (int)session.getAttribute("loginId");
	
	// 2. 로그인된 상태인지 체크하기
	if (loginType == null) {
		response.sendRedirect("/loginformPage.jsp");
		return;
	}
	
	// 3. 로그인된 유저의 객체 획득
	CustomerDao customerDao = CustomerDao.getInstance();
	Customer customer = customerDao.getCustomerById(loginId);
%>

<!doctype html>
<html lang="ko">
<head>

<style>
</style>

<title>회원정보 수정</title>
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

	<div class="container-fluid">

		<div class="row justify-content-center align-items-center mt-2">
			<div class="col-md-6">
				<div class="card shadow p-3 mb-5 bg-white rounded">
					<div class="card-header">
						<p class="my-2">회원 정보 수정</p>
					</div>
					<div class="card-body">
						<form id="form-edit-detail" method="post" action="editUserDetail.jsp">
							<div class="mb-3">
								<div class="row">
									<div class="col-3 my-1">
										<input class="form-check-input" type="radio" name="member"
											id="member-radio-1" value="customer" checked> <label
											class="form-check-label" for="member-radio-1">손님</label>
									</div>
									<div class="col-3 my-1">
										<input class="form-check-input" type="radio" name="member"
											id="member-radio-2" value="owner"> <label
											class="form-check-label" for="member-radio-2">사장님</label>
									</div>
								</div>
							</div>

							<div class="mb-3">
								<label for="user_id" class="form-label">아이디</label> <input
									type="text" class="form-control" id="id" name="member-id"
									required>
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">비밀번호</label> <input
									type="password" class="form-control" id="password"
									name="password" required>
							</div>
							<div class="mb-3">
								<label for="password_check" class="form-label">비밀번호 확인</label> <input
									type="password" class="form-control" id="password_check"
									required>
							</div>
							<div class="mb-3">
								<label for="name" class="form-label">성함</label> <input
									type="text" class="form-control" id="name" placeholder="성함"
									name="name" required>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">이메일</label> <input
									type="email" class="form-control" id="email"
									placeholder="foo@bar.com" name="email" required>
							</div>
							<div class="mb-3">
								<label for="phone" class="form-label">휴대전화 번호</label> <input
									type="text" class="form-control" id="phone"
									placeholder="010-0000-0000" name="phone" required>
							</div>
							<div class="mb-3">
								<label for="birthday" class="form-label">생년월일</label> <input
									type="date" class="form-control" id="birthday"
									placeholder="YYYY-MM-DD" name="birthday" required>
							</div>
							<div class="mb-3">
								성별
								<div class="row">
									<div class="col-3 my-1">
										<input class="form-check-input" type="radio" name="gender"
											id="gender-radio-1" value="male" checked> <label
											class="form-check-label" for="gridRadios1"> 남 </label>
									</div>
									<div class="col-3 my-1">
										<input class="form-check-input" type="radio" name="gender"
											id="gender-radio-2" value="female"> <label
											class="form-check-label" for="gridRadios2"> 여 </label>
									</div>
									<div class="col-6">
										<input type="text" class="form-control" id="gender"
											placeholder="직접 입력">
									</div>
								</div>
							</div>
							<div class="button-container col my-1 mt-4" style="text-align: right; ">
								<button type="submit" class="btn btn-primary btn m-1">완료</button>
								<button type="button" class="btn btn-secondary btn m-1"
									onclick="location.href='userDetail.jsp'">취소</button>
							</div>

						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>