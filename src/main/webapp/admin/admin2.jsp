<%--<%@ page import="com.example.demo.vo.UserVO" %>--%>
<%--<%@ page import="com.example.demo.vo.AdminPageVO" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>회원 관리</title>--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">--%>
<%--    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">--%>
<%--    <script src="<%=request.getContextPath()%>/js/jquery-3.7.1.js"></script>--%>
<%--    <script src="<%=request.getContextPath()%>/js/jquery.serializejson.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <h1>회원 관리</h1>--%>

<%--    <form action="<%=request.getContextPath()%>/AdminUser" method="get" id="searchForm">--%>
<%--        <select name="stype" id="stype">--%>
<%--            <option value="all" ${stype == 'all' ? 'selected' : ''}>전체</option>--%>
<%--            <option value="userId" ${stype == 'userId' ? 'selected' : ''}>아이디</option>--%>
<%--            <option value="userName" ${stype == 'userName' ? 'selected' : ''}>이름</option>--%>
<%--            <option value="userEmail" ${stype == 'userEmail' ? 'selected' : ''}>이메일</option>--%>
<%--            <option value="userPassNum" ${stype == 'userPassNum' ? 'selected' : ''}>여권번호</option>--%>
<%--        </select>--%>
<%--        <input type="text" name="sword" id="sword" value="${sword}" placeholder="검색어를 입력하세요">--%>
<%--        <input type="submit" value="검색" id="searchBtn">--%>
<%--    </form>--%>

<%--    <%--%>
<%--        AdminPageVO pageVO = (AdminPageVO)request.getAttribute("pageVO");--%>
<%--        if(pageVO != null) {--%>
<%--    %>--%>
<%--    <div class="count-info">--%>
<%--        <% if (pageVO.getCount() > 0) { %>--%>
<%--        <b><%=pageVO.getCount()%></b>명의 회원이 조회되었습니다.--%>
<%--        <% } else { %>--%>
<%--    </div>--%>
<%--    <%--%>
<%--            }--%>
<%--        }--%>
<%--    %>--%>

<%--    <table>--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>이름</th>--%>
<%--            <th>아이디</th>--%>
<%--            <th>이메일</th>--%>
<%--            <th>여권번호</th>--%>
<%--            <th>회원 정보 수정</th>--%>
<%--            <th>예약 현황</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <%--%>
<%--            List<UserVO> userList = (List<UserVO>)request.getAttribute("userList");--%>
<%--            if(userList != null && !userList.isEmpty()) {--%>
<%--                for(UserVO user : userList) {--%>
<%--                    if(user != null) { // null 체크 추가--%>
<%--        %>--%>
<%--        <tr>--%>
<%--            <td><%=user.getUserName()%></td>--%>
<%--            <td><%=user.getUserId()%></td>--%>
<%--            <td><%=user.getUserEmail()%></td>--%>
<%--            <td><%=user.getUserPassNum() != null ? user.getUserPassNum() : ""%></td>--%>
<%--            <td><a href="javascript:void(0);" onclick="openUserDetail('<%=user.getUserId()%>')" class="detail-link">상세보기</a></td>--%>
<%--            <td><a href="javascript:void(0);" onclick="openReservation('<%=user.getUserId()%>')" class="detail-link">예약상태</a></td>--%>
<%--        </tr>--%>
<%--        <%--%>
<%--                }--%>
<%--            }--%>
<%--        } else {--%>
<%--        %>--%>
<%--        <tr>--%>
<%--            <td colspan="6" class="no-data">검색 결과가 없습니다.</td>--%>
<%--        </tr>--%>
<%--        <%--%>
<%--            }--%>
<%--        %>--%>
<%--        </tbody>--%>
<%--    </table>--%>

<%--    <div class="pagination">--%>
<%--        <%--%>
<%--            if(pageVO != null) {--%>
<%--                if(pageVO.getStartPage() > 1) {--%>
<%--        %>--%>
<%--        <a href="<%=request.getContextPath()%>/AdminUser?page=<%=pageVO.getStartPage() - 1%>&stype=${stype}&sword=${sword}">&laquo; 이전</a>--%>
<%--        <%--%>
<%--            }--%>
<%--            for(int i = pageVO.getStartPage(); i <= pageVO.getEndPage(); i++) {--%>
<%--        %>--%>
<%--        <a href="<%=request.getContextPath()%>/AdminUser?page=<%=i%>&stype=${stype}&sword=${sword}" <%=pageVO.getCurrentPage() == i ? "class='active'" : ""%>><%=i%></a>--%>
<%--        <%--%>
<%--            }--%>
<%--            if(pageVO.getEndPage() < pageVO.getTotalPage()) {--%>
<%--        %>--%>
<%--        <a href="<%=request.getContextPath()%>/AdminUser?page=<%=pageVO.getEndPage() + 1%>&stype=${stype}&sword=${sword}">다음 &raquo;</a>--%>
<%--        <%--%>
<%--                }--%>
<%--            }--%>
<%--        %>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<script>--%>
<%--    function openUserDetail(userId) {--%>
<%--        // 팝업창 열기--%>
<%--        window.open(--%>
<%--            '<%=request.getContextPath()%>/AdminUser/AdminUserView.do?userId=' + userId,--%>
<%--            'userDetail',--%>
<%--            'width=650,height=800,resizable=no,scrollbars=yes'--%>
<%--        );--%>
<%--    }--%>
<%--    // 예약 확인 (새창)--%>
<%--    function openReservation(userId){--%>
<%--        var url = '<%=request.getContextPath()%>/AdminUser/AdminReservation?userId=' + userId;--%>
<%--        window.open(url, "test");--%>
<%--    }--%>

<%--    // 팝업창 위치를 화면 가운데로 설정하고 크기 고정--%>
<%--    window.onload = function() {--%>
<%--        // 팝업창 크기 설정--%>
<%--        const width = 650;--%>
<%--        const height = 800;--%>

<%--        // 화면 중앙에 위치시키기--%>
<%--        const left = (window.screen.width - width) / 2;--%>
<%--        const top = (window.screen.height - height) / 2;--%>

<%--        // 창 위치 조정 (크기는 고정)--%>
<%--        window.moveTo(left, top);--%>

<%--        // 크기 조정 이벤트 방지--%>
<%--        window.addEventListener('resize', function(e) {--%>
<%--            window.resizeTo(width, height);--%>
<%--        });--%>
<%--    };--%>



<%--    // 검색 폼 제출 시 페이지 번호 초기화--%>
<%--    $(document).ready(function() {--%>
<%--        $('#searchForm').on('submit', function(e) {--%>
<%--            // 검색 시 페이지를 1로 초기화--%>
<%--            const form = $(this);--%>
<%--            if (!form.find('input[name="page"]').length) {--%>
<%--                $('<input>').attr({--%>
<%--                    type: 'hidden',--%>
<%--                    name: 'page',--%>
<%--                    value: '1'--%>
<%--                }).appendTo(form);--%>
<%--            } else {--%>
<%--                form.find('input[name="page"]').val('1');--%>
<%--            }--%>
<%--        });--%>

<%--        // 상세보기 링크 스타일 유지--%>
<%--        $('.detail-link').on('click', function(e) {--%>
<%--            $(this).css('color', 'blue');--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>