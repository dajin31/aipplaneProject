<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SOON항공사</title>
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
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="/css/main.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="/mainPage/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<!-- 헤더 -->
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
            <a href="/user/mypage.jsp" class="mypage-btn">마이페이지</a>
            <span class="welcome-msg">${sessionScope.loginUser.userName}님 환영합니다.</span>
        </div>
    </div>
</header>
<br><br>
<main class="booking-container">
    <%--예약 섹션--%>
    <h1 style="font-size: 30px" class="booking-title">항공권 예매</h1>

    <div class="booking-tabs">
        <div class="tab active">예매</div>
    </div>

    <%--    <div class="trip-type-tabs" style="display: flex; margin-bottom: 20px" >--%>
    <%--        <div class="tab active">편도</div>--%>
    <%--    </div>--%>

    <form class="flight-search-form" action="flight-selection.jsp" method="POST" style="width: 1600px">
        <div style="display: flex; flex-wrap: wrap;">
            <div style="padding: 40px 30px 40px 30px; display: flex; align-items: center; width: 500px; margin-left: 70px ">
                <div class="location-input" style="margin-right: 20px" id="searchStart">
                    <span style="display: block; font-size: 14px">출발지</span>
                    <span style="display: block; font-size: 40px" id="startCountry">제주</span>
                    <input type="hidden" name="startCountry" id="startCountryInput" > <%--폼으로 날릴 출발지 값--%>
                </div>
                <div class="separator2"></div>
                <button type="button" class="swap-btn" id="swapBtn">⇄</button>
                <div class="separator2"></div>

                <div class="location-input" style="margin-left: 20px" id="searchEnd">
                    <span style="display: block; font-size: 14px">도착지</span>
                    <span style="display: block; font-size: 40px" id="endCountry">중국</span>
                    <input type="hidden" name="endCountry" id="endCountryInput" > <%--폼으로 날릴 도착지 값--%>
                </div>
            </div>

            <div class="separator"></div>

            <div style="padding: 40px 20px 40px 20px; display: flex; align-items: center; ">
                <div class="date-field">
                    <label style="font-size: 18px">출발일</label>
                    <input type="date" class="date-input" id="departDate" name="departDate">
                </div>
                <div class="date-field" style="margin-left: 10px">
                    <label>도착일</label>
                    <input type="date" class="date-input" id="returnDate" name="returnDate">
                </div>
            </div>
            <div class="separator"></div>

            <div style="padding: 40px 20px 40px 20px; align-items: center; display: flex">
                <div class="passenger " id="passengerDiv" >
                    <button class="passenger-click" id="selectPassenger" type="button" style=" margin-bottom: 10px;width: 120px;margin-top: 25px;">탑승객선택</button>
                    <input type="hidden" id="checkPassengerInput" name="checkPassenger">
                </div>
                <div class="seat-input" style="margin-left: 10px">
                    <label>좌석</label>
                    <select class="passenger-select" name="seatClass">
                        <option>이코노미</option>
                        <option>비즈니스</option>
                        <option>퍼스트</option>
                    </select>
                </div>
            </div>


        </div>

        <button type="submit" class="search-btn" >항공권 검색
        </button>
    </form>
</main>
<!-- 추천 항공권 섹션 -->
<div class="logo2">
    <img src="/reservation/booking-visual--pc.jpg" alt="메인 배경">
</div>
<section class="recommended-section">
    <div class="recommended-flights">
        <button class="slide-button prev" aria-label="이전 항공권">&lt;</button>
        <div class="slides-container">
            <div class="slides-track">
                <div class="slide">
                    <img src="/images/마카오.jpg" alt="마카오">
                    <div class="slide-content">
                        <h3>서울 (인천) - 마카오</h3>
                        <p>편도 총액 98,200원~</p>
                        <p>2025.04.01 - 2025.05.31</p>
                    </div>
                </div>
                <div class="slide">
                    <img src="/images/싱가포르.jpg" alt="싱가포르">
                    <div class="slide-content">
                        <h3>부산 - 싱가포르</h3>
                        <p>편도 총액 121,300원~</p>
                        <p>2025.04.01 - 2025.05.31</p>
                    </div>
                </div>
                <div class="slide">
                    <img src="/images/오키나와.jpg" alt="오키나와">
                    <div class="slide-content">
                        <h3>서울 (인천) - 오키나와(나하)</h3>
                        <p>편도 총액 101,900원~</p>
                        <p>2025.04.01 - 2025.05.31</p>
                    </div>
                </div>
                <div class="slide">
                    <img src="/images/울란바토르.jpg" alt="울란바토르">
                    <div class="slide-content">
                        <h3>부산 - 울란바토르</h3>
                        <p>편도 총액 108,200원~</p>
                        <p>2025.04.01 - 2025.05.31</p>
                    </div>
                </div>
                <div class="slide">
                    <img src="/images/홍콩.jpg" alt="홍콩">
                    <div class="slide-content">
                        <h3>서울(인천) - 홍콩</h3>
                        <p>편도 총액 108,200원~</p>
                        <p>2025.04.01 - 2025.05.31</p>
                    </div>
                </div>
                <div class="slide">
                    <img src="/images/바탐.jpg" alt="바탐">
                    <div class="slide-content">
                        <h3>서울(인천) - 바탐</h3>
                        <p>편도 총액 126,300원~</p>
                        <p>2025.04.01 - 2025.05.31</p>
                    </div>
                </div>
                <div class="slide">
                    <img src="/images/덴파사르.jpg" alt="덴파사르">
                    <div class="slide-content">
                        <h3>서울(인천) - 덴파사르(발리)</h3>
                        <p>편도 총액 186,300원~</p>
                        <p>2025.04.01 - 2025.05.31</p>
                    </div>
                </div>
            </div>
            <button class="slide-button next" aria-label="다음 항공권">&gt;</button>
        </div>
</section>

<!-- 여행 경험 섹션 -->
<section class="travel-experience">
    <div class="section-container">
        <h2>여행을 위한 경험</h2>
        <div class="experience-grid">
            <div class="experience-card weather">
                <h3>날씨 정보</h3>
                <div id="weather-widget"></div>
            </div>
            <div class="experience-card hotels">
                <h3>호텔 예약</h3>
                <a href="#" class="link-button">호텔 검색하기</a>
            </div>
            <div class="experience-card mileage">
                <h3>마일리지샵</h3>
                <a href="#" class="link-button">마일리지 사용하기</a>
            </div>
        </div>
    </div>
</section>

<!-- 푸터 -->
<footer class="main-footer">
    <div class="footer-container">
        <div class="footer-info">
            <div class="footer-logo">
                <img src="/images/soon-logo-gray.png" alt="SOON항공사">
            </div>
            <div class="contact-info">
                <p>고객센터: 1599-1500</p>
                <p>운영시간: 09:00-19:00</p>
            </div>
        </div>
        <div class="social-links">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
        </div>
    </div>
</footer>


<script>
    // 기존 JavaScript 코드에 추가
    document.addEventListener('DOMContentLoaded', function() {
        // 탭 전환 기능
        const tabs = document.querySelectorAll('.booking-tabs button');
        tabs.forEach(tab => {
            tab.addEventListener('click', function() {
                tabs.forEach(t => t.classList.remove('active'));
                this.classList.add('active');
            });
        });
    });

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
</body>
</html>