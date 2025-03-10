<%@ page import="com.example.demo.vo.UserVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SOON항공사</title>
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/header.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/mainPage/main.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f12a315bb86ece33f4207e49ecac47cf"></script>
</head>
<body>

<%
    UserVO userVO = (UserVO) session.getAttribute("loginUser")==null?null:(UserVO) session.getAttribute("loginUser");
%>

<%=userVO%>

<!-- 헤더 -->
<header>
    <div class="header-container header-before-login">
        <div class="logo">
            <a href="/mainPage/mainPage.jsp"><img src="/images/2.png" alt="로고"></a>

        </div>
        <nav class="nav">
            <ul class="nav-list">
                <li class="nav-item">
                    <a href="/reservation/reservation-airport.jsp">예약</a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath()%>/reservation/reservation-airport.jsp">항공권 예매</a></li>
                        <li><a href="#">예약 취소</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="/mileage/mileageShop.jsp">마일리지</a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath()%>/mileage/mileageShop.jsp">마일리지샵</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/member/list.do">공지사항</a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath()%>/member/list.do">공지사항</a></li>
                        <li><a href="<%=request.getContextPath()%>/member/list1_1.do">1:1 문의</a></li>
                        <li><a href="<%=request.getContextPath()%>/FAQBoard">FAQ</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="auth">
            <a href="/login/userJoin.jsp" class="join-btn">회원가입</a>
            <a href="/login/login.jsp" class="login-btn">로그인</a>
        </div>
    </div>
    <div class="header-container header-after-login hidden">
        <div class="logo">
            <a href="/mainPage/mainPage.jsp"><img src="/images/2.png" alt="로고"></a>
        </div>
        <nav class="nav">
            <ul class="nav-list">
                <li class="nav-item">
                    <a href="/reservation/reservation-airport.jsp">예약</a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath()%>/reservation/reservation-airport.jsp">항공권 예매</a></li>
                        <li><a href="#">예약 취소</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="/mileage/mileageShop.jsp">마일리지</a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath()%>/mileage/mileageShop.jsp">마일리지샵</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/member/list.do">공지사항</a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath()%>/member/list.do">공지사항</a></li>
                        <li><a href="<%=request.getContextPath()%>/member/list1_1.do">1:1 문의</a></li>
                        <li><a href="<%=request.getContextPath()%>/FAQBoard">FAQ</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="user-info">
            <a href="<%=request.getContextPath()%>/logout.do" class="logout-btn">로그아웃</a>
            <a href="/myPage/mypage.jsp" class="mypage-btn">마이페이지</a>
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

<form class="flight-search-form" action="/reservation/flight-selection.jsp" method="POST">
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
                <button class="passenger-click" id="selectPassenger" type="button">탑승객선택</button>
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
    <img src="/images/main1.jpg" alt="메인 배경">
</div>
<h2 class="recommended-title">추천 항공편</h2>
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
    </div>
</section>

<section id="noticeArea">
    <h2>공지사항</h2>
    <div class="notice-list">
        <div class="announcement-list">
            <div class="announcement-item">
                <div class="announcement-title">국내선 유류할증료 (2025년 4월)</div>
                <div class="announcement-date">2025.03.05.</div>
            </div>
            <div class="announcement-item">
                <div class="announcement-title">스카이패스 / 액티런트 보딩패스 제휴 종료 (파라다이스시티)</div>
                <div class="announcement-date">2025.03.04.</div>
            </div>
            <div class="announcement-item">
                <div class="announcement-title">로스앤젤레스 공항 라운지 변경</div>
                <div class="announcement-date">2025.02.28.</div>
            </div>
            <div class="announcement-item">
                <div class="announcement-title">보조배터리 기내 반입 및 보관 방법</div>
                <div class="announcement-date">2025.02.25.</div>
            </div>
        </div>
    </div>
</section>

<!-- 여행 경험 섹션 -->
<section class="travel-experience">
    <div class="section-container">
        <h2 style="margin-left: 100px;">여행을 위한 경험</h2>
        <div class="experience-grid">
            <div class="weather-container">
                <div id="weatherResult">
                    <%--날씨 정보 표시란--%>
                </div>
            </div>
            <!-- 호텔 예약하기 -->
            <div class="experience-card hotels">
                <div class="hotel-title"><h3>호텔 예약</h3></div>
                <div id="map" style="width:250px;height:250px;"></div>
                <a href="https://www.agoda.com/ko-kr/" class="link-button-hotel">추천 호텔 예약하러 가기 👈</a>
            </div>
            <div class="mileage-shop">
                <div class="mileage-shop-header">
                    <h2>마일리지샵</h2>
                </div>
                <div class="mileage-shop-main">
                    <div class="icon">🎁</div> <!-- 아이콘은 상황에 맞게 변경 가능 -->
                    <div class="value">500</div> <!-- 마일리지 수치 -->
                    <div class="location">사용 가능</div>
                </div>
                <div class="mileage-shop-details">
                    <div>포인트: 60</div>
                    <div>남은: 127</div>
                </div>
                <a href="/mileage/mileageShop.jsp" class="mileage-shop-link">바로가기</a>
            </div>
        </div>
    </div>
</section>

<!-- 푸터 -->
<footer class="main-footer">
    <div class="footer-container">
        <div class="footer-info">
            <div class="footer-logo">
                <img src="/images/2.png" alt="SOON항공사">
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
    $(document).ready(function() {
        // 세션에서 로그인 상태 확인
        const isLoggedIn = ${sessionScope.loginUser != null};
        const userName = "${sessionScope.loginUser.userName}";

        console.log(userName);
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
                location.href = "<%=request.getContextPath()%>/logout.do";
            }
        });
    });
    console.log(document.getElementById("searchEnd"));
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
</script>

    <!-- 다음 지도 api -->
<script src="/mainPage/weather.js"></script>
<script type="text/javascript">
    function initMap() {
        var mapContainer = document.getElementById('map'),
            mapOption = {
                center: new kakao.maps.LatLng(37.5659975, 126.9799762),
                level: 4,
                mapTypeId: kakao.maps.MapTypeId.ROADMAP
            };

        var map = new kakao.maps.Map(mapContainer, mapOption);

        var markerPositions = [
            new kakao.maps.LatLng(37.5653, 126.980979),
            new kakao.maps.LatLng(37.564378, 126.980058),
            new kakao.maps.LatLng(37.5649903, 126.981369)
        ];

        var hotelNames = [
            '롯데 호텔 서울',
            '웨스틴 조선 서울',
            '롯데 호텔 이그제큐티브'
        ];

        for (var i = 0; i < markerPositions.length; i++) {
            var marker = new kakao.maps.Marker({
                position: markerPositions[i],
                map: map
            });
            (function(marker, i) {
                kakao.maps.event.addListener(marker, 'click', function() {
                    alert(hotelNames[i] + '을(를) 추천합니다!');
                });
            })(marker, i);
        }
    }

    // SDK 로드 대기
    document.addEventListener('DOMContentLoaded', function() {
        if (typeof kakao === 'undefined' || typeof kakao.maps === 'undefined') {
            setTimeout(function checkKakao() {
                if (typeof kakao !== 'undefined' && typeof kakao.maps !== 'undefined') {
                    initMap();
                } else {
                    setTimeout(checkKakao, 100); // 100ms 후 재확인
                }
            }, 100);
        } else {
            initMap();
        }
    });
</script>
</body>
</html>