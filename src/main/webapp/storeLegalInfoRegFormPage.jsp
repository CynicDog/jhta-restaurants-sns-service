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

        .button-container {
            display: flex;
            justify-content: flex-end;
        }

        .button-container-mid {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center align-items-center mt-5">
        <div class="col-md-8">
            <div class="col my-4">
                <div></div>
            </div>
            <div class="card shadow p-3 mb-5 bg-white rounded">
                <div class="card-header">
                    <div class="row">
                        <div class="col-3">
                            <p class="text-center m-2"><span style="font-weight: bold; white-space: nowrap">가게 사업 정보 기입</span> </p>
                        </div>
                        <div class="col-3">
                            <p class="text-center m-2"><span style="color:#808080; white-space: nowrap; font-size: small">가게 상세 정보 기입</span> </p>
                        </div>
						<div class="col-3">
                            <p class="text-center m-2"><span style="color:#808080; white-space: nowrap; font-size: small">가게 사진 등록</span></p>
                        </div>
                        <div class="col-3">
                            <p class="text-center m-2"><span style="color:#808080; white-space: nowrap; font-size: small">메뉴 등록</span> </p>
                        </div>
                    </div>
                </div>
                <form method="post" action="storeLegalInfoRegister.jsp">
                    <div class="card-body">
                        <div class="col my-3">
                            <label for="business-license-number" class="form-label">사업자 등록 번호</label>
                            <input type="text" class="form-control" id="business-license-number" placeholder="사업자 등록 번호 10자리" name="business-license-number" required>
                        </div>
						<div class="col my-3">
                            <label for="phone" class="form-label">가게 전화번호</label>
                            <input type="text" class="form-control" id="phone" name="phone" required>
                        </div>
                        <div class="row">
                            <div class="col-7 my-1">
                                <input class="form-control my-1" type="text" id="sample6_postcode" placeholder="우편번호" name="zipcode" required>
                            </div>
                            <div class="col-5 my-1">
                                <div class="button-container-mid">
                                    <input class="btn btn-light my-1" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                                </div>
                            </div>
                        </div>
                        <div class="col my-1">
                            <input class="form-control" type="text" id="sample6_address" placeholder="주소" name="address" required>
                        </div>
                        <div class="col my-3">
                            <input class="form-control" type="text" id="sample6_detailAddress" placeholder="상세주소">
                        </div>
                        <div class="col my-2">
                            <input class="form-control" type="text" id="sample6_extraAddress" placeholder="참고항목">
                        </div>
                        <div>
                        	<input hidden=true id="storeLongitude" name="longitude">
                        </div>
                        <div>
                        	<input hidden=true id="storeLatitude" name="latitude">
                        </div>
                    </div>
                    <div class="button-container">
                        <button class="btn btn-primary" type="submit">입력</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8dc99e5108c8ac0f59f4315f77a45f84&libraries=services,clusterer,drawing"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
                
                console.log(addr);
                
             	var geocoder = new kakao.maps.services.Geocoder();
             	// 주소로 좌표를 검색합니다
                geocoder.addressSearch(addr, function(result, status) {

                    // 정상적으로 검색이 완료됐으면 
                     if (status === kakao.maps.services.Status.OK) {
						
                    	var x = result[0].road_address.x
                    	var y = result[0].road_address.y
                    	
		                document.getElementById('storeLongitude').value = x;
		                document.getElementById('storeLatitude').value = y;
                    } 
                });
				
                
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>