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
    <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여정 정보</title>
    <link rel="stylesheet" href="/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th {
        background-color: #2a4db7;
        color: white;
        padding: 10px;
        text-align: center;
    }
    td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    .total {
        text-align: right;
        margin-top: 20px;
        font-weight: bold;
        font-size: 18px;
    }
    .total-amount {
        color: #ff0000;
    }
</style>
<body>

<div class="container">
    <!-- 헤더 -->
    <div class="header">
        <a href="/mainPage/mainPage.jsp"><img src="/images/2.png" alt="로고"></a>
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
            <table>
                <thead>
                <tr>
                    <th>편명</th>
                    <th>출발지</th>
                    <th>도착지</th>
                    <th>클래스</th>
                    <th>기종</th>
                    <th>가격</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td id="fltCodeValue">KE706</td>
                    <td >
                        <p id="startCountry">도쿄/나리타(NRT)</p>
                        <p id="departDate">2023.12.01</p>
                    </td>
                    <td >
                        <p id="endCountry">도쿄/나리타(NRT)</p>
                        <p id="returnDate">2023.12.01</p>
                    </td>
                    <td>
                        <p id="classvalue">일반석</p>
                        <p id="numCount"></p>
                    </td>
                    <td id="airName">A330-200</td>
                    <td id="tdTotalPrice">1,350,000원</td>
                </tr>
                </tbody>
            </table>

            <div class="total">
                총 결제 금액: <span class="total-amount" id="totalPrice">2,790,000원</span>
            </div>
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
                <th>회원 아이디</th>
                <th>예약 번호</th>
                <th>예약 상태</th>
            </tr>
            </thead>
            <tbody id="tbodyValue">

            <%--            <tr>--%>
            <%--                <td>김예찬</td>--%>
            <%--                <td>KE123456789</td>--%>
            <%--                <td>18012345678</td>--%>
            <%--                <td class="action-buttons">--%>
            <%--                    <button class="btn btn-view view-ticket" data-fltcode="1020">조회</button>--%>
            <%--                    <button class="btn btn-pdf send-pdf" data-pnum="1">PDF 전송</button>--%>
            <%--                    <button class="btn btn-cancel cancel-booking" data-pnum="1">취소</button>--%>
            <%--                </td>--%>
            <%--            </tr>--%>

            </tbody>
        </table>

        <!-- 이메일 정보 -->
        <div class="email-info">
            <span class="label">이메일:</span>
            <span class="value">chanzz0518@gmail.com</span>
        </div>
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

    const urlParam =  new URLSearchParams(window.location.search);
    const fltCode = urlParam.get('fltCode');
    const selectedList = urlParam.get('selectedList');
    const totalPrice = urlParam.get('totalPrice');
    const userId = urlParam.get('userId');
    const start = urlParam.get("start");
    const end = urlParam.get("end");
    const departDate = urlParam.get("departDate");
    const returnDate = urlParam.get("returnDate");
    const classvalue = urlParam.get("classvalue");
    const userNameList = decodeURIComponent(urlParam.get("userNameList")) ;

    console.log(fltCode)
    console.log(selectedList)
    console.log(totalPrice)
    console.log(userId)
    console.log(start)
    console.log(end)
    console.log(departDate)
    console.log(returnDate)
    console.log(classvalue)

    const strings = userNameList.substring(1,userNameList.length-1);
    console.log(strings)



    document.getElementById("tdTotalPrice").textContent = totalPrice;
    document.getElementById("totalPrice").textContent = totalPrice;
    document.getElementById("fltCodeValue").textContent = fltCode;
    document.getElementById("startCountry").textContent = start;
    document.getElementById("endCountry").textContent = end;
    document.getElementById("departDate").textContent = departDate;
    document.getElementById("returnDate").textContent = returnDate;
    document.getElementById("classvalue").textContent = classvalue;

    //도착국가명 , 출발국가명 , count , 항공기 기종 명
    let fetchUrlValue = "/reservation/selectAirCompletList?fltCode=" + encodeURIComponent(fltCode) + "&userId=" + encodeURIComponent(userId) + "&userName=" +encodeURIComponent(strings);
    fetch(fetchUrlValue,{
        method: "GET",
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response=>response.json())
        .then(data=>{
            console.log(data)
            const totalNum = data.length;

            document.getElementById("numCount").textContent = totalNum + "석";

            const airName = data[0].airName;
            document.getElementById("airName").textContent = airName;

            const elementById = document.getElementById("tbodyValue");
            elementById.innerHTML = '';

            data.forEach(item=>{
                const row = document.createElement('tr');

                const nameCell = document.createElement('td');
                nameCell.textContent = item.userName;
                row.appendChild(nameCell);

                const idCell = document.createElement('td');
                idCell.textContent = item.userId;
                row.appendChild(idCell);

                const ticketCell = document.createElement('td');
                ticketCell.textContent = item.pNum;
                row.appendChild(ticketCell);

                const actionsCell = document.createElement('td');
                actionsCell.className = 'action-buttons';

                const viewButton = document.createElement('button');
                viewButton.className = 'btn btn-view view-ticket';
                viewButton.textContent = '조회';
                viewButton.dataset.fltcode = fltCode;
                actionsCell.appendChild(viewButton);

                const pdfButton = document.createElement('button');
                pdfButton.className = 'btn btn-pdf send-pdf';
                pdfButton.textContent = 'PDF 전송';
                pdfButton.dataset.pnum =item.pNum;
                actionsCell.appendChild(pdfButton);
                //
                const cancelButton = document.createElement('button');
                cancelButton.className = 'btn btn-cancel cancel-booking';
                cancelButton.textContent = '취소';
                cancelButton.dataset.pnum = item.pNum;
                actionsCell.appendChild(cancelButton);

                row.appendChild(actionsCell);
                elementById.appendChild(row)

                //


            })
        })
        .catch(err=>console.error(err))

    $(document).ready(function() {

        // 인쇄 버튼
        $('#printButton').click(function() {
            window.print();
        });

        // 모달 조회 버튼 클릭
        $(document).on('click','.view-ticket',function() {
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
                url: '<%=request.getContextPath()%>/reservation/detailSelectList',
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

    })




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



    //
    // 예약 취소
    $(document).on('click','.cancel-booking',function() {
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


    //
    $(document).on('click', '.send-pdf', function () {
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
    });
    //

</script>
</body>
</html>