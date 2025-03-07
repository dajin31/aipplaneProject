<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>승객 선택</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 24px;
            font-weight: bold;
        }

        .close-btn {
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
        }

        .passenger-type {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .type-label {
            display: flex;
            align-items: center;
            gap: 5px;
            font-size: 16px;
        }

        .info-icon {
            width: 16px;
            height: 16px;
            border: 1px solid #999;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
            color: #666;
            cursor: help;
        }

        .number-control {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .control-btn {
            width: 32px;
            height: 32px;
            border: 1px solid #ddd;
            border-radius: 50%;
            background: white;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
        }

        .control-btn:disabled {
            background: #f5f5f5;
            cursor: not-allowed;
            color: #ccc;
        }

        .passenger-number {
            width: 40px;
            text-align: center;
            font-size: 18px;
        }



        .info-section {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin: 20px 0;
        }

        .info-section p {
            font-size: 14px;
            color: #666;
            margin-bottom: 10px;
        }

        .info-section a {
            color: #0064de;
            text-decoration: none;
        }

        .select-btn {
            width: 100%;
            padding: 15px;
            background: #0064de;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }

        .select-btn:disabled {
            background: #ccc;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>승객 선택</h1>
        <button class="close-btn" >&times;</button>
    </div>

    <div class="passenger-type">
        <div class="type-label">
            성인 <span class="info-icon">?</span>
        </div>
        <div class="number-control">
            <button class="control-btn" >-</button>
            <span class="passenger-number" id="adult-count">1</span>
            <button class="control-btn">+</button>
        </div>
    </div>

    <div class="passenger-type">
        <div class="type-label">
            소아 <span class="info-icon">?</span>
        </div>
        <div class="number-control">
            <button class="control-btn">-</button>
            <span class="passenger-number" id="child-count">0</span>
            <button class="control-btn">+</button>
        </div>
    </div>



    <div class="info-section">
        <p>• 구매와 동시승급을 이용하시는 경우 마일리지 공제를 위해 등록된 가족 기준으로 승객선택을 해주시기 바랍니다.</p>
        <p>• 본인 1명 예매 시에만 등록된 가족의 마일리지를 합산하여 사용하실 수 있습니다.</p>
        <p>• 2인 이상 예매 시 로그인 회원 본인의 마일리지만 사용 가능합니다. <a href="https://www.koreanair.com/contents/skypass/benefits/family-plan/pooling">자세히 보기</a></p>
        <p>• 만 14세 미만 승객은 예매 시 법정대리인의 동의 및 인증이 필요합니다. 로그인 후 예매를 진행하여 주시기 바랍니다.</p>
    </div>

    <button class="select-btn">선택</button>
</div>

<script>

    let selectedPassenger = null;
    document.querySelectorAll('.control-btn').forEach(button=>{
        button.addEventListener('click',function (){
            const input = this.parentElement.querySelector('.passenger-number');
            let currentValue = parseInt(input.textContent);

            if (this.textContent === '+') {
                currentValue += 1;
            }else if (currentValue > 1) {
                currentValue -= 1;
            }

            input.textContent = currentValue;

        })
    })

    document.querySelector('.close-btn').addEventListener('click',()=>{
        window.close(); // 팝업 창 닫기
    })

    document.querySelector('.select-btn').addEventListener('click',()=>{
        selectedPassenger={

            adult : document.querySelector('#adult-count').textContent,
            child : document.querySelector('#child-count').textContent
        }
        console.log(selectedPassenger);

        if (window.opener) {
            window.opener.postMessage(selectedPassenger,{name: 'selectedPassenger'})
        }
        window.close();
    })
</script>
</body>
</html>