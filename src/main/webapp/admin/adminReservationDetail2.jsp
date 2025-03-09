<%--<%@ page import="com.example.demo.vo.UserVO" %>--%>
<%--<%@ page import="com.example.demo.vo.AdminReservationVO" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="java.util.Map" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>예약 상세 정보</title>--%>
<%--    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminReservationDetail.css">--%>
<%--    <script src="<%=request.getContextPath()%>/js/jquery-3.7.1.js"></script>--%>
<%--    <script src="<%=request.getContextPath()%>/js/jquery.serializejson.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <h1>예약 상세 정보</h1>--%>

<%--    <%--%>
<%--        UserVO user = (UserVO) request.getAttribute("user");--%>
<%--        AdminReservationVO reservation = (AdminReservationVO) request.getAttribute("reservation");--%>
<%--        List<AdminReservationVO> passengers = (List<AdminReservationVO>) request.getAttribute("passengers");--%>
<%--        List<Map<String, String>> seatClasses = (List<Map<String, String>>) request.getAttribute("seatClasses");--%>
<%--        String errorMessage = (String) request.getAttribute("errorMessage");--%>
<%--        String message = (String) request.getAttribute("message");--%>

<%--        if (errorMessage != null) {--%>
<%--    %>--%>
<%--    <div class="error-message">--%>
<%--        <%= errorMessage %>--%>
<%--    </div>--%>
<%--    <%--%>
<%--    } else if (message != null) {--%>
<%--    %>--%>
<%--    <div class="success-message">--%>
<%--        <%= message %>--%>
<%--    </div>--%>
<%--    <%--%>
<%--        }--%>

<%--        if (user != null && reservation != null) {--%>
<%--    %>--%>
<%--    <div class="reservation-info">--%>
<%--        <h2><%= user.getUserName() %> (<%= user.getUserId() %>)님의 예약 상세 정보</h2>--%>
<%--        <p>항공편 코드: <%= reservation.getFltCode() %></p>--%>
<%--        <p>출발지: <%= reservation.getDptAptName() %> (<%= reservation.getDptAptCode() %>)</p>--%>
<%--        <p>도착지: <%= reservation.getArrAptName() %> (<%= reservation.getArrAptCode() %>)</p>--%>
<%--        <p>출발 일시: <%= reservation.getFormattedDptDateTime() %></p>--%>
<%--        <p>도착 일시: <%= reservation.getFormattedArrDateTime() %></p>--%>
<%--        <p>항공기: <%= reservation.getAirName() %> (<%= reservation.getAirCode() %>)</p>--%>
<%--    </div>--%>

<%--    <h3>승객 목록</h3>--%>

<%--    <% if (passengers != null && !passengers.isEmpty()) { %>--%>
<%--    <table class="passenger-table">--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>승객 번호</th>--%>
<%--            <th>승객 이름</th>--%>
<%--            <th>여권 번호</th>--%>
<%--            <th>좌석 코드</th>--%>
<%--            <th>출발 일시</th>--%>
<%--            <th>도착 일시</th>--%>
<%--            <th>좌석 등급</th>--%>
<%--            <th>좌석 위치</th>--%>
<%--            <th>관리</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <% for (AdminReservationVO passenger : passengers) { %>--%>
<%--        <tr>--%>
<%--            <td class="passenger-info"><%= passenger.getPNum() %></td>--%>
<%--            <td class="passenger-info"><%= passenger.getUserName() %></td>--%>
<%--            <td class="passenger-info"><%= passenger.getPassNum() %></td>--%>
<%--            <td class="passenger-info"><%= passenger.getSeatCode() %></td>--%>
<%--            <td>--%>
<%--                <div class="date-time-container">--%>
<%--                    <input type="date" id="dptDate_<%= passenger.getPNum() %>" value="<%= passenger.getFormattedDptDate() %>" class="date-input"--%>
<%--                           onchange="getDepartureTimes(this.value, <%= passenger.getPNum() %>, <%= passenger.getFltCode() %>)">--%>
<%--                    <select id="dptTime_<%= passenger.getPNum() %>" class="time-input"--%>
<%--                            onchange="getArrivalDateTime(document.getElementById('dptDate_<%= passenger.getPNum() %>').value, this.value, <%= passenger.getPNum() %>, <%= passenger.getFltCode() %>)">--%>
<%--                        <option value="">시간 선택</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <div class="date-time-container">--%>
<%--                    <input type="date" id="arrDate_<%= passenger.getPNum() %>" value="<%= passenger.getFormattedArrDate() %>" class="date-input" readonly>--%>
<%--                    <input type="text" id="arrTime_<%= passenger.getPNum() %>" value="<%= new java.text.SimpleDateFormat("HH:mm").format(passenger.getArrTime()) %>" class="time-input" readonly>--%>
<%--                </div>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <select id="seatClass_<%= passenger.getPNum() %>" class="select-input"--%>
<%--                        onchange="getAvailableSeatPositions(this.value, <%= passenger.getPNum() %>, <%= passenger.getFltCode() %>)">--%>
<%--                    <% if (seatClasses != null && !seatClasses.isEmpty()) { %>--%>
<%--                    <% for (Map<String, String> seatClass : seatClasses) { %>--%>
<%--                    <option value="<%= seatClass.get("value") %>" <%= passenger.getSeatClass() != null && passenger.getSeatClass().equals(seatClass.get("value")) ? "selected" : "" %>><%= seatClass.get("label") %></option>--%>
<%--                    <% } %>--%>
<%--                    <% } else { %>--%>
<%--                    <option value="F" <%= "F".equals(passenger.getSeatClass()) ? "selected" : "" %>>퍼스트 클래스</option>--%>
<%--                    <option value="B" <%= "B".equals(passenger.getSeatClass()) ? "selected" : "" %>>비즈니스 클래스</option>--%>
<%--                    <option value="E" <%= "E".equals(passenger.getSeatClass()) ? "selected" : "" %>>이코노미 클래스</option>--%>
<%--                    <% } %>--%>
<%--                </select>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <select id="seatPosition_<%= passenger.getPNum() %>" class="select-input">--%>
<%--                    <option value="<%= passenger.getSeatPosition() %>"><%= passenger.getSeatPosition() %></option>--%>
<%--                </select>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <div class="action-buttons">--%>
<%--                    <button type="button" class="update-btn" onclick="confirmUpdate(<%= passenger.getPNum() %>, '<%= passenger.getUserId() %>', <%= passenger.getFltCode() %>)">수정</button>--%>
<%--                    <button type="button" class="delete-btn" onclick="confirmDelete(<%= passenger.getPNum() %>, '<%= passenger.getUserId() %>', <%= passenger.getFltCode() %>)">삭제</button>--%>
<%--                </div>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <% } %>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--    <% } else { %>--%>
<%--    <div class="no-data">--%>
<%--        <p>승객 정보가 없습니다.</p>--%>
<%--    </div>--%>
<%--    <% } %>--%>

<%--    <div class="button-container">--%>
<%--        <button type="button" onclick="window.close()">닫기</button>--%>
<%--    </div>--%>

<%--    <!-- 숨겨진 폼: 승객 정보 수정 -->--%>
<%--    <form id="updateForm" action="<%=request.getContextPath()%>/AdminUser/AdminReservationDetail" method="post">--%>
<%--        <input type="hidden" name="action" value="update">--%>
<%--        <input type="hidden" name="pNum" value="">--%>
<%--        <input type="hidden" name="userId" value="">--%>
<%--        <input type="hidden" name="fltCode" value="">--%>
<%--        <input type="hidden" name="dptDate" value="">--%>
<%--        <input type="hidden" name="dptTime" value="">--%>
<%--        <input type="hidden" name="arrDate" value="">--%>
<%--        <input type="hidden" name="arrTime" value="">--%>
<%--        <input type="hidden" name="seatClass" value="">--%>
<%--        <input type="hidden" name="seatPosition" value="">--%>
<%--    </form>--%>

<%--    <!-- 숨겨진 폼: 승객 정보 삭제 -->--%>
<%--    <form id="deleteForm" action="<%=request.getContextPath()%>/AdminUser/AdminReservationDetail" method="post">--%>
<%--        <input type="hidden" name="action" value="delete">--%>
<%--        <input type="hidden" name="pNum" value="">--%>
<%--        <input type="hidden" name="userId" value="">--%>
<%--        <input type="hidden" name="fltCode" value="">--%>
<%--    </form>--%>
<%--    <% } %>--%>
<%--</div>--%>

<%--<script>--%>
<%--    // 페이지 로드 시 각 승객의 초기 데이터 설정--%>
<%--    $(document).ready(function() {--%>
<%--        <% if (passengers != null) { %>--%>
<%--        <% for (AdminReservationVO passenger : passengers) { %>--%>
<%--        // 출발 시간 목록 가져오기 (기존 시간 선택 유지)--%>
<%--        var dptDate = '<%= passenger.getFormattedDptDate() %>';--%>
<%--        var pNum = <%= passenger.getPNum() %>;--%>
<%--        var fltCode = <%= passenger.getFltCode() %>;--%>
<%--        var dptTime = '<%= new java.text.SimpleDateFormat("HH:mm").format(passenger.getDptTime()) %>';--%>
<%--        var seatClass = '<%= passenger.getSeatClass() %>';--%>
<%--        var seatPosition = '<%= passenger.getSeatPosition() %>';--%>

<%--        console.log("Loading data for passenger:", pNum, "Date:", dptDate, "Time:", dptTime, "Class:", seatClass, "Position:", seatPosition);--%>

<%--        // 출발 시간 목록 가져오기--%>
<%--        getDepartureTimes(dptDate, pNum, fltCode, dptTime);--%>

<%--        // 좌석 위치 목록 가져오기--%>
<%--        getAvailableSeatPositions(seatClass, pNum, fltCode, seatPosition);--%>
<%--        <% } %>--%>
<%--        <% } %>--%>
<%--    });--%>

<%--    function confirmDelete(pNum, userId, fltCode) {--%>
<%--        if (confirm("정말로 이 승객 정보를 삭제하시겠습니까?")) {--%>
<%--            document.getElementById("deleteForm").elements["pNum"].value = pNum;--%>
<%--            document.getElementById("deleteForm").elements["userId"].value = userId;--%>
<%--            document.getElementById("deleteForm").elements["fltCode"].value = fltCode;--%>
<%--            document.getElementById("deleteForm").elements["action"].value = "delete";--%>
<%--            document.getElementById("deleteForm").submit();--%>
<%--        }--%>
<%--    }--%>

<%--    function confirmUpdate(pNum, userId, fltCode) {--%>
<%--        if (confirm("승객 정보를 수정하시겠습니까?")) {--%>
<%--            var updateForm = document.getElementById("updateForm");--%>
<%--            updateForm.elements["pNum"].value = pNum;--%>
<%--            updateForm.elements["userId"].value = userId;--%>
<%--            updateForm.elements["fltCode"].value = fltCode;--%>
<%--            updateForm.elements["dptDate"].value = document.getElementById('dptDate_' + pNum).value;--%>
<%--            updateForm.elements["dptTime"].value = document.getElementById('dptTime_' + pNum).value;--%>
<%--            updateForm.elements["arrDate"].value = document.getElementById('arrDate_' + pNum).value;--%>
<%--            updateForm.elements["arrTime"].value = document.getElementById('arrTime_' + pNum).value;--%>
<%--            updateForm.elements["seatClass"].value = document.getElementById('seatClass_' + pNum).value;--%>
<%--            updateForm.elements["seatPosition"].value = document.getElementById('seatPosition_' + pNum).value;--%>
<%--            updateForm.elements["action"].value = "update";--%>
<%--            updateForm.submit();--%>
<%--        }--%>
<%--    }--%>

<%--    // 출발 날짜 변경 시 해당 날짜의 출발 시간 목록 가져오기--%>
<%--    function getDepartureTimes(dptDate, pNum, fltCode, selectedTime) {--%>
<%--        if (!selectedTime) selectedTime = '';--%>

<%--        console.log("Getting departure times for date:", dptDate, "passenger:", pNum, "selected time:", selectedTime);--%>

<%--        $.ajax({--%>
<%--            url: '<%=request.getContextPath()%>/AdminUser/AdminReservationDetail',--%>
<%--            type: 'POST',--%>
<%--            data: {--%>
<%--                action: 'getDepartureTimes',--%>
<%--                dptDate: dptDate,--%>
<%--                fltCode: fltCode--%>
<%--            },--%>
<%--            dataType: 'json',--%>
<%--            success: function(data) {--%>
<%--                console.log("Received departure times:", data);--%>
<%--                var timeSelect = $('#dptTime_' + pNum);--%>
<%--                timeSelect.empty();--%>
<%--                timeSelect.append('<option value="">시간 선택</option>');--%>

<%--                if (data && data.length > 0) {--%>
<%--                    $.each(data, function(index, time) {--%>
<%--                        var selected = (time.value === selectedTime) ? 'selected' : '';--%>
<%--                        timeSelect.append('<option value="' + time.value + '" ' + selected + '>' + time.label + '</option>');--%>
<%--                    });--%>

<%--                    // 선택된 시간이 없으면 첫 번째 시간 선택--%>
<%--                    if (!selectedTime && data.length > 0) {--%>
<%--                        timeSelect.val(data[0].value);--%>
<%--                        getArrivalDateTime(dptDate, data[0].value, pNum, fltCode);--%>
<%--                    } else if (selectedTime) {--%>
<%--                        // 선택된 시간이 있으면 해당 시간에 맞는 도착 일시 가져오기--%>
<%--                        getArrivalDateTime(dptDate, selectedTime, pNum, fltCode);--%>
<%--                    }--%>
<%--                }--%>
<%--            },--%>
<%--            error: function(xhr, status, error) {--%>
<%--                console.error("Error fetching departure times:", error);--%>
<%--                console.error("Response:", xhr.responseText);--%>
<%--                alert('출발 시간 정보를 가져오는 중 오류가 발생했습니다.');--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>

<%--    // 출발 시간 변경 시 해당 도착 일시 가져오기--%>
<%--    function getArrivalDateTime(dptDate, dptTime, pNum, fltCode) {--%>
<%--        if (!dptDate || !dptTime) return;--%>

<%--        $.ajax({--%>
<%--            url: '<%=request.getContextPath()%>/AdminUser/AdminReservationDetail',--%>
<%--            type: 'POST',--%>
<%--            data: {--%>
<%--                action: 'getArrivalDateTime',--%>
<%--                dptDate: dptDate,--%>
<%--                dptTime: dptTime,--%>
<%--                fltCode: fltCode--%>
<%--            },--%>
<%--            dataType: 'json',--%>
<%--            success: function(data) {--%>
<%--                console.log("Received arrival date/time:", data);--%>
<%--                if (data && data.arrDate && data.arrTime) {--%>
<%--                    $('#arrDate_' + pNum).val(data.arrDate);--%>
<%--                    $('#arrTime_' + pNum).val(data.arrTime);--%>
<%--                }--%>
<%--            },--%>
<%--            error: function(xhr, status, error) {--%>
<%--                console.error("Error fetching arrival date/time:", error);--%>
<%--                console.error("Response:", xhr.responseText);--%>
<%--                alert('도착 일시 정보를 가져오는 중 오류가 발생했습니다.');--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>

<%--    // 좌석 등급 변경 시 해당 등급의 빈 좌석 위치 목록 가져오기--%>
<%--    function getAvailableSeatPositions(seatClass, pNum, fltCode, selectedPosition) {--%>
<%--        if (!seatClass) return;--%>
<%--        if (!selectedPosition) selectedPosition = '';--%>

<%--        console.log("Getting seat positions for class:", seatClass, "passenger:", pNum, "selected position:", selectedPosition);--%>

<%--        $.ajax({--%>
<%--            url: '<%=request.getContextPath()%>/AdminUser/AdminReservationDetail',--%>
<%--            type: 'POST',--%>
<%--            data: {--%>
<%--                action: 'getSeatPositions',--%>
<%--                seatClass: seatClass,--%>
<%--                fltCode: fltCode,--%>
<%--                pNum: pNum--%>
<%--            },--%>
<%--            dataType: 'json',--%>
<%--            success: function(data) {--%>
<%--                console.log("Received seat positions:", data);--%>
<%--                var positionSelect = $('#seatPosition_' + pNum);--%>
<%--                positionSelect.empty();--%>
<%--                positionSelect.append('<option value="">좌석 선택</option>');--%>

<%--                // 현재 좌석 위치 추가 (이미 예약된 좌석이므로 목록에 없을 수 있음)--%>
<%--                if (selectedPosition && selectedPosition !== 'null') {--%>
<%--                    var existingPosition = false;--%>

<%--                    // 받아온 데이터에 현재 좌석 위치가 있는지 확인--%>
<%--                    if (data && data.length > 0) {--%>
<%--                        for (var i = 0; i < data.length; i++) {--%>
<%--                            if (data[i].value === selectedPosition) {--%>
<%--                                existingPosition = true;--%>
<%--                                break;--%>
<%--                            }--%>
<%--                        }--%>
<%--                    }--%>

<%--                    // 현재 좌석 위치가 목록에 없으면 추가--%>
<%--                    if (!existingPosition) {--%>
<%--                        positionSelect.append('<option value="' + selectedPosition + '" selected>' + selectedPosition + ' (현재)</option>');--%>
<%--                    }--%>
<%--                }--%>

<%--                if (data && data.length > 0) {--%>
<%--                    $.each(data, function(index, position) {--%>
<%--                        var selected = (position.value === selectedPosition) ? 'selected' : '';--%>
<%--                        positionSelect.append('<option value="' + position.value + '" ' + selected + '>' + position.label + '</option>');--%>
<%--                    });--%>
<%--                }--%>
<%--            },--%>
<%--            error: function(xhr, status, error) {--%>
<%--                console.error("Error fetching seat positions:", error);--%>
<%--                console.error("Response:", xhr.responseText);--%>
<%--                alert('좌석 위치 정보를 가져오는 중 오류가 발생했습니다.');--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>

