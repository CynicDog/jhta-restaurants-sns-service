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
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<div class="container">
    <div class="row my-2 justify-content-center align-items-center">
        <div class="col-md-6">
            <div class="card shadow my-5">
                <div class="card-header">가입</div>
                <div class="card-body">
                    <div class="row my-2 p-2">
                        <form method="post" action="signup" modelAttribute="userCommand">
                            <div class="form-group my-3">
                                <input type="text" class="form-control" name="username" placeholder="유저 아이디"/>
                            </div>
                            <div class="form-group my-3">
                                <input type="password" class="form-control" name="password" placeholder="비밀번호"/>
                            </div>
                            <div class="form-group my-3">
                                <input type="text" class="form-control" name="fullName" placeholder="성함"/>
                            </div>
                            <div class="form-group my-3">
                                <input type="email" class="form-control" name="email" placeholder="이메일"/>
                            </div>
                            <div class="form-group my-3">
                                <input type="text" class="form-control" name="phone" placeholder="010-9999-9999"/>
                            </div>
                            <div class="form-group my-3">
                                <div class="row">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col-8">
                                                <input type="date" class="form-control" name="birthday"/>
                                            </div>
                                            <div class="col-4">
                                                <select class="form-select" name="gender">
                                                    <option value="">성별</option>
                                                    <option value="male">남</option>
                                                    <option value="female">여</option>
                                                    <option value="other">그 외</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="text-end my-2">
                                <button id="signupButton" class="btn btn-outline-secondary btn-sm">submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const signupButton = document.getElementById("signupButton");

        const usernameInput = document.querySelector('input[name="username"]');
        const passwordInput = document.querySelector('input[name="password"]');
        const fullNameInput = document.querySelector('input[name="fullName"]');
        const emailInput = document.querySelector('input[name="email"]');
        const phoneInput = document.querySelector('input[name="phone"]');
        const birthdayInput = document.querySelector('input[name="birthday"]');
        const genderInput = document.querySelector('select[name="gender"]');

        function displayErrorMessage(input, message) {

            input.classList.add('is-invalid');

            const errorDiv = document.createElement('div');
            errorDiv.className = 'invalid-feedback';
            errorDiv.textContent = message;

            const parentDiv = input.parentElement;
            parentDiv.appendChild(errorDiv);
        }

        function removeErrorMessage(input) {

            input.classList.remove('is-invalid');

            const parentDiv = input.parentElement;
            const errorDiv = parentDiv.querySelector('.invalid-feedback');
            if (errorDiv) {
                parentDiv.removeChild(errorDiv);
            }
        }

        function displaySuccessMessage(input) {
            input.classList.add("is-valid");
        }

        function removeSuccessMessage(input) {
            input.classList.remove("is-valid");
        }

        usernameInput.addEventListener("blur", function () {
            removeErrorMessage(this);
            if (this.value.trim() === '') {
                displayErrorMessage(this, "필수 입력 사항입니다.");
            } else {
                removeSuccessMessage(this);
                displaySuccessMessage(this);
            }
        });

        passwordInput.addEventListener("blur", function () {
            removeErrorMessage(this);
            if (this.value.trim() === '') {
                displayErrorMessage(this, "필수 입력 사항입니다.");
            } else {
                removeSuccessMessage(this);
                displaySuccessMessage(this);
            }
        });

        fullNameInput.addEventListener("blur", function () {
            const koreanNamePattern = /^[가-힣]{2,5}$/;

            removeErrorMessage(this);
            if (this.value.trim() === '') {
                displayErrorMessage(this, "필수 입력 사항입니다.")
            } else if (!koreanNamePattern.test(this.value.trim())) {
                displayErrorMessage(this, "올바른 형식의 성함을 적어주세요.");
            } else {
                removeSuccessMessage(this);
                displaySuccessMessage(this);
            }
        })

        emailInput.addEventListener("blur", function () {
            removeErrorMessage(this);
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(this.value.trim())) {
                displayErrorMessage(this, "올바른 형식의 이메일을 적어주세요.");
            } else {
                removeSuccessMessage(this);
                displaySuccessMessage(this);
            }
        });

        phoneInput.addEventListener("blur", function () {
            const phonePattern = /^010-[0-9]{4}-[0-9]{4}$/;

            removeErrorMessage(this);
            if (this.value.trim() === '') {
                displayErrorMessage(this, "필수 입력 사항입니다.");
            } else if (!phonePattern.test(this.value.trim())) {
                displayErrorMessage(this, "올바른 형식의 전화번호를 적어주세요.");
            } else {
                removeSuccessMessage(this);
                displaySuccessMessage(this);
            }
        });

        birthdayInput.addEventListener("blur", function () {
            removeErrorMessage(this);
            if (this.value.trim() === '') {
                displayErrorMessage(this, "필수 입력 사항입니다.");
            } else {
                removeSuccessMessage(this);
                displaySuccessMessage(this);
            }
        });

        genderInput.addEventListener("blur", function () {
            removeErrorMessage(this);
            if (this.value === '') {
                displayErrorMessage(this, "성별을 선택해주세요.");
            } else {
                removeSuccessMessage(this);
                displaySuccessMessage(this);
            }
        });

        signupButton.addEventListener("click", function (event) {
            event.preventDefault();

            const errorMessages = document.querySelectorAll('.invalid-feedback');
            if (errorMessages.length > 0) {
                // do nothing

            } else {
                const formData = {
                    username: usernameInput.value.trim(),
                    password: passwordInput.value.trim(),
                    fullName: fullNameInput.value.trim(),
                    email: emailInput.value.trim(),
                    phone: phoneInput.value.trim(),
                    birthday: birthdayInput.value,
                    gender: genderInput.value
                };

                fetch("/user/signup", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json"
                    },
                    body: JSON.stringify(formData)
                })
                    .then(response => {
                        if (response.ok) {
                            const email = encodeURIComponent(formData.email);

                            fetch(`/user/otp?email=\${email}`, {
                                method: "GET"
                            }).then(response => {
                                if (response.ok) {
                                    // modal pop up then validate
                                }
                            });
                        } else {
                            // constraints violation
                        }
                    })
                    .catch(error => {
                        // handle errors by showing toast
                    });
            }
        });
    });
</script>
</body>
</html>