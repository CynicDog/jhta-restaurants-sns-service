<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String message = null; 

	if (request.getParameter("message") != null) {
		message = request.getParameter("message"); 
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

    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center align-items-center mt-5">
        <div class="col-md-6">
            <div class="card shadow p-3 mb-5 bg-white rounded">
                <div class="card-header">
                    <p class="my-2">회원가입</p>
                </div>

                <div class="card-body">
                    <form method="post" action="memberInsert.jsp">
                    	
                    	<div class="mb-3">
                            <div class="row">
                                <div class="col-3 my-1">
                                    <input class="form-check-input" type="radio" name="member" id="member-radio-1" value="customer" checked>
                                    <label class="form-check-label" for="member-radio-1">손님</label>
                                </div>
                                <div class="col-3 my-1">
                                    <input class="form-check-input" type="radio" name="member" id="member-radio-2" value="owner">
                                    <label class="form-check-label" for="member-radio-2">사장님</label>
                                </div> 
                            </div>
                        </div>  
                    
                        <div class="mb-3">
                            <label for="user_id" class="form-label">아이디</label>
                            <input type="text" class="form-control" id="id" name="member-id" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">비밀번호</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="mb-3">
                            <label for="password_check" class="form-label">비밀번호 확인</label>
                            <input type="password" class="form-control" id="password_check" name="password_check" required>
                        </div>
                        <div class="mb-3">
                            <label for="name" class="form-label">성함</label>
                            <input type="text" class="form-control" id="name" placeholder="성함" name ="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">이메일</label>
                            <input type="email" class="form-control" id="email" placeholder="foo@bar.com" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">휴대전화 번호</label>
                            <input type="text" class="form-control" id="phone" placeholder="010-0000-0000" name="phone" required>
                        </div>
                        <div class="mb-3">
                            <label for="birthday" class="form-label">생년월일</label>
                            <input type="date" class="form-control" id="birthday" placeholder="YYYY-MM-DD" name="birthday" required>
                        </div>
                        <div class="mb-3"> 성별
                            <div class="row">
                                <div class="col-3 my-1">
                                    <input class="form-check-input" type="radio" name="gender" id="gender-radio-1" value="male" checked>
                                    <label class="form-check-label" for="gridRadios1"> 남 </label>
                                </div>
                                <div class="col-3 my-1">
                                    <input class="form-check-input" type="radio" name="gender" id="gender-radio-2" value="female">
                                    <label class="form-check-label" for="gridRadios2"> 여 </label>
                                </div>
                                <div class="col-6">
                                    <input type="text" class="form-control" id="gender" placeholder="직접 입력" >
                                </div>
                            </div>
                        </div>
                        <div class="button-container col my-1 mt-4" style="text-align: center; ">
                            <button type="submit" class="btn btn-primary btn-lg m-1">완료</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
</body>
<% if (message != null) {  %>
	<script>
		alert("User already exists with the given id or phone number."); 
	</script>
<% }%>
<script>
$(document).ready(function() {
    $('form').submit(function(event) {
        var password = $('#password').val();
        var passwordCheck = $('#password_check').val();

        if (password !== passwordCheck) {
            alert("Passwords do not match. Please enter the same password in both fields.");
            event.preventDefault(); // Prevent form submission
        }
    });
});
</script>
</html>