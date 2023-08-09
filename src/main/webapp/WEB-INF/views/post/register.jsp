<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Application</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="wrap">
	<div class="container">
	<form method="post" enctype="multipart/form-data" action="register">
		
  		<div class="row justify-content-center align-items-center mt-5" >
  			
	   		<div class="col-md-8">
	     			<div class="card shadow p-3 mb-5 rounded">
	        		<div class="card-header">
	          			<p class="my-2">포스팅의 제목과 소제목을 적어주세요!</p>
	        		</div>
	          		<div class="card-body">
              			<div class="mb-3">
              				<div class="form-floating">
								<input class="form-control mb-4" placeholder="Leave a comment here" name="title">
  								<label for="floatingTextarea">제목을 작성해 주세요!</label>
							</div>
							<div class="form-floating mb-4">
								<input class="form-control" placeholder="Leave a comment here" name="subtitle">
  								<label for="floatingTextarea">소제목을 작성해 주세요!</label>
							</div>
              			</div>
						
	          		</div>
	      		</div>
	    	</div>
	    	
	    	<div class="col-md-8" id="box">
     			<div class="card shadow p-3 mb-5 rounded">
	          		<div class="card-body">
              			<div class="row justify-content-center align-items-center">
              				<div class="col-4">
              					<div class="pos">
									    <div class="text-center">
									        <label for="imageFile">
              									<a class="btn"><i class="bi bi-plus-square-dotted" style="font-size:30px;"></i></a> 
									        </label>
									    </div>
									    <input style="visibility: hidden" type="file" id="imageFile" name="chooseFile" accept="image/*" >
              					</div>
              					<div class="pos" style="display:none;">
									<img class="img-thumbnail border-0" style="width: 231px;height: 225px;object-fit:cover;">
              					</div>
              				</div>
              				<div class="col-8"> 
              					<input class="form-control mb-4" placeholder="가게명을 작성해주세요." name="heading">
              					<textarea class="form-control" placeholder="원하는 글을 작성해 보세요." rows="6" cols="60" name="content"></textarea>
              				</div>
              			</div>
	          		</div>
		      		<button class="btn btn-outline-secondary">delete</button>
	      		</div>
	    	</div>
		    	
	    	<div class="col-md-8">
	     			<div class="card shadow p-3 mb-5 rounded">
		          		<div class="card-body">
	              			<div class="card-body text-center ">
          						<a class="btn" id="btn-add-field"><i class="bi bi-plus-square-dotted" style="font-size:30px;"></i></a> 
          					</div>
		          		</div>
	      			</div>
	    	</div>
	    	<div class="col-md-8 text-end">
		    	
		     		<a href="javascript:window.history.back();" class="btn btn-secondary">cancel</a>
		     		<button class="btn btn-secondary">submit</button>
	    	</div>
	  	</div>
	
	</form>
	</div>
	<%@ include file="../common/footer.jsp" %>
</div>
<script type="text/javascript">

$('#box').on('change', 'input[name=chooseFile]', function(event) {
    
    let $btnDiv = $(this).closest('.pos');
    let $imgDiv = $btnDiv.next();

    let file = event.target.files[0];
    let reader = new FileReader();
    
    reader.onload = function(e) {
       $btnDiv.hide();
       $imgDiv.show();
       
       $imgDiv.find('img').attr("src", e.target.result).click(function() {
          $btnDiv.show();
          $imgDiv.hide();
       })
    }
    reader.readAsDataURL(file);
 })
 

/* $("#preview").hide();
$("#form-box").show();
$("#imageFile").on("change", function(event) {

    let file = event.target.files[0];

    let reader = new FileReader(); 
    reader.onload = function(e) {

        $("#form-box").hide()
        $("#preview").show();
        $("#preview").attr("src", e.target.result).click(function() {
        	$("#form-box").show()
        	$("#preview").hide();
        });
    }

    reader.readAsDataURL(file);
}); */

$(function(){
	
	// 1. id="btn-add-field" 버튼에 이벤트핸들러 등록하기
	$('#btn-add-field').click(function(){
		
		let unixTime = new Date().getTime();
		
		// 추가할 html 컨텐츠를 정의한다.
		let content = `
			<div class="card shadow p-3 mb-5 rounded">
	      		<div class="card-body">
	      			<div class="row justify-content-center align-items-center">
	      				<div class="col-4">
	          					<div class="pos display:none">
									    <div class="text-center">
									        <label for="imageFile-\${unixTime}">
	          									<a class="btn"><i class="bi bi-plus-square-dotted" style="font-size:30px;"></i></a> 
									        </label>
									    </div>
									    <input style="visibility: hidden" type="file" id="imageFile-\${unixTime}" name="chooseFile" accept="image/*" >
	          					</div>
	          					<div class="pos" style="display:none;">
									<img id="preview" class="img-thumbnail border-0" style="width: 231px;height: 225px;object-fit:cover;">
	          					</div>
	      				</div>
	      				<div class="col-8"> 
	      					<input class="form-control mb-4" placeholder="가게명을 작성해주세요." name="heading">
	      					<textarea class="form-control" placeholder="원하는 글을 작성해 보세요." rows="6" cols="60" name="content"></textarea>
	      				</div>
	      			</div>
	      		</div>
      			<button class="btn btn-outline-secondary">delete</button>
	  		</div>
			
		`
		// html 컨텐츠가 추가될 부모엘리먼트를 검색한다.
		// 부모엘리먼트가 포함된 jQuery 집합객체를 획득하고, append(컨텐츠)메소드를 이용해서 지정된 컨텐츠를 자식 컨텐츠로 추가한다.
		$('#box').append(content);
	})
	
	// 2. 삭제버튼에 이벤트핸들러 등록하기
	$('#box').on('click','button',function(){
		$(this).parent().remove();	
	})
})


</script>

</body>
</html>