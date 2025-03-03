<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>항공권 검색 결과</title>
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
            padding: 20px;
        }

        .header {
            background: linear-gradient(to right, #1a3a8f, #3a5ca9);
            color: white;
            padding: 20px;
            border-radius: 10px 10px 0 0;
        }

        .search-results {
            background-color: white;
            border-radius: 0 0 10px 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .flight-card {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .flight-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .flight-time {
            font-size: 24px;
            font-weight: bold;
        }

        .flight-duration {
            color: #666;
        }

        .flight-price {
            font-size: 24px;
            font-weight: bold;
            color: #0a2463;
        }

        .select-btn {
            background-color: #0a2463;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .select-btn:hover {
            background-color: #153a94;
        }

        .back-btn {
            background-color: #666;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s;
        }

        .back-btn:hover {
            background-color: #444;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>항공권 검색 결과</h1>
        <p>
            <%
                String destination = request.getParameter("destination");
                String departureDate = request.getParameter("departure-date");
                String returnDate = request.getParameter("return-date");

                if(destination == null) destination = "";
                if(departureDate == null) departureDate = "";
                if(returnDate == null) returnDate = "";

                out.println("서울 → " + destination + " | " + departureDate + " ~ " + returnDate);
            %>
        </p>
    </div>

    <div class="search-results">
        <%
            // 실제 구현에서는 데이터베이스에서 항공권 정보를 조회하여 표시
            // 여기서는 예시 데이터를 사용
            String[][] flights = {
                    {"07:00", "09:30", "2시간 30분", "대한항공", "350,000원"},
                    {"10:30", "13:00", "2시간 30분", "아시아나항공", "320,000원"},
                    {"14:00", "16:30", "2시간 30분", "제주항공", "280,000원"},
                    {"19:00", "21:30", "2시간 30분", "티웨이항공", "260,000원"}
            };

            for(String[] flight : flights) {
        %>
        <div class="flight-card">
            <div class="flight-info">
                <div>
                    <div class="flight-time"><%= flight[0] %> → <%= flight[1] %></div>
                    <div class="flight-duration"><%= flight[2] %> | <%= flight[3] %></div>
                </div>
            </div>
            <div>
                <div class="flight-price"><%= flight[4] %></div>
                <button class="select-btn">선택</button>
            </div>
        </div>
        <%
            }
        %>

        <button class="back-btn" onclick="location.href='flight-ticket-check.jsp'">돌아가기</button>
    </div>
</div>
</body>
</html>

