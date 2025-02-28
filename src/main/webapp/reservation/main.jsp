<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>항공권 예매</title>
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
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            border-bottom: 1px solid #eee;
        }

        .header-left {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .airplane-icon {
            width: 40px;
            height: 40px;
        }

        .nav-categories {
            display: flex;
            gap: 20px;
        }

        .header-right {
            display: flex;
            gap: 10px;
        }

        .login-btn {
            background-color: #1a365d;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
        }

        .signup-btn {
            color: #1a365d;
            text-decoration: none;
            padding: 10px 20px;
        }

        .main-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .booking-section {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 40px;
        }

        .booking-types {
            margin-bottom: 20px;
        }

        .booking-type-btn {
            padding: 10px 20px;
            border: 1px solid #1a365d;
            background: none;
            border-radius: 20px;
            margin-right: 10px;
            cursor: pointer;
        }

        .booking-type-btn.active {
            background-color: #1a365d;
            color: white;
        }

        .flight-search {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 20px;
        }

        .location-box {
            width: 150px;
            height: 150px;
            border: 1px solid #ddd;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
        }

        .arrow {
            color: #1a365d;
            font-size: 24px;
        }

        .search-options {
            display: flex;
            align-items: center;
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

        .passenger-select, .class-select {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 120px;
        }

        .search-btn {
            background-color: #1a365d;
            color: white;
            padding: 10px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .recommended {
            margin-top: 40px;
        }

        .carousel {
            position: relative;
            margin-top: 20px;
        }

        .carousel-container {
            display: flex;
            gap: 20px;
            overflow: hidden;
        }

        .flight-card {
            text-decoration: none;
            color: inherit;
            min-width: 250px;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
        }

        .flight-image {
            width: 100%;
            height: 150px;
            background-color: #1a365d;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: opacity 0.3s;
        }

        .flight-info {
            padding: 15px;
            background-color: #f8f9fa;
            text-align: center;
        }

        .carousel-btn {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 40px;
            height: 40px;
            background: white;
            border: 1px solid #ddd;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }

        .prev-btn {
            left: -20px;
        }

        .next-btn {
            right: -20px;
        }

        .flight-card:hover .flight-image {
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="header-left">
            <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath d='M21 16v-2l-8-5V3.5c0-.83-.67-1.5-1.5-1.5S10 2.67 10 3.5V9l-8 5v2l8-2.5V19l-2 1.5V22l3.5-1 3.5 1v-1.5L13 19v-5.5l8 2.5z'/%3E%3C/svg%3E" 
                 alt="비행기" class="airplane-icon">
            <nav class="nav-categories">
                <span>카테고리</span>
                <span>카테고리</span>
                <span>카테고리</span>
            </nav>
        </div>
        <div class="header-right">
            <a href="#" class="signup-btn">회원가입</a>
            <a href="#" class="login-btn">로그인</a>
        </div>
    </header>

    <main class="main-content">
        <h1>항공권 예매</h1>
        
        <section class="booking-section">
            <div class="booking-types">
                <button class="booking-type-btn active">예매</button>
                <button class="booking-type-btn">마일리지 예매</button>
            </div>

            <div class="flight-search">
                <div class="location-box">출발지</div>
                <span class="arrow">→</span>
                <div class="location-box">도착지</div>
            </div>

            <div class="search-options">
                <div class="date-field">
                    <label>출발일</label>
                    <input type="date" class="date-input" id="departDate">
                </div>
                <div class="date-field">
                    <label>도착일</label>
                    <input type="date" class="date-input" id="returnDate">
                </div>
                <div>
                    <select class="passenger-select">
                        <option>1명</option>
                        <option>2명</option>
                        <option>3명</option>
                        <option>4명</option>
                    </select>
                </div>
                <div>
                    <select class="class-select">
                        <option>일반석</option>
                        <option>비즈니스</option>
                        <option>퍼스트</option>
                    </select>
                </div>
                <button class="search-btn">조회하기</button>
            </div>
        </section>

        <section class="recommended">
            <h2>추천 항공편</h2>
            <div class="carousel">
                <button class="carousel-btn prev-btn">←</button>
                <div class="carousel-container">
                    <a href="/flights/1" class="flight-card">
                        <div class="flight-image">사진</div>
                        <div class="flight-info">항공편 정보</div>
                    </a>
                    <a href="/flights/2" class="flight-card">
                        <div class="flight-image">사진</div>
                        <div class="flight-info">항공편 정보</div>
                    </a>
                    <a href="/flights/3" class="flight-card">
                        <div class="flight-image">사진</div>
                        <div class="flight-info">항공편 정보</div>
                    </a>
                    <a href="/flights/4" class="flight-card">
                        <div class="flight-image">사진</div>
                        <div class="flight-info">항공편 정보</div>
                    </a>
                </div>
                <button class="carousel-btn next-btn">→</button>
            </div>
        </section>
    </main>

    <script>
        // 캐러셀 네비게이션
        const container = document.querySelector('.carousel-container');
        const prevBtn = document.querySelector('.prev-btn');
        const nextBtn = document.querySelector('.next-btn');
        
        nextBtn.addEventListener('click', () => {
            container.scrollBy({ left: 270, behavior: 'smooth' });
        });
        
        prevBtn.addEventListener('click', () => {
            container.scrollBy({ left: -270, behavior: 'smooth' });
        });

        // 예매 타입 토글
        const bookingBtns = document.querySelectorAll('.booking-type-btn');
        bookingBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                bookingBtns.forEach(b => b.classList.remove('active'));
                btn.classList.add('active');
            });
        });

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
    </script>
</body>
</html>