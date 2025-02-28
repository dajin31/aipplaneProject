<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>항공권 조회</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
        }

        .header {
            display: flex;
            align-items: center;
            gap: 20px;
            padding: 20px;
            border-bottom: 1px solid #eee;
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

        .search-section {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .location-box {
            border: 1px solid #ddd;
            padding: 15px;
            width: 120px;
            text-align: center;
        }

        .arrow {
            color: #1a365d;
            font-weight: bold;
        }

        .date-select {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .passenger-select, .class-select {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .flight-list {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .flight-item {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .flight-info {
            flex: 1;
        }

        .flight-time {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .availability {
            color: #666;
        }

        .price-section {
            text-align: right;
        }

        .price {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .seat-status {
            color: #1a365d;
            text-decoration: underline;
        }

        .footer {
            background-color: #f8f9fa;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .total-price {
            font-size: 16px;
        }

        .next-btn {
            background-color: #1a365d;
            color: white;
            padding: 10px 20px;
            border: none;
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

    <main class="main-content">
        <h1>항공권 조회</h1>
        
        <section class="search-section">
            <div class="location-box">출발지</div>
            <span class="arrow">→</span>
            <div class="location-box">도착지</div>
            <div class="date-select">
                <span>가는날 ~ 오는날</span>
            </div>
            <select class="passenger-select">
                <option>1명</option>
                <option>2명</option>
                <option>3명</option>
            </select>
            <select class="class-select">
                <option>좌석등급</option>
            </select>
        </section>

        <div class="flight-list">
            <div class="flight-item">
                <div class="flight-info">
                    <div class="flight-time">선택한 좌석 시간대별</div>
                    <div class="availability">확인 가능</div>
                </div>
                <div class="price-section">
                    <div class="price">금액</div>
                    <div class="seat-status">잔여석</div>
                </div>
            </div>

            <div class="flight-item">
                <div class="flight-info">
                    <div class="flight-time">선택한 좌석 시간대별</div>
                    <div class="availability">확인 가능</div>
                </div>
                <div class="price-section">
                    <div class="price">금액</div>
                    <div class="seat-status">잔여석</div>
                </div>
            </div>

            <div class="flight-item">
                <div class="flight-info">
                    <div class="flight-time">선택한 좌석 시간대별</div>
                    <div class="availability">확인 가능</div>
                </div>
                <div class="price-section">
                    <div class="price">금액</div>
                    <div class="seat-status">잔여석</div>
                </div>
            </div>
        </div>
    </main>

    <footer class="footer">
        <div class="total-price">
            <span>예상 총액</span>
            <strong>KRW 000,000원</strong>
        </div>
        <button class="next-btn">다음완성</button>
    </footer>

    <script>
        // 항공편 선택 기능
        document.querySelectorAll('.flight-item').forEach(item => {
            item.addEventListener('click', function() {
                // 이전 선택 제거
                document.querySelectorAll('.flight-item').forEach(i => {
                    i.style.border = '1px solid #ddd';
                });
                // 현재 선택 표시
                this.style.border = '2px solid #1a365d';
            });
        });
    </script>
</body>
</html>