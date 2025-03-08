    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>상품상세</title>
        <style>
            * { box-sizing: border-box; margin: 0; padding: 0; }
            body { font-family: Arial, sans-serif;  padding: 80px 20px; margin-top: -50px }

            .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
            .product-grid { display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 20px; }

            .product-images { position: relative;  }
            .main-image { width: 100%; margin-bottom: 20px; }
            .thumbnail { width: 80px; height: 80px; border: 1px solid #ddd; cursor: pointer; }

            .product-info { padding: 20px;
                border: 1px solid #ddd;}
            .product-title { font-size: 22px; margin-bottom: 20px; }
            .brand { color: #666; margin-bottom: 10px; }
            .price { font-size: 24px; color: #000; margin: 20px 0; }
            .quantity-selector { display: flex; align-items: center; gap: 10px; margin: 20px 0; }
            .quantity-input { width: 60px; padding: 5px; text-align: center; }
            .quantity-btn { padding: 5px 10px; background: #fff; border: 1px solid #ddd; }

            .purchase-btn {
                width: 100%;
                padding: 15px;
                background: #333;
                color: white;
                border: none;
                cursor: pointer;
                font-size: 16px;
            }

            .product-images img {
                width: 100%;
                max-width: 500px;
                height: auto;
                border: 1px solid #ddd;
            }


            .product-rating { padding: 20px;   border: 1px solid #ddd;}
            .rating-number { font-size: 48px; text-align: center; }
            .stars { text-align: center; color: #ddd; font-size: 24px; }

            .tabs { display: flex; margin-top: 40px; border-bottom: 1px solid #ddd; }
            .tab { padding: 10px 20px; cursor: pointer; }
            .tab.active { border-bottom: 2px solid #000; }

            .product-table { width: 100%; border-collapse: collapse; }
            .product-table td {
                padding: 10px;
                border: 1px solid #ddd;
                font-size: 13px;

            }
            .product-table td:first-child {
                white-space: nowrap; /* 첫 번째 td는 한 줄로 고정 */
            }

            .product-table td:nth-child(2) {
                word-wrap: break-word; /* 두 번째 td는 내용에 따라 줄바꿈 허용 */
            }

            .tab-content {
                display: none; /* 기본적으로 모든 탭 콘텐츠는 숨깁니다. */
            }
            .tab-content.active {
                display: block; /* active 클래스를 가진 탭 콘텐츠만 보이게 합니다. */
            }

            .tab {
                cursor: pointer;
                padding: 10px 20px;
            }
            .tab.active {
                border-bottom: 2px solid #000; /* 활성화된 탭에 하단 테두리를 추가합니다. */
            }
        </style>
    </head>
    <body>
    <div class="container">
        <div class="product-grid">

            <div class="product-images">
            </div>

            <!-- 중앙: 상품 정보 -->
            <div class="product-info">
                <h2 id="proName" class="product-title"></h2>
                <div class="price">
                    <span style="color: red">판매가</span>
                    <strong id="proPrice" style="color: red"></strong>
                    <span style="font-size: 17px">마일</span>
                </div>

                <div class="quantity-selector">
                    <span>수량</span>
                    <button class="quantity-btn">-</button>
                    <input type="text" value="1" class="quantity-input">
                    <button class="quantity-btn">+</button>
                </div>

                <div>
                    <span style="color: red">합계</span>
                    <span id="totalPrice"  style="color: red"></span>
                    <span  style="font-size: 12px" >마일</span>
                </div>

                <button id="goBuy" class="purchase-btn" style="margin-top: 50px">바로구매하기</button>
            </div>

            <!-- 오른쪽: 평점 -->
            <div class="product-rating">
                <div class="rating-number">0</div>
                <div class="stars">★★★★★</div>
                <p style="text-align: center">상품리뷰 (0건)</p>
                <div class="product-details" style="margin-top: 50px">
                    <h3>구매정보</h3>
                    <p id="proName2"></p>
                </div>
            </div>
        </div>

        <!-- 하단 탭 -->
        <div class="tabs">
            <div class="tab active"  data-tab="details">상세설명</div>
            <div class="tab" data-tab="reviews">상품평</div>
            <div class="tab" data-tab="usage-info">이용안내</div>
            <div class="tab" data-tab="return-policy">주문취소/반품</div>
        </div>

        <!-- 상세 설명 -->
        <table class="product-table details tab-content active"  id="details">
            <tr>
                <td >주요재료</td>
                <td id="main-material"></td>
            </tr>
            <tr>
                <td >사용방법</td>
                <td id="use"></td>
            </tr>
            <tr>
                <td >재고수량</td>
                <td id="stock"></td>
            </tr>
            <tr>
                <td >상품설명</td>
                <td id="description"></td>
            </tr>
            <tr>
                <td>상담번호</td>
                <td>02-1234-5678</td>
            </tr>
        </table>

        <%--상품명--%>

        <table  class="product-table tab-content reviews" id="reviews">
            <tr>
                <td >상품리뷰  </td>
                <td style="width: 100%">등록된 상품후기가 없습니다.</td>
            </tr>
        </table>


        <%--이용안내--%>

        <table  class="product-table tab-content usage-info" id="usage-info">
            <tr>
                <td >면세점 이용 가능 고객</td>
                <td >아시아나항공 항공기를 타고 국제선을 이용하는 고객</td>
            </tr>
            <tr>
                <td >면세품 구매 한도금액 및 국내 반입 제한</td>
                <td >내국인 : 해외로 출국하는 내국인 면세품 구입 한도금액 제한 없음.
                    제주도 여행 시에는 구매하실 수 없으며, 해외로부터 입국하시는 고객님께서는 세금면세 한도액이 US$800 까지 이므로 이용시 참고해주시기 바랍니다.
                    (기본 면세한도 US$800 + 주류 2병 + 담배 200개비 + 향수 60ml)
                    외국인 : 출국 시 면세품 구입 한도금액 제한 없음.</td>
            </tr>
            <tr>
                <td >상품 수령</td>
                <td >기내에서 승무원에게 주문확인서를 보여주시면 승무원이 상품을 전달해 드립니다.</td>
            </tr>
            <tr>
                <td >주의사항</td>
                <td >탑승 편명 및 탑승일을 잘못 입력하실 경우 상품을 수령하실 수 없습니다.</td>
            </tr>
        </table>

        <%--주문취소--%>
        <table  class="product-table tab-content return-policy" id="return-policy">
            <tr>
                <td >주문취소/반품</td>
                <td >마이페이지 > 주문내역에서 직접 취소가 가능합니다.
                    세관 신고가 된 주문인 때 온라인 취소가 불가능하니, 고객센터로 문의하시기 바랍니다. (고객센터:080-669-3434)
                    고객센터 상담시간이 아닐 때는 1:1 문의에 남겨주시기 바랍니다.</td>
            </tr>
            <tr>
                <td >교환/반품</td>
                <td >상품 하자로 인한 반품 및 교환을 원하시는 경우에는 고객센터로 연락 부탁드립니다.</td>
            </tr>
        </table>


    </div>



    <script>

        const urlParams = new URLSearchParams(window.location.search);
        const getprodId = urlParams.get('prodId');
        console.log(getprodId)

        const prodId = getprodId.split('_')[1];

        const imgContainer = document.querySelector(".product-images");
        const imageElement = document.createElement('img');
        const url = 'image/' + prodId + '.png';
        imageElement.src = url;

        imgContainer.appendChild(imageElement);
        console.log(url);

        let paramUrl = "/mileage/mileageDetailList?prodId=" + getprodId;

        fetch(paramUrl)
            .then(response => response.json())
            .then(data => {
                const product = data[0];
                console.log(product)
                document.getElementById("main-material").textContent = product.ingredientca; // 주요재료
                document.getElementById("use").textContent = product.use;               // 사용방법
                document.getElementById("stock").textContent = product.stockQty;             // 재고 수량
                document.getElementById("description").textContent = product.detail; // 상품설명
                document.getElementById("proName").textContent = product.prodName;
                document.getElementById("proName2").textContent = product.prodName;
                document.getElementById("proPrice").textContent = product.unitPrice.toLocaleString();
                document.getElementById("totalPrice").textContent = product.unitPrice.toLocaleString();


                // 가격 업데이트
                const proPriceElement = document.getElementById("proPrice");
                proPriceElement.textContent = product.unitPrice.toLocaleString();

                // 가격을 숫자로 변환
                const getPrice = parseFloat(proPriceElement.textContent.replace(/[^0-9.-]+/g, ""));

                // 수량 조절 기능을 fetch 후에 추가
                document.querySelectorAll('.quantity-btn').forEach(button => {
                    button.addEventListener('click', function() {
                        const input = this.parentElement.querySelector('.quantity-input');
                        let currentValue = parseInt(input.value);

                        if (this.textContent === '+') {
                            currentValue += 1;
                        } else if (currentValue > 1) {
                            currentValue -= 1;
                        }
                        input.value = currentValue;

                        // 합계 계산 후 출력
                        const totalPrice = getPrice * currentValue;
                        document.getElementById("totalPrice").textContent = totalPrice.toLocaleString();
                    });
                });
            })
            .catch(err => console.error('error', err));


        document.querySelectorAll('.tab').forEach(tab => {
            tab.addEventListener('click', function() {
                // 모든 탭의 active 클래스를 제거
                document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));

                // 클릭한 탭에 active 클래스를 추가
                tab.classList.add('active');

                // 모든 탭 콘텐츠의 active 클래스를 제거
                document.querySelectorAll('.tab-content').forEach(content => content.classList.remove('active'));

                // 클릭한 탭에 해당하는 콘텐츠에 active 클래스를 추가
                const tabName = tab.getAttribute('data-tab');
                const cleanTabName = tabName.replace(/[^\w\-]/g, '');  // 알파벳, 숫자, -와 _만 남기기
                const tabContent = document.getElementById(cleanTabName);
                if (tabContent) {
                    tabContent.classList.add('active');
                }
            })

        });

        //바로결제
        document.getElementById("goBuy").addEventListener('click',()=>{
            //로그인 기능 추가 예정 회원아니면 return


            const priceText = document.getElementById("proPrice").innerText;
            const price = parseFloat(priceText.replace(/,/g, ''));

            const totalText = document.getElementById("totalPrice").innerText;
            const totalPrice = parseFloat(totalText.replace(/,/g, ''));
            const cnt = (totalPrice/price);
            console.log(totalPrice); //getprodId
            console.log(cnt);


            const payMentUrl = "/mileage/paymentMileage?totalPrice=" + totalPrice + "&prodId=" + getprodId+ "&cnt=" + cnt;

            const popWidth = 800;
            const popHeight = 600;
            const options = `width=${popWidth}px, height=${popHeight}px, top=20, left=20, resizable=no, scrollbars=yes, menubar=no, toolbar=no, location=no, directories=no, status=no`;

            const popupwindow = window.open(payMentUrl, 'PaymentPopup', options);

            if (popupwindow) {
                console.log("결제팝업 오픈");
                popupwindow.opener = window;
            } else {
                alert("팝업 오픈 실패 ㅜ")
            }
        })

    </script>
    </body>
    </html>