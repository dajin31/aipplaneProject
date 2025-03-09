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


        /* MileageVO mileageVO = (MileageVO) session.getAttribute("List<MileageVO>"); // 세션에서 MileageVO 객체 가져오기
        if (mileageVO != null) {
            // mileageVO 사용
            String orderId = mileageVO.getOrder_id(); // getOrder_id() 메서드 호출
            // orderId 사용
        } else {
            // mileageVO가 null인 경우 처리
            out.println("마일리지 정보가 없습니다.");
        } */



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
    </style>

    <!--     MemVO loginMemVo = (MemVo)session.getAttribute("loginMember"); -->

    const arrList = [];


    <script>
        /* $(function(){

            $(document).on('click, ')
        }) */
    </script>

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

    <%-- Main Navigation --%>
    <div class="bg-white border-b">
        <div class="container mx-auto px-4 h-16 flex items-center justify-between">
            <div class="flex items-center gap-8">
                <img src="" alt="Korean Air" width="120" height="40" class="mr-8" />
                <nav class="hidden md:flex items-center gap-8">
                    <button class="hover:text-blue-600 font-medium">예약</button>
                    <button class="hover:text-blue-600 font-medium">여행 준비</button>
                    <button class="hover:text-blue-600 font-medium">스카이패스</button>
                </nav>
            </div>
            <div class="flex items-center gap-4">
                <button class="p-2 hover:bg-gray-100 rounded-full">
                    <i data-lucide="search" class="w-5 h-5"></i>
                </button>
                <a href="<%= request.getContextPath() %>/myPage/mypage.jsp">
                <button class="px-4 py-2 border border-[#00256c] text-[#00256c] rounded-full hover:bg-[#00256c] hover:text-white transition-colors">
                    마이페이지
                </button>
                </a>
            </div>
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
                        <text class="CircularProgressbar-text" x="50" y="40" dy=".3em"><%=userVo.getUser_mileage()%></text>
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
            <div class="border border-gray-300 border-t-0 rounded-b-lg p-6 min-h-[200px] bg-white">
                <%
                    /*
                    [AirVO [pay_code=a003, pay_amount=12345, res_code=44, ptype_code=2, user_id=KTK2,
                    res_date=Thu Mar 06 16:02:59 KST 2025, p_num=7, pass_num=M12345421, reg_num=132121,
                    sear_code=null, flt_code=1020, dpt_date=2023-06-22 00:00:00, arr_date=2023-06-22 00:00:00,
                    dpt_time=2025-02-01 09:32:00, arr_time=2025-02-01 11:00:00, flt_time=150, air_code=338,
                    dpt_apt_code=CJU, arr_apt_code=PVG, air_name=Airbus A330-800, air_class=AIRBUS,
                    to_apt_name=제주국제공항, to_cnt_category=아시아, from_apt_name=상하이 푸둥 국제공항, from_cnt_name=중국,
                    from_cnt_category=아시아, total_price=480588, ticket_price=480588, seat_class=이코노미],
                     AirVO [pay_code=a003, pay_amount=12345, res_code=44, ptype_code=2, user_id=KTK2,
                     res_date=Thu Mar 06 16:02:59 KST 2025, p_num=8, pass_num=M52525555, reg_num=555532,
                     sear_code=null, flt_code=1020, dpt_date=2023-06-22 00:00:00, arr_date=2023-06-22 00:00:00,
                     dpt_time=2025-02-01 09:32:00, arr_time=2025-02-01 11:00:00, flt_time=150, air_code=338,
                     dpt_apt_code=CJU, arr_apt_code=PVG, air_name=Airbus A330-800, air_class=AIRBUS,
                     to_apt_name=제주국제공항, to_cnt_category=아시아, from_apt_name=상하이 푸둥 국제공항, from_cnt_name=중국,
                     from_cnt_category=아시아, total_price=480588, ticket_price=480588, seat_class=이코노미]]
                    */
                    //getAirList : List<AirVO> getAirList
                    for(AirVO vo : getAirList){
                %>

                <a href="<%= request.getContextPath() %>/myPage/mypage_air.jsp?flt_code=<%= vo.getFlt_code() %>">
                    <div style="width:100%;justify-content:space-between;">
                        <div style="float:left;margin:0 20px 0 0;">출발지 <%=vo.getFrom_apt_name()%></div>
                        <div style="float:left;margin:0 20px 0 0;">→ 도착지 <%=vo.getTo_apt_name()%></div>
                        <div style="float:left;margin:0 20px 0 0;">출발일시 <%=vo.getDpt_date()%></div>
                        <div style="float:left;margin:0 0px 0 0;">도착일시 <%=vo.getArr_date()%></div>
                    </div>
                </a>
                <p>flt_code: <%= vo.getFlt_code() %></p>

                <%
                    }
                %>


            </div>
            <!-- 항공권 예약 현황 목록 출력 영역 끝 -->
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
                    <div class="text-xl font-normal text-slate-800"><%=userVo.getMem_code()%></div><%--로그인 등급정보 불러오기--%>
                </div>
            </div>

            <%-- <div class="p-4 bg-white border-slate-200 shadow-sm">
               <div class="mt-auto text-right">
                   <a href="<%= request.getContextPath() %>/member/mypage_milge.jsp" class="text-sm">+더보기</a>
               </div>
               <div class="text-sm font-semibold mb-2">최근 마일리지 현황</div>
               <div class="space-y-2">
                   <div class="flex justify-between text-sm">
                       <span class="text-slate-600"><%=mileageVO.getOrder_id()%></span>
                       <span class="text-green-600">+531</span>
                   </div>
                   <div class="flex justify-between text-sm">
                       <span class="text-slate-600">OZ1085/GMPHND (V/S)</span>
                       <span class="text-green-600">+728</span>
                   </div>
               </div>
           </div> --%>
            <br>
            <div class="flex gap-2 mt-4">
                <a href="<%= request.getContextPath() %>/myPage/mypage_milge.jsp" style="text-align: center;" class="flex-1 bg-[#2d4b88] text-white py-2 px-4 rounded text-sm text-align: center;">나의 마일리지</a>
            </div>
            <div class="flex gap-2 mt-4">
                <button class="flex-1 bg-[#2d4b88] text-white py-2 px-4 rounded text-sm">마일리지샵구매내역</button><%--마일리지 샵으로 연결하기 기능 추가 해야됨--%>
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
                <span><%=userVo.getMem_code()%></span>  <%--회원 현재 등급정보 불러오기--%>
                <span>다음 등급까지</span>
            </div>
            <div class="h-2 bg-slate-200 rounded-full">
                <div class="h-full bg-pink-500 rounded-full" style="width: 33%;"></div>
            </div>
        </div>
    </div>
</div>

