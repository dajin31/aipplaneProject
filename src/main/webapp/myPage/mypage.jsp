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
    </style>



</head>
<body class="min-h-screen bg-gray-50">

<header>
    <%-- Top Utility Bar --%>
    <div class="bg-white border-b text-sm">
        <div class="container mx-auto px-4 h-10 flex items-center justify-end gap-4">
            <button class="flex items-center gap-1 hover:text-blue-600">
                <i data-lucide="gift" class="w-4 h-4"></i>
                이벤트
            </button>
            <button class="flex items-center gap-1 hover:text-blue-600">
                <i data-lucide="help-circle" class="w-4 h-4"></i>
                자주 묻는 질문
            </button>
            <!-- 동기방식 -->
            <form action="/middle/user/userLogOut.do" method="post">
                <button type="submit" class="flex items-center gap-1 hover:text-blue-600">
                    <i data-lucide="log-in" class="w-4 h-4"></i>
                    로그아웃
                </button>
            </form>
        </div>
    </div>

</header>

<div class="container mx-auto p-4">
    <div id="mainArea"  class="flex flex-col md:flex-row gap-4">
        <%-- Left Section - 항공권 예약 현황 --%>
        <div class="w-full md:w-[1000px]">
            <div class="max-w-xs mx-auto mb-8">
                <div class="relative circular-progress-bar">
                    <svg viewBox="0 0 100 100">
                        <circle class="CircularProgressbar-trail" cx="50" cy="50" r="42" fill="none" />
                        <!-- <path class="CircularProgressbar-path" d="M 50, 50 m 0, -42 a 42,42 0 1 1 0,84 a 42,42 0 1 1 0,-84"
                              stroke-dasharray="26.78, 264" /> -->
                        <text class="CircularProgressbar-text" x="50" y="40" dy=".3em" id="myMile"><%=userVo.getUser_mileage()%></text>
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
                    <div class="text-xl font-normal text-slate-800" id="myRank"><%=userVo.getMem_code()%></div><%--로그인 등급정보 불러오기--%>
                </div>
            </div>

            <br>
            <div class="flex gap-2 mt-4">
                <a href="<%= request.getContextPath() %>/myPage/mypage_milge.jsp" style="text-align: center;" class="flex-1 bg-[#2d4b88] text-white py-2 px-4 rounded text-sm text-align: center;">나의 마일리지</a>
            </div>
            <div class="flex gap-2 mt-4">
                <button class="flex-1 bg-[#2d4b88] text-white py-2 px-4 rounded text-sm" id="goMileShop">마일리지샵구매내역</button><%--마일리지 샵으로 연결하기 기능 추가 해야됨--%>
            </div>
            <div class="mt-auto text-right">
                <a href="<%= request.getContextPath() %>/myPage/mypage_pass.jsp" id="move-button" class="text-sm underline"> 비밀번호 변경</a><br>
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
    let isLogin = false;
   let userId =  "<%= userId %>";
   console.log(userId)

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
           window.location.href = "../user/login.jsp"
       }
       if (isLogin) {
           console.log(userId);
           window.location.href='/mileage/goOrdersList?userId=' + userId;
       }
   })
</script>
</html>