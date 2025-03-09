<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여정 정보</title>
    <link rel="stylesheet" href="/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <!-- 헤더 -->
    <div class="header">
        <img src="\images/SoonAirLine.png" alt="SOON 항공사 로고" class="logo">
    </div>

    <!-- 단계 네비게이션 -->
    <div class="steps-container">
        <div class="step-item">
            <div class="step-circle">1</div>
            <div class="step-text">여정/날짜 선택</div>
        </div>
        <div class="step-item">
            <div class="step-circle">2</div>
            <div class="step-text">운임/항공편 선택</div>
        </div>
        <div class="step-item">
            <div class="step-circle">3</div>
            <div class="step-text">탑승객 정보</div>
        </div>
        <div class="step-item">
            <div class="step-circle">4</div>
            <div class="step-text">결제 정보</div>
        </div>
        <div class="step-item active">
            <div class="step-circle">5</div>
            <div class="step-text">확인</div>
        </div>
    </div>

    <!-- 결제 완료 메시지 -->
    <div class="payment-complete-box">
        <h2>결제가 완료되었습니다</h2>
        <button class="reservation-button" id="printButton">예약정보 인쇄하기</button>
    </div>

    <!-- 여정 정보 섹션 -->
    <div class="section">
        <h3 class="section-title">여정정보</h3>
        <div id="flightInfoContainer">
            <%
                List<Map<String, Object>> flightList = new ArrayList<>();
                Map<String, Object> flight1 = new HashMap<>();
                flight1.put("fltCode", "KE706");
                flight1.put("dptAptCode", "NRT");
                flight1.put("dptCntName", "도쿄/나리타");
                flight1.put("arrAptCode", "ICN");
                flight1.put("arrCntName", "서울/인천");
                flight1.put("dptTime", "09:00");
                flight1.put("arrTime", "11:00");
                flight1.put("airline", "대한항공");
                flight1.put("seatClass", "일반석");
                flight1.put("price", "1350000");
                flight1.put("aircraft", "A330-200");
                flight1.put("dptDate", "2023.12.01");
                flight1.put("dptTerminal", "터미널 1");
                flight1.put("arrDate", "2023.12.01");
                flight1.put("arrTerminal", "터미널 2");
                flight1.put("seatGrade", "Q");
                flight1.put("seatCount", "3");
                flightList.add(flight1);

                Map<String, Object> flight2 = new HashMap<>();
                flight2.put("fltCode", "KE124");
                flight2.put("dptAptCode", "ICN");
                flight2.put("dptCntName", "서울/인천");
                flight2.put("arrAptCode", "NRT");
                flight2.put("arrCntName", "도쿄/나리타");
                flight2.put("dptTime", "09:00");
                flight2.put("arrTime", "11:00");
                flight2.put("airline", "대한항공");
                flight2.put("seatClass", "일반석");
                flight2.put("price", "1440000");
                flight2.put("aircraft", "A330-200");
                flight2.put("dptDate", "2023.12.05");
                flight2.put("dptTerminal", "터미널 2");
                flight2.put("arrDate", "2023.12.05");
                flight2.put("arrTerminal", "터미널 1");
                flight2.put("seatGrade", "L");
                flight2.put("seatCount", "3");
                flightList.add(flight2);

                ObjectMapper objectMapper = new ObjectMapper();
                String flightListJson = objectMapper.writeValueAsString(flightList);

                // 총 가격 계산
                int totalPrice = 0;
                for (Map<String, Object> flight : flightList) {
                    totalPrice += Integer.parseInt(flight.get("price").toString());
                }
            %>
            <div id="flightListInfo"></div>
        </div>
    </div>

    <!-- 탑승객 정보 섹션 -->
    <div class="section">
        <h3 class="section-title">탑승객 및 연락처 정보</h3>
        <table class="passenger-table">
            <thead>
            <tr>
                <th>탑승객 이름</th>
                <th>회원번호</th>
                <th>항공권번호</th>
                <th>예약 상태</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>김예찬</td>
                <td>KE123456789</td>
                <td>18012345678</td>
                <td class="action-buttons">
                    <button class="btn btn-view view-ticket" data-fltcode="1020">조회</button>
                    <button class="btn btn-pdf send-pdf" data-pnum="1">PDF 전송</button>
                    <button class="btn btn-cancel cancel-booking" data-pnum="1">취소</button>
                </td>
            </tr>
            <tr>
                <td>고예림</td>
                <td>KE987654321</td>
                <td>18098765432</td>
                <td class="action-buttons">
                    <button class="btn btn-view view-ticket" data-fltcode="1020">조회</button>
                    <button class="btn btn-pdf send-pdf" data-pnum="2">PDF 전송</button>
                    <button class="btn btn-cancel cancel-booking" data-pnum="2">취소</button>
                </td>
            </tr>
            <tr>
                <td>김태경</td>
                <td>KE123456522</td>
                <td>18012345671</td>
                <td class="action-buttons">
                    <button class="btn btn-view view-ticket" data-fltcode="1020">조회</button>
                    <button class="btn btn-pdf send-pdf" data-pnum="3">PDF 전송</button>
                    <button class="btn btn-cancel cancel-booking" data-pnum="3">취소</button>
                </td>
            </tr>
            </tbody>
        </table>

        <!-- 이메일 정보 -->
        <div class="email-info">
            <span class="label">이메일:</span>
            <span class="value">chanzz0518@gmail.com</span>
        </div>
        <span><a href="/images/2.png" download="2.png">첨부파일 다운로드</a></span>
    </div>
</div>

<div id="flightModal" class="modal" style="display:none;">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2 class="modal-title">여정 정보</h2>
        <div id="modalContent">
            <!-- 여기에 항공편 정보가 동적으로 삽입됩니다 -->
        </div>
    </div>
</div>



<script>
    var flightList = JSON.parse('<%=flightListJson%>');
    var totalPrice = <%= totalPrice %>;

    function displayFlightInfo(flights) {
        var container = document.getElementById('flightListInfo');
        // JavaScript 코드
        var flight = { price: 450000 }; // 예시: flight 객체 생성

        console.log(typeof flight.price); // price의 데이터 타입 출력

        // 테이블 생성
        var table = document.createElement('table');
        table.className = 'info-table';

        // 테이블 헤더 생성
        var thead = document.createElement('thead');
        var headerRow = document.createElement('tr');
        var headers = ['편명', '출발지', '도착지', '클래스', '기종', '가격'];

        headers.forEach(function(headerText) {
            var th = document.createElement('th');
            th.textContent = headerText;
            headerRow.appendChild(th);
        });

        thead.appendChild(headerRow);
        table.appendChild(thead);

        // 테이블 바디 생성
        var tbody = document.createElement('tbody');

        flights.forEach(function(flight) {
            var row = document.createElement('tr');

            // 편명
            var cell1 = document.createElement('td');
            cell1.className = 'flight-number';
            cell1.textContent = flight.fltCode;
            row.appendChild(cell1);

            // 출발지
            var cell2 = document.createElement('td');
            cell2.innerHTML = flight.dptCntName + '(' + flight.dptAptCode + ')<br>' +
                flight.dptDate + '<br>' +
                flight.dptTerminal;
            row.appendChild(cell2);

            // 도착지
            var cell3 = document.createElement('td');
            cell3.innerHTML = flight.arrCntName + '(' + flight.arrAptCode + ')<br>' +
                flight.arrDate + '<br>' +
                flight.arrTerminal;
            row.appendChild(cell3);

            // 클래스
            var cell4 = document.createElement('td');
            cell4.innerHTML = flight.seatClass + '<br>(' + flight.seatGrade + ')<br>' + flight.seatCount + '석';
            row.appendChild(cell4);

            // 기종
            var cell5 = document.createElement('td');
            cell5.textContent = flight.aircraft;
            row.appendChild(cell5);

            // 가격
            var cell6 = document.createElement('td');
            cell6.textContent = new Intl.NumberFormat('ko-KR').format(flight.price) + '원';
            row.appendChild(cell6);

            tbody.appendChild(row);
        });

        table.appendChild(tbody);

        // 테이블 푸터 (총 금액)
        var tfoot = document.createElement('tfoot');
        var footerRow = document.createElement('tr');

        var totalLabelCell = document.createElement('td');
        totalLabelCell.colSpan = 5;
        totalLabelCell.className = 'total-label';
        totalLabelCell.textContent = '총 결제 금액:';
        footerRow.appendChild(totalLabelCell);

        var totalValueCell = document.createElement('td');
        totalValueCell.className = 'total-price';
        totalValueCell.textContent = new Intl.NumberFormat('ko-KR').format(totalPrice) + '원';
        footerRow.appendChild(totalValueCell);

        tfoot.appendChild(footerRow);
        table.appendChild(tfoot);

        container.appendChild(table);
    }

    $(document).ready(function() {
        // 항공편 정보 표시
        displayFlightInfo(flightList);

        // 인쇄 버튼
        $('#printButton').click(function() {
            window.print();
        });

        // 조회 버튼 클릭
        $('.view-ticket').click(function() {
            const row = $(this).closest('tr');
            const passengerName = row.find('td:first').text();
            const fltCode = $(this).data('fltcode');
            if(fltCode === undefined){
                console.error('fltcode is undefined');
                return;
            }
            console.log(fltCode);
            // AJAX -> 서버 에서가져옴
            $.ajax({
                url: '<%=request.getContextPath()%>/reservation/detailSelectOne',
                method: 'GET',
                data: "fltCode=" + fltCode,
                success: function(data) {
                    console.log(data);
                    // 모달 내용을 업데이트합니다
                    updateModalContent(data[0], passengerName);
                    // 모달을 표시합니다
                    $('#flightModal').show();
                },
                error: function(err) {
                    console.error('Error fetching flight details:', err);
                }
            });
        });

// 모달 내용을 업데이트하는 함수
        function updateModalContent(flight, passengerName) {
            console.log("flight",flight);
            const content = `
        <h3>\${passengerName}님의 항공편 정보</h3>
        <table>
            <tr>
                <th>편명</th>
                <td>\${flight.FLTCODE}</td>
            </tr>
            <tr>
                <th>출발지</th>
                <td>\${flight.DPTCNTNAME} (\${flight.DPTAPTCODE})<br>\${flight.DPTTIME}</td>
            </tr>
            <tr>
                <th>도착지</th>
                <td>\${flight.ARRCNTNAME} (\${flight.ARRAPTCODE})<br>\${flight.ARRTIME}</td>
            </tr>
            <tr>
                <th>클래스</th>
                <td>일반석 (\${flight.SEATCLASS})</td>
            </tr>
            <tr>
                <th>기종</th>
                <td>\${flight.AIRNAME}</td>
            </tr>
            <tr>
                <th>가격</th>
                <td>\${flight.TICKET_PRICE}원</td>
            </tr>
        </table>
        `;
            $('#modalContent').html(content);
        }

// 모달 닫기 버튼 이벤트
        $('.close').click(function() {
            $('#flightModal').hide();
        });

// 모달 외부 클릭 시 닫기
        $(window).click(function(event) {
            if ($(event.target).is('#flightModal')) {
                $('#flightModal').hide();
            }
        });
        ////////////////

        // $('.view-ticket').click(function () {
        //     var pNum = $(this).data('pnum');
        //     var popupWindow = window.open('ViewTicketServlet?pNum=' + pNum, 'TicketInfo', 'width=800,height=600');
        //     popupWindow.focus();
        // });

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

        $('.send-pdf').click(function () {
            const row = $(this).closest('tr');
            const passengerName = row.find('td:first').text();
            const customerEmail = $('.email-info .value').text(); // 이메일 주소를 가져오는 방법은 실제 HTML 구조에 따라 다를 수 있습니다.

            const $this = $(this);
            $this.prop('disabled', true);
            $this.text('전송 중...');

            // 캡처할 영역 선택 (여정 정보 테이블)

            const element = document.querySelector('.section');

            html2canvas(element).then(canvas => {
                // 캔버스를 이미지 데이터로 변환
                const imageData = canvas.toDataURL('image/png');

                // 서버로 전송
                fetch('/PDFGeneratorServlet', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        imageData: imageData,
                        passengerName: passengerName,
                        email: customerEmail
                    })
                })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            alert('PDF가 이메일로 전송되었습니다.');
                        } else {
                            alert('PDF 전송에 실패했습니다.');
                        }
                        $this.prop('disabled', false);
                        $this.text('PDF 전송');
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert('PDF 전송 중 오류가 발생했습니다.');
                    });
            });
            // sendPDF 함수 호출
        });
    });
</script>
</body>
</html>