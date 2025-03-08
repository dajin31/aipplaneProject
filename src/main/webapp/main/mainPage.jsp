<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SOON항공사</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="/css/main.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="/main/main.js"></script>
</head>
<body>
<!-- 헤더 -->
<header class="main-header">
    <div class="header-container">
        <div class="logo">
            <img src="/images/SoonAirLine.png" alt="SOON항공사">
        </div>
        <nav class="main-nav">
            <ul>
                <li><a href="#" class="active">예약</a></li>
                <li><a href="#">여행 준비</a></li>
                <li><a href="#">서비스</a></li>
                <li><a href="#">여행 경험</a></li>
            </ul>
        </nav>
        <div class="util-menu">
            <a href="<%=request.getContextPath()%>/login.do" class="login-btn">로그인</a>
            <select class="lang-select">
                <option value="ko">한국어</option>
                <option value="en">English</option>
            </select>
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

    <form class="flight-search-form" action="flight-selection.jsp" method="POST">
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
    <img src="/images/main1.jpg" alt="메인 배경">
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
            <!-- 호텔 예약하기 -->
            <div class="experience-card hotels">
                <div class="hotel-title"><h3>호텔 예약</h3></div>
                <div id="map" style="width:250px;height:250px;"></div>
                <a href="https://www.agoda.com/ko-kr/" class="link-button-hotel">추천 호텔 예약하러 가기 👈</a>
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
                <img src="/images/SoonAirLine.png" alt="SOON항공사">
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
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8306615f01d266edffd26c9c180c3c4"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.5659975,126.9799762), // 지도의 중심좌표
            level: 4, // 지도의 확대 레벨
            mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
        };

    // 지도를 생성한다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 지도에 마커를 생성하고 표시한다
    var markerPositions = [
        new kakao.maps.LatLng(37.5653, 126.980979), //롯데 호텔
        new kakao.maps.LatLng(37.564378, 126.980058), //웨스틴조선서울 좌표
        new kakao.maps.LatLng(37.5649903, 126.981369) //롯데호텔 이그제큐티브
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

</script>

</body>
</html>