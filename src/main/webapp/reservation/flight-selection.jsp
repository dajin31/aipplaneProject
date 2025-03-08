<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>항공권 예약</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }
        body {
            font-family: 'Noto Sans KR', sans-serif;
        }

        .container {
            max-width: 1200px;
            margin: 32px auto;
            padding: 0 1rem;
        }

        .airplane-icon {
            width: 40px;
            height: 40px;
        }

        .headerStyle {
            align-items: center;
            gap: 20px;
            padding: 20px;
            border-bottom: 1px solid #eee;
            justify-content: flex-start;
            padding-left: 10%;
            background-color: white;
            border-radius: 10px;
            /*padding: 15px 20px;*/
            display: flex;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            margin-top: 150px;

        }
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

        .route {
            display: flex;
            align-items: center;
            font-weight: bold;
            font-size: 18px;
        }

        .route-icon {
            margin: 0 10px;
            color: #0066cc;
        }

        .date-info, .passenger-info, .ticket-info , #fltCodeCheck {
            display: flex;
            align-items: center;
            color: #333;
            margin: 0 15px;
            font-size: 14px;
        }

        .date-info i, .passenger-info i, .ticket-info i {
            margin-right: 5px;
        }

        .search-btn {
            background-color: #4a3cdb;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 15px;
            cursor: pointer;
            font-weight: bold;
        }

        .flight-card {
            background-color: white;
            border-radius: 10px;
            margin-bottom: 15px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            display: flex;
        }

        .flight-info {
            padding: 20px;
            width: 40%;
            border-right: 1px solid #eee;
            position: relative;
        }

        .time-container {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .departure-time, .arrival-time {
            font-size: 24px;
            font-weight: bold;
        }

        .airport-code {
            font-size: 14px;
            color: #666;
            margin-top: 5px;
        }

        .flight-duration {
            text-align: center;
            color: #666;
            font-size: 12px;
            margin: 0 15px;
            position: relative;
        }

        .flight-duration::before {
            content: "";
            height: 1px;
            background-color: #ccc;
            width: 100%;
            position: absolute;
            top: 50%;
            left: 0;
            z-index: 1;
        }

        .duration-text {
            background-color: white;
            padding: 0 5px;
            position: relative;
            z-index: 2;
        }

        .flight-number {
            margin-top: 15px;
            font-size: 14px;
            color: #666;
        }

        .korean-air {
            display: inline-block;
            width: 20px;
            height: 20px;
            background-color: #0066cc;
            border-radius: 50%;
            margin-right: 5px;
            vertical-align: middle;
        }

        .detail-btn {
            position: absolute;
            bottom: 20px;
            right: 20px;
            border: 1px solid #ccc;
            background-color: white;
            border-radius: 20px;
            padding: 5px 10px;
            font-size: 12px;
            cursor: pointer;
        }

        .price-options {
            display: flex;
            flex-grow: 1;
        }

        .price-option {
            flex: 1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #f9fbff;
            border-right: 1px solid #eee;
        }

        .price-option:last-child {
            border-right: none;
        }

        .fare-type {
            font-size: 14px;
            color: #666;
            margin-bottom: 10px;
        }

        .sold-out {
            color: #999;
            font-weight: bold;
        }

        .price {
            font-size: 20px;
            font-weight: bold;
        }

        .currency {
            font-size: 14px;
            margin-left: 2px;
        }

        .footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            background-color: white;
            border-radius: 10px;
            margin-top: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .total-price {
            display: flex;
            align-items: center;
        }

        .currency-type {
            margin-right: 10px;
            font-size: 14px;
            color: #666;
        }

        .price-amount {
            font-size: 24px;
            font-weight: bold;
        }

        .next-btn {
            background-color: #00205b;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 12px 25px;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
        }

        .return-tag {
            background-color: #4169e1;
            color: white;
            padding: 3px 8px;
            border-radius: 4px;
            font-size: 12px;
            margin-right: 10px;
        }

        .scroll-top {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 40px;
            height: 40px;
            background-color: white;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            cursor: pointer;
        }

        .price-option:hover{
            cursor: pointer;
        }

        .nav-categories {
            display: flex;
            gap: 20px;
        }
    </style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            <a href="/login/userJoin.jsp" class="join-btn">회원가입</a>
            <a href="/login/login.jsp" class="login-btn">로그인</a>
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
<div class="container">
    <!-- Header -->
    <div class="headerStyle" style="padding-left: 20px;">
        <div class="route">
            <span class="startCountry">NRT</span>
            <span class="route-icon">⟷</span>
            <span class="endCountry">SEL</span>
        </div>

        <div class="date-info">
            <i class="calendar-icon">📅</i>
            <span id="myDate">2025년 03월 12일 (수) ~ 2025년 03월 20일 (목)</span>
        </div>

        <div class="passenger-info">
            <i class="person-icon">👤</i>
            <span id="passenter">성인 1명</span>
        </div>

        <div class="ticket-info">
            <i class="ticket-icon">🎫</i>
            <span class="rank" id="rank">일반석</span>
        </div>

        <div class="ticket-info">
            <i class="ticket-icon">항공기 코드:</i>
            <span  id="fltCodeCheck">000</span>
        </div>

        <button class="search-btn" id="backBtn">뒤로</button>
        <button class="search-btn" id="searchBtn">항공권 검색</button>
    </div>

    <!-- Flight 1 -->
    <div class="flight-card">
        <div class="flight-info">
            <div class="time-container">
                <div>
                    <div class="departure-time" id="startTime">09:15</div>
                    <div class="airport-code startCountry"></div>
                </div>

                <div class="flight-duration">
                    <div class="duration-text" id="whatTime">2시간 45분</div>
                </div>

                <div>
                    <div class="arrival-time" id="endTime">12:00</div>
                    <div class="airport-code endCountry"></div>
                </div>
            </div>

            <div class="flight-number">
                <span class="korean-air"></span>
                KE706
            </div>

            <button class="detail-btn" id="detailBtn">상세 보기</button>
        </div>

        <div class="price-options">
            <div class="price-option">
                <div class="fare-type">이코노미 클래스</div>
                <div class="sold-out">매진</div>
            </div>

            <div class="price-option">
                <div class="fare-type">비즈니스 클래스</div>
                <div class="price">287,800<span class="currency">원</span></div>
            </div>

            <div class="price-option">
                <div class="fare-type">퍼스트 클래스</div>
                <div class="price">469,900<span class="currency">원</span></div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <div class="total-price">
            <div class="currency-type">
                <span>총액</span>
                <span>통화 KRW</span>
            </div>
            <div class="price-amount" id="totalPriceNum" style="margin-left: 770px">0 원</div>
        </div>

        <button class="next-btn" id="nextBtn">다음 여정</button>
    </div>

    <!-- Scroll to top button -->
    <div class="scroll-top">↑</div>
</div>

<%
    String startCountry = request.getParameter("startCountry");
    String endCountry = request.getParameter("endCountry");
    String departDate = request.getParameter("departDate");
    String returnDate = request.getParameter("returnDate");
    String checkPassenger = request.getParameter("checkPassenger");
    String seatClass = request.getParameter("seatClass");
%>

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
                location.href = "<%=request.getContextPath()%>/logout.do";
            }
        });
    });

    const startCountry = "<%= startCountry %>";
    const endCountry = "<%= endCountry %>";
    const departDate = "<%= departDate %>";
    const returnDate = "<%= returnDate %>";
    const checkPassenger = "<%= checkPassenger %>";
    const seatClass = "<%= seatClass %>";

    // 콘솔에 데이터 출력
    console.log("출발지:", startCountry);
    console.log("도착지:", endCountry);
    console.log("출발일:", departDate);
    console.log("도착일:", returnDate);
    console.log("checkPassenger:", checkPassenger);
    console.log("좌석 등급:", seatClass);

    const startElement = document.querySelectorAll('.startCountry');

    startElement.forEach(element=>{
        element.textContent = startCountry;
    })

    const endElement = document.querySelectorAll('.endCountry');

    endElement.forEach(element=>{
        element.textContent = endCountry;
    })

    document.getElementById("myDate").innerText = departDate + " ~ " + returnDate;

    document.getElementById("passenter").innerText = checkPassenger;

    const rankElement = document.querySelectorAll('.rank');
    rankElement.forEach(element=>{
        element.textContent = seatClass;
    })


    // Scroll to top functionality
    document.querySelector('.scroll-top').addEventListener('click', function() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });

    // Detail button functionality
    const detailButtons = document.querySelectorAll('.detail-btn');
    detailButtons.forEach(button => {
        button.addEventListener('click', function() {
            alert('항공편 상세 정보가 표시됩니다.');
        });
    });



    function formatFlightTime(fltTime) {
        const hours = Math.floor(fltTime / 60); // 시간을 계산합니다.
        const minutes = fltTime % 60; // 분을 계산합니다.

        if (hours > 0) {
            return hours + "시간 " + minutes + "분";
        } else {
            return minutes + "분";
        }
    }

    document.getElementById("backBtn").addEventListener('click',()=>{
        window.location.href = "reservation-airport.jsp";
    })


    document.getElementById('searchBtn').addEventListener('click',()=>{
        // dptAptCode 출발  startCountry   arrAptCode 도착 endCountry
        const url = '/reservation/selectScheduleList?dptAptCode=' + startCountry + "&arrAptCode=" + endCountry ;
        console.log(url)
        fetch(url)
            .then(response => response.json())
            .then(data => {
                console.log(data);

                const container = document.querySelector('.container');
                const existingFlightCard = document.querySelector('.flight-card');

                if(existingFlightCard) {
                    existingFlightCard.remove();
                }

                data.forEach(flight => {
                    // flight-card 생성
                    const flightCard = document.createElement('div');
                    flightCard.classList.add('flight-card');

                    // flight-info 생성
                    const flightInfo = document.createElement('div');
                    flightInfo.classList.add('flight-info');

                    // time-container 생성
                    const timeContainer = document.createElement('div');
                    timeContainer.classList.add('time-container');

                    // 출발 시간, 공항 코드 생성
                    const departureDiv = document.createElement('div');
                    const startTime = document.createElement('div');
                    startTime.classList.add('departure-time');
                    //출발시간
                    const dptTime = flight.dptTime;
                    const time = dptTime.split(" ")[1].substring(0, 5);

                    startTime.textContent = time;
                    const startCountry = document.createElement('div');
                    startCountry.classList.add('airport-code', 'startCountry');
                    startCountry.textContent = flight.dptAptCode;

                    departureDiv.appendChild(startTime);
                    departureDiv.appendChild(startCountry);

                    // 비행 시간 생성
                    const flightDuration = document.createElement('div');
                    flightDuration.classList.add('flight-duration');
                    const whatTime = document.createElement('div');
                    whatTime.classList.add('duration-text');
                    const times = flight.fltTime;
                    whatTime.textContent = formatFlightTime(times);
                    console.log(times)

                    flightDuration.appendChild(whatTime);

                    // 도착 시간, 공항 코드 생성
                    const arrivalDiv = document.createElement('div');
                    const endTime = document.createElement('div');
                    endTime.classList.add('arrival-time');
                    const arrTime = flight.arrTime;
                    const time2 = arrTime.split(" ")[1].substring(0, 5);
                    endTime.textContent = time2;

                    const endCountry = document.createElement('div');
                    endCountry.classList.add('airport-code', 'endCountry');
                    endCountry.textContent = flight.arrAptCode; // 데이터 적용

                    arrivalDiv.appendChild(endTime);
                    arrivalDiv.appendChild(endCountry);

                    // time-container에 추가
                    timeContainer.appendChild(departureDiv);
                    timeContainer.appendChild(flightDuration);
                    timeContainer.appendChild(arrivalDiv);

                    // flight-number 생성
                    const flightNumber = document.createElement('div');
                    flightNumber.classList.add('flight-number');
                    const koreanAir = document.createElement('span');
                    const koreanAir2 = document.createElement('span');
                    koreanAir2.textContent = flight.fltCode;
                    // koreanAir2.style.visibility = 'hidden';
                    koreanAir.classList.add('korean-air');
                    koreanAir2.classList.add('korean-air2');

                    flightNumber.appendChild(koreanAir);
                    flightNumber.appendChild(koreanAir2);
                    // flightNumber.appendChild(document.createTextNode(flight.fltCode)); // 데이터 적용

                    // detail-btn 생성
                    const detailBtn = document.createElement('button');
                    detailBtn.classList.add('detail-btn');
                    detailBtn.textContent = '상세 보기';

                    detailBtn.addEventListener('click',()=>{
                        const fltCode = flight.fltCode;
                        const url = '/reservation/detailAircraftPopup?fltCode=' + fltCode;
                        console.log("클릭")

                        const popWidth = 800;
                        const popHeight = 600;
                        const options = `width=${popWidth}px, height=${popHeight}px, top=20, left=20, resizable=no, scrollbars=yes, menubar=no, toolbar=no, location=no, directories=no, status=no`;

                        const popupwindow = window.open(url, 'detailPopup', options);

                        if (popupwindow) {
                            console.log("상세팝업 오픈");
                            popupwindow.opener = window;
                        } else {
                            alert("팝업 오픈 실패 ㅜ")
                        }
                    })

                    // flight-info에 추가
                    flightInfo.appendChild(timeContainer);
                    flightInfo.appendChild(flightNumber);
                    flightInfo.appendChild(detailBtn);

                    // price-options 생성
                    const priceOptions = document.createElement('div');
                    priceOptions.classList.add('price-options');

                    // 이코노미 클래스 생성
                    const economyOption = document.createElement('div');
                    economyOption.classList.add('price-option');
                    const economyFareType = document.createElement('div');
                    economyFareType.classList.add('fare-type');
                    economyFareType.textContent = '이코노미 클래스';
                    const economyPrice = document.createElement('div');
                    economyPrice.classList.add('price');
                    economyPrice.textContent = "253,000 원"; // 데이터 적용

                    const economyFltCode = document.createElement('div');
                    economyFltCode.textContent = flight.fltCode;
                    economyFltCode.style.display = 'none';
                    economyFltCode.classList.add('hiddenFltCode');

                    economyOption.appendChild(economyFareType);
                    economyOption.appendChild(economyPrice);
                    economyOption.appendChild(economyFltCode);

                    // 비즈니스 클래스 생성
                    const businessOption = document.createElement('div');
                    businessOption.classList.add('price-option');
                    const businessFareType = document.createElement('div');
                    businessFareType.classList.add('fare-type');
                    businessFareType.textContent = '비즈니스 클래스';
                    const businessPrice = document.createElement('div');
                    businessPrice.classList.add('price');
                    businessPrice.textContent = "543,000 원"; // 데이터 적용

                    const businessFltCode = document.createElement('div');
                    businessFltCode.textContent = flight.fltCode;
                    businessFltCode.style.display = 'none';
                    businessFltCode.classList.add('hiddenFltCode');

                    businessOption.appendChild(businessFareType);
                    businessOption.appendChild(businessPrice);
                    businessOption.appendChild(businessFltCode);

                    // 퍼스트 클래스 생성
                    const firstOption = document.createElement('div');
                    firstOption.classList.add('price-option');
                    const firstFareType = document.createElement('div');
                    firstFareType.classList.add('fare-type');
                    firstFareType.textContent = '퍼스트 클래스';
                    const firstPrice = document.createElement('div');
                    firstPrice.classList.add('price');
                    firstPrice.textContent = "1,500,000 원"; // 데이터 적용

                    const  firstFltCode = document.createElement('div');
                    firstFltCode.textContent = flight.fltCode;
                    firstFltCode.style.display = 'none';
                    firstFltCode.classList.add('hiddenFltCode');

                    firstOption.appendChild(firstFareType);
                    firstOption.appendChild(firstPrice);
                    firstOption.appendChild(firstFltCode);

                    // price-options에 추가
                    priceOptions.appendChild(economyOption);
                    priceOptions.appendChild(businessOption);
                    priceOptions.appendChild(firstOption);

                    // flight-card에 추가
                    flightCard.appendChild(flightInfo);
                    flightCard.appendChild(priceOptions);

                    // 컨테이너에 추가
                    container.appendChild(flightCard);
                    const footer = document.querySelector('.footer');
                    container.appendChild(footer);

                    economyOption.addEventListener('click',(e)=>{
                        const hiddenFltCodeElement = e.currentTarget.querySelector(".hiddenFltCode") || e.currentTarget.parentElement.querySelector(".hiddenFltCode");


                        const innerText = hiddenFltCodeElement.innerText;
                        console.log(innerText)

                        const fltElement = document.getElementById("fltCodeCheck");
                        fltElement.innerText = innerText;

                        const rankElement = document.getElementById('rank');
                        rankElement.innerText = "이코노미";

                        const totalNumElement = document.getElementById("totalPriceNum");
                        const passenterElement = document.getElementById("passenter");

                       const textContent = passenterElement.textContent;

                       const adultMatch = textContent.match(/성인\s*:\s*(\d+)/);
                       const childMatch = textContent.match(/소아\s*:\s*(\d+)/);

                        const adultCount = adultMatch ? parseInt(adultMatch[1]) : 0;
                        const childCount = childMatch ? parseInt(childMatch[1]) : 0;

                        const adultPrice = 253000;
                        const childPrice = adultPrice * 0.75;

                        const totalPrice = adultCount * adultPrice + childCount * childPrice;

                        totalNumElement.textContent = totalPrice.toLocaleString() +" 원";

                    })
                    businessOption.addEventListener('click',(e)=>{
                        const hiddenFltCodeElement = e.currentTarget.querySelector(".hiddenFltCode") || e.currentTarget.parentElement.querySelector(".hiddenFltCode");


                        const innerText = hiddenFltCodeElement.innerText;
                        console.log(innerText)

                        const fltElement = document.getElementById("fltCodeCheck");
                        fltElement.innerText = innerText;

                        const rankElement = document.getElementById('rank');
                        rankElement.innerText = "비즈니스";

                        const totalNumElement = document.getElementById("totalPriceNum");
                        const passenterElement = document.getElementById("passenter");

                        const textContent = passenterElement.textContent;

                        const adultMatch = textContent.match(/성인\s*:\s*(\d+)/);
                        const childMatch = textContent.match(/소아\s*:\s*(\d+)/);

                        const adultCount = adultMatch ? parseInt(adultMatch[1]) : 0;
                        const childCount = childMatch ? parseInt(childMatch[1]) : 0;

                        const adultPrice = 543000;
                        const childPrice = adultPrice * 0.75;

                        const totalPrice = adultCount * adultPrice + childCount * childPrice;

                        totalNumElement.textContent = totalPrice.toLocaleString() +" 원";
                    })
                    firstOption.addEventListener('click',(e)=>{
                        const hiddenFltCodeElement = e.currentTarget.querySelector(".hiddenFltCode") || e.currentTarget.parentElement.querySelector(".hiddenFltCode");


                        const innerText = hiddenFltCodeElement.innerText;
                        console.log(innerText)

                        const fltElement = document.getElementById("fltCodeCheck");
                        fltElement.innerText = innerText;
                        const rankElement = document.getElementById('rank');
                        rankElement.innerText = "퍼스트";

                        const totalNumElement = document.getElementById("totalPriceNum");
                        const passenterElement = document.getElementById("passenter");

                        const textContent = passenterElement.textContent;

                        const adultMatch = textContent.match(/성인\s*:\s*(\d+)/);
                        const childMatch = textContent.match(/소아\s*:\s*(\d+)/);

                        const adultCount = adultMatch ? parseInt(adultMatch[1]) : 0;
                        const childCount = childMatch ? parseInt(childMatch[1]) : 0;

                        const adultPrice = 1500000;
                        const childPrice = adultPrice * 0.75;

                        const totalPrice = adultCount * adultPrice + childCount * childPrice;

                        totalNumElement.textContent = totalPrice.toLocaleString() +" 원";


                    })




                });

            })
            .catch(err => console.error(err));
    })

    // Next button functionality
    document.querySelector('.next-btn').addEventListener('click', function() {
        const classValue = document.getElementById('rank').innerText;  //좌석등금
        const passengerValue = checkPassenger; //몇명

        const totalPrice = document.getElementById("totalPriceNum").innerText;


        const fltCode = document.getElementById("fltCodeCheck").innerText;
        console.log("fltCode",fltCode)

        window.location.href = "seat-selection.jsp?classValue=" + encodeURIComponent(classValue) + "&passengerValue=" + encodeURIComponent(passengerValue)
            + "&start=" + encodeURIComponent(startCountry) + "&end=" + encodeURIComponent(endCountry)+ "&departDate=" + departDate +  "&returnDate=" + returnDate + "&fltCode=" + fltCode + "&totalPrice=" + totalPrice;
    });


</script>
</body>
</html>

