<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>항공권 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* 이전과 동일한 스타일 */
    </style>
</head>
<body>
<div class="container">
    <div class="position-relative">
        <div class="ticket-header">
            <h2 class="mb-0">${passenger.userName}님의 항공권</h2>
            <button type="button" class="close-btn" onclick="window.close()">&times;</button>
        </div>

        <ul class="nav nav-tabs" id="ticketTabs" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="outbound-tab" data-bs-toggle="tab" data-bs-target="#outbound" type="button" role="tab">
                    가는 편 (${passenger.outboundFlight.fltCode})
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="inbound-tab" data-bs-toggle="tab" data-bs-target="#inbound" type="button" role="tab">
                    오는 편 (${passenger.inboundFlight.fltCode})
                </button>
            </li>
        </ul>

        <div class="tab-content" id="ticketTabContent">
            <div class="tab-pane fade show active" id="outbound" role="tabpanel">
                <div class="ticket-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="info-section">
                                <h3>승객 정보</h3>
                                <p>이름: ${passenger.userName}</p>
                                <p>여권번호: ${passenger.passNum}</p>
                                <p>예약번호: ${passenger.regNum}</p>
                            </div>
                            <div class="info-section">
                                <h3>좌석 정보</h3>
                                <p>좌석 코드: ${passenger.seatCode}</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="info-section">
                                <h3>출발</h3>
                                <p>${passenger.outboundFlight.dptCntName} (${passenger.outboundFlight.dptAptCode})</p>
                                <p><fmt:formatDate value="${passenger.outboundFlight.dptDate}" pattern="yyyy.MM.dd"/></p>
                                <p><fmt:formatDate value="${passenger.outboundFlight.dptTime}" pattern="HH:mm"/></p>
                            </div>
                            <div class="info-section">
                                <h3>도착</h3>
                                <p>${passenger.outboundFlight.arrCntName} (${passenger.outboundFlight.arrAptCode})</p>
                                <p><fmt:formatDate value="${passenger.outboundFlight.arrDate}" pattern="yyyy.MM.dd"/></p>
                                <p><fmt:formatDate value="${passenger.outboundFlight.arrTime}" pattern="HH:mm"/></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade" id="inbound" role="tabpanel">
                <!-- 오는 편 정보 (위와 동일한 구조로 passenger.inboundFlight 사용) -->
            </div>
        </div>

        <div class="d-flex justify-content-end p-3 border-top">
            <button type="button" class="btn btn-outline-primary me-2" onclick="sendPDF('${passenger.pNum}')">PDF 전송</button>
            <button type="button" class="btn btn-secondary" onclick="window.close()">닫기</button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function sendPDF(pNum) {
        fetch('SendPDFServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'pNum=' + pNum
        })
            .then(response => response.json())
            .then(data => {
                alert(data.message);
            })
            .catch(error => {
                console.error('Error:', error);
                alert('PDF 전송 중 오류가 발생했습니다.');
            });
    }
</script>
</body>
</html>