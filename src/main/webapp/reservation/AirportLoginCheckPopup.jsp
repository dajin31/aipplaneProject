<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Malgun Gothic', sans-serif;
        }
        body {
            margin: 0;
            padding: 16px;
            background-color: #fff;
        }
        .container {
            max-width: 420px;
            margin: 0 auto;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .header h1 {
            font-size: 20px;
            margin: 0;
        }
        .close-btn {
            font-size: 24px;
            background: none;
            border: none;
            cursor: pointer;
        }
        .tabs {
            display: flex;
            border-bottom: 1px solid #ddd;
            margin-bottom: 20px;
        }
        .tab {
            flex: 1;
            text-align: center;
            padding: 12px;
            cursor: pointer;
            font-size: 16px;
            color: #666;
        }
        .tab.active {
            color: #000;
            font-weight: bold;
            border-bottom: 3px solid #003087;
        }
        .form-group {
            margin-bottom: 24px;
        }
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            color: #666;
        }
        .form-label .required {
            color: #e74c3c;
        }
        .form-control {
            width: 100%;
            padding: 10px 0;
            border: none;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
            outline: none;
        }
        .form-control:focus {
            border-bottom: 1px solid #003087;
        }
        .checkbox-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .checkbox-label {
            display: flex;
            align-items: center;
            font-size: 14px;
            cursor: pointer;
        }
        .find-account {
            color: #003087;
            text-decoration: none;
            font-size: 14px;
        }
        .login-btn {
            width: 100%;
            padding: 16px;
            background-color: #003087;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-bottom: 20px;
        }
        .find-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 30px;
        }
        .find-link {
            color: #333;
            text-decoration: none;
            font-size: 14px;
        }
        .divider {
            color: #ddd;
        }
        .social-login-text {
            text-align: center;
            margin-bottom: 20px;
            color: #666;
            font-size: 14px;
        }
        .social-login {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .social-btn {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-decoration: none;
        }
        .social-icon {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 8px;
        }
        .social-name {
            font-size: 12px;
            color: #333;
        }
        .naver {
            background-color: #1EC800;
            color: white;
        }
        .kakao {
            background-color: #FEE500;
            color: #3C1E1E;
        }
        .google {
            background-color: #FFFFFF;
            border: 1px solid #ddd;
            color: #333;
        }
        .facebook {
            background-color: #3B5998;
            color: white;
        }
        .apple {
            background-color: #000;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>로그인</h1>
        <button class="close-btn">&times;</button>
    </div>

    <div class="tabs">
        <div class="tab active">아이디</div>

    </div>

        <div class="form-group">
            <label class="form-label">아이디<span class="required">*</span></label>
            <input type="text" class="form-control" name="userId" required id="userId">
        </div>

        <div class="form-group">
            <label class="form-label">비밀번호<span class="required">*</span></label>
            <input type="password" class="form-control" name="password" required id="userPw">
        </div>

        <div class="checkbox-container">

            <%--회원가입 페이지 구현후 연동 예정--%>
            <a href="<%=request.getContextPath()%>/user/userJoin.jsp" class="find-account">회원가입 &gt;</a>
        </div>

        <button type="submit" class="login-btn" id="loginBtn">로그인</button>

    <div class="find-links">
        <%--로그인 페이지 구현후 연동 예정--%>
        <a href="<%=request.getContextPath()%>/user/find_id.jsp" class="find-link">아이디 찾기</a>
        <span class="divider">|</span>
        <a href="<%=request.getContextPath()%>/user/find_pw.jsp" class="find-link">비밀번호 찾기</a>
    </div>

    <div class="social-login-text">다른 계정으로 로그인</div>

    <div class="social-login">
        <a href="" class="social-btn">
            <div class="social-icon naver">N</div>
            <span class="social-name">네이버</span>
        </a>
        <a href="" class="social-btn">
            <div class="social-icon kakao">K</div>
            <span class="social-name">카카오</span>
        </a>
        <a href="" class="social-btn">
            <div class="social-icon google">G</div>
            <span class="social-name">구글</span>
        </a>
        <a href="" class="social-btn">
            <div class="social-icon facebook">f</div>
            <span class="social-name">페이스북</span>
        </a>
        <a href="" class="social-btn">
            <div class="social-icon apple">
                <svg width="16" height="16" viewBox="0 0 16 16" fill="currentColor">
                    <path d="M12.6 6.5c-.2-1.7 1.4-2.6 1.4-2.6-1.2-1.8-3-2-3-2-.2-.2-1.2-.9-2.8-.8-1.5.1-2.7.9-3.4 2-1.3 2.2-.3 5.5 1 7.3.7.9 1.5 2 2.5 1.9 1-.1 1.4-.6 2.6-.6 1.2 0 1.6.6 2.6.6 1.1 0 1.8-1 2.4-1.9.5-.7.9-1.5 1-1.5-.1 0-1.8-.7-1.8-2.4 0-1.5 1.2-2.2 1.2-2.2-.6-1-1.7-1.1-2-1.1z"/>
                    <path d="M10.9 2c.5-.7.9-1.6.8-2.5-.8 0-1.7.5-2.2 1.2-.5.6-.9 1.5-.8 2.4.9.1 1.7-.4 2.2-1.1z"/>
                </svg>
            </div>
            <span class="social-name">Apple</span>
        </a>
    </div>
</div>

<script>
    const urlParams = new URLSearchParams(window.location.search);
    const passengerValue = decodeURIComponent(urlParams.get("passengerValue"));
    const classvalue = decodeURIComponent(urlParams.get("classValue"));
    const start = decodeURIComponent(urlParams.get("start"));
    const end = decodeURIComponent(urlParams.get("end"));
    const departDate =urlParams.get("departDate")
    const returnDate = urlParams.get("returnDate")
    const fltCode = urlParams.get("fltCode")
    const selectedList = urlParams.get("selectedList")
    const totalPrice = urlParams.get("totalPrice")


    console.log(passengerValue)
    console.log(classvalue)
    console.log(start)
    console.log(end)
    console.log(departDate)
    console.log(returnDate)
    console.log(fltCode)
    console.log(selectedList)
    console.log(totalPrice)

    document.querySelector('.close-btn').addEventListener('click',()=>{
        window.close();
    })

    document.getElementById("loginBtn").addEventListener('click',()=>{
        const userId = document.getElementById("userId").value;
        const userPw = document.getElementById("userPw").value;

        console.log(userId);
        console.log(userPw);

        let url = "/mileage/mileagePaymentPage/searchUser?userId=" + userId + "&userPw=" + userPw;

        fetch(url)
            .then(response=>response.json())
            .then(data=>{
                console.log(data)

                if (data == 1) {
                    alert("로그인 성공")
                    window.location.href="/reservation/travelInfoPayment?classValue=" + encodeURIComponent(classvalue) + "&passengerValue=" + encodeURIComponent(passengerValue)
                        + "&start=" + encodeURIComponent(start) + "&end=" + encodeURIComponent(end)+ "&departDate=" + departDate +  "&returnDate=" + returnDate + "&selectedList=" + selectedList + "&fltCode=" + fltCode + "&totalPrice=" + totalPrice + "&userId=" + userId;
                }else {
                    alert("로그인 실패")
                }
        })
    })
</script>
</body>
</html>

