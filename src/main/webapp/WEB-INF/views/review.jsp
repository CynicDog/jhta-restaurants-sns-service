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
	        <strong style="color: orange;">맛집</strong> <span>에 대한 솔직한 리뷰를 써주세요.</span>
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
	        		<textarea id="textLength" name="count" class="form-control border-0" style="height: 250px; position: relative;" placeholder="리뷰를 작성해주세요"></textarea>
		        	<p><span id="text-count">0</span>/4000</p>
				</div>
			</div>
	    </div>
	</div>
	<div class="row">
	    <div class="photo-section">
	    	<form method="post" enctype="multipart/form-data" id="form-image">
			    <div>
			        <label for="imageFile">
	       				<a class="btn"><i class="bi bi-plus-square-dotted" style="font-size: 65px;"></i></a> 
						<span></span>	
			        </label>
			    	<input style="visibility: hidden" type="file" id="imageFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
			    </div>
			</form>
			<div class="modal fade" id="previewModal" tabindex="-1" aria-labelledby="previewModalLabel" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered modal-xl">
		            <div class="modal-body" style="background-color: transparent; display: flex; justify-content: center; align-items: center; height: 90vh;">
		                <img id="modal-img" class="custom-modal-img" style="max-width: 100%; max-height: 100%;" alt="...">
		            </div>  
			    </div>
			</div>
		    <div class="buttons" style="margin-left: 1100px;">
		        <button type="button" class="btn btn-light">취소</button>
		        <button type="button" class="btn btn-outline-success">리뷰 올리기</button>
		    </div>
		</div>
	</div>
	</div>
<%@ include file="common/footer.jsp"%>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
	
	let previewModal = new bootstrap.Modal("#previewModal");
	
	$('.emoji-btn').click(function() {
		 // 모든 버튼에 있는 'active' 클래스를 제거합니다.
		$('.emoji-btn').removeClass('active');
		// 클릭한 버튼에만 'active' 클래스를 추가합니다.
		$(this).addClass('active');
	});
	
	// 이미지를 감싸는 버튼을 클릭할 때 마다 실행되는 이벤트 핸들러 함수를 추가하였다.
	$("#form-image span").on('click', 'button', function() {
		// 클릭한 버튼의 자손중에서 img 엘리먼트를 검색하고, src 속성값을 읽어온다.
		let imageSource = $(this).find("img").attr("src");
		// 조회된 이미지소스를 모달창의 img엘리먼트에 적용한다.
		$("#modal-img").attr("src", imageSource);
		previewModal.show();
	})
	
	// 이미지 필드의 이미지가 변경되면 
	$("#imageFile").on("change", function(event) {
		// 버튼과  이미지태그르 생성한다.
		let content = `
			<button type="button" class="btn">
				<img style="width: 100px; height: 100px; object-fit: cover;">
			</button>
		`;
		// 생성된 태그를 span에 추가한다.	
		$("#form-image span").append(content);
		
		// 파일데이터를 읽어오는 FileReader객체를 생성한다.
	    var file = event.target.files[0];
	    var reader = new FileReader(); 
	    // FileReader가 전부 파일을 읽어오면 새로 추가한 이미지태그에 표시한다.
	    reader.onload = function(e) {
	    	$("#form-image button img:last").attr("src", e.target.result);
	    }

	    // FileReader객체로 파일을 읽어온다.
	    reader.readAsDataURL(file);
	});
	
	$('textarea[name=count]').keydown(function() {
		let strLength = $(this).val().length + 1;
		$("#text-count").text(strLength);
		
		if (strLength+2 >= 9) {
			console.log(strLength)
			$(this).val($(this).val().substring(0, 8))
		}	
	})
});

</script>
</body>
</html>