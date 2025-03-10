<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>대한항공 - 항공권 예매</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
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



        .nav-menu {
            display: flex;
            gap: 2rem;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .search-bar {
            padding: 0.5rem 1rem;
            border: 1px solid #e5e5e5;
            border-radius: 20px;
            width: 300px;
        }

        .login-btn {
            background-color: #00256c;
            color: white;
            padding: 0.5rem 2rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .booking-container {
            max-width: 1200px;
            margin: 32px 150px;
            padding: 0 1rem;
        }

        .booking-title {
            font-size: 1.5rem;
            margin-bottom: 2rem;
        }

        .booking-tabs {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .tab {
            padding: 1rem 2rem;
            cursor: pointer;
        }

        .tab.active {
            background-color: #00256c;
            color: white;
            border-radius: 4px;
        }

        .flight-search-form {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .flight-input-group {
            display: flex;
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .location-input {
            position: relative;
        }

        .swap-btn {
            background: none;
            border: none;
            cursor: pointer;
            padding: 1rem;
        }

        .search-btn {
            width: 100%;
            background-color: #00256c;
            color: white;
            padding: 1rem;
            border: none;
            border-radius: 4px;
            font-size: 1.1rem;
            cursor: pointer;
        }

        .passenger-select, .date-select {
            padding: 0.5rem;
            border: 1px solid #e5e5e5;
            border-radius: 4px;
            width: 130px;
        }

        .passenger{
            padding: 0.5rem;
            width: 100%;
        }

        .airplane-icon {
            width: 40px;
            height: 40px;
        }


        .nav-categories {
            display: flex;
            gap: 20px;
        }

        .date-field {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .date-input {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 200px;
        }

        /* 추가: 점선 스타일 */
        .separator {
            border-left: 1px dashed #999;
            height: 180px; /* 점선의 높이 조정 */
            margin: 0 20px; /* 좌우 여백 조정 */
        }
        /* 추가: 점선 스타일 */
        .separator2 {
            border-top: 1px dashed #999; /* 가로 점선으로 변경 */
            width: 40px; /* 점선의 너비 조정 (짧게) */
            margin: 20px 0; /* 상하 여백 조정 */
            height: 0; /* 높이 제거 */
        }

        #searchStart:hover{
            outline: 1px solid blue;
            cursor: pointer;
            border-radius: 10px;
            padding: 10px;
        }
        #searchEnd:hover{
            outline: 1px solid blue;
            cursor: pointer;
            border-radius: 10px;
            padding: 10px;
        }
        .swap-btn:hover{
            outline: 1px solid blue;
            cursor: pointer;
            border-radius: 10px;
            padding: 10px;
        }

        .passenger-click{
            background-color: white; /* 배경색을 흰색으로 설정 */
            border: 1px solid black; /* 테두리를 검정색 1px 실선으로 설정 */
            padding: 10px 20px; /* 버튼 내부 여백 설정 (선택 사항) */
            border-radius: 5px;
            cursor: pointer;
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

<main class="booking-container" style="margin-top: 150px">
    <h1 style="font-size: 30px" class="booking-title"></h1>

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
<div >
    <img style="background-size: auto 100%" src="booking-visual--pc.jpg">
</div>
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

    let startValue = 'CJU';
    let endValue = 'PVG';

    // 날짜 관련 기능
    const today = new Date();
    const departDate = document.getElementById('departDate');
    const returnDate = document.getElementById('returnDate');

    // 날짜 포맷팅 함수
    function formatDate(date) {
        const d = new Date(date);
        let month = '' + (d.getMonth() + 1);
        let day = '' + d.getDate();
        const year = d.getFullYear();

        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;

        return [year, month, day].join('-');
    }

    // 초기 날짜 설정
    departDate.value = formatDate(today);
    const tomorrow = new Date(today);
    tomorrow.setDate(tomorrow.getDate() + 1);
    returnDate.value = formatDate(tomorrow);

    // 최소 날짜 설정
    departDate.min = formatDate(today);
    returnDate.min = formatDate(today);

    // 출발일 변경 시 도착일 최소값 설정
    departDate.addEventListener('change', function() {
        returnDate.min = this.value;
        if (returnDate.value < this.value) {
            returnDate.value = this.value;
        }
    });

    document.getElementById("searchStart").addEventListener('click',()=>{

        const countryList = "/reservation/openCountryList?type=start";
        const popWidth = 800;
        const popHeigth = 300;

        const options = `width=${popWidth}px, height=${popHeigth}px, top=20, left=20, resizable=no, scrollbars=yes, menubar=no, toolbar=no, location=no, directories=no, status=no`;

        const popupWindow = window.open(countryList, 'countryList', options);

        if (popupWindow) {
            console.log("나라 리스트 오픈");
            popupWindow.opener = window;
        } else {
            alert("아오 에러임");
        }
    })

    document.getElementById("searchEnd").addEventListener('click',()=>{
        const countryList = "/reservation/openCountryList?type=end";
        const popWidth = 800;
        const popHeigth = 300;

        const options = `width=${popWidth}px, height=${popHeigth}px, top=20, left=20, resizable=no, scrollbars=yes, menubar=no, toolbar=no, location=no, directories=no, status=no`;

        const popupWindow = window.open(countryList, 'countryList', options);

        if (popupWindow) {
            console.log("나라 리스트 오픈");
            popupWindow.opener = window;
        } else {
            alert("아오 에러임");
        }
    })



    window.addEventListener('message', function(event) {
        console.log(event.source.name);
        if (event.source.name === 'countryList') {
            const selectedAirport = event.data;
            if (event.data.type == 'start') {

                console.log('aiport.jsp에서 받은 start 데이터:', selectedAirport);
                const start = document.getElementById("startCountry");
                start.textContent = event.data.cntName;
                console.log(event.data.aptCode);
                startValue = event.data.aptCode;
            } else {
                console.log('aiport.jsp에서 받은 end 데이터:', selectedAirport);
                const end = document.getElementById("endCountry");
                end.textContent = event.data.cntName;
                endValue = event.data.aptCode;
            }
        }
    });

    document.getElementById("searchEnd").addEventListener('click',()=>{
        console.log("클릭")
    })

    document.getElementById("swapBtn").addEventListener("click", () => {
        const startCity = document.getElementById("startCountry");
        const endCity = document.getElementById("endCountry");

        const startCityInput = document.getElementById("startCountryInput");
        const endCityInput = document.getElementById("endCountryInput");


        // // 출발지와 도착지의 innerText를 임시 변수에 저장
        // const temp = startCity.innerText;
        // startCity.innerText = endCity.innerText;
        // endCity.innerText = temp;

        const tempText = startCity.innerText;
        const tempValue = startCityInput.value;

        startCity.innerText = endCity.innerText;
        startCityInput.value = endCityInput.value;

        endCity.innerText = tempText;
        endCityInput.value = tempValue;

    });

    document.getElementById("selectPassenger").addEventListener("click",()=>{
        const selectedPassenger = "/reservation/seletedPassenger";
        const popWidth = 800;
        const popHeigth = 300;

        const options = `width=${popWidth}px, height=${popHeigth}px, top=20, left=20, resizable=no, scrollbars=yes, menubar=no, toolbar=no, location=no, directories=no, status=no`;

        const popupWindow = window.open(selectedPassenger, 'selectedPassenger', options);

        if (popupWindow) {
            console.log("탑승객 팝업 오픈");
            popupWindow.opener = window;
        } else {
            alert("아오 에러임");
        }
    })

    window.addEventListener('message', function (event) {
        console.log(event.source.name);
        if (event.source.name === 'selectedPassenger') {
            const selectedPassenger = event.data;
            console.log(selectedPassenger);
            document.getElementById("selectPassenger").style.display = "none";

            const elementById = document.getElementById("passengerDiv");

            const pElement = document.createElement('p');
            pElement.id = 'checkPassenger';

            const adult = event.data.adult;
            const child = event.data.child;


            if (child == '0') {
                pElement.textContent = "성인 : " + adult + "명";
            }  else {

                pElement.textContent = "성인 : " + adult + "명 , " + "소아 : " + child + "명";

            }

            elementById.appendChild(pElement);
        }
    });

    document.querySelector('form').addEventListener('submit',function (event){
        // event.preventDefault();
        // const startValue = document.getElementById("startCountry").textContent;
        document.getElementById("startCountryInput").value = startValue;

        // const endValue = document.getElementById("endCountry").textContent;
        document.getElementById("endCountryInput").value = endValue;

        const departDateValue = document.getElementById("departDate").value;

        const returnDateValue = document.getElementById("returnDate").value;

        const checkValue = document.getElementById("checkPassenger").textContent;

        document.getElementById("checkPassengerInput").value = checkValue;

        const selectValue = document.querySelector('.passenger-select').value;

        console.log(startValue)
        console.log(endValue)
        console.log(departDateValue)
        console.log(returnDateValue)
        console.log(checkValue)
        console.log(selectValue)

    })
</script>
</body>
</html>