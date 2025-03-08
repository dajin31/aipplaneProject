<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert title here</title>

    <script src="<%=request.getContextPath() %>/js/jquery-3.7.1.js"></script>

    <script src="<%=request.getContextPath() %>/jquery.serializejson.min.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        h2 {
            font-size: 1.8rem;
            margin-bottom: 20px;
            color: #333;
            font-weight: bold;
        }

        .form-group {
            position: relative;
        }

        .control-label {
            font-weight: bold;
            color: #555;
            font-size: 1rem;
            position: absolute;
            top: 8px; /* 라벨 상단 위치 */
            left: 0; /* 라벨 왼쪽 위치 */
        }

        input.form-control {
            width: 100%;
            padding: 12px;
            margin-top: 50px; /* 라벨 높이만큼 여백 추가 */
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            box-sizing: border-box;
        }

        input[type="button"], button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
            padding: 12px 20px;
            border-radius: 5px;
            width: 100%;
            margin-top: 20px;
            font-size: 1.1rem;
        }

        input[type="button"]:hover, button:hover {
            background-color: #007bff;
        }

        #idcheck {
            width: auto;
            margin-left: 10px;
            padding: 8px 15px;
            font-size: 0.9rem;
        }

        #idspan, #joinspan {
            color: red;
            font-size: 0.9rem;
            margin-top: 5px;
            display: block;
        }

        .form-group input {
            margin-bottom: 10px;
        }

        #captchaImage {
            margin-top: 50px; /* 원하는 값으로 조정 */
        }

    </style>



    <script>
        $(function() {
            // id 중복검사
            $("#idcheck").on("click", function() {
                const userId = $("#id").val();
                if(userId.length == 0){
                    alert("아이디를 입력하세요.");
                    $("#id").focus();
                    return;
                }

                $.ajax({
                    url: "<%=request.getContextPath()%>/idCheck.do",
                    method: "get",
                    data: "user_id=" + userId,
                    success: function(data){
                        console.log(data);
                        $("#idspan").html(data.result).css("color", "red");
                    },
                    error: function(xhr){
                        alert("오류 상태값 : " + xhr.status);
                    },
                    dataType: "json"
                });
            });

            // 캡차 키 발급 및 이미지 표시
            getCaptcha();

            // 회원가입 처리
            $("#send").on("click", () => {
                // 입력한 모든 값 가져오기
                const vid = $("#id").val();
                const vname = $("#name").val();
                const vpass = $("#pwd").val();
                const vbir = $("#bir").val();
                const vemail = $("#email").val();
                const captchaValue = $("#captchaValue").val();

                // 입력값 검증 (캡차 제외)
                if (!vid || !vpass || !vname || !vbir || !vemail) {
                    alert("필수 정보를 입력하세요.");
                    return;
                }

                // 캡차 입력값 검증
                if (!captchaValue) {
                    alert("캡차를 입력하세요.");
                    return;
                }

                // 생년월일 처리
                if (!/^\d{6}$/.test(vbir)) {
                    alert("생년월일은 6자리 숫자여야 합니다.");
                    return;
                }

                // 캡차 입력값 검증
                verifyCaptcha(function (isCaptchaValid) {
                    if (isCaptchaValid) {

                        // 전송할 데이터 구성
                        const dataObj = {
                            "userId": vid,
                            "userName": vname,
                            "userRegnum": vbir,
                            "userPw": vpass,
                            "userEmail": vemail,
                        };

                        // 서버에 데이터 전송
                        fetch("<%=request.getContextPath()%>/userInsert.do", {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/json; charset=utf-8"
                            },
                            body: JSON.stringify(dataObj)
                        })
                            .then(res => {
                                console.log(res);
                                if (!res.ok) {
                                    return res.json().then(errorData => {
                                        throw new Error(errorData.message || "서버 오류 발생");
                                    });
                                }
                                return res.json();
                            })
                            .then(data => {
                                if (data.result === "success") {
                                    alert("회원가입이 완료되었습니다. 로그인 페이지로 이동합니다.");
                                    location.href = "<%=request.getContextPath()%>/login/login.jsp";
                                } else {
                                    $("#joinspan").html("회원가입 실패").css("color", "red");
                                }
                            })
                            .catch(err => {
                                console.log(err);
                                alert(err.message || "회원가입 중 오류 발생!");
                            });
                    } else {
                        // 캡차 검증 실패 시 오류 메시지 표시
                        alert("캡차를 다시 확인해주세요.");
                        getCaptcha(); // 캡차 새로고침
                    }
                });
            });
        });
        // 캡차 키 발급 및 이미지 표시 함수
        function getCaptcha() {
            $.ajax({
                url: "<%=request.getContextPath()%>/captcha/getNkey",
                success: function(data) {
                    $("#captchaKey").val(data.key);
                    $("#captchaImage").attr("src", "<%=request.getContextPath()%>/captcha/getImage?key=" + data.key);
                },
                error: function(error) {
                    console.error("캡차 키 발급 실패:", error);
                }
            });
        }

        // 캡차 입력값 검증 함수
        function verifyCaptcha(callback) {
            const captchaKey = $("#captchaKey").val();
            const captchaValue = $("#captchaValue").val();

            if (!captchaKey || !captchaValue) {
                alert("캡차를 입력해주세요.");
                callback(false);
                return;
            }

            $.ajax({
                url: "<%=request.getContextPath()%>/captcha/verifyNkey?key=" + captchaKey + "&value=" + captchaValue,
                success: function(data) {
                    callback(data.result);
                },
                error: function(error) {
                    console.error("캡차 검증 실패:", error);
                    alert("캡차 검증 중 오류가 발생했습니다. 다시 시도해주세요.");
                    callback(false);
                }
            });
        }
    </script>


</head>

<body>
<div class="container">
    <h2>회원가입</h2>

    <form class="form-horizontal" onsubmit="return false;">

        <div class="form-group">
            <label class="control-label col-sm-2" for="id">아이디</label>
            <div class="col-sm-2">
                <input type="text" name="userId" class="form-control" id="id" placeholder="id 입력">
            </div>
            <input id="idcheck" type="button" class="btn btn-success btn-sm" value="중복검사">
            <span id="idspan"></span>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="name">이름</label>
            <div class="col-sm-2">
                <input type="text" name="userName" class="form-control" id="name" placeholder="이름 입력">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="bir">생년월일</label>
            <div class="col-sm-2">
                <input type="text" name="birthdate" class="form-control" id="bir" placeholder="YYMMDD">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="pwd">비밀번호</label>
            <div class="col-sm-2">
                <input type="password" name="userPw" class="form-control" id="pwd" placeholder="비밀번호 입력">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2" for="email">이메일</label>
            <div class="col-sm-3">
                <input type="text" name="userEmail" class="form-control" id="email" placeholder="email 입력">
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-2">캡차 이미지</label>
            <div class="col-sm-10">
                <img id="captchaImage" src="" alt="캡차 이미지">
                <input type="hidden" id="captchaKey" name="captchaKey">
                <input type="text" id="captchaValue" name="captchaValue" placeholder="캡차 입력">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button id="send" type="button" class="btn btn-primary btn-lg">회원가입</button>
                <span id="joinspan"></span>
            </div>
        </div>

    </form>
</div>
</body>

</html>
