<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Application</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>
    .nav-link.my-3.active {
        font-weight: lighter;
        background-color: #AEAEAE;
    }
</style>
<body>
<%@ include file="../../common/navbar.jsp" %>
<div class="container-fluid">
    <div class="row justify-content-center align-items-center">
        <div class="col-md-6 col-sm-6">
            <div class="card shadow my-5 menu-input-group">
                <div class="row p-3">
                    <div class="col-4">
                        <nav id="navbar-example3" class="h-100 flex-column align-items-stretch pe-4 border-end">
                            <nav class="nav nav-pills flex-column fw-lighter">
                                <a class="nav-link my-3 text-secondary" href="#item-1">Store</a>
                                <a class="nav-link my-3 text-secondary" href="#item-2">Address</a>
                                <a class="nav-link my-3 text-secondary" href="#item-3">Menu</a>
                                <a class="nav-link my-3 text-secondary" href="#item-4">Hours</a>
                            </nav>
                        </nav>
                    </div>
                    <div class="col-8">
                        <div data-bs-spy="scroll" data-bs-target="#navbar-example3" data-bs-smooth-scroll="false"
                             class="shadow-sm rounded p-3 " tabindex="0" style="height: 550px; overflow-y: scroll;">
                            <div>
                                <div id="store-info-input-area" class="mb-5">
                                    <div class="row my-4 p-2" id="item-1">
                                        <div class="col-8 fw-lighter fs-3 d-flex my-1">Store</div>
                                    </div>
                                    <div>
                                        <div class="form-floating my-3">
                                            <input type="text" class="form-control-plaintext" name="name" id="name"
                                                   placeholder=""/>
                                            <label class="fw-lighter d-flex" for="name">Name
                                                <div class="ms-auto">
                                                    <div id="nameValidation" style="display: none;">
                                                        <i class="bi bi-check-lg mx-2 text-success"></i>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="form-floating my-3">
                                            <input type="text" class="form-control-plaintext" name="phone" id="phone"
                                                   placeholder=""/>
                                            <label class="fw-lighter d-flex" for="name">Phone
                                                <div class="ms-auto">
                                                    <div id="phoneValidation" style="display: none;">
                                                        <i class="bi bi-check-lg mx-2 text-success"></i>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="form-floating my-3">
                                            <input type="text" class="form-control-plaintext" name="buizLicense"
                                                   id="buizLicense" placeholder=""/>
                                            <label class="fw-lighter d-flex" for="name">Business License
                                                <div class="ms-auto">
                                                    <div id="buizLicenseValidation" style="display: none;">
                                                        <i class="bi bi-check-lg mx-2 text-success"></i>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-5">
                                <div id="address-input-area" class="mb-5">
                                    <div class="row my-4 p-2" id="item-2">
                                        <div class="col-8 fw-lighter fs-3 d-flex my-1">Address</div>
                                        <div class="col-4 d-flex justify-content-end my-1">
                                            <i id="addressLookupIcon" class="bi bi-search my-2"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="form-floating my-3">
                                            <input type="text" class="form-control-plaintext" name="zipCode"
                                                   id="zipCode"
                                                   placeholder=" " disabled/>
                                            <label class="fw-lighter d-flex" for="name">Postal Code
                                                <div class="ms-auto">
                                                    <div id="zipCodeValidation" style="display: none;">
                                                        <i class="bi bi-check-lg mx-2 text-success"></i>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="form-floating my-3">
                                            <input type="text" class="form-control-plaintext" name="address"
                                                   id="address"
                                                   placeholder=" " disabled/>
                                            <label class="fw-lighter d-flex" for="name">Address
                                                <div class="ms-auto">
                                                    <div id="addressValidation" style="display: none;">
                                                        <i class="bi bi-check-lg mx-2 text-success"></i>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="form-floating my-3">
                                            <input type="text" class="form-control-plaintext" name="addressDetail"
                                                   id="addressDetail" placeholder=""/>
                                            <label class="fw-lighter d-flex" for="name">Additional address
                                                <div class="ms-auto">
                                                    <div id="addressDetailValidation" style="display: none;">
                                                        <i class="bi bi-check-lg mx-2 text-success"></i>
                                                    </div>
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-5">
                                <div id="menu-input-area" class="mb-5" style="height: 200px">
                                    <div class="row my-4 p-2" id="item-3">
                                        <div class="col-8 fw-lighter fs-3 d-flex my-1">Add Menu</div>
                                        <div class="col-4 d-flex justify-content-end my-1">
                                            <i type="button" id="foodAddIcon" class="bi bi-plus-circle my-2"></i>
                                        </div>
                                    </div>
                                    <div id="foodOutputArea">
                                    </div>
                                </div>
                                <hr class="my-5">
                                <div id="operation-time-input-area" class="mb-5" style="height: 200px">
                                    <div class="row my-4 p-2" id="item-4">
                                        <div class="col-8 fw-lighter fs-3 d-flex my-1">Opening Hours</div>
                                        <div class="col-4 d-flex justify-content-end my-1">
                                            <i type="button" id="hourAddIcon" class="bi bi-plus-circle my-2"></i>
                                        </div>
                                    </div>
                                    <div id="hourOutputArea">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="toast-container position-fixed bottom-0 end-0 p-4">
    <div id="successfulToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body">
                Successfully registered the menu :)
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto"
                    data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
    <div id="menuAddToast" class="toast toast-add-menu" role="alert" aria-live="assertive" aria-atomic="true"
         data-bs-autohide="false">
        <div class="toast-body">
            <div class="row">
                <div class="col">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div class="fw-lighter fs-4">Menu</div>
                        <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                    </div>
                    <div>
                        <label class="fw-lighter d-flex" for="foodName">Name
                            <div id="foodNameValidationMessage" class="text-danger mx-2" style="display: none;"></div>
                        </label>
                        <input class="form-control-plaintext" id="foodName" name="foodName">
                    </div>
                    <div>
                        <label class="fw-lighter d-flex" for="foodName">Price
                            <div id="foodPriceValidationMessage" class="text-danger mx-2" style="display: none;"></div>
                        </label>
                        <input class="form-control-plaintext" id="foodPrice" name="foodPrice">
                    </div>
                </div>
                <div class="d-flex justify-content-end align-items-end">
                    <i id="foodAddRequestIcon" class="bi bi-pencil-square fs-6 m-1"
                       style="color: #838383; display: none"></i>
                </div>
            </div>
        </div>
    </div>
    <div id="hourAddToast" class="toast toast-add-menu" role="alert" aria-live="assertive" aria-atomic="true"
         data-bs-autohide="false">
        <div class="toast-body">
            <div class="row">
                <div class="col">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div class="fw-lighter fs-4">Opening hours</div>
                    </div>
                    <div>
                        <div class="fw-lighter d-flex" for="day">Day
                            <div id="dayValidationMessage" class="text-danger mx-2" style="display: none;"></div>
                        </div>
                        <div class="fs-6 mx-3 my-2" id="days">
                            <div type="button" class="badge rounded-pill text-bg-light day-button">Mon</div>
                            <div type="button" class="badge rounded-pill text-bg-light day-button">Tue</div>
                            <div type="button" class="badge rounded-pill text-bg-light day-button">Wed</div>
                            <div type="button" class="badge rounded-pill text-bg-light day-button">Thu</div>
                            <div type="button" class="badge rounded-pill text-bg-light day-button">Fri</div>
                            <div type="button" class="badge rounded-pill text-bg-light day-button">Sat</div>
                            <div type="button" class="badge rounded-pill text-bg-light day-button">Sun</div>
                        </div>
                    </div>
                    <div>
                        <div class="fw-lighter d-flex mt-4" for="foodName">Hour
                            <div id="hourValidationMessage" class="text-danger mx-2" style="display: none;"></div>
                        </div>
                        <div class="fs-6 mx-3 my-2" id="hours">
                            <div class="my-3">
                                <div class="my-1">
                                    <label for="openingTime" class="fw-lighter fs-6">opening</label>
                                    <input id="openingTime" class="form-control-plaintext fw-light" type="time" name="openingTime">
                                </div>
                                <div class="my-1">
                                    <label for="closingTime" class="fw-lighter fs-6">closing</label>
                                    <input id="closingTime" class="form-control-plaintext fw-light" type="time" name="closingTime">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-end align-items-end">
                    <i id="hourAddRequestIcon" class="bi bi-pencil-square fs-6 m-1"
                       style="color: #838383; display: none"></i>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {

        const scrollSpy = new bootstrap.ScrollSpy(document.body, {
            target: '#navbar-example3'
        })

        const addressLookupIcon = document.getElementById('addressLookupIcon')
        const foodAddIcon = document.getElementById('foodAddIcon')
        const foodAddRequestIcon = document.getElementById('foodAddRequestIcon')

        const foodNameInput = document.querySelector('input[name="foodName"]')
        const foodPriceInput = document.querySelector('input[name="foodPrice"]')

        const foodOutputArea = document.getElementById('foodOutputArea');

        let foodValidationStatus = {
            foodName: false,
            foodPrice: false
        }

        const hourAddIcon = document.getElementById('hourAddIcon')
        const hourAddRequestIcon = document.getElementById('hourAddRequestIcon')

        const daysDiv = document.getElementById('days');
        const dayButtons = document.querySelectorAll('.day-button');

        let hourValidationStatus = {
            days: false,
            hours: false
        }
        const dayValidationMessage = document.getElementById("dayValidationMessage");

        const selectedDays = {};

        addressLookupIcon.addEventListener("click", function () {
            console.log("hi");
            new daum.Postcode({
                oncomplete: function (data) {

                    let address = '';
                    let addressDetail = '';

                    if (data.userSelectedType === 'R') {
                        address = data.roadAddress;
                    } else {
                        addressDetail = data.jibunAddress;
                    }

                    if (data.userSelectedType === 'R') {
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            addressDetail += data.bname;
                        }
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            addressDetail += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        if (addressDetail !== '') {
                            addressDetail = ' (' + addressDetail + ')';
                        }

                        document.getElementById("addressDetail").value = addressDetail;

                    } else {
                        document.getElementById("addressDetail").value = '';
                    }

                    document.getElementById('zipCode').value = data.zonecode;
                    document.getElementById("address").value = address;
                    document.getElementById("addressDetail").focus();
                }
            }).open();
        })

        foodAddIcon.addEventListener("click", function () {
            let menuAddToast = document.getElementById('menuAddToast')
            const menuAddToastBootstrap = bootstrap.Toast.getOrCreateInstance(menuAddToast)
            menuAddToastBootstrap.show()
        })

        foodNameInput.addEventListener("blur", function () {
            if (this.value.trim() === '') {
                foodValidationStatus.foodName = false;
            } else {
                const foodName = encodeURIComponent(this.value.trim())

                fetch(`/owner/unique-food?foodName=\${foodName}`, {
                    method: "GET"
                }).then(response => {
                    if (response.ok) {
                        // unique food name
                        foodValidationStatus.foodName = true;
                        document.getElementById("foodNameValidationMessage").style.display = "none";

                    } else {
                        // already exists
                        foodValidationStatus.foodName = false;

                        response.text().then(message => {
                            document.getElementById("foodNameValidationMessage").textContent = message;
                            document.getElementById("foodNameValidationMessage").style.display = "block";
                        });
                    }
                })
            }
            updateFoodAddRequestIcon();
        })

        foodPriceInput.addEventListener("input", function () {
            if (!/^[0-9]+$/.test(this.value.trim())) {
                foodValidationStatus.foodPrice = false;
                document.getElementById("foodPriceValidationMessage").textContent = "(numeric values only)";
                document.getElementById("foodPriceValidationMessage").style.display = "block";
            } else {
                foodValidationStatus.foodPrice = true;
                document.getElementById("foodPriceValidationMessage").style.display = "none";
            }
            updateFoodAddRequestIcon();
        })

        foodAddRequestIcon.addEventListener("click", function () {
            this.style.display = 'none';
            foodAddRequest(foodNameInput.value.trim(), foodPriceInput.value.trim());

            this.style.display = 'block'
        });

        // event delegation
        foodOutputArea.addEventListener('click', function (event) {
            if (event.target.classList.contains('remove-food-btn')) {

                const foodName = event.target.getAttribute('data-food-name');
                const foodSpan = document.getElementById(foodName);
                if (foodSpan) {
                    foodSpan.remove();
                }

                foodRemoveRequest(foodName);
            }
        });

        function foodAddRequest(foodName, foodPrice) {
            const formData = {
                foodName: foodName,
                foodPrice: foodPrice
            }

            fetch('/owner/register-food', {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify(formData)
            }).then(response => {
                if (response.ok) {
                    return response.json();
                }
            }).then(data => {
                clearFoodInputs()
                showSuccessfulToast()

                const food = data

                foodOutputArea.innerHTML += `
                    <span id="\${food.foodName}" class="position-relative badge rounded-pill text-bg-light mx-1">
                        \${food.foodName}
                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary-subtle text-danger remove-food-btn" data-food-name="\${food.foodName}">
                            x
                        </span>
                    </span>

                `;
            });
        }

        hourAddIcon.addEventListener('click', function () {
            let hourAddToast = document.getElementById('hourAddToast')
            const hourAddToastBootstrap = bootstrap.Toast.getOrCreateInstance(hourAddToast)
            hourAddToastBootstrap.show()
        })

        // To avoid adding days that are already registered when the page is reloaded, instead of finalizing the operation hours registration in a complete way.
        dayButtons.forEach(disableNonUniqueDays);

        daysDiv.addEventListener('click', function (event) {
            if (event.target.classList.contains('day-button')) {
                const dayButton = event.target;
                const dayName = dayButton.textContent.trim();

                dayButton.classList.toggle('text-bg-primary');
                dayButton.classList.toggle('text-bg-light');

                if (dayButton.classList.contains('text-bg-primary')) {
                    selectedDays[dayName] = true;
                } else {
                    delete selectedDays[dayName];
                }

                fetch(`/owner/unique-day?dayName=\${dayName}`, {
                    method: "GET"
                }).then(response => {
                    // 1. if unique, then add the day in the session
                    if (response.ok) {
                        hourValidationStatus.days = Object.values(selectedDays).some(selected => selected === true);

                        // where..?
                        // dayValidationMessage.style.display = "none";

                        fetch(`/owner/register-day?dayName=\${dayName}`, {
                            method: "POST"
                        }).then(response => {
                            if (response.ok) {
                                // do nothing
                            } else {
                                // do nothing
                            }
                        })
                    }
                    // 2. if not unique, then remove the day in the session
                    else {
                        hourValidationStatus.days = false;
                        response.text().then(message => {
                            if (dayButton.classList.contains('text-bg-primary')) {
                                dayValidationMessage.textContent = message;
                                dayValidationMessage.style.display = "block";
                            }
                        })

                        fetch(`/owner/remove-day?dayName=\${dayName}`, {
                            method: "POST"
                        }).then(response => {
                            if (response.ok) {
                                // do nothing
                            } else {
                                // do nothing
                            }
                        })
                    }
                })
                updateHourAddRequestIcon()
            }
        });

        function foodRemoveRequest(foodName) {
            // Perform fetch or AJAX request to remove the food item
            fetch(`/owner/remove-food?foodName=\${foodName}`, {
                method: "POST"
            })
                .then(response => {
                    console.log(foodName)
                    if (response.ok) {
                        // do nothing
                    }
                });
        }

        function disableNonUniqueDays(dayButton) {
            const dayName = dayButton.textContent.trim();

            fetch(`/owner/unique-day?dayName=\${dayName}`, {
                method: "GET"
            }).then(response => {
                if (!response.ok) {
                    dayButton.style.pointerEvents = "none";
                    dayButton.classList.add('text-bg-disabled', 'text-secondary');
                }
            });
        }

        function showSuccessfulToast() {
            const successfulToast = document.getElementById('successfulToast');
            const successfulToastBootstrap = bootstrap.Toast.getOrCreateInstance(successfulToast);
            successfulToastBootstrap.show();
        }

        function clearFoodInputs() {
            document.querySelector('input[name="foodName"]').value = '';
            document.querySelector('input[name="foodPrice"]').value = '';
            foodValidationStatus.foodName = false;
            foodValidationStatus.foodPrice = false;

            foodAddRequestIcon.style.display = 'none';
            new bootstrap.Toast(document.querySelector('.toast.toast-add-menu')).hide();

            updateFoodAddRequestIcon();
        }

        function updateFoodAddRequestIcon() {
            const isValid = Object.values(foodValidationStatus).every(status => status === true);
            foodAddRequestIcon.style.display = isValid ? 'block' : 'none';
        }

        function updateHourAddRequestIcon() {
            const isValid = Object.values(hourValidationStatus).every(status => status === true);
            hourAddRequestIcon.style.display = isValid ? 'block' : 'none';
        }
    });
</script>
</body>
</html>