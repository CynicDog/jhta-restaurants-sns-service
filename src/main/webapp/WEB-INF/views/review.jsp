<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84&libraries=services,clusterer,drawing"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84"></script>
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	.emoji-btn.active {
  	color: orange;
}
</style>
</head>
<body>
<%@ include file="common/navbar.jsp" %>
<div class="wrap">
	<div class="container">
	    <div class="restaurant-name">
	        <strong>맛집</strong> <span>에 대한 솔직한 리뷰를 써주세요.</span>
	    </div>
	<div class="review-section mt-3" >
		<div class="row">
			<div class="col-12">
				<div class="card p-3">
	          		<div class="emoji-buttons" >
	              		<ul style="list-style-type: none; padding: 0;">
	                  		<li style="display: inline-block;">
	                      		<button class="emoji-btn" data-recommend-type="3" style="background: none; border: none;">
	                          		<i class="bi bi-emoji-heart-eyes" style="font-size: 25px;"></i>
	                          		맛있다
	                      		</button>
	                  		</li>
			                <li style="display: inline-block;">
			                	<button class="emoji-btn" data-recommend-type="2" style="background: none; border: none;">
			                    	<i class="bi bi-emoji-smile" style="font-size: 25px;"></i>
			                    	괜찮다
			              		</button>
			     			</li>
			                <li style="display: inline-block;">
			               		<button class="emoji-btn" data-recommend-type="1" style="background: none; border: none;">
			                		<i class="bi bi-emoji-angry" style="font-size: 25px;"></i>
			                        별로
			                	</button>
			             	</li>
	              		</ul>
	          		</div>
	        		<textarea class="form-control border-0" style="height: 250px; position: relative;" placeholder="리뷰를 작성해주세요"></textarea>
				</div>
			</div>
	    </div>
	</div>
	    <div class="photo-section">
	    	<form method="post" enctype="multipart/form-data">
			    <div>
			        <label for="imageFile">
	       				<a class="btn"><i class="bi bi-plus-square-dotted" style="font-size: 65px;"></i></a> 
			        </label>
			    	<input style="visibility: hidden" type="file" id="imageFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
			    </div>
			</form>
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#previewModal">
			    <img id="preview" style="width: 100px; height: 100px; object-fit: cover; border: 1px solid #ccc;">
			</button>
			<div class="modal fade" id="previewModal" tabindex="-1" aria-labelledby="previewModalLabel" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered modal-xl">
			        <div class="modal-content">
			            <div class="modal-body">
			                <img class="modal-img" style="object-fit: cover;" src="https://mp-seoul-image-production-s3.mangoplate.com/417406/927873_1585054126226_34632?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="...">
			            </div>
			        </div>
			    </div>
			</div>
	    <div class="buttons" style="margin-left: 1100px;">
	        <button type="button" class="btn btn-light">취소</button>
	        <button type="button" class="btn btn-outline-success">리뷰 올리기</button>
	    </div>
	</div>
	</div>
<%@ include file="common/footer.jsp"%>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		  $('.emoji-btn').click(function() {
		    // 모든 버튼에 있는 'active' 클래스를 제거합니다.
		    $('.emoji-btn').removeClass('active');
		    // 클릭한 버튼에만 'active' 클래스를 추가합니다.
		    $(this).addClass('active');
		});
	});
	
	$("#imageFile").on("change", function(event) {

	    var file = event.target.files[0];

	    var reader = new FileReader(); 
	    reader.onload = function(e) {

	        $("#preview").attr("src", e.target.result);
	    }

	    reader.readAsDataURL(file);
	});
</script>
</body>
</html>