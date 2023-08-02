<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>애플리케이션</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84"></script>
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
		<div class="row row-cols-5">
			<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" style="max-width: 100%; height: auto;" alt="..."> 
			<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" style="max-width: 100%; height: auto;" alt="..."> 
			<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" style="max-width: 100%; height: auto;" alt="..."> 
			<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" style="max-width: 100%; height: auto;" alt="..."> 
			<img class="img-thumbnail" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" style="max-width: 100%; height: auto;" alt="...">
		</div>
		<div class="row">
			<div class="col-8">
				<div>
					<header>
						<div class="row">
							<div class="col-8">
								<p class="restaurants_name my-3">
									<span style="font-size: x-large; font-weight: bold">가게제목</span>
									<span class="rate-point mx-3" style="font-weight: bold; font-size: large">평점</span>
								</p>
							</div>
							<div class="col-4">
								<span class="my-3 float-end">
									<button type="button" class="btn btn-outline-primary ">리뷰작성</button>
									<button class="btn" id="box">
										<i class="bi bi-star" style="color:gold; font-size:28px;" ></i>
									</button>
								</span>
							</div>
						</div>
						<div class="row">
							<table class="table">
								<tr>
									<th>주소</th>
									<td></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td></td>
								</tr>
								<tr>
									<th>가게 소개</th>
									<td></td>
								</tr>
								<tr>
									<th>음식 종류</th>
									<td></td>
								</tr>
								<tr>
									<th>영업시간</th>
									<td></td>
								</tr>
								<tr>
									<th>휴일</th>
									<td></td>
								</tr>

								<tr>
									<th>메뉴</th>
									<td>
										<div>
											<div class="col my-2">
												<span class="food-name"></span> <span class="food-price"></span>
											</div>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</header>
				</div>
			</div>
			<div class="col-4">
				<div id="map" style="width: 400px; height: 350px;"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-8">
				<span style="font-size: x-large; font-weight: bold">리뷰</span> 
				<span style="font-size: x-large; font-weight: bold; color: #adb5bd;">(3)</span>
				<div class="btn-group p-1 float-end">
					<button type="button" class="btn border-opacity-10" >전체(3)</button>
					<button type="button" class="btn border-opacity-10 " >
						<span class="visually-hidden">Button</span> 맛있다(3)
					</button>
					<button type="button" class="btn border-opacity-10" >
						<span class="visually-hidden">Button</span> 괜찮다(0)
					</button>
					<button type="button" class="btn border-opacity-10" >
						<span class="visually-hidden">Button</span> 별로(0)
					</button>
				</div>
			</div>
			<div class="row">
				<div class="col-8">
					<div class="card mb-3">
						<div class="card-body">
							<div class="row">
								<div class="col-2">
									<div class="text-center card-title my-1">
										<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle" alt="..."> 
											<span style="font-size: medium; font-weight: bold;">정손님</span>
										<p style="font-size: small; color: #adb5bd;">회원 등급</p>
									</div>
									<div class="text-center card-title my-1">
										<span style="font-size: medium; font-weight: bold; color: #FFC107;">5.00</span>
									</div>
								</div>
								<div class="col-10">
									<div class="row mb-2">
										<div class="col-10">
											<p class="col card-text" style="font-size: small; color: #adb5bd;">리뷰 작성일</p>
											<p class="col card-text">리뷰 내용</p>
										</div>
										<div class="col-1">
											<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-emoji-angry" viewBox="0 0 16 16">
  												<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  												<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zm6.991-8.38a.5.5 0 1 1 .448.894l-1.009.504c.176.27.285.64.285 1.049 0 .828-.448 1.5-1 1.5s-1-.672-1-1.5c0-.247.04-.48.11-.686a.502.502 0 0 1 .166-.761l2-1zm-6.552 0a.5.5 0 0 0-.448.894l1.009.504A1.94 1.94 0 0 0 5 6.5C5 7.328 5.448 8 6 8s1-.672 1-1.5c0-.247-.04-.48-.11-.686a.502.502 0 0 0-.166-.761l-2-1z" />
											</svg>
										</div>
										<div class="col-1">
											<button type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-megaphone" viewBox="0 0 16 16">
 													<path d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-.214c-2.162-1.241-4.49-1.843-6.912-2.083l.405 2.712A1 1 0 0 1 5.51 15.1h-.548a1 1 0 0 1-.916-.599l-1.85-3.49a68.14 68.14 0 0 0-.202-.003A2.014 2.014 0 0 1 0 9V7a2.02 2.02 0 0 1 1.992-2.013 74.663 74.663 0 0 0 2.483-.075c3.043-.154 6.148-.849 8.525-2.199V2.5zm1 0v11a.5.5 0 0 0 1 0v-11a.5.5 0 0 0-1 0zm-1 1.35c-2.344 1.205-5.209 1.842-8 2.033v4.233c.18.01.359.022.537.036 2.568.189 5.093.744 7.463 1.993V3.85zm-9 6.215v-4.13a95.09 95.09 0 0 1-1.992.052A1.02 1.02 0 0 0 1 7v2c0 .55.448 1.002 1.006 1.009A60.49 60.49 0 0 1 4 10.065zm-.657.975 1.609 3.037.01.024h.548l-.002-.014-.443-2.966a68.019 68.019 0 0 0-1.722-.082z" />
												</svg>
												<span class="visually-hidden">신고</span>
											</button>
										</div>
										<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h1 class="modal-title fs-5" id="exampleModalLabel">신고하기</h1>
														<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<form>
															<div class="col-md">
																<div class="form-floating">
																	<select class="form-select" id="floatingSelectGrid">
																		<option selected>신고사유를 선택해 주세요</option>
																		<option value="1">욕설</option>
																		<option value="2">비방</option>
																		<option value="3">허위</option>
																	</select> <label for="floatingSelectGrid">신고사유</label>
																</div>
															</div>
															<div class="mb-3">
																<label for="message-text" class="col-form-label">Message:</label>
																<textarea class="form-control" id="message-text"></textarea>
															</div>
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
														<button type="button" class="btn btn-primary">Send message</button>
													</div>
												</div>
											</div>
										</div>
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
									<div class="row">
										<div class="col">
											<span class="float-end">
												<button type="button" class="btn btn-outline-primary btn-sm">수정</button>
												<button type="button" class="btn btn-outline-danger btn-sm">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
				  										<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z" />
													</svg>
													<span class="visually-hidden">삭제</span>
												</button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card mb-3">
						<div class="card-body">
							<div class="row">
								<div class="col-2">
									<div class="text-center card-title my-1">
										<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle" alt="..."> 
											<span style="font-size: medium; font-weight: bold;">정손님</span>
											<p style="font-size: small; color: #adb5bd;">회원 등급</p>
										</div>
									<div class="text-center card-title my-1">
										<span style="font-size: medium; font-weight: bold; color: #FFC107;">5.00</span>
									</div>
								</div>
								<div class="col-10">
									<div class="row mb-2">
										<div class="col-10">
											<p class="col card-text" style="font-size: small; color: #adb5bd;">리뷰 작성일</p>
											<p class="col card-text">리뷰 내용</p>
										</div>
										<div class="col-1">
											<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-emoji-angry" viewBox="0 0 16 16">
  												<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  												<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zm6.991-8.38a.5.5 0 1 1 .448.894l-1.009.504c.176.27.285.64.285 1.049 0 .828-.448 1.5-1 1.5s-1-.672-1-1.5c0-.247.04-.48.11-.686a.502.502 0 0 1 .166-.761l2-1zm-6.552 0a.5.5 0 0 0-.448.894l1.009.504A1.94 1.94 0 0 0 5 6.5C5 7.328 5.448 8 6 8s1-.672 1-1.5c0-.247-.04-.48-.11-.686a.502.502 0 0 0-.166-.761l-2-1z" />
											</svg>
										</div>
										<div class="col-1">
											<button type="button" class="btn btn-outline-danger btn-sm">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-megaphone" viewBox="0 0 16 16">
 													<path d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-.214c-2.162-1.241-4.49-1.843-6.912-2.083l.405 2.712A1 1 0 0 1 5.51 15.1h-.548a1 1 0 0 1-.916-.599l-1.85-3.49a68.14 68.14 0 0 0-.202-.003A2.014 2.014 0 0 1 0 9V7a2.02 2.02 0 0 1 1.992-2.013 74.663 74.663 0 0 0 2.483-.075c3.043-.154 6.148-.849 8.525-2.199V2.5zm1 0v11a.5.5 0 0 0 1 0v-11a.5.5 0 0 0-1 0zm-1 1.35c-2.344 1.205-5.209 1.842-8 2.033v4.233c.18.01.359.022.537.036 2.568.189 5.093.744 7.463 1.993V3.85zm-9 6.215v-4.13a95.09 95.09 0 0 1-1.992.052A1.02 1.02 0 0 0 1 7v2c0 .55.448 1.002 1.006 1.009A60.49 60.49 0 0 1 4 10.065zm-.657.975 1.609 3.037.01.024h.548l-.002-.014-.443-2.966a68.019 68.019 0 0 0-1.722-.082z" />
												</svg>
												<span class="visually-hidden">신고</span>
											</button>
										</div>
									</div>
									<div class="row">
										<div class="col-12">
											<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" style="width: 320px; max-width: 320px;" alt="...">
										</div>
									</div>
									<div class="row">
										<div class="col">
											<span class="float-end">
												<button type="button" class="btn btn-outline-primary btn-sm">답글 작성</button>
												<button type="button" class="btn btn-outline-danger btn-sm">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
				  										<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z" />
													</svg>
													<span class="visually-hidden">삭제</span>
												</button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card mb-3">
						<div class="card-body">
							<div class="row">
								<div class="col-2">
									<div class="text-center card-title my-1">
										<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="img-thumbnail rounded-circle" alt="..."> 
											<span style="font-size: medium; font-weight: bold;">정손님</span>
										<p style="font-size: small; color: #adb5bd;">회원 등급</p>
									</div>
									<div class="text-center card-title my-1">
										<span style="font-size: medium; font-weight: bold; color: #FFC107;">5.00</span>
									</div>
								</div>
								<div class="col-10">
									<div class="row mb-2">
										<div class="col-10">
											<p class="col card-text" style="font-size: small; color: #adb5bd;">리뷰 작성일</p>
											<p class="col card-text">리뷰 내용</p>
										</div>
										<div class="col-1">
											<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-emoji-angry" viewBox="0 0 16 16">
  												<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  												<path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.498 3.498 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.498 4.498 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683zm6.991-8.38a.5.5 0 1 1 .448.894l-1.009.504c.176.27.285.64.285 1.049 0 .828-.448 1.5-1 1.5s-1-.672-1-1.5c0-.247.04-.48.11-.686a.502.502 0 0 1 .166-.761l2-1zm-6.552 0a.5.5 0 0 0-.448.894l1.009.504A1.94 1.94 0 0 0 5 6.5C5 7.328 5.448 8 6 8s1-.672 1-1.5c0-.247-.04-.48-.11-.686a.502.502 0 0 0-.166-.761l-2-1z" />
											</svg>
										</div>
										<div class="col-1">
											<button type="button" class="btn btn-outline-danger btn-sm">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-megaphone" viewBox="0 0 16 16">
 														<path d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-.214c-2.162-1.241-4.49-1.843-6.912-2.083l.405 2.712A1 1 0 0 1 5.51 15.1h-.548a1 1 0 0 1-.916-.599l-1.85-3.49a68.14 68.14 0 0 0-.202-.003A2.014 2.014 0 0 1 0 9V7a2.02 2.02 0 0 1 1.992-2.013 74.663 74.663 0 0 0 2.483-.075c3.043-.154 6.148-.849 8.525-2.199V2.5zm1 0v11a.5.5 0 0 0 1 0v-11a.5.5 0 0 0-1 0zm-1 1.35c-2.344 1.205-5.209 1.842-8 2.033v4.233c.18.01.359.022.537.036 2.568.189 5.093.744 7.463 1.993V3.85zm-9 6.215v-4.13a95.09 95.09 0 0 1-1.992.052A1.02 1.02 0 0 0 1 7v2c0 .55.448 1.002 1.006 1.009A60.49 60.49 0 0 1 4 10.065zm-.657.975 1.609 3.037.01.024h.548l-.002-.014-.443-2.966a68.019 68.019 0 0 0-1.722-.082z" />
												</svg>
												<span class="visually-hidden">신고</span>
											</button>
										</div>
									</div>
									<div class="row">
										<div class="col-12">
											<img class="img-thumbnail" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" style="width: 320px; max-width: 320px;" alt="...">
										</div>
									</div>
									<div class="row">
										<div class="col">
											<span class="float-end">
												<button type="button" class="btn btn-outline-primary btn-sm">수정</button>
												<button type="button" class="btn btn-outline-danger btn-sm">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
				  										<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z" />
													</svg>
													<span class="visually-hidden">삭제</span>
												</button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-4 p-4">
					<div class="row">
						<div class="card text-center m-3 text-light font-weight-bold shadow" onclick="location.href='post'" id="cardId" style="height: 200px;">
							<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="card-img" alt="관리자 추천 맛집" style="height: 200px;">
							<div class="card-img-overlay ">
								<h3 class="card-title p-5">
									<strong>관리자 추천 맛집</strong>
								</h3>
							</div>
						</div>
						<div class="card text-center m-3 text-light font-weight-bold shadow" onclick="location.href='post'" id="cardId" style="height: 200px;">
							<img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_4C89175D6281320DB40FF21CD5E71DC5.jpeg&type=sc960_832" class="card-img" alt="관리자 추천 맛집" style="height: 200px;">
							<div class="card-img-overlay ">
								<h3 class="card-title p-5">
									<strong>관리자 추천 맛집</strong>
								</h3>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="common/footer.jsp"%>
</div>
<script>
	var container = document.getElementById('map');
	var options = {
		// latitude,longitude 순으로 입력
		center : new kakao.maps.LatLng(37.5729587735263, 126.992241734889), level : 4
	};
	
	var map = new kakao.maps.Map(container, options);
	
	// 마커가 표시될 위치입니다 
	var markerPosition = new kakao.maps.LatLng(37.5729587735263, 126.992241734889);
	var markerPosition2 = new kakao.maps.LatLng(37.5699451391001, 126.988087440713);
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});
	var marker2 = new kakao.maps.Marker({
		position : markerPosition2
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	marker2.setMap(map);
	
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);
	
	
	$('i').click(function(){
	if($(this).hasClass('bi-star-fill')){
		$(this).removeClass('bi-star-fill')
				.addClass('bi-star')
	}else {
		$(this).removeClass('bi-star')
					.addClass('bi-star-fill')
		}
	})
	
	$('.btn-group').click(function() {
		let hasSecondaryClass = $(this).hasClass('border-opacity-10');
		if (hasSecondaryClass) {
			$(this).removeClass('border-opacity-10').addClass('btn-warning');
		} else {
			$(this).removeClass('btn-warning').addClass('border-opacity-10');
		}
	}) 

</script>
</body>
</html>