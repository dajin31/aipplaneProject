<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>출발지 검색</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
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

        .search-input {
            width: 100%;
            padding: 12px;
            border: none;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
            margin-bottom: 20px;
            outline: none;
        }

        .route-tags {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-bottom: 30px;
        }

        .route-tag {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            cursor: pointer;
        }

        .route-tag:hover {
            background-color: #f5f5f5;
        }

        .tag-close {
            background: none;
            border: none;
            font-size: 18px;
            cursor: pointer;
            color: #666;
        }

        .view-all {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #000;
            font-size: 16px;
        }

        .view-all::before {
            content: "📍";
            margin-right: 8px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>출발지 검색</h1>
        <button class="close-btn">&times;</button>
    </div>

    <input type="text" class="search-input" placeholder="도시, 공항" />

    <div class="route-tags">
        <div class="route-tag">
            <span>NRT 도쿄/나리타 > SEL 서울/모든 공항</span>
            <button class="tag-close">&times;</button>
        </div>
        <div class="route-tag">
            <span>SEL 서울/모든 공항 > NRT 도쿄/나리타</span>
            <button class="tag-close">&times;</button>
        </div>
    </div>

    <a href="#" class="view-all" id="countryList">모든 지역 보기</a>
</div>

<script>

    const urlParam =  new URLSearchParams(window.location.search);
    const type = urlParam.get('type');
    console.log(type)

    // Close button functionality
    document.querySelector('.close-btn').addEventListener('click', function() {
        // Add your close logic here
    });

    // Tag close button functionality
    document.querySelectorAll('.tag-close').forEach(button => {
        button.addEventListener('click', function(e) {
            e.stopPropagation();
            this.closest('.route-tag').remove();
        });
    });

    // Route tag click functionality
    document.querySelectorAll('.route-tag').forEach(tag => {
        tag.addEventListener('click', function() {
            // Add your route selection logic here
        });
    });

    document.getElementById("countryList").addEventListener('click',()=>{
        const url = '/reservation/countryListPopup.jsp?type=' + type
        window.location.href = url;
    })


</script>
</body>
</html>