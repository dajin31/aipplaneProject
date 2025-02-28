<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여정 정보</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal {
            position: relative;
            width: 100%;
            max-width: 750px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
            overflow: hidden;
        }

        .modal-header {
            padding: 20px;
            border-bottom: 1px solid #eee;
            position: relative;
        }

        .modal-title {
            font-size: 20px;
            font-weight: bold;
        }

        .close-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
        }

        .route-info {
            background-color: #e8f4ff;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .route {
            display: flex;
            align-items: center;
        }

        .airport-code {
            font-size: 20px;
            font-weight: bold;
            color: #00205b;
        }

        .airport-name {
            font-size: 14px;
            color: #666;
            margin-left: 5px;
        }

        .route-arrow {
            margin: 0 15px;
            color: #666;
        }

        .duration {
            font-size: 14px;
            color: #333;
        }

        .flight-details {
            padding: 20px;
            border-bottom: 1px solid #eee;
        }

        .flight-number {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .flight-code {
            font-size: 16px;
            font-weight: bold;
            color: #00205b;
        }

        .aircraft-type {
            font-size: 14px;
            color: #666;
            margin-left: 10px;
            text-decoration: underline;
        }

        .utility-icons {
            display: flex;
            gap: 15px;
        }

        .icon {
            width: 20px;
            height: 20px;
            cursor: pointer;
        }

        .timeline {
            position: relative;
            padding-left: 30px;
        }

        .timeline::before {
            content: "";
            position: absolute;
            left: 10px;
            top: 25px;
            bottom: 25px;
            width: 2px;
            background-color: #00205b;
        }

        .timeline-point {
            position: relative;
            margin-bottom: 30px;
        }

        .timeline-point:last-child {
            margin-bottom: 0;
        }

        .timeline-point::before {
            content: "";
            position: absolute;
            left: -30px;
            top: 5px;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background-color: #00205b;
        }

        .timeline-airport {
            font-size: 16px;
            font-weight: bold;
            color: #00205b;
            margin-bottom: 5px;
        }

        .timeline-details {
            font-size: 14px;
            color: #333;
        }

        .timeline-terminal {
            margin-left: 10px;
            color: #666;
        }

        .duration-label {
            color: #0066cc;
            font-size: 14px;
            margin: 15px 0 15px 0;
        }

        .confirm-btn-container {
            padding: 20px;
            display: flex;
            justify-content: center;
        }

        .confirm-btn {
            background-color: #00205b;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 12px 80px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="modal">
    <div class="modal-header">
        <h2 class="modal-title">여정 정보</h2>
        <button class="close-btn">×</button>
    </div>

    <div class="route-info">
        <div class="route">
            <div>
                <span class="airport-code" id="startCountry">NRT</span>
                <span class="airport-name" id="startCountryName">도쿄/나리타</span>
            </div>

            <span class="route-arrow">→</span>

            <div>
                <span class="airport-code" id="endCountry">ICN</span>
                <span class="airport-name"  id="endCountryName">서울/인천</span>
            </div>
        </div>

        <div class="duration" id="totalTime">총 2시간 45분 여정</div>
    </div>

    <div class="flight-details">
        <div class="flight-number">
            <div>
                <span class="flight-code" id="airCode">KE706</span>
                <span class="aircraft-type" id="airName">A321-neo</span>
            </div>

            <div class="utility-icons">
                <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M8 17l4 4 4-4M12 12v9"></path>
                    <path d="M20.88 18.09A5 5 0 0018 9h-1.26A8 8 0 103 16.29"></path>
                </svg>

                <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M6 9H4.5a2.5 2.5 0 010-5H6"></path>
                    <path d="M18 9h1.5a2.5 2.5 0 000-5H18"></path>
                    <path d="M4 22h16a2 2 0 002-2V7a2 2 0 00-2-2H4a2 2 0 00-2 2v13a2 2 0 002 2z"></path>
                    <path d="M11 16H8"></path>
                    <path d="M16 16h-2"></path>
                </svg>

                <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M5 12.55a11 11 0 0114.08 0"></path>
                    <path d="M1.42 9a16 16 0 0121.16 0"></path>
                    <path d="M8.53 16.11a6 6 0 016.95 0"></path>
                    <path d="M12 20h.01"></path>
                </svg>

                <svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
                </svg>
            </div>
        </div>

        <div class="timeline">
            <div class="timeline-point">
                <div class="timeline-airport" id="startCountryLine">NRT 도쿄/나리타</div>
                <div class="timeline-details" id="startTimeDetail">
                    2025년 03월 12일 (수) 09:15
                    <span class="timeline-terminal">터미널 1</span>
                </div>
            </div>

            <div class="duration-label" id="whatTime">2시간 45분</div>

            <div class="timeline-point">
                <div class="timeline-airport" id="endCountryLine">ICN 서울/인천</div>
                <div class="timeline-details" id="endTimeDetail">
                    2025년 03월 12일 (수) 12:00
                    <span class="timeline-terminal">터미널 2</span>
                </div>
            </div>
        </div>
    </div>

    <div class="confirm-btn-container">
        <button class="confirm-btn">확인</button>
    </div>
</div>

<script>


    function formatFlightTime(fltTime) {
        const hours = Math.floor(fltTime / 60); // 시간을 계산합니다.
        const minutes = fltTime % 60; // 분을 계산합니다.

        if (hours > 0) {
            return hours + "시간 " + minutes + "분";
        } else {
            return minutes + "분";
        }
    }

    const urlParams = new URLSearchParams(window.location.search);
    const fltCode = urlParams.get('fltCode');
    console.log(fltCode);

    const url = '/reservation/detailSelectOne?fltCode=' + fltCode;

    fetch(url)
        .then(response => response.json())
        .then(data=>{
            console.log(data[0])
            document.getElementById("startCountry").innerText = data[0].dptAptCode;
            document.getElementById("startCountryName").innerText = data[0].dptCntName;
            document.getElementById("startCountryLine").innerText = data[0].dptAptCode + " " + data[0].dptCntName;

            document.getElementById("endCountry").innerText = data[0].arrAptCode;
            document.getElementById("endCountryName").innerText = data[0].aptName;
            document.getElementById("endCountryLine").innerText = data[0].arrAptCode + " " + data[0].aptName;

            document.getElementById("airCode").innerText = data[0].fltCode;
            document.getElementById("airName").innerText = data[0].airName;

            if (data[0].dptTime) {
                const time = data[0].dptTime.split(" ")[1].substring(0, 5);
                document.getElementById("startTimeDetail").innerText = time;
            } else {
                document.getElementById("startTimeDetail").innerText = "시간 정보 없음";
            }

            const fltTime = data[0].fltTime;
            const realTime = formatFlightTime(fltTime);
            document.getElementById("whatTime").innerText = realTime;

            if (data[0].arrTime) {
                const endtime = data[0].arrTime.split(" ")[1].substring(0, 5);
                document.getElementById("endTimeDetail").innerText = endtime;
            } else {
                document.getElementById("endTimeDetail").innerText = "시간 정보 없음";
            }

            document.getElementById("totalTime").innerText = "총 " + realTime + " 여정";


        })
        .catch(err=>console.error(err))

    // Close button functionality
    document.querySelector('.close-btn').addEventListener('click', function() {
        // In a real application, this would close the modal
        window.close();
    });

    // Confirm button functionality
    document.querySelector('.confirm-btn').addEventListener('click', function() {
        // In a real application, this would confirm and close the modal
        window.close();
    });
</script>
</body>
</html>

