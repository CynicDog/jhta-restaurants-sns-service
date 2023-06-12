<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%--
<%
	
	// 1. 세션에서 로그인된 사용자 정보 조회하기
	String loginType = (String) session.getAttribute("loginType");
	it loginId = (int)session.getAttribute("loginId");
	
	// 2. 로그인된 상태인지 체크하기
	if (loginType == null) {
		response.sendRedirect("../loginform.jsp?err=req&job="+URLEncoder.encode("수강신청현황조회", "utf-8"));
		return;
	}
	
	// 3. 로그인된 학생의 수강신청 현황 조회하기
	CustomerDao customerDao = CustomerDao.getInstance();
	Customer customer = customerDao.getCustomerById(loginId);
%>
--%>
<!doctype html>
<html lang="ko">
<head>

<style type="text/css">
.container-fluid {
	
}

#user-activity {
	border: 1px solid rgb(233, 100, 121);
	padding: 10px;
	padding-left: 30px;
	background-color: rgb(233, 100, 121);
	color: white;
}

#user-details {
	width: 200px;
	height: 500px;
	padding: 10px;
}

.user-act {
	font-size: 20px;
}

.table {
	margin-top: 30px;
}

table td {
	font-family: Arial, sans-serif;
	font-size: 20px;
	/* 추가적인 폰트 스타일 조정 */
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


<script>
  var popupChangeUserDetail;

  function openPopup() {
    var popupWidth = 600; // 팝업 창의 너비
    var popupHeight = 800; // 팝업 창의 높이

    var leftPosition = (window.innerWidth - popupWidth) / 2; // 가로 위치 계산
    var topPosition = (window.innerHeight - popupHeight) / 2; // 세로 위치 계산

    var popupOptions = 'width=' + popupWidth + ',height=' + popupHeight + ',top=' + topPosition + ',left=' + leftPosition;
    popupChangeUserDetail = window.open('changeUserDetail.html', 'popup', popupOptions);
  }
  
  function closePopup() {
    if (popupChangeUserDetail) {
      popupChangeUserDetail.close(); // 팝업 창 닫기
    }
  }
</script>

</head>
<body>
	<jsp:include page="nav.jsp">
		<jsp:param name="menu" value="userDetail" />
	</jsp:include>

	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<h1 class="border bg-light fs-4 p-2">상세 정보</h1>
			</div>
		</div>

		<div class="row">
			<div id="user-activity" class="col-12">
				<h3>활동 내역</h3>
				<p class="user-act">loginType</p>

				<!-- 사장, 유저의 경우에만 grade 존재하고 관리자는 없음 -->
				<%-- <%if (!loginType="관리자") { %> --%>
				<p class="user-act">리뷰어 등급 : customer.getGrade()</p>
				<!-- } -->
			</div>
		</div>

		<div class="row justify-content-center">
			<div id="user-details" class="col-3">
				<table class="table">
					<thead>
						<tr>
							<th style="text-align: center; font-size: 25px;">회원 정보</th>
							<th>
								<!-- 								<a href="/changeUserDetail.jsp" style="font-size: 18px; ">수정</a> -->
								<button onclick="openPopup()">수정</button>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>아이디</th>
							<td>customer.getUserId()</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>customer.getName()</td>
						</tr>
						<tr>
							<th>성별</th>
							<td>customer.getGender()</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>customer.getEmail()</td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td>customer.getPhone()</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td>customer.getBirthday()</td>
						</tr>

					</tbody>
				</table>

			</div>

		</div>

	</div>

</body>
</html>