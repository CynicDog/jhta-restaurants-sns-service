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
        .result-container {
            max-height: 100px; /* Adjust the maximum height as needed */
            overflow: auto;
            padding: 10px;
        }
        .button-container {
            display: flex;
            justify-content: flex-end;
        }
        .clicked {
            background-color: #316cf4;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center align-items-center mt-5">
        <div class="col-md-8">
            <div class="card shadow p-3 mb-5 bg-white rounded">
                <div class="card-header">
                    <div class="row">
                        <div class="col-3">
                            <p class="text-center m-2"><span style="color:#808080; white-space: nowrap; font-size: small">가게 사업 정보 기입</span> </p>
                        </div>
                        <div class="col-3">
                            <p class="text-center m-2"><span style="font-weight: bold; white-space: nowrap">가게 상세 정보 기입</span> </p>
                        </div>
						<div class="col-3">
                            <p class="text-center m-2"><span style="color:#808080; white-space: nowrap; font-size: small">가게 사진 등록</span></p>
                        </div>
                        <div class="col-3">
                            <p class="text-center m-2"><span style="color:#808080; white-space: nowrap; font-size: small">메뉴 등록</span> </p>
                        </div>
                    </div>
                </div>
                <form id="store-details-register-form" method="post" action="storeDetailsRegister.jsp">
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="name" class="form-label">가게 이름</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="text">가게 소개글</label>
                            <textarea class="form-control" id="text" rows="3" name="text"></textarea>
                        </div>
                        <div class="col mt-3"> 영업시간
                            <div class="row my-2">
                                <div class="col-3 my-1">
                                    <label class="text-center" for="text1"><span style="white-space: nowrap">요일</span></label>
                                    <select class="form-control" id="text1">
                                        <option value="월요일">월요일</option>
                                        <option value="화요일">화요일</option>
                                        <option value="수요일">수요일</option>
                                        <option value="목요일">목요일</option>
                                        <option value="금요일">금요일</option>
                                        <option value="토요일">토요일</option>
                                        <option value="일요일">일요일</option>
                                    </select>
                                </div>
                                <div class="col-3 my-1">
                                    <label class="text-center" for="text2"><span style="white-space: nowrap">요일</span></label>
                                    <select class="form-control" id="text2">
                                        <option value="월요일">월요일</option>
                                        <option value="화요일">화요일</option>
                                        <option value="수요일">수요일</option>
                                        <option value="목요일">목요일</option>
                                        <option value="금요일">금요일</option>
                                        <option value="토요일">토요일</option>
                                        <option value="일요일">일요일</option>
                                    </select>
                                </div>
                                <div class="col-3 my-1">
                                    <label class="text-center" for="text3"><span style="white-space: nowrap">시작 시간</span></label>
                                    <select class="form-control" id="text3">
                                        <option value="06:00">06:00</option>
                                        <option value="07:00">07:00</option>
                                        <option value="08:00">08:00</option>
                                        <option value="09:00">09:00</option>
                                        <option value="10:00">10:00</option>
                                        <option value="11:00">11:00</option>
                                        <option value="12:00">12:00</option>
                                        <option value="13:00">13:00</option>
                                        <option value="14:00">14:00</option>
                                        <option value="15:00">15:00</option>
                                        <option value="16:00">16:00</option>
                                        <option value="17:00">17:00</option>
                                        <option value="18:00">18:00</option>
                                        <option value="19:00">19:00</option>
                                        <option value="20:00">20:00</option>
                                        <option value="21:00">21:00</option>
                                        <option value="22:00">22:00</option>
                                        <option value="23:00">23:00</option>
                                        <option value="00:00">00:00</option>
                                        <option value="01:00">01:00</option>
                                        <option value="02:00">02:00</option>
                                        <option value="03:00">03:00</option>
                                        <option value="04:00">04:00</option>
                                        <option value="05:00">05:00</option>
                                    </select>
                                </div>
                                <div class="col-3 my-1">
                                    <label class="text-center" for="text4"><span style="white-space: nowrap">종료 시간</span></label>
                                    <select class="form-control" id="text4">
                                        <option value="06:00">06:00</option>
                                        <option value="07:00">07:00</option>
                                        <option value="08:00">08:00</option>
                                        <option value="09:00">09:00</option>
                                        <option value="10:00">10:00</option>
                                        <option value="11:00">11:00</option>
                                        <option value="12:00">12:00</option>
                                        <option value="13:00">13:00</option>
                                        <option value="14:00">14:00</option>
                                        <option value="15:00">15:00</option>
                                        <option value="16:00">16:00</option>
                                        <option value="17:00">17:00</option>
                                        <option value="18:00">18:00</option>
                                        <option value="19:00">19:00</option>
                                        <option value="20:00">20:00</option>
                                        <option value="21:00">21:00</option>
                                        <option value="22:00">22:00</option>
                                        <option value="23:00">23:00</option>
                                        <option value="00:00">00:00</option>
                                        <option value="01:00">01:00</option>
                                        <option value="02:00">02:00</option>
                                        <option value="03:00">03:00</option>
                                        <option value="04:00">04:00</option>
                                        <option value="05:00">05:00</option>
                                    </select>
                                </div>
                                <input id="operation-times" hidden name="operation-times">
                                <div class="button-container col my-1">
                                    <button type="button" class="btn btn-light btn-sm m-1" onclick="generateResult()">추가</button>
                                    <button type="button" class="btn btn-light btn-sm m-1" onclick="deleteResult()">삭제</button>
                                </div>

                            </div>
                            <div class="row">
                                <div class="form-group">
                                    <div class="result-container " id="result"></div>
                                </div>
                            </div>
                            <div class="mt-3"> 쉬는날
                                <input id="day-offs" hidden name="day-offs">
                                <div class="row">
                                    <div id="day1" class="col text-center border rounded m-1" onclick="addDayOff('day1')"><span style="white-space: nowrap">월요일</span></div>
                                    <div id="day2" class="col text-center border rounded m-1" onclick="addDayOff('day2')"><span style="white-space: nowrap">화요일</span></div>
                                    <div id="day3" class="col text-center border rounded m-1" onclick="addDayOff('day3')"><span style="white-space: nowrap">수요일</span></div>
                                    <div id="day4" class="col text-center border rounded m-1" onclick="addDayOff('day4')"><span style="white-space: nowrap">목요일</span></div>
                                    <div id="day5" class="col text-center border rounded m-1" onclick="addDayOff('day5')"><span style="white-space: nowrap">금요일</span></div>
                                    <div id="day6" class="col text-center border rounded m-1" onclick="addDayOff('day6')"><span style="white-space: nowrap">토요일</span></div>
                                    <div id="day7" class="col text-center border rounded m-1" onclick="addDayOff('day7')"><span style="white-space: nowrap">일요일</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="button-container">
                        <button class="btn btn-primary" type="button" onclick="register()">입력</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function generateResult() {
        const text1 = document.getElementById('text1').value;
        const text2 = document.getElementById('text2').value;
        const text3 = document.getElementById('text3').value;
        const text4 = document.getElementById('text4').value;

        const result = text1 + " ~ " + text2 + " : " + text3 + " ~ " + text4 + ".";
        const resultRow = document.createElement('p');
        resultRow.textContent = result;

        const divResult = document.getElementById('result');

        if (!divResult.hasChildNodes()) {
            divResult.classList.add("form-control");
        }

        divResult.appendChild(resultRow);

        divResult.scrollTop = divResult.scrollHeight;
    }

    function deleteResult() {
        const divResult = document.getElementById('result');

        if (divResult.lastChild) {
            divResult.removeChild(divResult.lastChild);
        }

        if (!divResult.firstChild) {
            divResult.classList.remove("form-control");
        }

    }

    function addDayOff(id) {

        const offDays = document.getElementById("day-offs");
        const offDay = document.getElementById(id);

        const selectedDays = offDays.value.split(",").filter(Boolean);

        if (offDay.classList.contains("clicked")) {
            const index = selectedDays.findIndex(day => day === id);
            if (index !== -1) {
                selectedDays.splice(index, 1);
            }
        } else {
            selectedDays.push(id);
            selectedDays.sort((a, b) => {
                const numA = parseInt(a.match(/\d+/)?.[0]);
                const numB = parseInt(b.match(/\d+/)?.[0]);
                return numA - numB;
            });
        }

        offDays.value = selectedDays.join(",");

        offDay.classList.toggle("clicked");
    }

    function register() {

        const divResult = document.getElementById('result');
        if (divResult === "") {
            alert("영업 시간을 선택해주세요.");
            return;
        }
        const inputResult = document.getElementById('operation-times');
        inputResult.value = divResult.innerText;

        const name = document.getElementById("name");
        if (name === "") {
            alert("가게 이름을 적어주세요.");
            return;
        }

        const text = document.getElementById("text");
        if (text === "") {
            alert("가게 소개를 적어주세요.");
            return;
        }

        let form = document.getElementById("store-details-register-form");
        form.submit();
    }
</script>
</body>
</html>