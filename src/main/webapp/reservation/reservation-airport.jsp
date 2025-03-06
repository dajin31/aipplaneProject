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

        .header {
            display: flex;
            align-items: center;
            gap: 20px;
            padding: 20px;
            border-bottom: 1px solid #eee;
            justify-content: flex-start;
            padding-left: 10%;
        }


        .logo img {
            height: 40px;
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
<body>
<header class="header">
    <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath d='M21 16v-2l-8-5V3.5c0-.83-.67-1.5-1.5-1.5S10 2.67 10 3.5V9l-8 5v2l8-2.5V19l-2 1.5V22l3.5-1 3.5 1v-1.5L13 19v-5.5l8 2.5z'/%3E%3C/svg%3E"
         alt="비행기" class="airplane-icon">
    <nav class="nav-categories">
        <span>카테고리</span>
        <span>카테고리</span>
        <span>카테고리</span>
    </nav>
</header>

<main class="booking-container">
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
<div >
    <img style="background-size: auto 100%" src="/images/main1.jpg">
</div>
<script>

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