<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여정 정보</title>
    <link rel="stylesheet" href="/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
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
        <div class="step last">
            <span class="step-number">5</span>
            <span>확인</span>
        </div>
    </div>

    <!-- 알림 메시지 -->
    <div class="notification">
        <div class="notification-title">결제가 완료되었습니다</div>
        <button class="notification-btn">예약정보 인쇄하기</button>
    </div>

    <div id="flightInfoContainer">
        <%
            List<Map<String, Object>> flightList = new ArrayList<>();
            Map<String, Object> flight1 = new HashMap<>();
            flight1.put("fltCode", "KE706");
            flight1.put("dptAptCode", "NRT");
            flight1.put("dptCntName", "도쿄/나리타");
            flight1.put("arrAptCode", "ICN");
            flight1.put("aptName", "서울/인천");
            flight1.put("dptTime", "09:00");
            flight1.put("arrTime", "11:00");
            flight1.put("airline", "대한항공");
            flight1.put("seatClass", "일반석");
            flightList.add(flight1);

            Map<String, Object> flight2 = new HashMap<>();
            flight2.put("fltCode", "OZ123");
            flight2.put("dptAptCode", "ICN");
            flight2.put("dptCntName", "서울/인천");
            flight2.put("arrAptCode", "LAX");
            flight2.put("aptName", "로스앤젤레스");
            flight2.put("dptTime", "09:00");
            flight2.put("arrTime", "11:00");
            flight2.put("airline", "대한항공");
            flight2.put("seatClass", "일반석");
            flightList.add(flight2);

            Map<String, Object> flight3 = new HashMap<>();
            flight3.put("fltCode", "AA456");
            flight3.put("dptAptCode", "LAX");
            flight3.put("dptCntName", "로스앤젤레스");
            flight3.put("arrAptCode", "JFK");
            flight3.put("aptName", "뉴욕");
            flight3.put("dptTime", "09:00");
            flight3.put("arrTime", "11:00");
            flight3.put("airline", "대한항공");
            flight3.put("seatClass", "일반석");
            flightList.add(flight3);

            ObjectMapper objectMapper = new ObjectMapper();
            String flightListJson = objectMapper.writeValueAsString(flightList);
        %>

        <script>
            var flightList = JSON.parse('<%=flightListJson%>');

            function displayFlightInfo(flights) {
                var container = document.getElementById('flightListInfo');
                container.innerHTML = ''; // 기존 내용 비우기

                // 테이블 생성
                var table = document.createElement('table');
                table.className = 'flight-info-table'; // 테이블에 클래스 추가

                // 테이블 헤더 생성
                var headerRow = table.insertRow();
                var headers = ['편명', '출발지', '도착지', '클래스', '기종', '가격'];
                headers.forEach(function(headerText) {
                    var header = document.createElement('th');
                    header.textContent = headerText;
                    headerRow.appendChild(header);
                });

                // 테이블 데이터 생성
                flights.forEach(function (flight) {
                    var row = table.insertRow();
                    var cell1 = row.insertCell(0);
                    cell1.textContent = flight.fltCode;

                    var cell2 = row.insertCell(1);
                    var routeInfo1 = document.createElement('div');
                    routeInfo1.className = 'route-info';
                    routeInfo1.innerHTML = '<div class="departure-info"><span class="startCountry">' + flight.dptCntName + '</span><span class="startCountryName"> (' + flight.dptAptCode + ')</span></div><span>-></span><div class="arrival-info"><span class="endCountry">2023.12.01</span><span class="endCountryName">터미널 2</span></div>';
                    cell2.appendChild(routeInfo1);
                    cell2.innerHTML += '<br>' + flight.dptTime + ' - ' + flight.arrTime + '<br>' + flight.airline + '<br>' + flight.seatClass;

                    var cell3 = row.insertCell(2);
                    var routeInfo2 = document.createElement('div');
                    routeInfo2.className = 'route-info';
                    routeInfo2.innerHTML = '<div class="departure-info"><span class="startCountry">' + flight.aptName + '</span><span class="startCountryName"> (' + flight.arrAptCode + ')</span></div><span>-></span><div class="arrival-info"><span class="endCountry">2023.12.01</span><span class="endCountryName">터미널 1</span></div>';
                    cell3.appendChild(routeInfo2);

                    var cell4 = row.insertCell(3);
                    cell4.innerHTML = '일반석<br>(Q)<br>2석';

                    var cell5 = row.insertCell(4);
                    cell5.textContent = 'A321-neo';

                    var cell6 = row.insertCell(5);
                    cell6.textContent = '450,000원';
                });

                container.appendChild(table); // 테이블을 컨테이너에 추가

                <%--flights.forEach(function (flight, index) {--%>
                <%--    var themeClass = 'theme' + ((index % 3) + 1); // 테마 클래스 설정--%>
                <%--    var flightInfoHtml = `--%>
                <%--        <div class="flight-info-item ${themeClass}">--%>
                <%--            <div class="route-info">--%>
                <%--                <div class="departure-info">--%>
                <%--                    <span class="startCountry">${flight.dptAptCode ? flight.dptAptCode : ''}</span>--%>
                <%--                    <span class="startCountryName">${flight.dptCntName ? flight.dptCntName : ''}</span>--%>
                <%--                </div>--%>
                <%--                <span>→</span>--%>
                <%--                <div class="arrival-info">--%>
                <%--                    <span class="endCountry">${flight.arrAptCode ? flight.arrAptCode : ''}</span>--%>
                <%--                    <span class="endCountryName">${flight.aptName ? flight.aptName : ''}</span>--%>
                <%--                </div>--%>
                <%--            </div>--%>
                <%--            <div class="flight-details">--%>
                <%--                <div class="flight-number">--%>
                <%--                    <span class="flight-code">${flight.fltCode ? flight.fltCode : ''}</span>--%>
                <%--                    <span class="aircraft-type">A321-neo</span>--%>
                <%--                </div>--%>
                <%--                <div class="total-time">총 2시간 45분 여정</div>--%>
                <%--            </div>--%>
                <%--        </div>--%>
                <%--    `;--%>
                <%--    container.innerHTML += flightInfoHtml;--%>
                <%--});--%>
            }

            window.onload = function () {
                displayFlightInfo(flightList);
            };
        </script>
    </div>
<%--    <div class="route-info">--%>
<%--        <div class="col-md-6">--%>
<%--            <h5>NRT 도쿄/나리타</h5>--%>
<%--            <div class="mb-1">2025년 03월 12일 (수) 09:15</div>--%>
<%--            <div class="terminal-info">터미널 1</div>--%>
<%--        </div>--%>
<%--        <div class="col-md-6">--%>
<%--            <h5>ICN 서울/인천</h5>--%>
<%--            <div class="mb-1">2025년 03월 12일 (수) 12:00</div>--%>
<%--            <div class="terminal-info">터미널 2</div>--%>
<%--        </div>--%>
<%--    </div>--%>
</div>

<div class="flight-info">
    <h2 class="flight-info-title">여정정보</h2>
    <div id="flightListInfo">
    </div>
    <br><br>
    <!-- 애초에 디비에 데이터 넣을 때 도착 시간 - 출발 시간 해서 여정이라는 컬럼에 값을 넣어놓기
        그 이후에 값을 그대로 꺼내와서 바인딩만 해주면 됨 -->
    <div class="totalTime">총 2시간 45분 여정</div>
</div>

<!-- 요금 정보 -->
<div class="price-info">
    <h3 class="mb-3">탑승권 요금 정보</h3>
    <div class="row">
        <div class="col-md-4">
            <p>탑승 인원: <strong>3명</strong></p>
            <p>1인당 요금: <strong>450,000원</strong></p>
        </div>
        <div class="col-md-8 text-end">
            <p class="mb-2">총 결제 금액</p>
            <p class="total-price">1,350,000원</p>
        </div>
    </div>
</div>

<!-- 탑승객 정보 -->
<h3 class="mb-3">탑승객 및 예약 정보 조회</h3>
<table class="table table-striped">
    <thead>
    <tr>
        <th>탑승객 이름</th>
        <th>회원번호</th>
        <th>항공권번호</th>
        <th>예약 정보</th>
    </tr>
    </thead>
    <tbody>
    <%--<c:forEach var="passenger" items="${passengers}">
        <tr>
            <td>${passenger.userName}</td>
            <td>${passenger.passNum}</td>
            <td>${passenger.regNum}</td>
            <td>
                <button class="btn btn-primary btn-sm view-ticket" data-pnum="${passenger.pNum}">조회</button>
                <button class="btn btn-secondary btn-sm send-pdf" data-pnum="${passenger.pNum}">PDF 전송</button>
                <button class="btn btn-danger btn-sm cancel-booking" data-pnum="${passenger.pNum}">취소</button>
            </td>
        </tr>
    </c:forEach>--%>
    <tr>
        <td>김예찬</td>
        <td>KE123456789</td>
        <td>180123456789</td>
        <td>
            <div class="btn-group">
                <button type="button" class="btn btn-primary btn-sm view-ticket">조회</button>
                <button type="button" class="btn btn-secondary btn-sm send-pdf" onclick="sendPDF('김예찬', 'kim@email.com')">PDF 전송
                </button>
                <button type="button" class="btn btn-danger btn-sm cancel-booking">취소</button>
            </div>
        </td>
    </tr>
    <tr>
        <td>고예림</td>
        <td>KE987654321</td>
        <td>1809876543210</td>
        <td>
            <div class="btn-group">
                <button type="button" class="btn btn-primary btn-sm view-ticket">조회</button>
                <button type="button" class="btn btn-secondary btn-sm send-pdf" onclick="sendPDF('고예림', 'kim@email.com')">PDF 전송
                </button>
                <button type="button" class="btn btn-danger btn-sm cancel-booking">취소</button>
            </div>
        </td>
    </tr>
    <tr>
        <td>김태경</td>
        <td>KE123456522</td>
        <td>1801234567123</td>
        <td>
            <div class="btn-group">
                <button type="button" class="btn btn-primary btn-sm view-ticket" data-pnum="${passenger.pNum}">조회</button>
                <button type="button" class="btn btn-secondary btn-sm send-pdf" data-pnum="${passenger.pNum}" onclick="sendPDF('김태경', 'kim@email.com')">PDF 전송
                </button>
                <button type="button" class="btn btn-danger btn-sm cancel-booking" data-pnum="${passenger.pNum}">취소</button>
            </div>
        </td>
    </tr>
    </tbody>
</table>
<div class="email-info">
    구매자 이메일(예찬)@email.com
</div>
<%--    <div class="text-center mt-4">--%>
<%--        <button type="button" class="btn btn-primary px-5">확인</button>--%>
<%--    </div>--%>
</div>

<script>
    $(document).ready(function() {
        console.log(flightList);
        var str = '';
        for(var i=0; i<flightList.length; i++) {

            str += '<div class="route-info">';
            str += '<div class="departure-info">';
            str += '<span class="startCountry">' + flightList[i].aptName + '</span>';
            str += '<span class="startCountryName">' + flightList[i].arrAptCode + '</span>';
            str += '</div>';
            str += '<span>-></span>';
            str += "<div>";
            str += '<span class="endCountry">' + flightList[i].dptCntName + '</span>';
            str += '<span class="endCountryName">' + flightList[i].dptAptCode + '</span>';
            str += "</div>";
            str += "</div>";
        }
        console.log("str     : ", str);

        $("#flightListInfo").html(str);

        // 티켓 조회
        $('.view-ticket').click(function() {
            var pNum = $(this).closest('tr').find('.view-ticket').data('pnum'); // 수정된 부분
            console.log("pNum : ", pNum);
            var popupWindow = window.open('ViewTicketServlet?pNum=' + pNum, 'TicketInfo', 'width=800,height=600');
            popupWindow.focus();
        });

        // PDF 전송
        $('.send-pdf').click(function() {
            var pNum = $(this).data('pnum');
            $.post('SendPDFServlet', { pNum: pNum }, function(response) {
                alert(response.message);
            });
        });

        // 예약 취소
        $('.cancel-booking').click(function() {
            var pNum = $(this).data('pnum');
            if (confirm('정말로 예약을 취소하시겠습니까?')) {
                $.post('CancelBookingServlet', { pNum: pNum }, function(response) {
                    alert(response.message);
                    if (response.success) {
                        location.reload();
                    }
                });
            }
        });
    });
    function sendPDF(name, email) {
        fetch('/PDFGeneratorServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                passengerName: name,
                email: email,
                flightNumber: 'KE706',
                departure: 'NRT',
                arrival: 'ICN',
                departureDate: '2025-03-12 09:15',
                arrivalDate: '2025-03-12 12:00'
            })
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('PDF가 이메일로 전송되었습니다.');
                } else {
                    alert('PDF 전송에 실패했습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('PDF 전송 중 오류가 발생했습니다.');
            });
    }

    document.querySelector('.notification-btn').addEventListener('click', function () {
        window.print();
    });

    // 받아온 데이터를 여기서 포문 돌려서 .html()로 설정해줘야함

</script>
</body>
</html>