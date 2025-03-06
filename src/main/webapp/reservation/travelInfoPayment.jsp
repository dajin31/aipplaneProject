<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행 예약</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Malgun Gothic', sans-serif;
        }

        body {
            background-color: #f5f5f5;
            color: #333;
        }

        .container {
            max-width: 768px;
            margin: 0 auto;
            background-color: #fff;
        }

        .tab-menu {
            display: flex;
            border-bottom: 1px solid #ddd;
        }

        .tab-menu button {
            padding: 10px 15px;
            background: none;
            border: none;
            cursor: pointer;
        }

        .tab-menu button.active {
            border-bottom: 2px solid #0066cc;
            color: #0066cc;
            font-weight: bold;
        }

        .section-title {
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
        }

        .itinerary-box {
            border: 1px solid #ddd;
            border-radius: 5px;
            margin: 10px 15px;
            padding: 15px;
        }

        .route {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .route-code {
            font-weight: bold;
            color: #0066cc;
        }

        .route-arrow {
            margin: 0 10px;
            color: #999;
        }

        .flight-info {
            font-size: 12px;
            color: #666;
            margin-top: 5px;
            display: flex;
        }

        .flight-number {
            color: #333;
            font-weight: bold;
        }

        .detail-button {
            float: right;
            background-color: #f5f5f5;
            border: 1px solid #ddd;
            border-radius: 15px;
            padding: 3px 8px;
            font-size: 12px;
            cursor: pointer;
        }

        .price-summary {
            padding: 15px;
        }

        .price-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
        }

        .price-label {
            color: #666;
        }

        .price-value {
            font-weight: bold;
        }

        .total-price {
            font-size: 20px;
            font-weight: bold;
            color: #0066cc;
            text-align: right;
            margin-top: 10px;
        }

        .passenger-form {
            margin: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-header {
            background-color: #003366;
            color: white;
            padding: 10px 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
        }

        .form-content {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            color: #666;
        }

        .required:after {
            content: "*";
            color: red;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        select.form-control {
            appearance: none;
            background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%23333' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M6 9l6 6 6-6'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 8px center;
            background-size: 16px;
        }

        .form-row {
            display: flex;
            gap: 15px;
        }

        .form-row .form-group {
            flex: 1;
        }

        .submit-btn {
            background-color: #8cd3ff;
            color: #333;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
            float: right;
            font-weight: bold;
        }

        .accordion {
            margin: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .accordion-header {
            padding: 15px;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .footer {
            background-color: #fff;
            padding: 15px;
            border-top: 1px solid #ddd;
            bottom: 0;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .payment-btn {
            background-color: #003366;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">


    <div class="section-title">여정 정보</div>

    <div class="itinerary-box">
        <div class="detail-button" id="detailBtn">상세 보기</div>
        <div class="route">
            <span class="route-code">가는 편</span>
            <span class="route-arrow">:</span>
            <span class="route-code" id="startCountry">CJU 제주</span>
            <span class="route-arrow">→</span>
            <span class="route-code" id="endCountry">GMP 김포/서울</span>
        </div>

        <div class="flight-info">
            <div  id="whatDate">
                2023년 8월 27일 (일) 12:25 ~ 13:35
            </div>
            <span class="flight-number" id="flightNumber" style="margin-left: 5px">AB1234</span>
            <span class="detail">(직항)</span>
        </div>
    </div>


    <div class="price-summary">
        <div class="price-row">
            <span class="price-label" id="passengerNum">성인 1명</span>
            <span class="price-value" id="farePrice" >411,000 원</span>
        </div>
        <div class="price-row">
            <span class="price-label">유류할증료</span>
            <span class="price-value" id="oilPrice"></span>
        </div>
        <div class="price-row">
            <span class="price-label">세금,수수료 및 기타 요금</span>
            <span class="price-value" id="chargePrice"></span>
        </div>
        <div class="total-price">
            <div>총액</div>
            <div id="totalPrice">521,400 원</div>
            <div style="font-size: 12px; color: #666; font-weight: normal;">* 모든 세금과 수수료 포함</div>
        </div>
    </div>

    <div class="section-title">승객 정보</div>
    <div style="padding: 0 15px; font-size: 12px; color: #666;">
        * 모든 정보는 영문으로 입력해주세요. 여권에 기재된 이름과 동일하게 입력하셔야 합니다.
    </div>

    <div class="passenger-form">

    </div>




</div>

<div class="footer">
    <div style="margin-left: 700px">
        <div>항공 결제 금액</div>
        <div class="total-price" style="margin-top: 0;" id="resultPrice">521,400 원</div>
    </div>
    <button class="payment-btn">결제하기</button>

</div>

<script>

    const urlParams = new URLSearchParams(window.location.search);
    const passengerValue = decodeURIComponent(urlParams.get("passengerValue"));
    const classvalue = decodeURIComponent(urlParams.get("classValue"));
    const start = decodeURIComponent(urlParams.get("start"));
    const end = decodeURIComponent(urlParams.get("end"));
    const departDate = decodeURIComponent(urlParams.get("departDate"));
    const returnDate = decodeURIComponent(urlParams.get("returnDate"));
    const fltCode = decodeURIComponent(urlParams.get("fltCode"));
    const selectedList = decodeURIComponent(urlParams.get("selectedList"));
    const totalPrice = decodeURIComponent(urlParams.get("totalPrice"));
    const userId = decodeURIComponent(urlParams.get("userId"));

    console.log(passengerValue)
    console.log(classvalue)
    console.log(start)
    console.log(end)
    console.log(departDate)
    console.log(returnDate)
    console.log(fltCode)
    console.log(selectedList)
    console.log(totalPrice)
    console.log(userId)

    let formList = [];

    const startCountry = document.getElementById("startCountry");
    startCountry.innerText = start;

    document.getElementById("endCountry").innerText = end;

    document.getElementById("whatDate").innerText = departDate + " ~ " + returnDate;

    document.getElementById("passengerNum").innerText = "운임료 : " +  passengerValue ;

    document.getElementById("totalPrice").innerText = totalPrice;

    document.getElementById("flightNumber").innerText = fltCode;

    const price = totalPrice.replace(",","");
    const priceNum = price.split(" ")[0];
    console.log(priceNum);

    console.log(typeof parseInt(priceNum))


    document.getElementById("farePrice").innerText = Math.round(parseInt(priceNum) *0.8221343873517799).toLocaleString() + " 원";

    document.getElementById("oilPrice").innerText = Math.round(parseInt(priceNum) * 0.079051383399209486).toLocaleString() + " 원";

    const servicePrice = Math.round(parseInt(priceNum) *0.8221343873517799 + parseInt(priceNum) * 0.079051383399209486) ;

    document.getElementById("chargePrice").innerText =(parseInt(priceNum) - servicePrice).toLocaleString() + " 원";

    document.getElementById("resultPrice").innerText = totalPrice;


    // 몇명인지
    const adultMatch = passengerValue.match(/성인\s*:\s*(\d+)/);
    const childMatch = passengerValue.match(/소아\s*:\s*(\d+)/);

    const adultCount = adultMatch ? parseInt(adultMatch[1]) : 0;
    const childCount = childMatch ? parseInt(childMatch[1]) : 0;

    const totalCount = adultCount + childCount;
    // console.log(totalCount)



    document.addEventListener("DOMContentLoaded",function (){
        const element = document.querySelector(".container");
        for (let i = 1; i <= totalCount; i++) {
            const passengerForm = document.createElement("div");
            passengerForm.className = "passenger-form";

            passengerForm.innerHTML = `
            <div class="form-header">
            <div>승객 \${i}</div>
            <div><i class="arrow-down"></i></div>
        </div>

        <div class="form-content">
            <div class="form-group">
                <label class="form-label required">여행자 이름</label>
             <input type="text" class="form-control" placeholder="홍길동" maxlength="3" id="userName">
            </div>


            <div class="form-group">
                <label class="form-label">생년월일</label>
               <input type="text" class="form-control" placeholder="000000" maxlength="6">
            </div>

            <div class="form-group">
                <label class="form-label">여권 번호</label>
                <div class="form-row">
                    <input type="text" class="form-control" placeholder="M12345678" maxlength="9">
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">좌석번호</label>
                <select class="form-control" >

                </select>
            </div>

            <button class="submit-btn">확인</button>
            <div style="clear: both;"></div>
        </div>
            `;



            element.appendChild(passengerForm);

            const selectElement = passengerForm.querySelector("select");

            const strings = selectedList.split(",");
            console.log(strings)
            //
            for (let i = 0; i < strings.length; i++) {
                const option = document.createElement("option");
                option.textContent = strings[i];
                selectElement.appendChild(option);
            }

            selectElement.addEventListener("change", function() {
                validateSeatSelection();
            });
        }
//---------------------------------------------------

        const submitBtns = document.querySelectorAll(".submit-btn");
        submitBtns.forEach(submitBtn=>{

            submitBtn.addEventListener("click",(e)=>{
                let validation = false;
                e.preventDefault(); // 폼 기본 제출 방지
                const passengerForm = submitBtn.closest(".passenger-form");

                        const travelerName   = passengerForm.querySelector('input[placeholder="홍길동"]').value;
                        const birthdate      = passengerForm.querySelector('input[placeholder="000000"]').value;
                        const passportNumber = passengerForm.querySelector('input[placeholder="M12345678"]').value;
                        const seatNumber     = passengerForm.querySelector('select').value;

                        // 유효성 검사
                        if (!validateName(travelerName)) {
                            alert("여행자 이름은 한글만 입력해주세요.");
                            return;
                        }


                        if (!validateBirthdate(birthdate)) {
                            alert("생년월일은 숫자 6자리로 입력해주세요.");
                            return;
                        }

                        if (!validatePassportNumber(passportNumber)) {
                            alert("여권 번호는 영문 1자리와 숫자 8자리 조합으로 입력해주세요.");
                            return;
                        }


                validation = true;

                if (validation) {
                    alert("유효성 검사 통과!");

                    formList.push({
                        userId : userId,
                        userName: travelerName,
                        fltCode: fltCode,
                        passNum: passportNumber,
                        regNum : birthdate,
                        seatCode :seatNumber
                    })


                    const koreanNameInput = passengerForm.querySelector('input[placeholder="홍길동"]');
                    koreanNameInput.disabled  = true;


                    const birthdateInput = passengerForm.querySelector('input[placeholder="000000"]');
                    birthdateInput.disabled  = true;

                    const passportInput = passengerForm.querySelector('input[placeholder="M12345678"]');
                    passportInput.disabled  = true;

                    const seatInput = passengerForm.querySelector('select');
                    seatInput.disabled = true;
                }

                    });


                    // 유효성 검사 함수
                    function validateName(name) {
                        const regex = /^[가-힣]+$/;
                        return regex.test(name);
                    }


                    function validateBirthdate(birthdate) {
                        const regex = /^\d{6}$/;
                        return regex.test(birthdate);
                    }

                    function validatePassportNumber(passportNumber) {
                        const regex = /^[A-Z]\d{8}$/;
                        return regex.test(passportNumber);
                    }




            })


    function validateSeatSelection() {
        const selectElements = document.querySelectorAll(".passenger-form select");
        const selectedSeats = [];

        // 선택된 좌석 번호 수집
        selectElements.forEach(selectElement => {
            if (selectElement.value) {
                selectedSeats.push(selectElement.value);
            }
        });

        // 중복된 좌석 번호 확인
        const duplicateSeats = selectedSeats.filter((seat, index) => selectedSeats.indexOf(seat) !== index);

        if (duplicateSeats.length > 0) {
            alert("선택된 좌석 번호가 중복되었습니다. 다시 선택해주세요.");

            // 중복된 좌석 선택 취소
            selectElements.forEach(selectElement => {
                if (duplicateSeats.includes(selectElement.value)) {
                    selectElement.value = ""; // 선택 초기화
                }
            });
        }
    }




    });



    document.getElementById("detailBtn").addEventListener('click',()=>{
        const url = '/reservation/detailAircraftPopup?fltCode=' + fltCode;
        console.log("클릭")

        const popWidth = 800;
        const popHeight = 600;
        const options = `width=${popWidth}px, height=${popHeight}px, top=20, left=20, resizable=no, scrollbars=yes, menubar=no, toolbar=no, location=no, directories=no, status=no`;

        const popupwindow = window.open(url, 'detailPopup', options);

        if (popupwindow) {
            console.log("상세팝업 오픈");
            popupwindow.opener = window;
        } else {
            alert("팝업 오픈 실패 ㅜ")
        }
    })


    // 결제 버튼 처리
    document.querySelector('.payment-btn').addEventListener('click', function (e) {
        e.preventDefault();
        // alert('결제 페이지로 이동합니다.');
        console.log(formList)
        window.location.href = "airportPaymentInfo.jsp?userId=" + userId + "&totalPrice=" + totalPrice + "&formList=" + encodeURIComponent(JSON.stringify(formList)) + "&selectedList=" + selectedList + "&fltCode=" + fltCode;

    });


</script>
</body>
</html>