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
  </style>
</head>
<body>
<div class="container">
  <div class="row justify-content-center align-items-center mt-5">
    <div class="col-md-6">
      <div class="card shadow p-3 mb-5 bg-white rounded">
        <div class="card-header">
          <p class="my-2">로그인</p>
        </div>
        <form method="post" action="login.jsp">
          <div class="card-body">
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
            <div class="row mb-3">
              <label for="user_id" class="col-sm-2 col-form-label"><span style="white-space: nowrap">아이디</span></label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="member-id" name="member-id">
              </div>
            </div>
            <div class="row mb-3">
              <label for="password" class="col-sm-2 col-form-label"><span style="white-space: nowrap">비밀번호</span></label>
              <div class="col-sm-10">
                <input type="password" class="form-control" id="password" name="password">
              </div>
            </div>
            <div class="d-flex justify-content-end mt-4 mb-1 w-100">
              <div>
                <button type="submit" class="btn btn-primary">로그인</button>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>

