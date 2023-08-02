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
  		<div class="row justify-content-center align-items-center mt-5">
    		<div class="col-md-8">
      			<div class="card shadow p-3 mb-5  rounded">
	        
	        		<div class="card-header">
	          			<p class="my-2">포스팅의 제목과 소제목을 적어주세요!</p>
	        		</div>
	
	          		<div class="card-body">
	            		<form method="post">
	              			<div class="mb-3">
	              				<div class="form-floating">
									<input class="form-control mb-4" placeholder="Leave a comment here" id="floatingTextarea">
	  								<label for="floatingTextarea">제목을 작성해 주세요!</label>
								</div>
								<div class="form-floating mb-4">
									<input class="form-control" placeholder="Leave a comment here" id="floatingTextarea">
	  								<label for="floatingTextarea">소제목을 작성해 주세요!</label>
								</div>
	              			</div>
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					  			<a href="javascript:window.history.back();" class="btn btn-outline-white me-md-2" >cancel</a>
					  			<button  class="btn btn-outline-white" type="submit" >next</button>
							</div>
	            		</form>
	          		</div>
	      		</div>
	    	</div>
	    	
	    	<div class="col-md-8">
      			<div class="card shadow p-3 mb-5 rounded">
	          		<div class="card-body">
	            		<form method="post">
	              			<div class="row">
	              				<div class="col-4" style="display:flex; align-items:center;">
	              					<div class="card-body text-center ">
	              						<button class="btn"><i class="bi bi-plus-square-dotted" style="font-size:30px;"></i></button> 
	              					</div>
	              				</div>
	              				
	              				<div class="col-8">
	              					<input class="form-control mt-3 mb-4" placeholder="가게명을 작성해주세요." id="floatingTextarea">
	              					<textarea class="form-control" placeholder="원하는 글을 작성해 보세요." rows="6" cols="60"></textarea>
	              				</div>
	              			</div>
	            		</form>
	          		</div>
	      		</div>
	    	</div>
	    	
	    	<div class="col-md-8">
      			<div class="card shadow p-3 mb-5  rounded">
	          		<div class="card-body">
	            		<form method="post">
	              			
	            		</form>
	          		</div>
	      		</div>
	    	</div>
	    	
	  	</div>
	  	
	</div>
	<%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>