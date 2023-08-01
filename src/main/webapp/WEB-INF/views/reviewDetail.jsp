<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>애플리케이션</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
html, body {
	height: 100%;
}

.wrap {
	position: relative;
	min-height: 100%;
	padding-bottom: 70px;
}
</style>
</head>
<body>
<%@ include file="common/navbar.jsp"%>
<div class="wrap">
	<div class="container">
		<div class="card border border-success p-2 border-opacity-10">
  			<div class="card-body">
				<div class="row m-3">
					<div class="col-3">
						<p class="m-1 text-center">리뷰추천수</p>
						<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle" alt="...">
					</div>
					<div class="col-2">
						<p class="mb-5 my-5"><strong>정손님</strong></p>
					</div>
					<div class="col-6">
						<span class="float-end">
							<button type="button" class="btn btn-outline-primary ">리뷰신고</button>
								<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-emoji-angry" viewBox="0 0 16 16">
		  							<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
		  							<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zm6.991-8.38a.5.5 0 1 1 .448.894l-1.009.504c.176.27.285.64.285 1.049 0 .828-.448 1.5-1 1.5s-1-.672-1-1.5c0-.247.04-.48.11-.686a.502.502 0 0 1 .166-.761l2-1zm-6.552 0a.5.5 0 0 0-.448.894l1.009.504A1.94 1.94 0 0 0 5 6.5C5 7.328 5.448 8 6 8s1-.672 1-1.5c0-.247-.04-.48-.11-.686a.502.502 0 0 0-.166-.761l-2-1z" />
								</svg>
						</span>
					</div>
				</div>
				<div class="row m-3">
					<p class="mx-3">가게명-서울시 종로구</p>
				<div class="row m-3">
					<p>리뷰 내용</p>
				</div>
				<div class="row">
					<div class="col-4">
						<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="...">
					</div>
					<div class="col-4">
						<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="...">
					</div>
					<div class="col-4">
						<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="...">
					</div>
				</div>
  			</div>
		</div>
		<div class="h4 pb-2 mb-4 border-bottom border-secondary"></div>
		<div class="row m-3">
			<div class="card">
  				<div class="card-body">
    				답글입니다
  				</div>
			</div>
		</div>
	</div>	
<%@ include file="common/footer.jsp"%>
</div>
<script>
	
</script>
</body>
</html>