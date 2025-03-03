<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대한항공 예약 조회</title>
    <style>
        /* 이전 CSS 스타일 유지 */
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
            margin: 0 auto;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* 헤더 스타일 */
        .header {
            display: flex;
            align-items: center;
            padding: 15px 20px;
            border-bottom: 1px solid #ddd;
        }

        .logo {
            height: 40px;
            margin-right: 20px;
        }

        .anniversary {
            height: 30px;
            margin-left: auto;
        }

        /* 검색 폼 스타일 */
        .search-form {
            margin: 30px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .form-title {
            font-size: 18px;
            margin-bottom: 20px;
            color: #00589c;
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
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 3px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #00589c;
            color: white;
        }

        .btn-container {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <!-- 헤더 -->
    <div class="header">
        <img src="\images/SoonAirLine.png" alt="SOON 항공 로고" class="logo">
    </div>

    <!-- 예약 조회 폼 -->
    <div class="search-form">
        <h3 class="form-title">예약 조회</h3>
        <form action="reservation-result.jsp" method="post">
            <div class="form-group">
                <label for="reservation-number">예약번호</label>
                <input type="text" id="reservation-number" name="reservationNumber" class="form-control" placeholder="예약번호를 입력하세요">
            </div>

            <div class="form-group">
                <label for="passenger-name">탑승객 성명 (한글)</label>
                <input type="text" id="passenger-name" name="passengerName" class="form-control" placeholder="탑승객 성명을 입력하세요">
            </div>

            <div class="btn-container">
                <button type="submit" class="btn btn-primary">조회하기</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>

