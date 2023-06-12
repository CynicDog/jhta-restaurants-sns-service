<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Mary Blog</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
		<style type="text/css">
			
			.navbar{
				position:fixed;
				top:0px;
				right:0px;
				width:100%;
				height:55px;
				z-index:100;
				background-color:rgb(233, 100, 121);
			}

			.d-flex{
				width:90%;
				position:fixed;
				top:8px;
				right:5px;
				z-index:101;
			}
			
			#search-button{
				background-color: rgb(125, 185, 182);
			}

		</style>
	</head>
	<body>
	
			<nav class="navbar ">
			  <div class="container-fluid">
			    <form class="d-flex" role="search">
			      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			      <button id="search-button" class="btn" type="submit">Search</button>
			    </form>
			  </div>
			</nav>
	
	</body>
</html>