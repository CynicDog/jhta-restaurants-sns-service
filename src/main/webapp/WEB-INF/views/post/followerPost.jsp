<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
<!DOCTYPE html>
<html>
<%@ include file="../common/navbar.jsp" %>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    
    <style type="text/css">
    	img{
    		width: 100%;
    		height: 250px;
    		object-fit:cover;
    		filter: brightness(70%);
    	}
    	.card-img-overlay{
    		position: absolute;
  			top:30%;
  			font-size: 22px;
    	}
    </style>
<title>Insert title here</title>
</head>
<body>
<div class="wrap">
	<div class="container border-top mt-3" >
		<div class="row text-center border-bottom">
			<div class="col-12 my-5">
				<h2>Follower Post</h2>
				<h4 class="text-secondary">( 내가 팔로우한 사람들의 포스팅 확인해보세요! )</h4>
			</div>
		</div>
	</div>
	<div class="container justify-content-center align-items-center">
		<div class="row mt-4 mb-3">
			<c:forEach var="post" items="${posts }">
				
				<c:set var="sysYear"><fmt:formatDate value="${post.createDate}" pattern="yyyy-MM-dd HH:mm:ss" /></c:set> 
					<div class="col-4 my-3">
						<div class="card text-center text-light font-weight-bold shadow" onclick="location.href='followerPost/detail?id='+'${post.id}'" style=" cursor: pointer;">
							<img src="../resources/image/cafe1.jpg" class="card-img-top rounded" alt="...">
		
							<div class="card-img-overlay">
								<p><strong>${post.title }</strong></p>
							</div>
							
						</div>
						<div class="row">
							<div class="col">
								<strong >${post.customer.id }</strong>
							</div>
							<div class="col text-end">
								<input id="dateInput-${post.id }" type="text" value="${sysYear }" >
								<p class="text-end text-secondary" id="dateValue-${post.id }"></p>
							</div>
						</div>
					</div>
			</c:forEach>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</div>
<script type="text/javascript">

	function timeForToday(value) {
	    const today = new Date();
	    const timeValue = new Date(value);
	    console.log(timeValue)
	
	    const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
	    console.log(betweenTime)
	    if (betweenTime < 1) return '방금전';
	    if (betweenTime < 60) {
	        return `\${betweenTime}분전`;
	    }
	
	    const betweenTimeHour = Math.floor(betweenTime / 60);
	    if (betweenTimeHour < 24) {
	        return `\${betweenTimeHour}시간전`;
	    }
	
	    const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
	    if (betweenTimeDay < 365) {
	        return `\${betweenTimeDay}일전`;
	    }
	
	    return `\${Math.floor(betweenTimeDay / 365)}년전`;
	}
	
	function elapsedTime(date) {
		const start = new Date(date);
		const end = new Date();

		const diff = (end - start) / 1000;
		  
		const times = [
			{ name: '년', milliSeconds: 60 * 60 * 24 * 365 },
		    { name: '개월', milliSeconds: 60 * 60 * 24 * 30 },
		    { name: '일', milliSeconds: 60 * 60 * 24 },
		    { name: '시간', milliSeconds: 60 * 60 },
		    { name: '분', milliSeconds: 60 },
		];

		for (const value of times) {
			const betweenTime = Math.floor(diff / value.milliSeconds);

		   	if (betweenTime > 0) {
		      	return `\${betweenTime}\${value.name} 전`;
		    }
		}
		return '방금 전';
	}

	$("[id^=dateInput]").each(function(index, input) {
		let value = $(input).val();
		let elapsed = timeForToday(value);
		$(input).next().text(elapsed);
	})
	//const dateInput = document.getElementById('dateInput-1');
    //const dateValue = document.getElementById('dateValue-1');
    //const createDate = dateInput.value;
    
    //const elapsed = timeForToday(createDate);
    //dateValue.textContent = elapsed;
	
</script>
</body>
</html>