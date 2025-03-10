<%@page import="java.util.List"%>
<%@page import="com.example.demo.vo.AirVO"%>
<%@ page import="com.example.demo.vo.UserVO" %>
<%@ page import="com.example.demo.vo.MileageVO" %>
<%@ page import="com.example.demo.service.AirService" %>
<%@ page import="com.example.demo.service.AirServicelmp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/lucide@latest/dist/umd/lucide.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/react-circular-progressbar@2.1.0/dist/styles.css">

    <%
        UserVO userVo = (UserVO)session.getAttribute("loginUser");/*로그인 정보 불러오기*/

        if(userVo==null){//로그인 안되었다면
            response.sendRedirect(request.getContextPath() + "/user/login.jsp");

            return;
        }

        //예약정보 불러오기 시작
        AirService airService = AirServicelmp.getInstance();

        //user_id, flt_code,
        AirVO airVO = new AirVO();
        //로그인 한 회원의 아이디(동적으로 바뀜)
        System.out.println("회원 아이디" + userVo.getUserId());
        String userId = userVo.getUserId();
        airVO.setUser_id(userId);
        System.out.println("유저 아이디 : " + airVO.getUser_id());

        List<AirVO> getAirList = airService.getAirList(airVO);
        System.out.println(getAirList + "???");

    %>



    <style>
        #mainArea {
            display: flex;
            justify-content: center;
        }

        .circular-progress-bar {
            width: 200px;
            height: 200px;
            margin: 0 auto;
        }

        .circular-progress-bar svg {
            width: 100%;
            height: 100%;
        }

        .circular-progress-bar .CircularProgressbar-path {
            stroke: #ec4899;
            stroke-width: 8;
            fill: white;
        }

        .circular-progress-bar .CircularProgressbar-trail {
            stroke: #e2e8f0;
            stroke-width: 8;
        }

        .circular-progress-bar .CircularProgressbar-text {
            fill: #0f172a;
            font-size: 24px;
            dominant-baseline: middle;
            text-anchor: middle;
        }
        table {
            width: 100%; /* 테이블 너비를 100%로 설정 */
            border-collapse: collapse; /* 테두리 병합 */
            border-spacing: 0; /* 테두리 간격 제거 */
        }

        th, td {
            padding: 8px 12px; /* 셀 내부 패딩 추가 */
            text-align: left; /* 텍스트 왼쪽 정렬 */
            border-bottom: 1px solid #ddd; /* 셀 아래쪽 테두리 추가 */
        }

        th {
            background-color: #f2f2f2; /* 헤더 배경색 설정 */
        }

        /* 홀수 행 배경색 설정 */
        tbody tr:nth-child(odd) {
            background-color: #f9f9f9;
        }

        header {
            background-color: #ffffff;
            padding: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 100;
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body class="min-h-screen bg-gray-50">

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
                        <li><a href="reservation.jsp">예약 취소</a></li>
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
                        <li><a href="/reservationreservation.jsp">예약 취소</a></li>
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
            <a href="<%=request.getContextPath()%>/user/logout.do" class="logout-btn">로그아웃</a>
            <a href="/myPage/mypage.jsp" class="mypage-btn">마이페이지</a>
            <span class="welcome-msg">${sessionScope.loginUser.userName}님 환영합니다.</span>
        </div>
    </div>
</header>

<div class="container mx-auto p-4">
    <div id="mainArea"  class="flex flex-col md:flex-row gap-4" style="margin-top: 150px">
        <%-- Left Section - 항공권 예약 현황 --%>
        <div class="w-full md:w-[1000px]">
            <div class="max-w-xs mx-auto mb-8">
                <div class="relative circular-progress-bar">
                    <svg viewBox="0 0 100 100">
                        <circle class="CircularProgressbar-trail" cx="50" cy="50" r="42" fill="none" />
                        <!-- <path class="CircularProgressbar-path" d="M 50, 50 m 0, -42 a 42,42 0 1 1 0,84 a 42,42 0 1 1 0,-84"
                              stroke-dasharray="26.78, 264" /> -->
                        <text class="CircularProgressbar-text" x="50" y="40" dy=".3em" id="myMile"><%=userVo.getUserMileage()%></text>
                    </svg>
                    <div class="absolute inset-0 flex items-center justify-center mt-12 text-sm text-slate-600">
                        잔여 마일리지
                    </div>
                </div>
            </div>
            <div class="bg-slate-700 text-white p-4 rounded-t-lg flex justify-between items-center">
                <a href="<%= request.getContextPath() %>/myPage/air_cancel.jsp" class="font-medium">항공권 예약 현황</a>
                <i data-lucide="file-text" class="w-5 h-5"></i>
            </div>
            <!-- 항공권 예약 현황 목록 출력 영역 시작 -->
            <div class="border border-gray-300 border-t-0 rounded-b-lg p-6 min-h-[200px] bg-white" id="reservaionList">

            </div>

        </div>

        <%-- Right Section --%>
        <div class="md:w-[300px] bg-[#e8f1ff] p-6 flex flex-col gap-4 rounded-lg">
            <div class="space-y-4">
                <div>
                    <h3 class="font-medium">회원 명</h3>
                    <div class="text-xl font-semibold"><%=userVo.getUserName()%>님</div><%--로그인 이름정보 불러오기--%>

                </div>

                <div>
                    <h3 class="font-medium">회원 등급</h3>
                    <div class="text-xl font-normal text-slate-800" id="myRank"><%=userVo.getMemCode()%></div><%--로그인 등급정보 불러오기--%>
                </div>
            </div>

            <br>
            <div class="flex gap-2 mt-4">
                <button style="text-align: center;" class="flex-1 bg-[#2d4b88] text-white py-2 px-4 rounded text-sm text-align: center;" id="goMyMile">나의 마일리지</button>
            </div>
            <div class="flex gap-2 mt-4">
                <button class="flex-1 bg-[#2d4b88] text-white py-2 px-4 rounded text-sm" id="goMileShop">마일리지샵구매내역</button><%--마일리지 샵으로 연결하기 기능 추가 해야됨--%>
            </div>
            <div class="mt-auto text-right">
                <button  id="moveButton" class="text-sm underline"> 비밀번호 변경</button><br>
                <a href="<%= request.getContextPath() %>/myPage/mypage_change.jsp" id="move-button1" class="text-sm underline"> 회원정보 수정</a>
            </div>
        </div>
    </div>
</div>

<div id="bar" class="container mx-auto p-4">
    <div class="p-6 bg-white border-slate-200 shadow-sm mb-4">
        <div class="mb-4">
            <div class="flex justify-between text-sm mb-2 text-slate-600">
                <span id="memCode"></span>  <%--회원 현재 등급정보 불러오기--%>
                <span>다음 등급까지</span>
            </div>
            <div class="h-2 bg-slate-200 rounded-full">
                <div class="h-full bg-pink-500 rounded-full" style="width: 33%;"></div>
            </div>
        </div>
    </div>
</div>

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

    let isLogin = false;
   let userId =  "<%= userId %>";
   console.log("userId",userId)

    if (userId) {
        isLogin = true;
    }

   if (userId) {
       let url = '/myPage/selectUserMe?userId=' + userId;
       fetch(url)
           .then(response => response.json())
           .then(data => {
               console.log("으엥",data)
               document.getElementById("myMile").textContent = data.user_mileage.toLocaleString();

               document.getElementById("myRank").textContent = data.mem_code;

               document.getElementById("memCode").textContent = data.mem_code;

               if (data) {
                   let dataUrl = "/myPage/selectReservation?userId=" + userId;
                   fetch(dataUrl)
                       .then(response => response.json())
                       .then(data => {
                           console.log(data);
                           createReservationTable(data);

                       })
                       .catch(err => console.error(err));
               }

               if (data) {
                   let detailUrl = "/myPage/selectReservationDetail?userId=" + userId;
                   fetch(detailUrl)
                       .then(response => response.json())
                       .then(data => {
                           console.log(data);

                       })
                       .catch(err => console.error(err));
               }
           })
           .catch(err => console.error(err));
   }

   function createReservationTable(reservationData) {
       let reservaionListDiv = document.getElementById("reservaionList");
       if (!reservaionListDiv) {
           console.error("#reservaionList 요소를 찾을 수 없습니다.");
           return;
       }

       // 테이블 요소 생성
       let table = document.createElement("table");
       let thead = document.createElement("thead");
       let tbody = document.createElement("tbody");

       // 헤더 생성
       let headerRow = document.createElement("tr");
       let headers = ["예약 코드", "사용자 ID", "출발 국가", "도착 국가", "출발지", "도착지", "티켓 가격", "예약 날짜" ];
       headers.forEach(headerText => {
           let th = document.createElement("th");
           th.textContent = headerText;
           headerRow.appendChild(th);
       });
       thead.appendChild(headerRow);
       table.appendChild(thead);


       if (reservationData && reservationData.length > 0) {
           reservationData.forEach(item => {
               let row = document.createElement("tr");

               console.log(item.ticketPrice)
               let resCodeCell = document.createElement("td");
               resCodeCell.textContent = item.resCode.toLocaleString();
               row.appendChild(resCodeCell);

               let userIdCell = document.createElement("td");
               userIdCell.textContent = item.userId;
               row.appendChild(userIdCell);

               let startCountryCell = document.createElement("td");
               startCountryCell.textContent = item.startCountry;
               row.appendChild(startCountryCell);

               let endCountryCell = document.createElement("td");
               endCountryCell.textContent = item.endCountry;
               row.appendChild(endCountryCell);


               let dptCntNameCell = document.createElement("td");
               dptCntNameCell.textContent = item.dptCntName;
               row.appendChild(dptCntNameCell);

               let arrCntNameCell = document.createElement("td");
               arrCntNameCell.textContent = item.arrCntName;
               row.appendChild(arrCntNameCell);

               let ticketPriceCell = document.createElement("td");
               ticketPriceCell.textContent = item.ticketPrice.toLocaleString();
               row.appendChild(ticketPriceCell);

               let resDateCell = document.createElement("td");
               resDateCell.textContent = item.resDate ? item.resDate.substring(0, 10) : "";
               row.appendChild(resDateCell);

               // let detailButtonCell = document.createElement("td");
               // let detailButton = document.createElement("button");
               // detailButton.textContent = "상세 보기";
               // detailButton.classList.add("bg-blue-500", "hover:bg-blue-700", "text-white", "font-bold", "py-2", "px-4", "rounded"); // Tailwind 클래스 추가
               // detailButton.addEventListener("click", () => {
               //     // 상세 정보 보기 로직 추가
               //     console.log("상세 보기 클릭됨 - 예약 코드:", item.resCode);
               //     // 여기에 상세 정보 보기 기능을 구현해야 합니다.
               // });
               // detailButtonCell.classList.add("p-2", "text-center"); // Tailwind 클래스 추가
               // detailButtonCell.appendChild(detailButton);
               // row.appendChild(detailButtonCell);

               tbody.appendChild(row);
           });
       }
       table.appendChild(tbody);
       reservaionListDiv.innerHTML = "";//기존에 있던 내용들을 비워줍니다.
       reservaionListDiv.appendChild(table); // 테이블을 div에 추가
   }

   document.getElementById("goMileShop").addEventListener("click",()=>{
       if (!isLogin) {
           // alert("로그인하세요")
           // return;
           window.location.href = "/login/login.jsp"
       }
       if (isLogin) {
           console.log(userId);
           window.location.href='/mileage/goOrdersList?userId=' + userId;
       }
   })

    document.getElementById("moveButton").addEventListener("click", () => {
        window.location.href =  "/myPage/mypage_pass.jsp?userId=" + userId;
    });

   document.getElementById("goMyMile").addEventListener("click",()=>{
       window.location.href = "/myPage/mypage_milge.jsp?userId=" + userId;
   })
</script>
</html>