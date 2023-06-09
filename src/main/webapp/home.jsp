<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
	#test_btn_group{
		boarder: 1px solid skyblue;
		background-color:rgba(0,0,25,0);
		color: skyblue;
		padding:5px;
		margin-left:12px;
	}
	.test_btn_group{
		boarder: 1px solid skyblue;
		background-color:rgba(0,0,25,0);
		color: skyblue;
		padding:5px;
		margin-left:12px;
	}

</style>

</head>
<body>
<jsp:include page="nav.jsp">
	<jsp:param name="menu" value="홈"/>
</jsp:include>



<div class="container-fluid text-center">
	<div class="row">
    
    <div id="test_btn_group" class="col-8 ">	
    	<button class="btn" type="button">Button</button>
		<a class="btn" role="button" >Link</a>
		<a class="btn" role="button" >Link</a>
		<a class="btn" role="button" >Link</a>
		<a class="btn" role="button" >Link</a>
		<a class="btn" role="button" >Link</a>
    </div>	
  
  	</div>
  	<div class="row">
  
	    <div class="col-4">
	      <div class="card m-2 sm-14" style="inline-block; width: 500px; height: 280px; box-shadow: 20px 20px 20px grey;">
				<img src="..." class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					<a href="#" class="btn btn-primary">Go somewhere</a>
				</div>
			</div>
	    </div>
    
	    <div class="col-4">
	      	<div class="card m-2 sm-14" style="inline-block">
				<img src="..." class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					<a href="#" class="btn btn-primary">Go somewhere</a>
				</div>
			</div>
		    <div class="col-4">
	      
	    	</div>	
		</div>
	</div>
    
   <div class="row">
		<div class="col-4">
		    <div class="card m-2 sm-14" style="inline-block">
				<img src="..." class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					<a href="#" class="btn btn-primary">Go somewhere</a>
				</div>
			</div>
		</div>
    
    	<div class="col-4">
      		<div class="card m-2 sm-14" style="inline-block">
				<img src="..." class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					<a href="#" class="btn btn-primary">Go somewhere</a>
				</div>
			</div>
   		</div>
    
    	<div class="col-4">
      
    	</div>
	</div>

</div>
</body>
</html>