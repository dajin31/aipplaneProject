<%--<%@ page import="com.example.demo.vo.UserVO" %>--%>
<%--<%@ page import="com.example.demo.vo.AdminReservationVO" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="java.util.HashSet" %>--%>
<%--<%@ page import="java.util.Set" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>회원 예약 현황</title>--%>
<%--    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminReservation.css">--%>
<%--    <script src="<%=request.getContextPath()%>/js/jquery-3.7.1.js"></script>--%>
<%--    <script>--%>
<%--        // 이미 열린 상세 창 추적--%>
<%--        var detailWindow = null;--%>

<%--        function openDetailWindow(url) {--%>
<%--            if (detailWindow && !detailWindow.closed) {--%>
<%--                // 이미 열린 창이 있으면 해당 창에서 URL 변경--%>
<%--                detailWindow.location.href = url;--%>
<%--                detailWindow.focus();--%>
<%--            } else {--%>
<%--                // 새 창 열기 (전체 화면에 가깝게 설정)--%>
<%--                var width = window.screen.width * 0.9;--%>
<%--                var height = window.screen.height * 0.9;--%>
<%--                var left = (window.screen.width - width) / 2;--%>
<%--                var top = (window.screen.height - height) / 2;--%>

<%--                detailWindow = window.open(url, 'reservationDetail', 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top);--%>
<%--            }--%>
<%--        }--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <h1>회원 예약 현황</h1>--%>

<%--    <%--%>
<%--        UserVO user = (UserVO) request.getAttribute("user");--%>
<%--        List<AdminReservationVO> reservations = (List<AdminReservationVO>) request.getAttribute("reservations");--%>
<%--        String errorMessage = (String) request.getAttribute("errorMessage");--%>

<%--        if (errorMessage != null) {--%>
<%--    %>--%>
<%--    <div class="error-message">--%>
<%--        <%= errorMessage %>--%>
<%--    </div>--%>
<%--    <%--%>
<%--    } else if (user != null) {--%>
<%--    %>--%>
<%--    <div class="user-info">--%>
<%--        <h2><%= user.getUserName() %> (<%= user.getUserId() %>)님의 예약 현황</h2>--%>
<%--    </div>--%>

<%--    <% if (reservations != null && !reservations.isEmpty()) { %>--%>
<%--    <table class="reservation-table">--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>항공편 코드</th>--%>
<%--            <th>출발지</th>--%>
<%--            <th>도착지</th>--%>
<%--            <th>기종</th>--%>
<%--            <th>인원수</th>--%>
<%--            <th>상세조회</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <%--%>
<%--            // 중복 항공편 코드 제거를 위한 Set--%>
<%--            Set<Integer> processedFlights = new HashSet<>();--%>

<%--            for (AdminReservationVO reservation : reservations) {--%>
<%--                // 이미 처리된 항공편 코드는 건너뛰기--%>
<%--                if (processedFlights.contains(reservation.getFltCode())) {--%>
<%--                    continue;--%>
<%--                }--%>
<%--                processedFlights.add(reservation.getFltCode());--%>
<%--        %>--%>
<%--        <tr>--%>
<%--            <td><%= reservation.getFltCode() %></td>--%>
<%--            <td>--%>
<%--                <%= reservation.getDptAptName() %><br>--%>
<%--                <span class="datetime"><%= reservation.getFormattedDptDateTime() %></span>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <%= reservation.getArrAptName() %><br>--%>
<%--                <span class="datetime"><%= reservation.getFormattedArrDateTime() %></span>--%>
<%--            </td>--%>
<%--            <td><%= reservation.getAirName() %></td>--%>
<%--            <td><%= reservation.getPassengerCount() %></td>--%>
<%--            <td>--%>
<%--                <button type="button" onclick="openDetailWindow('<%=request.getContextPath()%>/AdminUser/AdminReservationDetail?userId=<%= reservation.getUserId() %>&fltCode=<%= reservation.getFltCode() %>')">상세조회</button>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <% } %>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--    <% } else { %>--%>
<%--    <div class="no-data">--%>
<%--        <p>예약 정보가 없습니다.</p>--%>
<%--    </div>--%>
<%--    <% } %>--%>

<%--    <div class="button-container">--%>
<%--        <button type="button" onclick="window.close()">닫기</button>--%>
<%--    </div>--%>
<%--    <% } %>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

