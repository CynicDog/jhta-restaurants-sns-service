<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <style>
    html, body {
      height: 100%;
    }

    body {
      display: flex;
      align-items: center;
      justify-content: center;
    }
	.starpoint_wrap{display:inline-block;}
	.starpoint_box{position:relative;background:url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png) 0 0 no-repeat;font-size:0;}
	.starpoint_box .starpoint_bg{display:block;position:absolute;top:0;left:0;height:18px;background:url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png) 0 -20px no-repeat;pointer-events:none;}
	.starpoint_box .label_star{display:inline-block;width:10px;height:18px;box-sizing:border-box;}
	.starpoint_box .star_radio{opacity:0;width:0;height:0;position:absolute;}
	.starpoint_box .star_radio:nth-of-type(1):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(1):checked ~ .starpoint_bg{width:10%;}
	.starpoint_box .star_radio:nth-of-type(2):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(2):checked ~ .starpoint_bg{width:20%;}
	.starpoint_box .star_radio:nth-of-type(3):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(3):checked ~ .starpoint_bg{width:30%;}
	.starpoint_box .star_radio:nth-of-type(4):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(4):checked ~ .starpoint_bg{width:40%;}
	.starpoint_box .star_radio:nth-of-type(5):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(5):checked ~ .starpoint_bg{width:50%;}
	.starpoint_box .star_radio:nth-of-type(6):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(6):checked ~ .starpoint_bg{width:60%;}
	.starpoint_box .star_radio:nth-of-type(7):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(7):checked ~ .starpoint_bg{width:70%;}
	.starpoint_box .star_radio:nth-of-type(8):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(8):checked ~ .starpoint_bg{width:80%;}
	.starpoint_box .star_radio:nth-of-type(9):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(9):checked ~ .starpoint_bg{width:90%;}
	.starpoint_box .star_radio:nth-of-type(10):hover ~ .starpoint_bg,
	.starpoint_box .star_radio:nth-of-type(10):checked ~ .starpoint_bg{width:100%;}
	
	.blind{position:absolute;clip:rect(0 0 0 0);margin:-1px;width:1px;height: 1px;overflow:hidden;}
	#floatingTextarea{height:300px;}
	
    .real-upload {
      display: none;
    }

    .upload {
      width: 100%;
      height: 35px;
      margin-bottom: 15px;
      
    }

  </style>
</head>
<body>
<div class="container">
  <div class="row justify-content-center align-items-center mt-5">
    <div class="col-md-6">
      <div class="card shadow p-3 mb-5 bg-white rounded">
        <div class="card-header">
          <p class="my-2">가게에 대한 평가를 해주세요.</p>
        </div>

          <div class="card-body">
			<div class="starpoint_wrap">
			  <div class="starpoint_box">
			    <label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
			    <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
			    <label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
			    <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
			    <label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
			    <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
			    <label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
			    <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
			    <label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
			    <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
			    <input type="radio" name="starpoint" id="starpoint_1" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_2" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_3" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_4" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_5" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_6" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_7" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_8" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_9" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_10" class="star_radio">
			    <span class="starpoint_bg"></span>
			  </div>
			</div>
            <form>
              <div class="mb-3">
              	<div class="form-floating">
					<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea"></textarea>
  					<label for="floatingTextarea">리뷰를 작성해 주세요!</label>
				</div>
              </div>
            </form>
				  <input type="file" class="real-upload" accept="image/*" required multiple>
					<div>
						<a class="upload btn btn-primary">사진 업로드</a>
					</div>
					<script>
					  function getImageFiles(e) {
					    const files = e.currentTarget.files;
					    console.log(typeof files, files);
					  }
					
					  const realUpload = document.querySelector('.real-upload');
					  const upload = document.querySelector('.upload');
					
					  upload.addEventListener('click', () => realUpload.click());
					  realUpload.addEventListener('change', getImageFiles);
					</script>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			  <button class="btn btn-primary me-md-2" type="submit">취소</button>
			  <button class="btn btn-primary" type="submit">작성</button>
			</div>
          </div>

      </div>
    </div>
  </div>
</div>
</body>
</html>