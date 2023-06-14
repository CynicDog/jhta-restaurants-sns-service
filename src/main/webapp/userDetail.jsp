<%@page import="vo.Customer"%>
<%@page import="dao.CustomerDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
	//테스트용 세션 데이터
	String type = "customer";
	int id = 10;
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
<style type="text/css">

.container-fluid{
	margin-top: 55px;
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

.user-act-info {

	font-size: 20px;
}

.table {
	margin-top: 30px;
}

table td {
	font-family: Arial, sans-serif;
	font-size: 20px;
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
  var popupEditUserDetail;

  function openPopup() {
    var popupWidth = 600; // 팝업 창의 너비
    var popupHeight = 800; // 팝업 창의 높이

    var leftPosition = (window.innerWidth - popupWidth) / 2; // 가로 위치 계산
    var topPosition = (window.innerHeight - popupHeight) / 2; // 세로 위치 계산

    var popupOptions = 'width=' + popupWidth + ',height=' + popupHeight + ',top=' + topPosition + ',left=' + leftPosition;
    popupEditUserDetail = window.open('editUserDetail.jsp', 'popup', popupOptions);
  }
  
  function closePopup() {
    if (popupEditUserDetail) {
    	popupEditUserDetail.close(); // 팝업 창 닫기
    }
  }
  
  
</script>


</head>
<body>
<!-- 네비게이션 -->
	<jsp:include page="nav.jsp">
		<jsp:param name="menu" value="userDetail" />
	</jsp:include>

	<div class="container-fluid">
		<div class="row">
			<div id="user-activity" class="col-12">
				<p class="user-act-info"><%=loginType %></p>
				<p class="user-act-info"><%=customer.getUserId() %></p>
				<p class="user-act-info">리뷰어 등급 : <%=customer.getGrade()%></p>
			</div>
		</div>

		<div class="row justify-content-center">
			<div id="user-details" class="col-3">
				<table class="table">
					<thead>
						<tr>
							<th style="font-size: 25px;">회원 정보</th>
							<th>
								<div class="button-container col my-1 mt-4" style="text-align: right;">
									<button class="btn btn-primary" onclick="location.href='editUserDetailPage.jsp'">수정</button>
								</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>아이디</th>
							<td><%=customer.getUserId() %></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><%=customer.getName() %></td>
						</tr>
						<tr>
							<th>성별</th>
							<td><%=customer.getGender() %></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><%=customer.getEmail() %></td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td><%=customer.getPhone() %></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><%=customer.getBirthday() %></td>
						</tr>

					</tbody>
				</table>

			</div>

		</div>

	</div>

</body>
</html>