<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
	
	<style type="text/css">
	
	
	.searchInput .resultBox {
        padding: 0;
        opacity: 0;
        pointer-events: none;
        max-height: 280px;
        overflow-y: auto;
        position: absolute; /* 위치 변경 */
        top: 50px; /* 위치 변경 */
        left: 0; /* 위치 변경 */
        z-index: 10; /* 위치 변경 */
    }
	
	.searchInput.active .resultBox{
	  padding: 10px 8px;
	  opacity: 1;
	  pointer-events: auto;
	}
	
	.resultBox li{
	  list-style: none;
	  padding: 8px 12px;
	  display: none;
	  width: 100%;
	  cursor: default;
	  border-radius: 3px;
	}
	
	.searchInput.active .resultBox li{
	  display: block;
	}
	.resultBox li:hover{
	  background: #efefef;
	}
	</style>
    <title>Insert title here</title>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="wrap">
    <div class="container">
        <form method="post" action="register">
            <div class="row justify-content-center align-items-center mt-5">
                <div class="col-md-10">
                    <div class="card shadow p-3 mb-5 rounded">
                        <div class="fw-lighter m-4 p-2">
		                    <span class="fs-3">포스팅을 작성해주세요.</span>
		                </div>
                        <div class="card-body">
                            <div class="mb-3">
                                <div class="form-floating">
                                    <input class="form-control-plaintext mb-4" placeholder="Leave a comment here"
                                           name="title"
                                           id="postTitle">
                                    <label for="postTitle">제목을 작성해 주세요!</label>
                                </div>
                                <div class="form-floating mb-5">
                                    <input class="form-control-plaintext" placeholder="Leave a comment here"
                                           name="subTitle"
                                           id="postSubTitle">
                                    <label for="postSubTitle">소제목을 작성해 주세요!</label>
                                </div>
                            </div>

                            <div class="col-md" id="box">
                                <div id="post-index-0" class="card shadow p-3 mb-5 rounded">
                                    <div class="card-body justify-content-center align-items-center">
                                        <div class="row justify-content-center align-items-center">
                                            <div class="col-4">
                                                <div class="pos">
                                                    <div class="text-center">
                                                        <label for="imageFile-0">
                                                            <a class="btn"><i class="bi bi-plus-square-dotted"
                                                                              style="font-size:30px;"></i></a>
                                                        </label>
                                                    </div>
                                                    <input style="visibility: hidden;" type="file" id="imageFile-0"
                                                           name="chooseFile"
                                                           accept="image/*">
                                                </div>
                                                <div class="text-center" style="display:none;">
                                                    <img class="img-thumbnail border-0"
                                                         style="width: 245px;height: 245px;object-fit:cover;margin-top:-55px">
                                                </div>
                                            </div>
                                            <div class="col-8">
                                                <div class="form-floating searchInput">
                                                    <input type="text" id="storeIdInput" class="form-control-plaintext mb-4"
                                                          name="storeId">
				                                    <div class="resultBox"><!-- here list are inserted from javascript --></div>
                                                    <label for="storeIdInput">가게명을 작성해주세요 :)</label>
                                                </div>
                                                <div class="form-floating">
				                                    <textarea class="form-control-plaintext"
                                                              rows="10" cols="60"
                                                              name="content" style="min-height:10rem"></textarea>
                                                    <label for="storeIdInput">원하는 글을 작성해주세요</label>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12 text-end mt-4">
                                                        <button type="button" class="btn btn-outline-secondary border-light-subtle btn-delete">delete</button>
                                                        <button type="submit" id="save" name="savebutton" class="btn btn-outline-secondary border-light-subtle btn-save">save</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md">
                                <div class="card shadow p-3 mb-5 rounded">
                                    <div class="card-body">
                                        <div class="card-body text-center ">
                                            <a class="btn" id="btn-add-field">
                                                <i class="bi bi-plus-square-dotted" style="font-size:30px;"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-10 text-end">
                    <a href="javascript:window.history.back();" class="btn btn-outline-secondary border-light-subtle">cancel</a>
                    <button type="submit" id="postSubmit" class="btn btn-outline-secondary border-light-subtle">
                        <div id="submitRequest">submit</div>
                        <div id="submitLoadingSpinner"
                             class="spinner-border spinner-border-sm text-primary m-1" role="status"
                             style="display: none;">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                    </button>
                </div>
            </div>

			<div class="toast-container position-fixed bottom-0 end-0 p-3">
			  	<div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
			    	<div class="toast-header">
			      		<strong class="me-auto">알림</strong>
			      		<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
			    	</div>
			    	<div class="toast-body">
			    		포스트가 게시되었습니다.
			    	</div>
			  	</div>
			</div>
        </form>
        
    </div>
    <%@ include file="../common/footer.jsp" %>
</div>
<script type="text/javascript">

    $('#box').on('change', 'input[name=chooseFile]', function (event) {

        let $btnDiv = $(this).closest('.pos');
        let $imgDiv = $btnDiv.next();

        let file = event.target.files[0];
        let reader = new FileReader();

        reader.onload = function (e) {
            $btnDiv.hide();
            $imgDiv.show();

            $imgDiv.find('img').attr("src", e.target.result).click(function () {
                $btnDiv.show();
                $imgDiv.hide();
            })
        }
        reader.readAsDataURL(file);
    })

    $(function () {

        let formIndex = 0;
        // 1. id="btn-add-field" 버튼에 이벤트핸들러 등록하기
        $('#btn-add-field').click(function () {

            // let unixTime = new Date().getTime();
            formIndex += 1;

            // 추가할 html 컨텐츠를 정의한다.
            let content = `
            <div id="post-index-\${formIndex}" class="card shadow p-3 mb-5 rounded post-index">
                <div class="card-body justify-content-center align-items-center">
                    <div class="row justify-content-center align-items-center">
                        <div class="col-4">
                            <div class="pos">
                                <div class="text-center">
                                    <label for="imageFile-\${formIndex}">
                                        <a class="btn"><i class="bi bi-plus-square-dotted"
                                                          style="font-size:30px;"></i></a>
                                    </label>
                                </div>
                                <input style="visibility: hidden;" type="file" id="imageFile-\${formIndex}"
                                       name="chooseFile"
                                       accept="image/*">
                            </div>
                            <div class="text-center" style="display:none;">
                                	<img class="img-thumbnail border-0"
                                     	style="width: 245px;height: 245px;object-fit:cover;margin-top:-55px">
                            </div>
                        </div>
                        <div class="col-8">
			            	<div class="form-floating searchInput">
			                	<input type="text" id="storeIdInput" class="form-control-plaintext mb-4"
			                       placeholder="가게명을 작성해주세요." name="storeId">
			                <div class="resultBox"><!-- here list are inserted from javascript --></div>
			                	<label for="storeIdInput">가게명을 작성해주세요 :)</label>
			            	</div>
                            <div class="form-floating">
                                <textarea class="form-control-plaintext"
                                          placeholder="원하는 글을 작성해 보세요." rows="10" cols="60"
                                          name="content" style="min-height:10rem"></textarea>
                                <label for="storeIdInput">원하는 글을 작성해주세요</label>
                            </div>
                            <div class="row">
                                <div class="col-12 text-end mt-4">
                                    <button type="button" class="btn btn-outline-secondary border-light-subtle btn-delete">delete
                                    </button>
                                    <button class="btn btn-outline-secondary border-light-subtle btn-save">save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			
		`
            // html 컨텐츠가 추가될 부모엘리먼트를 검색한다.
            // 부모엘리먼트가 포함된 jQuery 집합객체를 획득하고, append(컨텐츠)메소드를 이용해서 지정된 컨텐츠를 자식 컨텐츠로 추가한다.
            $('#box').append(content);
        })

        // 2. 삭제버튼에 이벤트핸들러 등록하기
        /* $('#box').on('click', '.btn-delete', function () {
            $(this).closest('.card').remove();
        }) */
        
        $('#box').on('click', '.btn-delete', function () {
            const card = $(this).closest('.card');

 			const dataId = card.attr('id').split('-')[2];
            const storeIdInput = card.find('input[name=storeId]').val();
            const contentTextarea = card.find('textarea[name=content]').val();
            
            if (storeIdInput.trim() !== '' || contentTextarea.trim() !== '') {
            	const formDataToSend = new FormData();
                formDataToSend.append('data-id', dataId);
            	
                fetch('/post/delete-post-data', {
                    method: 'POST',
                    body: formDataToSend
                })
                .then(response => {
                    if (response.ok) {
                        return response.text(); // 반환된 응답 데이터 읽기
                    } else {
                        throw new Error('삭제 실패');
                    }
                })
                .then(data => {
                    // 서버에서 응답한 메시지를 출력하거나 다른 작업 수행
                    console.log(data);
                    card.remove(); // 카드 삭제
                })
                .catch(error => {
                    showToast('삭제할 수 없습니다.');
                    console.error('Failed to send delete request:', error);
                });
	            /* fetch('/post/delete-post-data', {
	            	method: 'POST',
                    body: formDataToSend
                    
	            }).then(response => {
	                if (response.ok) {
	                    card.remove();
	                } else {
	                    showToast('삭제할 수 없습니다.');
	                }
	            }).catch(error => {
	                
	                console.error('Failed to send delete request:', error);
	            }); */
        
            } else {
                // 저장된 값이 없는 경우에는 바로 해당 카드를 제거
                card.remove();
            }
        });
    })

    document.addEventListener("DOMContentLoaded", function () {
        const postSubmitButton = document.getElementById("postSubmit");
        const buttonMessage = document.getElementById("submitRequest");
        const submitLoadingSpinner = document.getElementById("submitLoadingSpinner");
 
        postSubmitButton.addEventListener("click", function (event) {
            event.preventDefault();
            event.stopPropagation();
            buttonMessage.textContent = "";
            submitLoadingSpinner.style.display = "block";

            const postTitle = document.getElementById("postTitle").value;
            const postSubTitle = document.getElementById("postSubTitle").value;
            
            
            if (!postTitle || !postSubTitle) {
                showToast('빈칸을 모두 작성해주세요.');
                submitLoadingSpinner.style.display = "none";
                buttonMessage.textContent = "submit";
                return;
            }
            // TODO: Perform validation on postTitle and postSubTitle

            const postForm = {
                postTitle: postTitle,
                postSubtitle: postSubTitle
            };
            
            // Send a POST request using fetch()
            
			fetch('/post/register-post', {
		        method: "POST",
		        headers: {
		            "Content-Type": "application/json"
		        },
		        body: JSON.stringify(postForm)
		    })
		        .then(response => {
		            if (response.ok) {
		                window.location.href = "/";
		            } else {
		                // TODO: Handle error response
		            	console.error("Form submission failed. Status:", response.status);
		                response.text().then(errorMessage => {
		                    console.error("Error message:", errorMessage);
		                });
		            }
		        })
		        .catch(error => {
		            // TODO: Handle fetch error
		            console.error("Error submitting form:", error);
		        });
				
        });

        const boxInput = document.getElementById('box');
        boxInput.addEventListener('click', function (event) {
            if (event.target.classList.contains('btn-save')) {
                event.preventDefault();
                event.stopPropagation();
                event.target.disabled = true;

                const card = event.target.closest('.card');

                const inputsAndTextarea = card.querySelectorAll('input, textarea');
                inputsAndTextarea.forEach(element => {
                    element.disabled = true;
                });

                const chooseFileInput = card.querySelector('input[name=chooseFile]');
                const storeIdInput = card.querySelector('input[name=storeId]');
                const contentTextarea = card.querySelector('textarea[name=content]');
                const dataId = card.getAttribute('id').split('-')[2];

                if (chooseFileInput.files.length === 0 || storeIdInput.value.trim() === '' || contentTextarea.value.trim() === '') {
                    showToast('사진, 가게명, 게시글을 모두 작성해주세요.');
                    event.target.disabled = false;
                    inputsAndTextarea.forEach(element => {
                        element.disabled = false;
                    });
                    return;
                }
                
                const formDataToSend = new FormData();
                formDataToSend.append('chooseFile', chooseFileInput.files[0]);
                formDataToSend.append('storeId', storeIdInput.value);
                formDataToSend.append('content', contentTextarea.value);
                formDataToSend.append('data-id', dataId);

                fetch('/post/register-post-data', {
                    method: 'POST',
                    body: formDataToSend
                })
                    .then(response => {
                        if (response.ok) { // SC_200
                        	showToast('블록이 저장되었습니다');
                        } else{
                        	showToast('서버 오류가 발생하였습니다.')
                        }
                    })
                    .catch(error => {
                        // TODO: error handling
                    });
            }
            
        });
        
    });
    
    function showToast(message) {
    	  const toastLiveExample = document.getElementById('liveToast');
    	  if (toastLiveExample) {
    	    const toast = new bootstrap.Toast(toastLiveExample);
    	    const toastBody = toastLiveExample.querySelector('.toast-body');
    	    
    	    toastBody.textContent = message; // 원하는 메시지로 변경
    	    
    	    toast.show();
    	  }
    }
    
    let suggestions = [
    	"25",
        "Channel",
        "CodingLab",
        "CodingNepal",
        "YouTube",
        "YouTuber",
        "YouTube Channel",
        "Blogger",
        "Bollywood",
        "Vlogger",
        "Vechiles",
        "Facebook",
        "Freelancer",
        "Facebook Page",
        "Designer",
        "Developer",
        "Web Designer",
        "Web Developer",
        "Login Form in HTML & CSS",
        "How to learn HTML & CSS",
        "How to learn JavaScript",
        "How to became Freelancer",
        "How to became Web Designer",
        "How to start Gaming Channel",
        "How to start YouTube Channel",
        "What does HTML stands for?",
        "What does CSS stands for?",
    ];

    const searchInput = document.querySelector(".searchInput");
    const input = searchInput.querySelector("input");
    const resultBox = searchInput.querySelector(".resultBox");
    const icon = searchInput.querySelector(".icon");
    let linkTag = searchInput.querySelector("a");
    let webLink;

    function select(element) {
	    let selectData = element.textContent;
	    input.value = selectData;
	    searchInput.classList.remove("active");
	}

	input.onkeyup = (e) => {
	    let userData = e.target.value;
	    
	    $.getJSON("/getStores", {keyword:userData}, function(stores) {
	    	// stores - [{id:10, name:"소담짐"}, {id:11, name:"돈까스우찌"}]
		    let emptyArray = [];
		    if (userData) {
		        emptyArray = suggestions.filter((data) => {
		            return data.name.toLowerCase().startsWith(userData.toLowerCase());
		        });
		        emptyArray = emptyArray.map((data) => {
		            return `<li data-store-id="\${store.id}">\${store.name}</li>`;
		        });
		        searchInput.classList.add("active");
		        showSuggestions(emptyArray);
		        let allList = resultBox.querySelectorAll("li");
		        for (let i = 0; i < allList.length; i++) {
		            allList[i].setAttribute("onclick", "select(this)");
		        }
		    } else {
		        searchInput.classList.remove("active");
		    }
	    	
	    })
	    
	};
	

    function showSuggestions(list){
        let listData;
        if(!list.length){
            userValue = inputBox.value;
            listData = '<li>'+ userValue +'</li>';
        }else{
            listData = list.join('');
        }
        resultBox.innerHTML = listData;
    }
    
    
	/* input.addEventListener("keydown", (e) => {
	    const allList = resultBox.querySelectorAll("li");
	    let activeElement = document.activeElement;

	    // If the input is focused and arrow keys are pressed
	    if (activeElement === input) {
	        if (e.key === "ArrowDown" || e.key === "ArrowUp") {
	            e.preventDefault();
	            if (allList.length > 0) {
	                if (!resultBox.classList.contains("active")) {
	                    resultBox.classList.add("active");
	                    allList[0].classList.add("active");
	                } else {
	                    const currentIndex = Array.from(allList).indexOf(document.querySelector(".active"));
	                    allList[currentIndex].classList.remove("active");
	                    let nextIndex;
	                    if (e.key === "ArrowDown") {
	                        nextIndex = (currentIndex + 1) % allList.length;
	                    } else {
	                        nextIndex = (currentIndex - 1 + allList.length) % allList.length;
	                    }
	                    allList[nextIndex].classList.add("active");
	                }
	                allList.forEach((item, index) => {
	                    if (item.classList.contains("active")) {
	                        item.focus();
	                        input.value = item.textContent;
	                    }
	                });
	            }
	        }
	    }
	}); */
</script>

</body>
</html>