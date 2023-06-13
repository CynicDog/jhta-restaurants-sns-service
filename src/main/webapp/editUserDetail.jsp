<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>


<%
//테스트용 세션 데이터
String type = "customer";
int id = 10;
session.setAttribute("loginType", type);
session.setAttribute("loginId", id);

String loginType = (String) session.getAttribute("loginType");
int loginId = (int)session.getAttribute("loginId");

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

<script type="text/javascript">
function closePopupAndSubmit() {
    var password = document.getElementById("password").value;
    var email = document.getElementById("email").value;
    var phone = document.getElementById("phone").value;
    var birthday = document.getElementById("birthday").value;
    
    customer.setPassword(password);
    customer.setEmail(email);
    customer.setPhone(phone);
    customer.setBirthday(birthday);
    
    customerdao.updateCustomer(customer)
    window.opener.location.reload();
    window.close();
}
</script>

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
						<form id="form-edit-detail" onsubmit="event.preventDefault(); closePopupAndSubmit();">
							<div class="mb-3">
								<label for="user_id" class="form-label">아이디</label> <input
									type="text" class="form-control" id="user_id"
									value=<%=customer.getUserId() %> readonly>
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">새 비밀번호</label> <input
									type="password" class="form-control" id="password" required>
							</div>
							<div class="mb-3">
								<label for="password_check" class="form-label">비밀번호 확인</label> <input
									type="password" class="form-control" id="password_check" required>
							</div>
							<div class="mb-3">
								<label for="name" class="form-label">이름</label> <input
									type="text" class="form-control" id="name" placeholder="이름"
									value=<%=customer.getName() %> readonly>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">이메일</label> 
								<input
									type="email" class="form-control" id="email"
									placeholder="foo@bar.com" value=<%=customer.getEmail() %> required>
							</div>
							<div class="mb-3">
								<label for="phone" class="form-label">휴대전화 번호</label> <input
									type="text" class="form-control" id="phone"
									placeholder="010-0000-0000" value=<%=customer.getPhone() %> required>
							</div>
							<div class="mb-3">
								<label for="birthday" class="form-label">생년월일</label> <input
									type="text" class="form-control" id="birthday"
									placeholder="YYYY-MM-DD" value=<%=customer.getBirthday() %> required>
							</div>
								<div class="mb-3">
								<label for="gender" class="form-label">성별</label> <input
									type="text" class="form-control" id="gender"
									value=<%=customer.getGender() %> readonly>
							</div>
							<div class="button-container col my-1 mt-4" style="text-align: right; ">
								<button type="submit" class="btn btn-primary btn m-1">완료</button>
								<button type="button" class="btn btn-secondary btn m-1"
									onclick="window.opener.closePopup()">취소</button>
							</div>

						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>