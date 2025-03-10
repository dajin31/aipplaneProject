<%@ page import="com.example.demo.vo.UserVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>좌석선택</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /*.header {*/
        /*    display: flex;*/
        /*    align-items: center;*/
        /*    gap: 20px;*/
        /*    padding: 20px;*/
        /*    border-bottom: 1px solid #eee;*/
        /*    justify-content:  flex-start;*/
        /*    padding-left: 20%;*/
        /*}*/
        header {
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

        .airplane-icon {
            width: 40px;
            height: 40px;
        }

        .nav-categories {
            display: flex;
            gap: 20px;
        }

        .main-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .flight-info {
            margin-bottom: 30px;
        }

        .flight-type {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .departure-info {
            color: #666;
            margin-bottom: 20px;
        }

        .airplane-container {
            position: relative;
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            padding: 40px;
        }

        .airplane-background {
            position: absolute;
            top: 0;
            left: 0;
            width: 1800px;
            height:800px;
            background-image: url('../mileage/image/airport.png');
            background-size: cover;
            background-repeat: no-repeat;
            /*clip-path: polygon(0 40%, 20% 40%, 35% 20%, 65% 20%, 80% 40%, 100% 40%, 100% 60%, 80% 60%, 65% 80%, 35% 80%, 20% 60%, 0 60%);*/
            z-index: -1;
        }

        .seat-map {
            position: relative;
            margin-top: -200px;
            z-index: 1;
        }

        .seat-grid {
            display: grid;
            grid-template-columns: repeat(12, 1fr);
            gap: 5px;
            margin-bottom: 20px;
        }

        .seat {
            aspect-ratio: 1;
            border: 1px solid #ddd;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 14px;
            background: white;
            transition: all 0.2s;
            border-radius: 4px;
        }

        .seat.first-class {
            background-color: #fef3c7;
        }

        .seat.business {
            background-color: #dbeafe;
        }

        .seat.economy {
            background-color: #dcfce7;
        }

        .seat.occupied {
            background-color: #e5e7eb;
            cursor: not-allowed;
        }

        .seat.selected {
            background-color: #3b82f6;
            color: white;
        }

        .seat-legend {
            display: flex;
            gap: 20px;
            margin-left: 105px;
            justify-content: center;
            margin-bottom: 20px;
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .legend-color {
            width: 20px;
            height: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .passenger-info {
            text-align: center;
            margin: 30px 0;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .btn {
            padding: 10px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-primary {
            background-color: #1a365d;
            color: white;
        }

        .btn-secondary {
            background-color: #e2e8f0;
        }
    </style>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body class="airplane-background">
<%
    // 세션에서 로그인한 사용자 정보 가져오기
    UserVO user = (UserVO) session.getAttribute("loginUser");
    String username = (user != null) ? user.getUserName() : ""; // null 처리
    String userId = (user != null) ? user.getUserId() : ""; // null 처리
    if (user != null) {
        System.out.println("로그인한 사용자: " + username);
    } else {
        System.out.println("로그인한 사용자가 없습니다.");
    }
%>
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
            <a href="<%=request.getContextPath()%>/logout.do" class="logout-btn">로그아웃</a>
            <a href="/login/mypage.jsp" class="mypage-btn">마이페이지</a>
            <span class="welcome-msg">${sessionScope.loginUser.userName}님 환영합니다.</span>
        </div>
    </div>
</header>

<main class="main-content" style="margin-top: 180px">
    <h1>좌석선택</h1>

    <section class="flight-info">
        <div class="flight-type">가는편</div>
        <div class="departure-info" id="startCountry">출발국가명</div>
    </section>

    <div class="airplane-container">
        <div ></div>
        <section class="seat-map" style="margin-left: 150px">
            <div class="seat-legend">
                <div class="legend-item">
                    <div class="legend-color" style="background-color: #fef3c7;"></div>
                    <span>퍼스트</span>
                </div>
                <div class="legend-item">
                    <div class="legend-color" style="background-color: #dbeafe;"></div>
                    <span>비즈니스</span>
                </div>
                <div class="legend-item">
                    <div class="legend-color" style="background-color: #dcfce7;"></div>
                    <span>이코노미</span>
                </div>
                <div class="legend-item">
                    <div class="legend-color" style="background-color: #e5e7eb;"></div>
                    <span>예약불가</span>
                </div>
            </div>

            <div class="seat-grid" id="seatGrid">
                <!-- 좌석은 JavaScript로 동적 생성됨 -->
            </div>
        </section>
    </div>

    <div class="passenger-info" id="passengerNum">

    </div>


    <div class="button-group">

        <button class="btn btn-primary" id="goNextBtn">확인</button>
    </div>
</main>

<script>
    let isLogin = false;
    let username = "<%= username %>";
    let userIdValue = "<%= userId %>";
    console.log("로그인한 사용자 이름:", username);
    console.log("로그인한 사용자 아이디:", userIdValue);

    // username이 null 또는 빈 문자열인 경우 처리
    if (!username) {
        console.log("사용자가 로그인하지 않았습니다.");
    }
    if (username) {
        isLogin = true;
    }

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

    const urlParams = new URLSearchParams(window.location.search);
    const passengerValue = decodeURIComponent(urlParams.get("passengerValue"));
    const classvalue = decodeURIComponent(urlParams.get("classValue"));
    const start = decodeURIComponent(urlParams.get("start"));
    const end = decodeURIComponent(urlParams.get("end"));
    const departDate =urlParams.get("departDate")
    const returnDate = urlParams.get("returnDate")
    const fltCode = urlParams.get("fltCode")
    const totalPrice = urlParams.get("totalPrice")


    let selectedList = [];
    console.log(passengerValue)
    console.log(classvalue)
    console.log(start)
    console.log(end)
    console.log(departDate)
    console.log(returnDate)
    console.log(fltCode)
    console.log(totalPrice)

    const passengerCounts = passengerValue.split(',').map(item => parseInt(item.split(':')[1].trim()));
    const passengerCount = passengerCounts.reduce((acc, curr) => acc + curr, 0);

    console.log(passengerCount)
    const elementById = document.getElementById("passengerNum");
    elementById.textContent = passengerValue;

    const startElement = document.getElementById("startCountry");
    startElement.textContent = start;
    fetch('/reservation/seatListSelect')
        .then(response => response.json())
        .then(data => {
            // console.log(data)
            createSeatGrid(data);
        });


    function createSeatGrid(seatData) {
        const seatGrid = document.getElementById('seatGrid');
        seatGrid.innerHTML = '';

        const rows = 6;
        const cols = 12;

        // 열(A, B, C...)을 처리하는 바깥쪽 루프
        for (let j = 0; j < rows; j++) {
            // 행(1, 2, 3...)을 처리하는 안쪽 루프
            for (let i = 0; i < cols; i++) {
                const seat = document.createElement('div');
                seat.className = 'seat';


                const seatPosition = (i + 1).toString().padStart(2, '0') + String.fromCharCode(65 + j);

                const seatInfo = seatData.find(item => item.seatPosition === seatPosition);
                // console.log("seatPosition:", seatPosition, "seatInfo:", seatInfo);

                if (seatInfo) {
                    // 좌석 클래스 할당
                    const colLetter = seatPosition.charAt(2);
                    if (colLetter === 'A') {
                        seat.classList.add('first-class');
                    } else if (colLetter === 'B' || colLetter === 'C' || colLetter === 'D') {
                        seat.classList.add('business');
                    } else if (colLetter === 'E' || colLetter === 'F') {
                        seat.classList.add('economy');
                    } else {
                        seat.classList.add('economy');
                    }

                    if (seatInfo.seatStatus === '1') {
                        seat.classList.add('occupied');
                        seat.textContent = 'X';
                    } else {
                        seat.textContent = 'O';
                        seat.addEventListener('click', function() {
                            console.dir(this)
                            console.log(this.classList)
                            let classCase = "";

                            switch (classvalue) {
                                case "이코노미":
                                    classCase = "economy";
                                    break;
                                case "비즈니스":
                                    classCase ="business";
                                    break;
                                case "퍼스트":
                                    classCase ="first-class";
                                    break;

                            }

                            console.log(classCase);
                            if (!this.classList.contains(classCase)) {
                                alert("해당 클래스가 아닙니다");
                                return;
                            }
                            if (this.classList.contains('selected')) {
                                this.classList.remove('selected');
                                selectedList.splice(this, 1);
                            } else {
                                const selectedSeats = document.querySelectorAll('.seat.selected');
                                if (selectedSeats.length < passengerCount) {
                                    this.classList.add('selected');
                                    console.log(seatPosition)
                                    selectedList.push(seatPosition);
                                }
                            }
                        });
                    }
                } else {
                    seat.textContent = '?';
                }

                seatGrid.appendChild(seat);
            }
        }
    }

    document.getElementById("goNextBtn").addEventListener('click', () => {
        console.log(selectedList)
        console.log(passengerValue)
        console.log(classvalue)
        console.log(start)
        console.log(end)
        console.log(departDate)
        console.log(returnDate)

        //     회원 여부 판단후 회원이 아니면 로그인 페이지 이동

        if (!isLogin) {
            const airportLogin = "/reservation/AirportLoginCheckPopup?classValue=" + encodeURIComponent(classvalue) + "&passengerValue=" + encodeURIComponent(passengerValue)
                + "&start=" + encodeURIComponent(start) + "&end=" + encodeURIComponent(end)+ "&departDate=" + departDate +  "&returnDate=" + returnDate + "&selectedList=" + selectedList + "&fltCode=" + fltCode + "&totalPrice=" + totalPrice;
            const popWidth = 800;
            const popHeigth = 300;

            const options = `width=${popWidth}px, height=${popHeigth}px, top=20, left=20, resizable=no, scrollbars=yes, menubar=no, toolbar=no, location=no, directories=no, status=no`;

            const popupWindow = window.open(airportLogin, 'airportLogin', options);

            if (popupWindow) {
                console.log("로그인 팝업 오픈");
                popupWindow.opener = window;
                loginCheck = true;
            } else {
                alert("아오 에러임");
            }
        }

        if (isLogin) {
            const airportPayment="/reservation/travelInfoPayment?classValue=" + encodeURIComponent(classvalue) + "&passengerValue=" + encodeURIComponent(passengerValue)
                + "&start=" + encodeURIComponent(start) + "&end=" + encodeURIComponent(end)+ "&departDate=" + departDate +  "&returnDate=" + returnDate + "&selectedList=" + selectedList + "&fltCode=" + fltCode + "&totalPrice=" + totalPrice + "&userId=" + userIdValue;
            const popWidth = 800;
            const popHeigth = 300;

            const options = `width=${popWidth}px, height=${popHeigth}px, top=20, left=20, resizable=no, scrollbars=yes, menubar=no, toolbar=no, location=no, directories=no, status=no`;

            const popupWindow = window.open(airportPayment, 'airportPayment', options);

            if (popupWindow) {
                console.log("결제 팝업 오픈");
                popupWindow.opener = window;
            } else {
                alert("아오 에러임");
            }
        }
    });


</script>
</body>
</html>