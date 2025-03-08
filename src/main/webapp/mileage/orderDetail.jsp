<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Items</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            padding: 50px 50px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }


        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-weight: normal;
        }

        .order-table {
            width: 100%;
            border-collapse: collapse;
        }

        .order-table th {
            padding: 15px;
            text-align: left;
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            color: #666;
            font-weight: normal;
        }

        .order-table td {
            padding: 15px;
            border-bottom: 1px solid #eee;
            vertical-align: middle;
        }

        .product-image {
            width: 80px;
            height: 80px;
            object-fit: cover;
            background-color: #f5f5f5;
        }

        .price {
            text-align: right;
            font-weight: bold;
        }

        .quantity {
            text-align: center;
        }

        .option {
            color: #666;
        }
    </style>
</head>
<body>
<div class="container">
<h1>주문내역</h1>
    <a href="/mileage/mileageShop.jsp" class="back-button">마일리지 샵으로 돌아가기</a>
<table class="order-table">
    <thead>
    <tr>
        <th>IMAGE</th>
        <th>ITEM</th>
        <th>수량</th>
        <th>주문일</th>
        <th>PRICE</th>
    </tr>
    </thead>
    <tbody  id="orderList">
    </tbody>
</table>

</div>
<script>

    const urlParams = new URLSearchParams(window.location.search);
    const getuserId = urlParams.get('userId');
    console.log(getuserId);

    url = "/mileage/orderList?userId=" + getuserId;
    fetch(url)
        .then(response => response.json())
    .then(orders=>{
        console.log(orders)
        const orderListElement = document.getElementById("orderList");
       orders.forEach(item=>{
           const trElement = document.createElement('tr');
          const tdElement = document.createElement('td');
           const imageElement = document.createElement("img");
           imageElement.classList.add('product-image')
           const prodId = item.prodId;
           const imgUrl = prodId.split("_")[1];
           const urlImg = 'image/' + imgUrl + '.png';
           imageElement.src = urlImg;
           tdElement.appendChild(imageElement)
           trElement.appendChild(tdElement);

           const prodElement = document.createElement('td');
           prodElement.textContent = item.prodName;
           trElement.appendChild(prodElement);

           const qtyElement = document.createElement('td');
           qtyElement.textContent = item.orderQty;
           trElement.appendChild(qtyElement);

           const dateElement = document.createElement('td');
           dateElement.textContent = item.orderDate;
           trElement.appendChild(dateElement);

           const orderPriceElement = document.createElement('td');
           orderPriceElement.textContent = item.orderAmt.toLocaleString();
           trElement.appendChild(orderPriceElement);

           orderListElement.appendChild(trElement);



       })
    }).catch(err=>console.error(err))
</script>
</body>
</html>