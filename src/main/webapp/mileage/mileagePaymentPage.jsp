<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신청하신 상품</title>
</head>
<style>
    .product-table td:first-child {
        white-space: nowrap; /* 첫 번째 td는 한 줄로 고정 */
    }
    .product-table { width: 100%; border-collapse: collapse; }
    .product-table td {
        padding: 10px;
        border: 1px solid #ddd;
        font-size: 13px;

    }

</style>
<body>
<div class="max-w-5xl mx-auto p-4">
    <h1 class="text-2xl font-bold mb-6">신청하신 상품</h1>

    <!-- 상품 목록 테이블 -->
    <table class="min-w-full table-auto product-table">
        <thead>
        <tr>
            <th class="w-32 p-2 ">카테고리</th>
            <th class="w-full p-2 " >상품명</th>
            <th class="text-right p-2">필요 마일리지</th>
            <th class="text-right w-20 p-2">수량</th>
            <th class="text-right p-2">총 필요 마일리지</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="p-2"  id="category" style="text-align: center">

            </td>
            <td class="p-2 font-medium" id="prodName" style="text-align: center">

            </td>
            <td class="text-right text-red-600 p-2" style="text-align: center" id="mile1"> ${param.totalPrice}</td>
            <td class="text-right p-2" style="text-align: center">${param.cnt}</td>
            <td class="text-right text-red-600 p-2" style="text-align: center"  id="mile2"></td>
        </tr>
        </tbody>
    </table>

    <!-- 마일리지 인증 섹션 -->
    <div class="mt-8">
        <h2 class="text-lg font-bold flex items-center gap-2 mb-4">
            <span class="bg-red-500 text-white px-2 py-1 text-sm rounded" style="margin-left: 400px" >마일리지 인증</span>
        </h2>


        <div class="grid gap-4 max-w-md" style="display: flex">
            <div id="targetImg" style="width: 300px; height: 200px;display: flex; margin-top: -50px; flex-direction: row-reverse  ">
                <%--이미지 태그 추가--%>
            </div>

            <div style="display: flex; flex-direction: column; margin-left: 100px">
            <div class="grid grid-cols-[120px,1fr] " >
                <label class="font-medium">회원번호</label>
                <input type="text" class="p-2 border border-gray-300 rounded" style="margin-left: 113px" id="memId"/>
            </div>
            <div class="grid grid-cols-[120px,1fr] items-center gap-2" style="margin-top: 30px">
                <label class="font-medium">홈페이지 로그인 비밀번호</label>
                <div class="flex gap-2" style="display: contents">
                    <input type="password" class="p-2 border border-gray-300 rounded" id="memPass" />
                    <button class="bg-gray-300 hover:bg-gray-400 text-white p-2 rounded" id="searchBtn">승인</button>
                </div>
            </div>
            </div>
        </div>
    </div>

    <!-- 마일리지 정보 섹션 -->
    <div class="mt-8" style="margin-top: 20px">
        <h2 class="text-lg font-bold flex items-center gap-2 mb-4">
            <span class="bg-red-500 text-white px-2 py-1 text-sm rounded">마일리지 정보</span>
        </h2>
        <table class="min-w-full table-auto product-table">
            <thead>
            <tr>
                <th class="text-center p-2">보유 마일리지</th>
                <th class="text-center p-2">필요 마일리지</th>
                <th class="text-center p-2">잔여 마일리지</th>
            </tr>
            </thead>
            <tbody style="text-align: center">
            <tr>
                <td class="text-center p-2" id="myMile">? 마일</td>
                <td class="text-center p-2"  id="mile3" style="color: red">${param.totalPrice}</td>
                <td class="text-center p-2" id="resultMile">? 마일</td>
            </tr>
            </tbody>
        </table>
    </div>

    <div style="display: flex;justify-content: center; margin-top: 20px">
        <button id="closePopup">취소</button>
        <button style="margin-left:20px" id="buyok">결제</button>
    </div>
</div>
<script>
    let loginCheck = false;
    const urlParams = new URLSearchParams(window.location.search);
    const getprodId = urlParams.get('prodId');

    const prodId = getprodId.split('_')[1];

    const imgContainer = document.getElementById("prodName");


    let paramUrl = "/mileage/mileageDetailList?prodId=" + getprodId;

    fetch(paramUrl)
        .then(response => response.json())
        .then(data => {
            const product = data[0];
            console.log(product)
            imgContainer.textContent = product.prodName;
            document.getElementById("mile1").innerText = product.unitPrice.toLocaleString();
            // 파라미터 cnt 값은 URL에서 추출할 수 있다고 가정
            const urlParams = new URLSearchParams(window.location.search);
            const cnt = urlParams.get('cnt');

            const totalMiles = product.unitPrice * cnt;
            document.getElementById("mile2").innerText = totalMiles.toLocaleString();
            document.getElementById("mile3").innerText = product.unitPrice.toLocaleString();
            document.getElementById("category").innerText = product.category;

        })
        .catch(err => console.error('error', err));

    const targetImg = document.getElementById("targetImg");
    const imageElement = document.createElement('img');

    const url = 'image/' + prodId + '.png';
    imageElement.src = url;

    targetImg.appendChild(imageElement);
    console.log(url);

    const btn = document.getElementById("searchBtn");
    btn.addEventListener('click',()=>{
        const userId = document.getElementById("memId").value;
        const userPw = document.getElementById("memPass").value;

        console.log(userId);
        console.log(userPw);

        let url = "/mileage/mileagePaymentPage/searchUser?userId=" + userId + "&userPw=" + userPw;
        fetch(url)
            .then(response => response.json())
            .then(data => {
                console.log(data)
                if (data == 0) {
                    alert("인증 실패");
                }else {
                    alert("인증성공")
                    //마일리지 값 가져오기
                    // "/mileage/userMileage"
                    let url = "/mileage/userMileage?userId=" + userId;
                    fetch(url)
                        .then(response => response.json())
                        .then(data=>{
                            console.log(data)
                            document.getElementById("myMile").innerText = data.toLocaleString();

                            let needMile = document.getElementById("mile3").innerText;
                            console.log(needMile);
                            // 쉼표 제거 후 needMile 변수에 다시 할당
                            needMile = needMile.replace(/,/g, "");
                            console.log(needMile);

                            document.getElementById("resultMile").innerText = (data - needMile).toLocaleString();

                            document.getElementById("memId").disabled = true;
                            document.getElementById("memPass").disabled = true;

                            loginCheck = true;
                        })
                }



            })
            .catch(err => console.error('error', err));

    })

    //팝업 닫기
    document.getElementById("closePopup").addEventListener('click',()=>{
        if (window.opener && !window.opener.closed) {
            window.opener.close();
        }
        window.close();
    })

//     결제하기
    document.getElementById("buyok").addEventListener('click',()=>{
        if (!loginCheck) {
            alert("마일리지 인증하삼")
        }
        const totalMileage = parseInt(document.getElementById("mile3").innerText.replace(/,/g, ""));
        const userMileage = parseInt(document.getElementById("myMile").innerText.replace(/,/g, ""));

        if (userMileage < totalMileage) {
            alert("보유 마일리지가 부족합니다.");
            return;
        }


        const orderAmt = document.getElementById("mile3").innerText;
        const userId = document.getElementById("memId").value;
        let paymentStatus = false;
        console.log("userId",userId)
        const orderQty = urlParams.get('cnt');
        let url = "/mileage/insertOrder?orderAmt=" + orderAmt + "&userId=" + userId + "&prodId=" + getprodId + "&orderQty=" + orderQty;
        console.log("파라미터 " ,url)
        fetch(url)
            .then(data=>{
                console.log(data)

                if (data.status) {
                    const userMileage = document.getElementById("resultMile").innerText;
                    console.log(userId)
                    let url = "/milage/updateMile?userMileage=" + userMileage + "&userId=" + userId;
                    fetch(url)
                        .then(data=>{
                            console.log(data)
                        }).catch(err=>console.error(err))
                    alert("결제완료");
                    paymentStatus = true;
                    if (paymentStatus) {
                        console.log("이동이동")
                        goUrl = '/mileage/goOrdersList?userId=' + userId;
                        window.open(goUrl);
                    }
                } else {
                    alert("결제실패")
                }
            })
            .catch(err=>console.error(err))
    })
</script>
</body>
</html>
