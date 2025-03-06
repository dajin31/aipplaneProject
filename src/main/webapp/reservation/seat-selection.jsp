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

        .header {
            display: flex;
            align-items: center;
            gap: 20px;
            padding: 20px;
            border-bottom: 1px solid #eee;
            justify-content:  flex-start;
            padding-left: 20%;
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
<body class="airplane-background">
    <header class="header">
        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath d='M21 16v-2l-8-5V3.5c0-.83-.67-1.5-1.5-1.5S10 2.67 10 3.5V9l-8 5v2l8-2.5V19l-2 1.5V22l3.5-1 3.5 1v-1.5L13 19v-5.5l8 2.5z'/%3E%3C/svg%3E"
             alt="비행기" class="airplane-icon">
        <nav class="nav-categories">
            <span>카테고리</span>
            <span>카테고리</span>
            <span>카테고리</span>
        </nav>
    </header>

    <main class="main-content" style="margin-top: 130px">
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
            // window.location.href =

            //     회원 여부 판단후 회원이 아니면 로그인 페이지 이동
            let loginCheck = false;
            if (!loginCheck) {
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
        });


    </script>
</body>
</html>