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
.buttons {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    padding: 10px;
}
#btn-1.active {
	color: red;

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
	                          		맛있어요!
	                      		</button>
	                  		</li>
			                <li style="display: inline-block;">
			                	<button class="emoji-btn" data-recommend-type="2" style="background: none; border: none;">
			                    	<i class="bi bi-emoji-smile" style="font-size: 25px;"></i>
			                    	괜찮아요!
			              		</button>
			     			</li>
			                <li style="display: inline-block;">
			               		<button class="emoji-btn" data-recommend-type="1" style="background: none; border: none;">
			                		<i class="bi bi-emoji-angry" style="font-size: 25px;"></i>
			                        별로에요!
			                	</button>
			             	</li>
	              		</ul>
	          		</div>
	        		<textarea id="textLength" name="content" rows=20 class="form-control border-0" style="height: 250px; position: relative;" placeholder="리뷰를 작성해주세요"></textarea>
		        	<p style="text-align: right;"><span id="text-count">0</span>/2000</p>
				</div>
			</div>
	    </div>
	</div>
	<div class="row">
		<div class="btn-group m-2" style="background: none; border: none;">
			<span>
				<button id="btn-1" type="button" class="btn border-opacity-10 fw-lighter fs-6 m-2 p-1">#음식이 맛있어요</button>
				<button id="btn-2" type="button" class="btn border-opacity-10 fw-lighter fs-6 m-2 p-1">#주차가 편해요</button>
				<button id="btn-3" type="button" class="btn border-opacity-10 fw-lighter fs-6 m-2 p-1">#매장이 청결해요</button>
				<button id="btn-4" type="button" class="btn border-opacity-10 fw-lighter fs-6 m-2 p-1">#매장이 넓어요</button>
				<button id="btn-5" type="button" class="btn border-opacity-10 fw-lighter fs-6 m-2 p-1">#분위기가 좋아요</button>
				<button id="btn-6" type="button" class="btn border-opacity-10 fw-lighter fs-6 m-2 p-1">#친절해요</button>
			</span>
		</div>
	</div>
	<div class="row">
	    <div class="photo-section">
	    	<form method="post" enctype="multipart/form-data" id="form-image">
			    <div>
			        <label for="imageFile">
	       				<a class="btn" style="position: relative; display: inline-block;"><i class="bi bi-plus-square-dotted" style="font-size: 65px; color: #000;"></i></a> 
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
		        <p style="position: relative; left: 30px;"><span id="image-count">0</span>/10</p>
		    <div class="buttons">
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
	
	$("#form-image span").on('click', 'button', function(event) {
		// !$(event.target): 이벤트가 발생한 HTML 엘리먼트를 jQuery 객체로 감싼 것, .hasClass: text-danger를 갖고 있는지 물어보는코드
        if (!$(event.target).hasClass('text-danger')) {
            // 클릭한 버튼의 자손중에서 img 엘리먼트를 검색하고, src 속성값을 읽어온다.
            let imageSource = $(this).find("img").attr("src");
            // 조회된 이미지소스를 모달창의 img엘리먼트에 적용한다.
            $("#modal-img").attr("src", imageSource);
            previewModal.show(); // 이미지를 감싸는 버튼 클릭 시 모달 창을 보여줌
        }
    });
	
	// 이미지 필드의 이미지가 변경되면 
	$("#imageFile").on("change", function(event) {
		// 버튼과  이미지태그르 생성한다.
		let content = `
			<button type="button" class="btn position-relative">
				<i class="bi bi-x position-absolute fw-bold text-danger bg-secondary" style="top: 8px; right:15px; padding-left:1px;"></i>
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
	
	$("textarea[name=content]").keyup(function() {
		
	    let maxLength = 2000; 
	    let text = $(this).val(); 
	    let totalLength = text.length;
	   
	    if (totalLength > maxLength) {
	        $(this).val("");
	        let sub = text.slice(0, maxLength);
	        $(this).val(sub);
	        totalLength = 2000;
	        text = '';
	        
	    }
	        $("#text-count").text(totalLength)
	});
	
	// 초기값이 0인 이미지 수를 나타내는 변수
    let imageCount = 0;
    const maxImageCount = 10;

    $("#imageFile").on("change", function() {
	    
    	// imageCount가 maxImageCount보다 작다면 이미지 카운트를 증가
        if (imageCount < maxImageCount) {
            imageCount++;
            // imageCount가 증가할 때 마다 텍스트 내용을 변경
            $("#image-count").text(imageCount);
            
            // imageCount와 maxImageCount가 같다면 이미지 선택 버튼 비활성화
            if (imageCount === maxImageCount) {
                $("#imageFile").prop("disabled", true); 
            }
        } 
    });
    
    $("#form-image").on('click', 'i.text-danger', function(event) {
    	event.stopImmediatePropagation()
    	
    	$(this).parent().remove();
    	
    	// imageCount가 감소할 때 마다 텍스트 내용을 변경
    	 imageCount--;
         $("#image-count").text(imageCount);
         
      // imageCount가 maxImageCount보다 작다면 이미지 선택 버튼 활성화
         if (imageCount < maxImageCount) { 
         	$("#imageFile").prop("disabled", false);
         }
    	
    	event.preventDefault()
    	return false;
    })
    
    $("#textLength").on("input", function() {
        // textarea 내용 가져오기
        let textareaContent = $(this).val().trim();
        
        // 리뷰 올리기 버튼 활성화/비활성화
        if (textareaContent === "") {
            $("button.btn-outline-success").prop("disabled", true);
        } else {
            $("button.btn-outline-success").prop("disabled", false);
        }
    });

    // 초기 상태에서 textarea의 내용 확인하여 버튼 상태 설정
    $("#textLength").trigger("input");
 
 	// '.emoji-btn' 클래스를 가진 버튼을 클릭할 때 실행되는 함수를 정의합니다.
	$('#btn-1').click(function() {
		// 모든 버튼에 있는 'active' 클래스를 제거합니다.
		$('#btn-1').removeClass('active');
		// 클릭한 버튼에만 'active' 클래스를 추가합니다.
		$(this).addClass('active');
	}); 
    
});

</script>
</body>
</html>