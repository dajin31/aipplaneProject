<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> --%>
<%@page import="com.example.demo.vo.AirVO"%>
<%@page import="com.example.demo.Air.service.AirServicelmp"%>
<%@page import="com.example.demo.Air.service.AirService"%>
<%@ page import="com.example.demo.vo.UserVO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>항공권 예약 확인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <%
        UserVO userVo = (UserVO)session.getAttribute("loginUser");/*로그인 정보 불러오기*/

        if(userVo==null){//로그인 안되었다면
            response.sendRedirect("/middle/member/login.jsp");

            return;
        }

        //예약정보 불러오기 시작
        AirService airService = AirServicelmp.getInstance();

        //user_id, flt_code, 
        AirVO airVO = new AirVO();
        //로그인 한 회원의 아이디(동적으로 바뀜)
        airVO.setUser_id(userVo.getUser_id());
        airVO.setFlt_code(Integer.parseInt(request.getParameter("flt_code")));
        List<AirVO> list= airService.getAirList(airVO);
        if(list != null){
           // out.println("<p>airVO: " + list.toString() + "</p>");
        }
    %>



</head>

<body>


<div class="container mt-5">
    <h1 class="mb-4">항공권 예약 확인</h1>


    <!-- 결제 완료 메시지 -->
    <div class="alert alert-success" role="alert">

        <button class="btn btn-warning float-end" onclick="window.print();">예약정보 인쇄하기</button>
        <br>
    </div>

    <!-- 여정 정보 -->
    <h2>여정 정보</h2>
    <table class="table table-striped">
        <tr>
            <th>편명</th>
            <td>${list.flt_code}</td>
        </tr>
        <tr>
            <th>출발지</th>
            <td>${air.from_apt_name}</td>
        </tr>
        <tr>
            <th>도착지</th>
            <td>${air.to_apt_name}</td>
        </tr>
        <tr>
            <th>출발 일시</th>
            <td>${air.dpt_date}</td>
        </tr>
        <tr>
            <th>도착 일시</th>
            <td>${air.arr_date}</td>
        </tr>
        <tr>
            <th>총 결제 금액</th>
            <td><fmt:formatNumber value="${air.total_price}" type="currency" currencySymbol="₩"/></td>
        </tr>
    </table>




    <!-- 탑승객 정보 -->
    <h2>탑승객 정보</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>탑승객 이름</th>
            <th>회원번호</th>
            <th>항공권번호</th>
            <th>예약 상태</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="passenger" items="${passengers}">
            <tr>
                <td>${passenger.name}</td>
                <td>${passenger.memberNumber}</td>
                <td>${passenger.passportNumber}</td>
                <td>
                    <a href="FlightBookingServlet?action=viewTicket&passengerId=${passenger.id}" class="btn btn-primary btn-sm">조회</a>
                    <form action="FlightBookingServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="sendPDF">
                        <input type="hidden" name="passengerId" value="${passenger.id}">
                        <button type="submit" class="btn btn-secondary btn-sm">PDF 전송</button>
                    </form>
                    <form action="FlightBookingServlet" method="post" style="display:inline;" onsubmit="return confirm('정말로 예약을 취소하시겠습니까?');">
                        <input type="hidden" name="action" value="cancelBooking">
                        <input type="hidden" name="passengerId" value="${passenger.id}">
                        <button type="submit" class="btn btn-danger btn-sm">취소</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- 이메일 정보 -->
    <div class="mb-3">
        <strong>이메일:</strong> example@email.com
    </div>
</div>


</body>
</html>

