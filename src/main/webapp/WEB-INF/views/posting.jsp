<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Application</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<%@ include file="common/navbar.jsp" %>
<div class="wrap"> 
	<div class="container border-top mt-3" >
		<div class="row text-center border-bottom">
			<div class="col-12 my-5">
				<h2>내가 뽑은 맛있는 카페 10선</h2>
				<h4 class="text-secondary">( 종로에서 내가 가고 싶었던 인생 카페 )</h4>
			</div>
		</div>
	</div>
	<div class="container mt-2" >
		<div class="row border-bottom">
			<div class="col-1"></div>
			<div class="col-3 my-5">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">
				</div>
			</div>
			<div class="col-6 my-5 text-left">
				<div class="d-flex">
					<h3>1. 망우로30</h3>
					<h3 class="text-warning ms-3">5.0</h3>
				</div>
				<p class="text-secondary">서울특별시 동대문구 망우로 30</p>
				<p>여기에는 포스팅 글을 쓸게요</p>
			</div>
			<div class="col-2 my-5">
				<button class="btn ms-3" id="box">
					<i class="bi bi-star" style="color:gold; font-size:28px;" ></i>
				</button>
				
			</div>
		</div>
		
		<div class="row border-bottom">
			<div class="col-1"></div>
			<div class="col-3 my-5">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">
				</div>
			</div>
			<div class="col-6 my-5 text-left">
				<div class="d-flex">
					<h3>1. 망우로30</h3>
					<h3 class="text-warning ms-3">5.0</h3>
				</div>
				<p class="text-secondary">서울특별시 동대문구 망우로 30</p>
				<p>여기에는 포스팅 글을 쓸게요</p>
			</div>
			<div class="col-2 my-5">
				<button class="btn ms-3 " id="box">
					<i class="bi bi-star" style="color:gold; font-size:28px;" ></i>
				</button>
				
			</div>
		</div>
		
		<div class="row border-bottom">
			<div class="col-1"></div>
			<div class="col-3 my-5">
				<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='post'" style=" cursor: pointer;">
					<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">
				</div>
			</div>
			<div class="col-6 my-5 text-left">
				<div class="d-flex">
					<h3>1. 망우로30</h3>
					<h3 class="text-warning ms-3">5.0</h3>
				</div>
				<p class="text-secondary">서울특별시 동대문구 망우로 30</p>
				<p>여기에는 포스팅 글을 쓸게요</p>
			</div>
			<div class="col-2 my-5">
				<button class="btn ms-3 " id="box">
					<i class="bi bi-star" style="color:gold; font-size:28px;" ></i>
				</button>
				
			</div>
		</div>
	</div>
	<%@ include file="common/footer.jsp" %>
</div>

<script type="text/javascript">
	$('i').click(function(){
		if($(this).hasClass('bi-star-fill')){
			$(this).removeClass('bi-star-fill')
					.addClass('bi-star')
		}else {
			$(this).removeClass('bi-star')
					.addClass('bi-star-fill')
		}
	})
	
	
	/* let i = 0;
       $('i').on('click',function(){
           if(i==0){
               $(this).attr('class','bi-star-fill');
               i++;
           }else if(i==1){
               $(this).attr('class','bi-star');
               i--;
           }

       }); */
</script>
</body>
</html>