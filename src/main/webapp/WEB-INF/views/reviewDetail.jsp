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
							<button type="button" class="btn btn-outline-primary ">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
  									<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
								</svg>
							</button>
								<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-emoji-angry" viewBox="0 0 16 16">
		  							<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
		  							<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zm6.991-8.38a.5.5 0 1 1 .448.894l-1.009.504c.176.27.285.64.285 1.049 0 .828-.448 1.5-1 1.5s-1-.672-1-1.5c0-.247.04-.48.11-.686a.502.502 0 0 1 .166-.761l2-1zm-6.552 0a.5.5 0 0 0-.448.894l1.009.504A1.94 1.94 0 0 0 5 6.5C5 7.328 5.448 8 6 8s1-.672 1-1.5c0-.247-.04-.48-.11-.686a.502.502 0 0 0-.166-.761l-2-1z" />
								</svg>
						</span>
					</div>
				</div>
				<div class="row m-3">
					<p class="mx-3">가게명-서울시 종로구</p>
				</div>	
				<div class="row m-3">
					<p>리뷰 내용</p>
				</div>
				<div class="row">
					<!-- Button trigger modal -->
					<div class="col-4">
						<button type="button" class="btn border-opacity-10" data-bs-toggle="modal" data-bs-target="#imgModal">
							<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="..." >
						</button>
					</div>
					<div class="col-4">
						<button type="button" class="btn border-opacity-10" data-bs-toggle="modal" data-bs-target="#imgModal">
							<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="..." >
						</button>
					</div>
					<div class="col-4">
						<button type="button" class="btn border-opacity-10" data-bs-toggle="modal" data-bs-target="#imgModal">
							<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="..." >
						</button>
					</div>
					
					<!-- Modal -->
					<div class="modal fade" id="imgModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-fullscreen">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
							<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" alt="..." >
					      </div>
					    </div>
					  </div>
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