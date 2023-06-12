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
        <div class="card-body">
          <div class="row m-4">
            <div class="col-6 text-center">
                <button type="button" class="btn btn-primary btn-lg mx-4"><span style="white-space: nowrap">로그인</span></button>
            </div>
            <div class="col-6 text-center">
                <button type="button" class="btn btn-secondary btn-lg mx-4"><span style="white-space: nowrap">회원가입</span></button>
            </div>
          </div>

          <div class="row">
            <p class="text-center">소셜계정으로 로그인하기</p>
            <div class="d-flex justify-content-between mt-1 mb-3">
              <button type="button" class="btn btn btn-outline-secondary btn-sm mx-2" disabled>네이버</button>
              <button type="button" class="btn btn btn-outline-secondary btn-sm mx-2" disabled>카카오</button>
              <button type="button" class="btn btn btn-outline-secondary btn-sm mx-2" disabled>구글</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>

