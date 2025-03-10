<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>헤더</title>
    <style>
        header {
            background-color: #ffffff;
            padding: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 100;
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo img {
            height: 100px;
            margin-left: 20px;
        }

        .nav {
            margin-left: 20px;
        }

        .nav-list {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: space-around; /* 메뉴 항목 균등 배치 */
            width: 100%;
        }

        .nav-item {
            position: relative;
            flex-grow: 1;
            margin: 0 100px; /* 좌우 여백 추가 */
        }

        .nav-item a {
            text-decoration: none;
            color: #000000;
            padding: 5px 10px;
            font-size: 20px; /* 글씨 크기 조절 */
            font-weight: bold; /* 글씨 두께 조절 */
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #fff;
            list-style: none;
            padding: 0;
            margin: 0;
            border: 1px solid #ffffff;
            z-index: 1;
            width: 100%;
        }

        .nav-item:hover .dropdown-menu {
            display: block;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
            top: calc(100% + 5px); /* 드롭다운 메뉴 위치 조정 */
            min-width: 150px; /* 드롭다운 메뉴 최소 너비 설정 */
            left: 50%; /* nav-item 중앙에 배치 */
            transform: translateX(-50%); /* 중앙 정렬 */
        }

        .dropdown-menu li a {
            display: block;
            padding: 5px 10px;
            text-decoration: none;
            color: #333;
            font-size: 16px; /* dropdown-menu 글씨 크기 */
            font-weight: normal; /* dropdown-menu 글씨 두께 */
            text-align: center;
        }

        .dropdown-menu li a:hover {
            background-color: #f0f0f0;
        }
        .auth {
            display: flex;
            text-align: center;
            margin-right: 50px;
        }

        .login-btn {
            background-color: #fff; /* 로그인 버튼 배경색 */
            color: #007bff; /* 로그인 버튼 글자색 */
            padding: 10px 20px; /* 로그인 버튼 내부 여백 */
            border: none; /* 로그인 버튼 테두리 제거 */
            border-radius: 5px; /* 로그인 버튼 모서리 둥글게 */
            font-size: 16px; /* dropdown-menu 글씨 크기 */
            font-weight: bold; /* dropdown-menu 글씨 두께 */
            text-decoration: none;
            margin-left: 10px;
        }

        .join-btn {
            background-color: #fff; /* 로그인 버튼 배경색 */
            color: #007bff; /* 로그인 버튼 글자색 */
            padding: 10px 20px; /* 회원가입 버튼 내부 여백 */
            border: none; /* 회원가입 버튼 테두리 제거 */
            border-radius: 5px; /* 회원가입 버튼 모서리 둥글게 */
            font-size: 16px; /* dropdown-menu 글씨 크기 */
            font-weight: bold; /* dropdown-menu 글씨 두께 */
            text-decoration: none;

        }

        .login-btn:hover {
            background-color: #007bff; /* 마우스 호버 시 로그인 버튼 배경색 */
            color: #fff; /* 마우스 호버 시 로그인 버튼 글자색 */
        }

        .join-btn:hover {
            background-color: #007bff; /* 마우스 호버 시 회원가입 버튼 배경색 */
            color: #fff; /* 마우스 호버 시 회원가입 버튼 글자색 */
        }

        /* 여기서부터는 로그인 후 헤더 */
        .user-info {
            display: flex;
            align-items: center;
            margin-right: 50px;
        }

        .logout-btn, .mypage-btn {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            margin-right: 10px;
        }

        .welcome-msg {
            margin-left: 20px;
        }

        .header-after-login.hidden {
            display: none;
        }

    </style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        // 세션에서 로그인 상태 확인
        const isLoggedIn = ${sessionScope.loginUser != null};
        const userName = "${sessionScope.loginUser.userName}";

        if (isLoggedIn) {
            $(".header-before-login").hide();
            $(".header-after-login").removeClass("hidden");
            $(".welcome-msg").text(userName + "님 환영합니다.");
        } else {
            $(".header-before-login").show();
            $(".header-after-login").addClass("hidden");
        }

        // 로그아웃 후 페이지 리로드
        $(".logout-btn").click(function(event) {
            event.preventDefault(); // 기본 링크 동작 방지
            if (confirm("로그아웃 하시겠습니까?")) {
                location.href = "<%=request.getContextPath()%>/user/logout.do";
            }
        });
    });
</script>
<body>
<header>
    <div class="header-container header-before-login">
        <div class="logo">
            <a href="index.jsp"><img src="/images/2.png" alt="로고"></a>
        </div>
        <nav class="nav">
            <ul class="nav-list">
                <li class="nav-item">
                    <a href="#">예약</a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath()%>/reservation/reservation-airport.jsp">항공권 예매</a></li>
                        <li><a href="reservation.jsp">예약 취소</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#">마일리지</a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath()%>/mileage/mileageShop.jsp">마일리지샵</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#">공지사항</a>
                    <ul class="dropdown-menu">
                        <li><a href="notice.jsp">공지사항</a></li>
                        <li><a href="qna.jsp">1:1 문의</a></li>
                        <li><a href="faq.jsp">FAQ</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="auth">
            <a href="/user/userJoin.jsp" class="join-btn">회원가입</a>
            <a href="/user/login.jsp" class="login-btn">로그인</a>
        </div>
    </div>
    <div class="header-container header-after-login hidden">
        <div class="logo">
            <a href="index.jsp"><img src="/images/2.png" alt="로고"></a>
        </div>
        <nav class="nav">
            <ul class="nav-list">
                <li class="nav-item">
                    <a href="#">예약</a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath()%>/reservation/reservation-airport.jsp">항공권 예매</a></li>
                        <li><a href="reservation.jsp">예약 취소</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#">마일리지</a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath()%>/mileage/mileageShop.jsp">마일리지샵</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#">공지사항</a>
                    <ul class="dropdown-menu">
                        <li><a href="notice.jsp">공지사항</a></li>
                        <li><a href="qna.jsp">1:1 문의</a></li>
                        <li><a href="faq.jsp">FAQ</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="user-info">
            <a href="<%=request.getContextPath()%>/user/logout.do" class="logout-btn">로그아웃</a>
            <a href="/myPage/mypage.jsp" class="mypage-btn">마이페이지</a>
            <span class="welcome-msg">${sessionScope.loginUser.userName}님 환영합니다.</span>
        </div>
    </div>
</header>
</body>
</html>