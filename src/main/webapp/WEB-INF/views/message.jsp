<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지</title>
</head>
<body>
<%@ include file="common/navbar.jsp"%>
<div class="wrap">
	<div class="container-fluid">
		<div class= "row ">
			<div class= "col-12">
				<h2 class="fw-lighter">Message</h2>
			</div>
		</div>
		<div class= "row d-flex justify-content-start mt-3">
			<div class="col-2">
	            <nav id="message-left-navbar" class="h-100 flex-column align-items-stretch pe-4 border-end">
	                <nav class="nav nav-pills flex-column fw-lighter ps-3">
	                    	<a class="nav-link my-3 text-secondary" href="">name</a>
	                    	<a class="nav-link my-3 text-secondary" href="">name</a>
	                    	<a class="nav-link my-3 text-secondary" href="">name</a>
		                    <a class="nav-link my-3 text-secondary" href="">name</a>
	                </nav>
	            </nav>
			</div>
			<div class="col-10" id="message-area">
				<div class="row">
					<div class="col-12" >
						<div class="card shadow-sm border-0">
							<p>~~~~~~~~~~~~~~</p>
							<p>~~~~~~~~~~~~~~</p>
							<p>~~~~~~~~~~~~~~</p>
							<p>~~~~~~~~~~~~~~</p>
							<p>~~~~~~~~~~~~~~</p>
							<p>~~~~~~~~~~~~~~</p>
							<p>~~~~~~~~~~~~~~</p>
							<p>~~~~~~~~~~~~~~</p>
							<p>~~~~~~~~~~~~~~</p>
							<p>~~~~~~~~~~~~~~</p>
							<p>~~~~~~~~~~~~~~</p>
							<p>~~~~~~~~~~~~~~</p>
							<p>~~~~~~~~~~~~~~</p>
							<p>~~~~~~~~~~~~~~</p>
							<p>~~~~~~~~~~~~~~</p>
							<p>~~~~~~~~~~~~~~</p>
						</div>
						<form action="" method="GET">
							<div class="mx-auto my-5 input-group" style="width: 60%;" >
								<input name="keyword" type="text"
									class="form-control rounded-pill" placeholder="메시지 입력"
									aria-label="Recipient's username" aria-describedby="button-addon2">
								<div class="input-group-append"></div>
							</div>
						</form>
					</div>
				</div>
			
			
			</div>

		</div>
	</div>
	</div>
	

</body>
</html>