<%@ page import="com.example.demo.vo.UserVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.service.UserServiceImpl" %>
<%@ page import="com.example.demo.service.UserService" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest/dist/umd/lucide.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/react-circular-progressbar@2.1.0/dist/styles.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

    <%
        UserVO userVo = (UserVO)session.getAttribute("loginUser");/*로그인 정보 불러오기*/

        if(userVo==null){//로그인 안되었다면
            response.sendRedirect("/mainPage/mainPage.jsp");

            return;
        }

        UserService service = UserServiceImpl.getInstance();
        UserVO userInfo = service.getmyUser(userVo.getUserId());
    %>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Malgun Gothic', sans-serif;
        }

        body {
            padding: 20px;
            color: #333;
        }

        h1, h2 {
            font-weight: bold;
            margin-bottom: 20px;
        }

        .mileage-container {
            display: flex;
            gap: 20px;
            margin-bottom: 40px;
        }

        .mileage-box {
            background-color: #f8f9fa;
            border: 1px solid #eee;
            border-radius: 10px;
            padding: 20px;
            flex: 1;
        }

        .mileage-box.primary {
            background-color: #f0f8ff;
        }

        .mileage-label {
            font-size: 14px;
            color: #666;
            margin-bottom: 10px;
        }

        .mileage-amount {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        /* #search{
        margin-left : 20%;
        }  */

        .search-container {
            background-color: #f5f5f5;
            border-radius: 4px;
            padding: 30px;
            margin-bottom: 30px;

        }

        .search-row {
            display: flex;
            margin-bottom: 20px;
            align-items: center;
            margin-left : 30%;
        }

        .search-label {
            width: 100px;
            font-weight: bold;
        }

        .period-buttons {
            display: flex;
            margin-top: 10px;
        }

        .period-button {
            flex: 1;
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
            background-color: white;
            cursor: pointer;
        }

        .period-button.active {
            background-color: #666;
            color: white;
        }

        .period-button:first-child {
            border-radius: 4px 0 0 4px;
        }

        .period-button:last-child {
            border-radius: 0 4px 4px 0;
        }

        .date-range {
            display: flex;
            align-items: center;
            margin-top: 15px;
            gap: 10px;
        }

        .date-input {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 180px;
            display: flex;
            align-items: center;
            background-color: white;
        }

        .date-input input {
            border: none;
            outline: none;
            width: 100%;
        }

        .calendar-icon {
            margin-left: auto;
            color: #666;
        }

        .search-button {
            background-color: #2d4b88;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 30px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 15px;
        }

        .search-button-container {
            display: flex;
            justify-content: flex-end;
        }

        .result-period {
            margin-top: 20px;
            font-size: 16px;
            color: #666;
        }

        .highlight {
            font-weight: bold;
            color: #333;
        }


        .divider {
            height: 1px;
            background-color: #eee;
            margin: 20px 0;
            border-bottom: 1px solid #ddd

        }
        .divider-var{
            padding-left: 350px;
            display: flex;
            border-bottom: 1px solid #ddd;
        }
        .divider-cell{
            flex: 1; /* 각 셀이 동일한 너비를 가지도록 설정 */
            padding: 10px; /* 셀 내부 여백 설정 */

        }

        .no-results {
            text-align: center;
            padding: 40px 0;
            color: #999;
        }

        .usage-card {
            border: 1px solid #eee;
            border-radius: 10px;
            padding: 25px;
            flex: 0.5;
            display: flex;
            align-items: center;
            position: relative;
        }

        .usage-content {
            flex: 1;
        }

        .usage-title {
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 16px;
            text-align: left;
        }

        .usage-description {
            color: #666;
            font-size: 14px;
            text-align: left;
        }

        .arrow {
            position: absolute;
            font-size: 20px;
        }

        #tle{
            margin-left : 40%;
        }
        .result-container {
            display: flex;
            border-bottom: 1px solid #ddd;
        }

        .result-cell {
            flex: 1; /* 각 셀이 동일한 너비를 가지도록 설정 */
            padding: 10px; /* 셀 내부 여백 설정 */
            color: black;
        }


        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo img {
            height: 100px;
            margin-left: 20px;
        }

        .nav {
            margin-left: 20px;
        }

        .nav-list {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: space-around; /* 메뉴 항목 균등 배치 */
            width: 100%;
        }

        .nav-item {
            position: relative;
            flex-grow: 1;
            margin: 0 100px; /* 좌우 여백 추가 */
        }

        .nav-item a {
            text-decoration: none;
            color: #000000;
            padding: 5px 10px;
            font-size: 20px; /* 글씨 크기 조절 */
            font-weight: bold; /* 글씨 두께 조절 */
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #fff;
            list-style: none;
            padding: 0;
            margin: 0;
            border: 1px solid #ffffff;
            z-index: 1;
            width: 100%;
        }

        .nav-item:hover .dropdown-menu {
            display: block;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
            top: calc(100% + 5px); /* 드롭다운 메뉴 위치 조정 */
            min-width: 150px; /* 드롭다운 메뉴 최소 너비 설정 */
            left: 50%; /* nav-item 중앙에 배치 */
            transform: translateX(-50%); /* 중앙 정렬 */
        }

        .dropdown-menu li a {
            display: block;
            padding: 5px 10px;
            text-decoration: none;
            color: #333;
            font-size: 16px; /* dropdown-menu 글씨 크기 */
            font-weight: normal; /* dropdown-menu 글씨 두께 */
            text-align: center;
        }

        .dropdown-menu li a:hover {
            background-color: #f0f0f0;
        }
        .auth {
            display: flex;
            text-align: center;
            margin-right: 50px;
        }

        .login-btn {
            background-color: #fff; /* 로그인 버튼 배경색 */
            color: #007bff; /* 로그인 버튼 글자색 */
            padding: 10px 20px; /* 로그인 버튼 내부 여백 */
            border: none; /* 로그인 버튼 테두리 제거 */
            border-radius: 5px; /* 로그인 버튼 모서리 둥글게 */
            font-size: 16px; /* dropdown-menu 글씨 크기 */
            font-weight: bold; /* dropdown-menu 글씨 두께 */
            text-decoration: none;
            margin-left: 10px;
        }

        .join-btn {
            background-color: #fff; /* 로그인 버튼 배경색 */
            color: #007bff; /* 로그인 버튼 글자색 */
            padding: 10px 20px; /* 회원가입 버튼 내부 여백 */
            border: none; /* 회원가입 버튼 테두리 제거 */
            border-radius: 5px; /* 회원가입 버튼 모서리 둥글게 */
            font-size: 16px; /* dropdown-menu 글씨 크기 */
            font-weight: bold; /* dropdown-menu 글씨 두께 */
            text-decoration: none;

        }

        .login-btn:hover {
            background-color: #007bff; /* 마우스 호버 시 로그인 버튼 배경색 */
            color: #fff; /* 마우스 호버 시 로그인 버튼 글자색 */
        }

        .join-btn:hover {
            background-color: #007bff; /* 마우스 호버 시 회원가입 버튼 배경색 */
            color: #fff; /* 마우스 호버 시 회원가입 버튼 글자색 */
        }

        /* 여기서부터는 로그인 후 헤더 */
        .user-info {
            display: flex;
            align-items: center;
            margin-right: 50px;
        }

        .logout-btn, .mypage-btn {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            margin-right: 10px;
        }

        .welcome-msg {
            margin-left: 20px;
        }

        .header-after-login.hidden {
            display: none;
        }


    </style>


</head>
<body id="mileage-point" class="min-h-screen bg-gray-50">
<header>
    <div class="header-container header-before-login">
        <div class="logo">
            <a href="/mainPage/mainPage.jsp"><img src="/images/2.png" alt="로고"></a>
        </div>
        <nav class="nav">
            <ul class="nav-list">
                <li class="nav-item">
                    <a href="/reservation/receiptPage.jsp">예약</a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath()%>/reservation/reservation-airport.jsp">항공권 예매</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#">마일리지</a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath()%>/mileage/mileageShop.jsp">마일리지샵</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/member/list.do">공지사항</a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath()%>/member/list.do">공지사항</a></li>
                        <li><a href="<%=request.getContextPath()%>/member/list1_1.do">1:1 문의</a></li>
                        <li><a href="<%=request.getContextPath()%>/FAQBoard">FAQ</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="auth">
            <a href="/login/userJoin.jsp" class="join-btn">회원가입</a>
            <a href="/login/login.jsp" class="login-btn">로그인</a>
        </div>
    </div>
    <div class="header-container header-after-login hidden">
        <div class="logo">
            <a href="/mainPage/mainPage.jsp"><img src="/images/2.png" alt="로고"></a>
        </div>
        <nav class="nav">
            <ul class="nav-list">
                <li class="nav-item">
                    <a href="/reservation/receiptPage.jsp">예약</a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath()%>/reservation/reservation-airport.jsp">항공권 예매</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="/mileage/mileageShop.jsp">마일리지</a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath()%>/mileage/mileageShop.jsp">마일리지샵</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/member/list.do">공지사항</a>
                    <ul class="dropdown-menu">
                        <li><a href="<%=request.getContextPath()%>/member/list.do">공지사항</a></li>
                        <li><a href="<%=request.getContextPath()%>/member/list1_1.do">1:1 문의</a></li>
                        <li><a href="<%=request.getContextPath()%>/FAQBoard">FAQ</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="user-info">
            <a href="<%=request.getContextPath()%>/logout.do" class="logout-btn">로그아웃</a>
            <a href="/myPage/mypage.jsp" class="mypage-btn">마이페이지</a>
            <span class="welcome-msg">${sessionScope.loginUser.userName}님 환영합니다.</span>
        </div>
    </div>
</header>

    <%-- 마일리지 --%>
    <br>
    <h1 style="font-size: 2.5em;" >나의 마일리지</h1>
    <br>
    <div class="mileage-container">
        <div class="mileage-box primary">
            <div class="mileage-label">현재 보유 마일리지</div>
            <div class="mileage-amount"><%=userInfo.getUser_mileage()%> 마일리지</div>
            <div class="mileage-links">

            </div>
        </div>

        <div class="mileage-box">
            <div class="mileage-label">총 누적 마일리지</div>
            <div class="mileage-amount"><%=userInfo.getUser_totalmileage()%>마일리지</div>
        </div>
    </div>

    <h2 style="font-size: 2.5em;">상세내역</h2>
    <br>
    </div>
    <%-- 상세내역 --%>

    <div  style="width: 100%" class="search-container" id=search>
        <div class="search-row">
            <div class="search-label">구분</div>
            <div class="radio-group">
                <label>
                    <input type="radio" id="allck" name= gubun value="0"> 전체
                </label>
                <label>
                    <input type="radio" id="earnck" name= gubun> 적립
                </label>
                <label>
                    <input type="radio" id="useck" name= gubun value="2"> 사용
                </label>
            </div>
        </div>

        <div class="search-row">
            <div class="search-label">조회기간</div>
            <div>

                <div class="period-buttons">
                    <button class="period-button">1개월</button>
                    <button class="period-button">3개월</button>
                    <button class="period-button">6개월</button>
                    <button class="period-button">1년</button>
                    <button class="period-button active">직접 선택</button>
                </div>

                <div class="date-range">
                    <div class="date-input">
                        <input type="text" placeholder="시작일 선택" class="sdt">
                        <span class="calendar-icon">📅</span>
                    </div>
                    <span>부터 ~</span>
                    <div class="date-input">
                        <input type="text" placeholder="종료일 선택" class="edt">
                        <span class="calendar-icon">📅</span>
                    </div>
                    <span>까지</span>
                </div>

                <div class="search-button-container">
                    <button class="search-button">조회하기</button>
                </div>
            </div>
        </div>
    </div>

    <div class="result-period">
        <span class="highlight" id="startDateDisplay"></span>부터 <span class="highlight" id="endDateDisplay"></span>까지 조회 결과
    </div>

    <div class="divider"></div>
    <div class=divider-var>
        <div class="divider-cell">일자</div>
        <div class="divider-cell">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 종류</div>
        <div class="divider-cell">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;포인트</div>
    </div>
    <div style="font-size: 1.5em;" color: black; class="no-results">
        조회된 내용이 없습니다.
    </div>

    <div class="divider"></div>


    <button>
        <div style="width: 120%" class="usage-card">
            <div class="usage-content">

                <div class="usage-title">마일리지 몰</div>
                <div class="usage-description">다양한 상품과 제휴서비스를 마일리지로 이용해 보세요!</div>

                <button  style="font-size: 2.5em;" class="arrow" id="goMileageShop">›</button>
            </div>
        </div>
        <br><br>
    </button>

</body>
<script>

    $(document).ready(function() {
        // 세션에서 로그인 상태 확인
        const isLoggedIn = ${sessionScope.loginUser != null};
        const userName = "${sessionScope.loginUser.userName}";

        if (isLoggedIn) {
            $(".header-before-login").hide();
            $(".header-after-login").removeClass("hidden");
            $(".welcome-msg").text(userName + "님 환영합니다.");
        } else {
            $(".header-before-login").show();
            $(".header-after-login").addClass("hidden");
        }

        // 로그아웃 후 페이지 리로드
        $(".logout-btn").click(function(event) {
            event.preventDefault(); // 기본 링크 동작 방지
            if (confirm("로그아웃 하시겠습니까?")) {
                location.href = "<%=request.getContextPath()%>/user/logout.do";
            }
        });
    });
    const urlParams = new URLSearchParams(window.location.search);

    const userId = urlParams.get('userId');

    document.getElementById("goMileageShop").addEventListener("click",()=>{
        window.location.href = "../mileage/mileageShop.jsp?userId=" + userId;
    })


    const toTalMileage = <%=userInfo.getUser_totalmileage()%>;
    const realToTalMileage =<%=userInfo.getUser_totalmileage()%>;
    console.log("?",toTalMileage)

    $(function() {
        //라디오 버튼 변경
        $('input[name="gubun"]').on('change', function(){		// name 속성이 gubun 인 요소 change(버튼이 선택될 때마다 실행)
            var gbValue = $(this).val();   // 해당 값을 gbValue에 저장
            console.log("gbValue : ", gbValue);
            //sendAjaxRequest(gbValue, $('.sdt').val(), $('.edt').val());
        });
        //조회 버튼 클릭
        $('.search-button').on('click', function() {
            var startDate = $('.sdt').val();
            var endDate = $('.edt').val();
            var gbValue = $('input[name="gubun"]:checked').val(); // 선택된 구분 값 가져오기
            sendAjaxRequest(gbValue, startDate, endDate); // 조회 기간 정보 추가
        });

        function sendAjaxRequest(gbValue, startDate, endDate) {
            $.ajax({
                url:`<%= request.getContextPath() %>/user/mileagehistory.do`,
                type:'post',
                data: JSON.stringify({"gu_val":gbValue, "startDate": startDate, "endDate": endDate}),
                contentType : 'application/json;charset=utf-8',
                success: function(data){
                    // 데이터 처리 및 화면 표시
                    console.log("data", data)
                    var resultHtml = "";
// 	                if (data && data.length > 0) {
// 	                    $.each(data, function(index, item) {
// 	                        resultHtml += "<div>" + item.id + " - " + item.name + " - " + item.gubun + "</div>";
// 	                    });

                    if (data && data.length > 0) { // 배열인지 확인
                        $.each(data, function(index, item) { // 배열 순회
                            resultHtml +=  "<div class='result-container'>" +
                                "<span class='result-cell'>" + item.order_date + "</span>" +
                                "<span class='result-cell'>" + item.prod_id + "</span>" +
                                "<span class='result-cell'>" + item.order_amt + "</span>" +
                                "</div>";

                            $("#startDateDisplay").text(startDate);
                            $("#endDateDisplay").text(endDate);
                        });
                    } else {
                        resultHtml = "조회된 내용이 없습니다.";
                    }
                    $(".no-results").html(resultHtml);
                },
                error: function(xhr) {
                    $(".no-results").text("데이터 조회 실패");
                },
                dataType : "json"
            });

        }





        // 날짜 형식 설정 페이지
        $(".date-input input").datepicker({
            dateFormat: 'yy-mm-dd'
        });


        // 기간 버튼 클릭 이벤트
        const periodButtons = document.querySelectorAll('.period-button');

        function setPeriodDates(period) {
            let currentDate = new Date();
            /* const endDate = new Date(); */
            let startDate = new Date();

            let year = currentDate.getFullYear();
            let month = String(currentDate.getMonth() + 1).padStart(2, '0');
            let day = String(currentDate.getDate()).padStart(2, '0');

            var formattedDate = year + '-' + month + '-' + day;

            $('.date-input input.edt').val(formattedDate);

            switch (period) {
                case '1개월':
                    var sDate = year + '-' + (month - 1) + '-' + day;
                    if((month - 1)<=0){sDate = (year - 1) + '-' + (month -1 + 12) + '-' +day;

                    }
                    $('.date-input input.sdt').val(sDate);
                    /* startDate.setMonth(endDate.getMonth() - 1); */

                    break;
                case '3개월':
                    var sDate = year + '-' + (month - 3) + '-' + day;
                    if((month - 3)<=0){sDate = (year - 1) + '-' + (month -3 + 12) + '-' +day;

                    }
                    $('.date-input input.sdt').val(sDate);
                    /* startDate.setMonth(endDate.getMonth() - 3); */


                    break;
                case '6개월':
                    var sDate = year + '-' + (month - 6) + '-' + day;
                    if((month - 6)<=0){sDate = (year - 1) + '-' + (month -6 + 12) + '-' +day;

                    }
                    $('.date-input input.sdt').val(sDate);
                    /* startDate.setMonth(endDate.getMonth() - 6); */
                    break;
                case '1년':
                    var sDate = (year -1) + '-' + month + '-' + day;
                    $('.date-input input.sdt').val(sDate);
                    /* startDate.setFullYear(endDate.getFullYear() - 1); */


                    break;
            }

            /* $("#startDate").datepicker("setDate", startDate);
            $("#endDate").datepicker("setDate", endDate); */
        }
        $(".period-button").on("click",function(){
            $(".period-button").removeClass('active');
            $(this).toggleClass('active');
            let period = $(this).html();

            setPeriodDates(period);
        })

        /*             	periodButtons.forEach(button => {
                            button.addEventListener('click', function() {
                                periodButtons.forEach(btn => btn.classList.remove('active'));
                                this.classList.toggle('active');

                                const period = this.dataset.period;
                                if (period !== '직접 선택') {
                                    setPeriodDates(period);
                                }
                            });
                        }); */

        // 달력 아이콘 클릭 이벤트
        document.querySelectorAll('.calendar-icon').forEach(icon => {
            icon.addEventListener('click', function() {
                const input = this.previousElementSibling;
                input.focus(); // input 요소에 포커스를 주어 달력 표시
            });
        });

    });

</script>

</html>