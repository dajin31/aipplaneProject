<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대한항공 항공권 조회</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
        }

        body {
            background-color: #f5f5f5;
        }

        .container {
            max-width: 1000px;
            height: 1000px;
            margin: 0 auto;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* 헤더 스타일 */
        .header {
            display: flex;
            align-items: center;
            padding: 15px 15px;
            border-bottom: 1px solid #ddd;
        }

        @media (min-width: 360px) {
            .logo {
                width: 13.2rem;
                height: 4.4rem;
                background-size: contain; /* 또는 cover */
            }
        }

        .logo {
            width: 10rem; /* 원하는 너비 설정 */
            height: 3rem; /* 원하는 높이 설정 */
            background-image: url('/images/SoonAirLine.png');
            background-size: contain; /* 또는 cover */
            background-repeat: no-repeat;
            background-position: center;
        }

        .anniversary {
            height: 30px;
            margin-left: auto;
        }

        /* 단계 네비게이션 */
        .steps {
            display: flex;
            border-bottom: 1px solid #ddd;
        }

        .step {
            flex: 1;
            text-align: center;
            padding: 15px 10px;
            background-color: #f9f9f9;
            position: relative;
        }

        .step.active {
            background-color: #00589c;
            color: white;
        }

        .step-number {
            display: inline-block;
            width: 24px;
            height: 24px;
            line-height: 24px;
            border-radius: 50%;
            background-color: #ccc;
            color: white;
            margin-right: 8px;
        }

        .step.active .step-number {
            background-color: white;
            color: #00589c;
        }

        /* 알림 메시지 */
        .notification {
            margin: 20px;
            padding: 15px;
            border: 2px dashed #e74c3c;
            border-radius: 5px;
            text-align: center;
            color: #333;
        }

        .notification-title {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .notification-btn {
            background-color: #f1c40f;
            border: none;
            color: #333;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 10px;
        }

        /* 섹션 제목 */
        .section-title {
            font-size: 20px;
            margin: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #ddd;
        }

        /* 테이블 스타일 */
        .data-table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 20px;
            width: calc(100% - 40px);
        }

        .data-table th {
            background-color: #00589c;
            color: white;
            padding: 12px;
            text-align: center;
        }

        .data-table td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        .data-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* 폼 스타일 */
        .search-form {
            margin: 20px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 3px;
        }

        .btn {
            padding: 8px 15px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .btn-primary {
            background-color: #00589c;
            color: white;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }

        /* 항공편 정보 */
        .flight-info {
            background-color: #fff9e6;
            padding: 10px;
            margin-bottom: 10px;
        }

        .flight-number {
            font-weight: bold;
            color: #00589c;
        }

        .seat-info {
            color: #666;
        }

        .aircraft-type {
            color: #00589c;
            text-decoration: none;
        }

        .aircraft-type:hover {
            text-decoration: underline;
        }

        /* 버튼 그룹 */
        .btn-group {
            display: flex;
            gap: 5px;
        }

        .btn-sm {
            padding: 5px 10px;
            font-size: 12px;
        }

        .btn-info {
            background-color: #17a2b8;
            color: white;
        }

        .btn-warning {
            background-color: #ffc107;
            color: #212529;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        /* 연락처 정보 */
        .contact-info {
            display: flex;
            align-items: center;
        }

        .contact-label {
            width: 80px;
            font-weight: bold;
        }

        .sms-btn {
            background-color: #17a2b8;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            margin-left: 10px;
            cursor: pointer;
            font-size: 12px;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- 헤더 -->
    <div class="header">
        <img src="\images/SoonAirLine.png" alt="SOON 항공사 로고" class="logo">
    </div>

    <!-- 단계 네비게이션 -->
    <div class="steps">
        <div class="step">
            <span class="step-number">1</span>
            <span>여정/날짜 선택</span>
        </div>
        <div class="step">
            <span class="step-number">2</span>
            <span>운임/항공편 선택</span>
        </div>
        <div class="step">
            <span class="step-number">3</span>
            <span>탑승객 정보</span>
        </div>
        <div class="step">
            <span class="step-number">4</span>
            <span>결제 정보</span>
        </div>
        <div class="step active">
            <span class="step-number">5</span>
            <span>확인</span>
        </div>
    </div>

    <!-- 알림 메시지 -->
    <div class="notification">
        <div class="notification-title">결제가 완료되었습니다</div>
        <button class="notification-btn">예약정보 인쇄하기</button>
    </div>

    <!-- 여정 정보 -->
    <h2 class="section-title">여정정보</h2>
    <table class="data-table">
        <thead>
        <tr>
            <th>편명</th>
            <th>출발지</th>
            <th>도착지</th>
            <th>클래스</th>
            <th>기종</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="flight-number">KE123</td>
            <td>서울/인천(ICN)<br>2023.12.01<br>터미널 2</td>
            <td>도쿄/나리타(NRT)<br>2023.12.01<br>터미널 1</td>
            <td class="seat-info">일반석(Q)<br>2석</td>
            <td><a href="#" class="aircraft-type">A330-200</a></td>
        </tr>
        <tr>
            <td class="flight-number">KE124</td>
            <td>도쿄/나리타(NRT)<br>2023.12.05<br>터미널 1</td>
            <td>서울/인천(ICN)<br>2023.12.05<br>터미널 2</td>
            <td class="seat-info">일반석(L)<br>2석</td>
            <td><a href="#" class="aircraft-type">A330-200</a></td>
        </tr>
        </tbody>
    </table>

    <!-- 탑승객 및 연락처 정보 -->
    <h2 class="section-title">탑승객 및 연락처 정보</h2>
    <table class="data-table">
        <thead>
        <tr>
            <th>탑승객 이름</th>
            <th>회원번호</th>
            <th>항공권번호</th>
            <th>예약 상세</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>김예찬</td>
            <td>KE123456789</td>
            <td>1801234567890</td>
            <td>
                <div class="btn-group">
                    <button class="btn btn-sm btn-info">조회</button>
                    <button class="btn btn-sm btn-warning">PDF 전송</button>
                    <button class="btn btn-sm btn-danger">취소</button>
                </div>
            </td>
        </tr>
        <tr>
            <td>고예림</td>
            <td>KE987654321</td>
            <td>1809876543210</td>
            <td>
                <div class="btn-group">
                    <button class="btn btn-sm btn-info">조회</button>
                    <button class="btn btn-sm btn-warning">PDF 전송</button>
                    <button class="btn btn-sm btn-danger">취소</button>
                </div>
            </td>
        </tr>
        <tr>
            <td>김태경</td>
            <td>KE123456522</td>
            <td>1801234567123</td>
            <td>
                <div class="btn-group">
                    <button class="btn btn-sm btn-info">조회</button>
                    <button class="btn btn-sm btn-warning">PDF 전송</button>
                    <button class="btn btn-sm btn-danger">취소</button>
                </div>
            </td>
        </tr>
        </tbody>
    </table>

    <div style="margin: 20px;">
        <div class="contact-info" style="margin-top: 10px;">
            <span class="contact-label">이메일</span>
            <span>구매자이메일(예찬)@email.com</span>
        </div>
    </div>
</div>

<script>
    document.querySelector('.notification-btn').addEventListener('click', function() {
        window.print();
    });
</script>
</body>
</html>

