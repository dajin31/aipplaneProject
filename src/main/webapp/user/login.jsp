<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        }

        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 40px;
            font-weight: normal;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #666;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .login-button {
            width: 100%;
            padding: 12px;
            background-color: #0056b3;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 20px;
        }

        .login-button:hover {
            background-color: #0056b3;
        }

        .links {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .links a {
            color: #666;
            text-decoration: none;
            font-size: 14px;
        }

        .links a:hover {
            text-decoration: underline;
        }

        .error {
            color: red;
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.1.1/crypto-js.min.js"></script>
    <script>
        $(document).ready(function() {
            // 유효성 검사 초기화
            $("#id").on("input", function () {
                $("#idError").text("").removeClass("error");
            });
            $("#password").on("input", function () {
                $("#passwordError").text("").removeClass("error");
            });

            // 로그인 폼 제출 이벤트 핸들러
            $("#loginForm").submit(function(event) {
                event.preventDefault(); // 기본 제출 동작 방지

                const userId = $("#id").val().trim();
                const password = $("#password").val(); // 암호화하지 않고 그대로 사용

                // 유효성 검사
                if (!userId) {
                    $("#idError").text("아이디를 입력해주세요.").addClass("error");
                    $("#id").focus();
                    return;
                }
                if (!password) {
                    $("#passwordError").text("비밀번호를 입력해주세요.").addClass("error");
                    $("#password").focus();
                    return;
                }

                // 로딩 표시
                $("#loginButton").prop("disabled", true).text("로그인 중...");

                // fetch 요청
                fetch("<%=request.getContextPath()%>/user/login.do", {
                    method: "POST",
                    headers: { "Content-Type": "application/json; charset=utf-8" },
                    body: JSON.stringify({ user_id: userId, user_pw: password }) // 'userPw' 대신 'password' 사용
                })
                    .then(res => res.json())
                    .then(data => {
                        // 로딩 표시 제거
                        $("#loginButton").prop("disabled", false).text("로그인");

                        if (data.result === "success") {
                            alert("로그인 성공!");
                            location.href = "<%=request.getContextPath()%>/user/test.jsp";
                        } else if (data.result === "fail") {
                            $("#loginError").text(data.message || "아이디 또는 비밀번호가 일치하지 않습니다.").addClass("error");
                        } else {
                            $("#loginError").text(data.message || "서버 오류 발생!").addClass("error"); // 서버 오류 메시지 표시
                        }
                    })
                    .catch(err => {
                        // 로딩 표시 제거
                        $("#loginButton").prop("disabled", false).text("로그인");

                        console.error("로그인 오류:", err);
                        $("#loginError").text("서버 오류 발생!").addClass("error");
                    });
            });

        });


    </script>
</head>
<body>
<div class="login-container">
    <h1>로그인</h1>
    <form id="loginForm" action="">
        <div class="form-group">
            <label for="id">Id</label>
            <input type="text" id="id" name="id" required>
            <span id="idError" class="error"></span>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
            <span id="passwordError" class="error"></span>
        </div>
        <button type="submit" class="login-button" id="loginButton">Log in</button>
        <div id="loginError" class="error"></div>
        <div class="links">
            <a href="find_pw.jsp">아이디 찾기</a>
            <a href="find_pw.jsp">비밀번호 찾기</a>
        </div>
    </form>
</div>
</body>
</html>