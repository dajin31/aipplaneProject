<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>항공권 조회</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }

        body {
            background-color: #f5f5f5;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        /* 네비게이션 바 */
        .nav-bar {
            display: flex;
            background: linear-gradient(to right, #1a3a8f, #3a5ca9);
            color: white;
        }

        .nav-item {
            padding: 20px 0;
            flex: 1;
            text-align: center;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .nav-item.active {
            background-color: #0a2463;
            font-weight: bold;
        }

        /* 검색 폼 */
        .search-container {
            background-color: white;
            padding: 30px;
            border-radius: 0 0 10px 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .tab-container {
            display: flex;
            margin-bottom: 20px;
        }

        .tab {
            padding: 10px 20px;
            border-radius: 20px;
            cursor: pointer;
            margin-right: 10px;
        }

        .tab.active {
            background-color: #0a2463;
            color: white;
        }

        .trip-type {
            display: flex;
            margin-bottom: 20px;
        }

        .trip-option {
            margin-right: 20px;
            display: flex;
            align-items: center;
        }

        .trip-option input {
            margin-right: 5px;
        }

        .search-form {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            flex: 1;
            min-width: 200px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .location-input {
            display: flex;
            align-items: center;
            background-color: #f9f9f9;
            border-radius: 5px;
            padding: 10px;
        }

        .location-code {
            font-size: 24px;
            font-weight: bold;
            margin-right: 10px;
        }

        .location-name {
            font-size: 14px;
            color: #666;
        }

        .passenger-select {
            display: flex;
            align-items: center;
            background-color: #f9f9f9;
            border-radius: 5px;
            padding: 10px;
        }

        .search-btn {
            background-color: #0a2463;
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .search-btn:hover {
            background-color: #153a94;
        }

        .checkbox-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .checkbox-container input {
            margin-right: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- 네비게이션 바 -->
    <div class="nav-bar">
        <div class="nav-item">항공권 예매</div>
        <div class="nav-item active">예약 조회</div>
        <div class="nav-item">체크인</div>
        <div class="nav-item">출도착/스케줄</div>
    </div>

    <!-- 검색 폼 -->
    <div class="search-container">
        <div class="tab-container">
            <div class="tab active">예매</div>
            <div class="tab">마일리지 예매</div>
        </div>

        <div class="trip-type">
            <div class="trip-option">
                <input type="radio" id="round-trip" name="trip-type" checked>
                <label for="round-trip">왕복</label>
            </div>
            <div class="trip-option">
                <input type="radio" id="one-way" name="trip-type">
                <label for="one-way">편도</label>
            </div>
            <div class="trip-option">
                <input type="radio" id="multi-city" name="trip-type">
                <label for="multi-city">다구간</label>
            </div>
        </div>

        <form action="processTicketSearch.jsp" method="post">
            <div class="search-form">
                <div class="form-group">
                    <label>출발지</label>
                    <div class="location-input">
                        <div class="location-code">SEL</div>
                        <div class="location-name">서울</div>
                    </div>
                </div>

                <div class="form-group">
                    <label>도착지</label>
                    <select class="form-control" name="destination">
                        <option value="">선택하세요</option>
                        <option value="JFK">뉴욕 (JFK)</option>
                        <option value="LAX">로스앤젤레스 (LAX)</option>
                        <option value="CDG">파리 (CDG)</option>
                        <option value="HND">도쿄 (HND)</option>
                        <option value="PEK">베이징 (PEK)</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>출발일</label>
                    <input type="date" class="form-control" name="departure-date">
                </div>

                <div class="form-group">
                    <label>도착일</label>
                    <input type="date" class="form-control" name="return-date">
                </div>
            </div>

            <div class="search-form">
                <div class="form-group">
                    <label>탑승객</label>
                    <div class="passenger-select">
                        <span>성인 1명</span>
                    </div>
                </div>

                <div class="form-group">
                    <label>좌석 등급</label>
                    <select class="form-control" name="seat-class">
                        <option value="economy">일반석</option>
                        <option value="business">비즈니스석</option>
                        <option value="first">일등석</option>
                    </select>
                </div>
            </div>

            <div class="checkbox-container">
                <input type="checkbox" id="flexible-dates" name="flexible-dates">
                <label for="flexible-dates">가까운 날짜 함께 조회</label>
            </div>

            <div style="text-align: right;">
                <button type="submit" class="search-btn">항공권 검색</button>
            </div>
        </form>
    </div>
</div>

<script>
    // 탭 전환 기능
    document.querySelectorAll('.tab').forEach(tab => {
        tab.addEventListener('click', function() {
            document.querySelector('.tab.active').classList.remove('active');
            this.classList.add('active');
        });
    });

    // 네비게이션 아이템 전환 기능
    document.querySelectorAll('.nav-item').forEach(item => {
        item.addEventListener('click', function() {
            document.querySelector('.nav-item.active').classList.remove('active');
            this.classList.add('active');
        });
    });

    // 폼 제출 처리
    document.querySelector('form').addEventListener('submit', function(e) {
        e.preventDefault();
        // 실제 구현에서는 이 부분에 폼 유효성 검사 및 서버 제출 로직 추가
        // alert('항공권 검색을 시작합니다.');
        // this.submit(); // 실제 제출 시 주석 해제
        const destination = document.querySelector('select[name="destination"]').value;
        const departureDate = document.querySelector('input[name="departure-date"]').value;
        const returnDate = document.querySelector('input[name="return-date"]').value;

        // 두 번째 페이지로 이동
        window.location.href = `flight-ticket-check.jsp?destination=${destination}&departure-date=${departureDate}&return-date=${returnDate}`;
    });

</script>
</body>
</html>

