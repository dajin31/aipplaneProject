<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>지역과 도시 선택</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        }

        .container {
            display: flex;
            height: 100vh;
            position: relative;
        }

        .header {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            padding: 20px;
            background: white;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            font-size: 20px;
            font-weight: bold;
        }

        .close-btn {
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
        }

        .sidebar {
            width: 250px;
            background: #f8f9fa;
            padding-top: 70px;
            border-right: 1px solid #eee;
        }

        .region-list {
            list-style: none;
        }

        .region-item {
            padding: 15px 20px;
            cursor: pointer;
        }

        .region-item:hover {
            background: #eef1f5;
        }

        .region-item.active {
            background: #eef1f5;
        }

        .main-content {
            flex: 1;
            padding: 70px 20px 20px;
            overflow-y: auto;
        }

        .airport-list {
            list-style: none;
            max-width: 600px;
        }

        .airport-item {
            display: flex;
            align-items: center;
            padding: 12px;
            border-bottom: 1px solid #eee;
            cursor: pointer;
        }

        .airport-item:hover {
            background: #f8f9fa;
        }

        .airport-code {
            font-weight: bold;
            margin-right: 15px;
            min-width: 45px;
        }

        .airport-name {
            color: #333;
            margin-left: 5px;
        }

        .airport-Cntname {
            color: #333;

        }

        .main-region-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }
    </style>
</head>
<body>
<div class="container">
    <header class="header">
        <h1>지역과 도시 선택</h1>
        <button class="close-btn">&times;</button>
    </header>

    <nav class="sidebar">
        <ul class="region-list" id="regionList">

            <li class="region-item tab active" >
               전체
            </li>
            <li class="region-item tab">
               아시아
            </li>
            <li class="region-item tab">
                아메리카
            </li>
            <li class="region-item tab">
                유럽
            </li>

        </ul>
    </nav>

    <main class="main-content">
        <h2 class="main-region-title">Soon~항공 취항지</h2>
        <ul class="airport-list" id="ulList">

        </ul>
    </main>
</div>

<script>

    const urlParam =  new URLSearchParams(window.location.search);
    const type = urlParam.get('type');
    console.log(type)

    let selectedAirport = null;

    // Close button functionality
    document.querySelector('.close-btn').addEventListener('click', function() {
        if (window.opener && selectedAirport) {
            window.opener.postMessage(selectedAirport, '*'); // 부모 창으로 값 전달
        }
        window.close(); // 팝업 창 닫기
    });




    // 나라 리스트 가져오기
    fetch("/reservation/selectCountryList")
        .then(response=>response.json())
        .then(list => {
            const elementById = document.getElementById("ulList");
            elementById.innerHTML = '';
            list.forEach(item => {
                const elementById = document.getElementById("ulList");
                console.log(item);

                const liElement = document.createElement('li');
                liElement.classList.add('airport-item');

                const span1Element = document.createElement('span');
                span1Element.classList.add('airport-code');
                span1Element.textContent = item.aptCode;

                const span2Element = document.createElement('span');
                span2Element.classList.add('airport-Cntname');
                span2Element.textContent = item.cntName;

                const span3Element = document.createElement('span');
                span3Element.classList.add('airport-name');
                span3Element.textContent = item.aptName;

                liElement.appendChild(span1Element);
                liElement.appendChild(span2Element);
                liElement.appendChild(span3Element);

                elementById.appendChild(liElement);
                })
            }).catch(err=>console.error(err))

            document.querySelectorAll('.tab').forEach(tab => {
                tab.addEventListener('click', () => {
                    document.querySelector('.tab.active').classList.remove('active');
                    tab.classList.add('active');

                    const category = tab.textContent.trim();

                    let url = '';

                    switch (category) {
                        case '전체':
                            url = '/reservation/selectCountryList';
                            break;
                        default:
                            url = '/reservation/categoryList?cntCategory=' + category;
                            break;
                    }

                    fetch(url)
                        .then(response => response.json())
                        .then(list => {
                            const elementById = document.getElementById("ulList");
                            elementById.innerHTML = '';
                            list.forEach(item => {
                                const elementById = document.getElementById("ulList");


                                const liElement = document.createElement('li');
                                liElement.classList.add('airport-item');

                                const span1Element = document.createElement('span');
                                span1Element.classList.add('airport-code');
                                span1Element.textContent = item.aptCode;

                                const span2Element = document.createElement('span');
                                span2Element.classList.add('airport-Cntname');
                                span2Element.textContent = item.cntName;

                                const span3Element = document.createElement('span');
                                span3Element.classList.add('airport-name');
                                span3Element.textContent = item.aptName;

                                liElement.appendChild(span1Element);
                                liElement.appendChild(span2Element);
                                liElement.appendChild(span3Element);

                                elementById.appendChild(liElement);

                            })
                        })
                    document.getElementById('ulList').addEventListener('click', function(event) {
                        if (event.target.classList.contains('airport-item')) {
                            let item = event.target;
                            selectedAirport = {
                                aptCode: item.querySelector('.airport-code').textContent,
                                cntName: item.querySelector('.airport-Cntname').textContent,
                                aptName: item.querySelector('.airport-name').textContent,
                                type: type
                            };
                            console.log(selectedAirport);

                            if (window.opener) {
                                window.opener.postMessage(selectedAirport, { name: 'countryListPopup' });
                            }

                            window.close();
                        }
                    });

                })

        })



</script>
</body>
</html>