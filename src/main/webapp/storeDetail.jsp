<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<div class="container-fluid p-0">
   <nav class="navbar navbar-expand-lg bg-light">
     <div class="container-fluid">
       <a class="navbar-brand" href="#">Navbar</a>
       <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
       </button>
       <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <ul class="navbar-nav me-auto mb-2 mb-lg-0">
           <li class="nav-item">
             <a class="nav-link active" aria-current="page" href="#">Home</a>
           </li>
           <li class="nav-item">
             <a class="nav-link" href="#">Link</a>
           </li>
           <li class="nav-item dropdown">
             <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
               Dropdown
             </a>
             <ul class="dropdown-menu">
               <li><a class="dropdown-item" href="#">Action</a></li>
               <li><a class="dropdown-item" href="#">Another action</a></li>
               <li><hr class="dropdown-divider"></li>
               <li><a class="dropdown-item" href="#">Something else here</a></li>
             </ul>
           </li>
           <li class="nav-item">
             <a class="nav-link disabled">Disabled</a>
           </li>
         </ul>
         <form class="d-flex" role="search">
           <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
           <button class="btn btn-outline-success" type="submit">Search</button>
         </form>
       </div>
     </div>
   </nav>
   <div class="container">
     <div class="row row-cols-5">
       <div class="col">
         <img src="https://mp-seoul-image-production-s3.mangoplate.com/688135_1508733757417689.jpg?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" class="img-fluid" alt="...">
       </div>
       <div class="col">
         <img src="https://mp-seoul-image-production-s3.mangoplate.com/332683/569295_1680599766207_1000011436?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" class="img-fluid" alt="...">
       </div>
       <div class="col">
         <img src="https://mp-seoul-image-production-s3.mangoplate.com/332683/569295_1680599766207_1000011435?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" class="img-fluid" alt="...">
       </div>
       <div class="col">
         <img src="https://mp-seoul-image-production-s3.mangoplate.com/332683/569295_1680599766207_1000011438?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" class="img-fluid" alt="...">
       </div>
       <div class="col">
         <img src="https://mp-seoul-image-production-s3.mangoplate.com/332683/569295_1680599766207_1000011433?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" class="img-fluid" alt="...">
       </div>
     </div>
   </div>
   <div class="container">
      <div class="row">
         <div class="col">
            <header>
               <div>
                  <span class="title">
                     <h1>가게 이름</h1>
                  </span>
               </div>
            </header>
         </div>
         <div class="col">
            <div id="map" style="width:500px; height:400px;"></div>
         </div>
      </div>
   </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84"></script>
<script>
   var container = document.getElementById('map');
   var options = {
      center: new kakao.maps.LatLng(33.450701, 126.570667),
      level: 3
   };

   var map = new kakao.maps.Map(container, options);

   // 키워드 검색 완료 시 호출되는 콜백함수입니다
   function placesSearchCB (data, status, pagination) {
      if (status === kakao.maps.services.Status.OK) {
         for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);
         }
      }
   }   
</script>
<div>
	<div>
		<h3>1</h3>
		<h3>2</h3>
		<h3>3</h3>
		<h3>4</h3>
		<h3>5</h3>
		<h3>6</h3>
		<h3>7</h3>
	</div>
</div>
</body>
</html>