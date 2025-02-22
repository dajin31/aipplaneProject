<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 목록</title>
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

        .search-section {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

        .search-bar {
            display: flex;
            flex: 1;
        }

        .search-input {
            flex: 1;
            padding: 10px;
            border: 2px solid #dc2626;
            border-right: none;
            font-size: 16px;
        }

        .search-button {
            padding: 10px 20px;
            background-color: #dc2626;
            color: white;
            border: none;
            cursor: pointer;
        }

        .order-button {
            padding: 10px 20px;
            border: 1px solid #ddd;
            background: white;
            cursor: pointer;
        }

        .filter-section {
            margin-bottom: 20px;
        }

        .result-count {
            margin-bottom: 10px;
            font-size: 14px;
        }

        .tabs {
            display: flex;
            border-bottom: 1px solid #ddd;
            margin-bottom: 20px;
        }

        .tab {
            padding: 10px 20px;
            cursor: pointer;
            border: none;
            background: none;
        }

        .tab.active {
            border-bottom: 2px solid #dc2626;
            color: #dc2626;
            font-weight: bold;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

        .product-card {
            border: 1px solid #eee;
            padding: 15px;
            transition: transform 0.2s;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .product-image {
            width: 100%;
            aspect-ratio: 1;
            object-fit: contain;
            margin-bottom: 10px;
        }

        .product-name {
            font-size: 14px;
            margin-bottom: 10px;
            color: #333;
        }

        .product-price {
            font-size: 18px;
            font-weight: bold;
            color: #dc2626;
            margin-bottom: 5px;
        }

        .product-mileage {
            font-size: 12px;
            color: #666;
        }


    </style>
</head>
<body>
<div class="container">
    <div class="search-section">
        <div class="search-bar">
            <input type="text" class="search-input" placeholder="검색어를 입력하세요">
            <button class="search-button">검색</button>
        </div>
        <button class="order-button">주문내역</button>
    </div>

    <div class="filter-section">
        <div id="countNum" class="result-count"></div>
        <div class="tabs">
            <button class="tab active">전체</button>
            <button class="tab">화장품</button>
            <button class="tab">잡화/주얼리</button>
            <button class="tab">식품</button>
        </div>
    </div>



    <div class="product-grid" id="productGrid">

    </div>

</div>

<script>
    document.querySelectorAll('.tab').forEach(tab => {
        tab.addEventListener('click', () => {
            document.querySelector('.tab.active').classList.remove('active');
            tab.classList.add('active');

            const category = tab.textContent.trim();
            console.log(category)
            let url = '';

            switch (category) {
                case '화장품':
                    url = '/mileage/mileageShop/makeup';
                    break;
                case '잡화/주얼리':
                    url = '/mileage/mileageShop/grocery';
                    break;
                case '식품':
                    url = '/mileage/mileageShop/food';
                    break;
                case '전체':
                    url = '/mileage/mileageShop/allList';
                    break;
                default:
                    break;
            }



            fetch(url)
                .then(response => response.json())
                .then(products => {
                    const productGrid = document.getElementById('productGrid');

                    // 기존 내용 초기화
                    productGrid.innerHTML = '';

                    const totalNum = products.length;

                    console.log(totalNum)

                    let numId = document.getElementById("countNum");
                    numId.innerText = "총 " + totalNum + "개 검색";

                    products.forEach(product => {
                        console.log(product); // 제품 정보 콘솔로 확인

                        const productCard = document.createElement('div');
                        productCard.classList.add('product-card');

                        const productImg = document.createElement('img');
                        productImg.classList.add('product-image');
                        const url = product.prodId.split('_')[1];
                        console.log(url)
                        const urlImg = 'image/' + url + '.png';
                        productImg.src = urlImg;

                        const productName = document.createElement('div');
                        productName.classList.add('product-name');
                        productName.textContent = product.prodName ?  product.prodName : '상품명이 없습니다';


                        const productPrice = document.createElement('div');


                        const priceText = document.createElement('span');
                        priceText.classList.add('product-price')
                        priceText.textContent = product.unitPrice.toLocaleString() + "원";


                        const mileageText = document.createElement('span');
                        mileageText.classList.add('product-mileage')
                        mileageText.textContent = " 마일리지";

                        productPrice.appendChild(priceText);
                        productPrice.appendChild(mileageText);

                        productCard.appendChild(productImg);
                        productCard.appendChild(productName);
                        productCard.appendChild(productPrice);


                        productGrid.appendChild(productCard);
                    });
                })
                .catch(err => console.error('error', err));



        });
    });

    fetch('/mileage/mileageShop/all')
        .then(response => response.json())
        .then(products => {
            const list = products.products;
            const totalNum = products.count;

            console.log(totalNum)

            let numId = document.getElementById("countNum");
            numId.innerText = "총 " + totalNum + "개 검색";


            if (Array.isArray(list)) {
                    const productGrid = document.getElementById('productGrid');

                    productGrid.innerHTML = '';

                list.forEach(product => {
                    const productCard = document.createElement('div');
                    productCard.classList.add('product-card');

                    const productImg = document.createElement('img');
                    productImg.classList.add('product-image');
                    const url = product.prodId.split('_')[1];
                    const urlImg = 'image/' + url + '.png';
                    productImg.src = urlImg;

                    const productName = document.createElement('div');
                    productName.classList.add('product-name');
                    productName.textContent = product.prodName ? product.prodName : '상품명이 없습니다';

                    const productPrice = document.createElement('div');

                    const priceText = document.createElement('span');
                    priceText.classList.add('product-price');
                    priceText.textContent = product.unitPrice.toLocaleString() + "원";

                    const mileageText = document.createElement('span');
                    mileageText.classList.add('product-mileage');
                    mileageText.textContent = " 마일리지";

                    productPrice.appendChild(priceText);
                    productPrice.appendChild(mileageText);

                    productCard.appendChild(productImg);
                    productCard.appendChild(productName);
                    productCard.appendChild(productPrice);

                    productGrid.appendChild(productCard);
                });
            } else {
                console.error('products is not an array', list);
            }

        })
        .catch(err => console.error('error', err));

    document.querySelector('.search-button').addEventListener('click', () => {
        const searchTerm = document.querySelector('.search-input').value.trim();
        console.log(searchTerm)

        if (!searchTerm) {
            alert("검색어를 입력하세요");
            return;
        }

        let url = "/mileage/mileageShop/search?prodName="+searchTerm;
        console.log("파라미",url)

        fetch(url)
            .then(response => response.json())
            .then(products => {
                const productGrid = document.getElementById('productGrid');
                productGrid.innerHTML = '';

                const totalNum = products.length;
                console.log(totalNum);

                let numId = document.getElementById("countNum");
                numId.innerText = "총 " + totalNum + "개 검색";

                products.forEach(product => {
                    const productCard = document.createElement('div');
                    productCard.classList.add('product-card');

                    const productImg = document.createElement('img');
                    productImg.classList.add('product-image');
                    const url = product.prodId.split('_')[1];
                    const urlImg = 'image/' + url + '.png';
                    productImg.src = urlImg;

                    const productName = document.createElement('div');
                    productName.classList.add('product-name');
                    productName.textContent = product.prodName ? product.prodName : '상품명이 없습니다';

                    const productPrice = document.createElement('div');

                    const priceText = document.createElement('span');
                    priceText.classList.add('product-price');
                    priceText.textContent = product.unitPrice.toLocaleString() + "원";

                    const mileageText = document.createElement('span');
                    mileageText.classList.add('product-mileage');
                    mileageText.textContent = " 마일리지";

                    productPrice.appendChild(priceText);
                    productPrice.appendChild(mileageText);

                    productCard.appendChild(productImg);
                    productCard.appendChild(productName);
                    productCard.appendChild(productPrice);

                    productGrid.appendChild(productCard);
                });
            })
            .catch(err => console.error('error', err));
    });

    document.querySelector('.search-input').addEventListener('keydown', (e) => {
        if (e.key === 'Enter') {
            document.querySelector('.search-button').click();
        }
    });

</script>
</body>
</html>