<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>항공권 결제</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif;
        }

        body {
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.5;
        }

        .container {
            max-width: 480px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 4px;
        }

        .subtitle {
            font-size: 14px;
            color: #666;
            margin-bottom: 20px;
        }

        .price-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
        }

        .price-label {
            font-size: 15px;
        }

        .price-value {
            font-size: 15px;
            text-align: right;
        }

        .divider {
            height: 1px;
            background-color: #eee;
            margin: 16px 0;
        }

        .mileage-section {
            margin: 16px 0;
        }

        .mileage-title {
            font-size: 15px;
            margin-bottom: 8px;
        }

        .mileage-input-group {
            display: flex;
            margin-bottom: 16px;
        }

        .mileage-input {
            flex: 1;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .search-button {
            width: 40px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-left: 8px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .search-icon {
            width: 20px;
            height: 20px;
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            font-weight: 700;
            font-size: 18px;
            margin: 16px 0;
        }

        .pay-button {
            width: 100%;
            padding: 16px;
            background-color: #000;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            margin-bottom: 16px;
        }

        .terms {
            font-size: 12px;
            color: #888;
            text-align: center;
        }

        .terms a {
            color: #888;
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>결제 금액</h1>
    <p class="subtitle">항공권 가격 및 할인 정보</p>

    <div class="price-row">
        <span class="price-label">항공권 요금</span>
        <span class="price-value">원</span>
    </div>


    <div class="divider"></div>

    <div class="mileage-section">
        <p class="mileage-title">마일리지 조회 및 적용</p>
            <div class="mileage-input-group">
                <input type="text" name="memberId" class="mileage-input" placeholder="회원 ID 입력">
                <button type="submit" class="search-button">
                    <svg class="search-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                </button>
            </div>

        <div class="price-row">
            <span class="price-label">사용 가능 마일리지</span>
            <span class="price-value" id="myMileage">마일</span>
        </div>

            <div class="mileage-input-group">
                <input type="number" name="useMileage" id="inputMile" class="mileage-input" placeholder="사용할 마일리지 입력" max="999999">
                <button type="submit" class="search-button" id="useMileage">적용</button>
            </div>


        <div class="price-row">
            <span class="price-label">마일리지 할인</span>
            <span class="price-value" id="resultMile">-원</span>
        </div>

        <div class="price-row">
            <span class="price-label">등급 할인</span>
            <span class="price-value" id="rankDiscount">-원</span>
        </div>
    </div>

    <div class="divider"></div>

    <div class="total-row">
        <span>최종 결제 금액</span>
        <span id="realTotalPrice">원</span>
    </div>

        <button type="submit" class="pay-button" id="paymentButton">결제하기</button>


    <p class="terms">
        결제를 진행하면 <a href="#">이용약관</a> 및 <a href="#">개인정보 처리방침</a>에 동의하는 것으로 간주됩니다.
    </p>
</div>
<script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
<script>

    const urlParams = new URLSearchParams(window.location.search);
    const userId = decodeURIComponent(urlParams.get("userId"));
    const totalPrice = decodeURIComponent(urlParams.get("totalPrice"));
    const formList = decodeURIComponent(urlParams.get("formList"));
    const selectedList = decodeURIComponent(urlParams.get("selectedList"));
    const fltCode = decodeURIComponent(urlParams.get("fltCode"));

    let mCheck = false;

    console.log(userId)
    console.log(totalPrice)
    console.log(formList)
    console.log(selectedList)
    console.log(fltCode)

    document.querySelector('.price-value').textContent = totalPrice;


    // 마일리지 조회 폼 제출 시 AJAX 처리
    document.querySelector('.search-button').addEventListener('click', function(e) {
        e.preventDefault();

        if (!userId) return;

        let url = "/mileage/userMileage?userId=" + userId;

        fetch(url)
            .then(response => response.json())
            .then(data => {
                console.log(data)
                alert("인증성공")
                mCheck = true;
                if (mCheck) {
                    document.getElementById("myMileage").textContent = data.toLocaleString() + " 마일";
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('마일리지 조회 중 오류가 발생했습니다.');
            });
    });





    document.getElementById("useMileage").addEventListener("click",()=>{
        console.log("클릭")

        const useMile = document.getElementById("inputMile").value; //입력 마일
        const myMile = document.getElementById("myMileage").innerText; //내 마일
        const maxMile = parseInt(document.getElementById('inputMile').getAttribute('max'));

        const mileString = myMile.split(" ")[0];
        const myMileValue = mileString.replace(",","");

        if(parseInt(useMile) > maxMile){
            alert("최대 입력값을 초과했습니다.");
            return;
        }

        const useMileInt = parseInt(useMile);
        const myMileInt = parseInt(myMileValue);

        if (useMileInt > myMileInt) {
            alert("님 마일리지 부족함 ㅇㅇ");
            return;
        }

        const elementById = document.getElementById("resultMile");
        elementById.textContent = useMile.toLocaleString('en-US') + " 마일";
        elementById.style.color = 'red';

        const inputElement = document.getElementById("inputMile");
        inputElement.disabled  = true;


        const strValue = totalPrice.split(" ")[0].replace(",","");
         const toTalNum = parseInt(strValue);
        document.getElementById("realTotalPrice").textContent = (toTalNum - useMileInt).toLocaleString() + " 원";


    })


    document.getElementById("paymentButton").addEventListener("click", async (e) => {
        //
        // const innerTextValue = document.getElementById("realTotalPrice").innerText;
        // const string = innerTextValue.split(" ")[0].replace(",","");
        // const number = parseInt(string);
        // let resultCheck = false;
        //
        // console.log(number)
        //
        // e.preventDefault();
        // try {
        //     const response = await PortOne.requestPayment({
        //         storeId: "store-8d537446-2e5f-4b3f-b293-52538bc22fbc",
        //         channelKey: "channel-key-ff249e0c-abee-42b9-8b4a-59bbf04c2586",
        //         paymentId: `payment-\${crypto.randomUUID()}`,
        //         orderName: "항공권 구매",
        //         totalAmount: number,
        //         currency: "CURRENCY_KRW",
        //         payMethod: "EASY_PAY",
        //     });
        //
        //     console.log("결제 성공:", response);
        //
        // } catch (error) {
        //     console.error("결제 실패:", error);
        //     alert("결제 실패ㅠ")
        // }
        //
        // resultCheck = true;
        // if (resultCheck) {
        //     alert("결제 성공");
        //     //결제성공시 insert작업 , update작업
        //
        // }
        const totalPrice = document.getElementById("realTotalPrice").innerText;
        console.log(totalPrice)

        const totalPriceValue = totalPrice.split(" ")[0].replace(",","");

        const useMile = document.getElementById("inputMile").value;
        const myMile = document.getElementById("myMileage").innerText; //내 마일


        const mileString = myMile.split(" ")[0];
        const myMileValue = mileString.replace(",","");

        const useMileInt = parseInt(useMile);
        const myMileInt = parseInt(myMileValue);

        const resultMile = (myMileInt - useMileInt);

        let url = "/reservation/processReservation?seatCode=" + selectedList + "&totalPrice=" + totalPriceValue + "&userId=" + userId + "&fltCode=" + fltCode + "&userMileage=" + resultMile;

        console.log(url)
        fetch(url)
            .then(response=>response.json())
            .then(data=>{
                console.log(data);
            })

    });



</script>
</body>
</html>