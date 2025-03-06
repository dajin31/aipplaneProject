<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>예약 목록</title>
    <style>
        table { border-collapse: collapse; width: 80%; margin: 20px auto; }
        th, td { border: 1px solid black; padding: 10px; text-align: center; }
    </style>
</head>
<body>
<h2 align="center">예약 목록</h2>

<table>
    <tr>
        <th>예약 코드</th>
        <th>예약 날짜</th>
        <th>총 가격</th>
        <th>티켓 가격</th>
        <th>예약 상태</th>
        <th>사용자 ID</th>
        <th>취소</th>
    </tr>

    <%
        // reservations 리스트 가져오기
        java.util.List<com.example.demo.vo.ReservationVO> reservations =
                (java.util.List<com.example.demo.vo.ReservationVO>) request.getAttribute("reservations");

        if (reservations != null) {
            for (com.example.demo.vo.ReservationVO reservation : reservations) {
    %>
    <tr>
        <td><%= reservation.getResCode() %></td>
        <td><%= reservation.getResDate() %></td>
        <td><%= reservation.getTotalPrice() %></td>
        <td><%= reservation.getTicketPrice() %></td>
        <td><%= reservation.isResStatus() ? "확정" : "취소됨" %></td>
<%--        <td><%= reservation.getUser().getUserId() %></td>--%>
        <td>
            <form action="reservations" method="post">
                <input type="hidden" name="resCode" value="<%= reservation.getResCode() %>">
                <input type="submit" value="취소">
            </form>
        </td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="7">예약 내역이 없습니다.</td>
    </tr>
    <%
        }
    %>
</table>

<h3>새로운 예약 생성</h3>
<form action="<%=request.getContextPath()%>/testUser.do" method="get">
    사용자 ID: <input type="text" name="userId" required><br>
    좌석 번호: <input type="text" name="seatId" ><br>
    <input type="submit" value="예약하기">
</form>
</body>
</html>
