<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.demo.vo.Notice_BoardVO" %>
<%@ page import="com.example.demo.vo.UserVO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <%--    //<link rel="stylesheet" href="viewstyle.css">--%>
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <link rel="stylesheet" href="/css/viewstyle.css">
    <%
        Notice_BoardVO noticeBoardVO = (Notice_BoardVO) request.getAttribute("nboardVO");
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
    %>
    <style>

    </style>


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
        $(function (){

            $('#delete').click(function() {
                const ntc_board = $(this).data("num");
                console.log(ntc_board)
                alert(ntc_board + " 번 글을 삭제")
                $.ajax({
                    url  : `<%=request.getContextPath()%>/member/delete.do`,
                    type : 'post',
                    data : {"ntc_board" : ntc_board},
                    success : function(data){
                        if(data.result>0){
                            console.log(ntc_board + "번 게시글이 삭제되었습니다.");
                            location.href = "<%=request.getContextPath()%>/member/list.do";
                        }else{
                            console.log("게시글 삭제 오류~~")
                        }

                    },
                    error : function(xhr){
                        alert("상태 : " + xhr.status)
                    },
                    dataType : 'json'
                });
            });
        })
    </script>

</head>
<body>
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
                        <li><a href="/reservation/reservation.jsp">항공권 예매</a></li>
                        <li><a href="reservation.jsp">예약 취소</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="/mileage/mileageShop.jsp">마일리지</a>
                    <ul class="dropdown-menu">
                        <li><a href="/mileage/mileage.jsp">마일리지샵</a></li>
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
                        <li><a href="/reservation/reservation.jsp">항공권 예매</a></li>
                        <li><a href="reservation.jsp">예약 취소</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="/mileage/mileageShop.jsp">마일리지</a>
                    <ul class="dropdown-menu">
                        <li><a href="/mileage/mileage.jsp">마일리지샵</a></li>
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
<%

    if (loginUser != null && loginUser.getUserId() != null) {
        System.out.println("list" + loginUser.getUserId());
        System.out.println("list" + loginUser.getMemCode());
    } else {
        // loginUser가 null인 경우 처리 (예: 로그인 페이지로 리다이렉트)
        out.println("<script>console.log('loginUser is null');</script>"); // 콘솔 로그
    }
%>

<div class="container">
    <div class="notice-header">
        <div class="notice-board">공지사항</div>
        <div class="notice-title"><%=noticeBoardVO.getNtc_title()%></div>
        <div class="notice-info">
            <%
                if(noticeBoardVO.getFile_name()!=null){
            %>
            <span>첨부 파일: <a href="/member/view.do?ntc_board=<%=noticeBoardVO.getNtc_board()%>&action=download"><%=noticeBoardVO.getFile_name()%></a>
            </span>

<%--            <span>첨부 파일: <a href="<%=request.getContextPath()%>/member/view.do?ntc_board=<%=noticeBoardVO.getNtc_board()%>&action=download"><%=noticeBoardVO.getFile_name()%></a> </span>--%>
<%--            <span><a href="/images/" download="2.png"></a>첨부파일</span>--%>
<%--&lt;%&ndash;            <span>첨부 파일: <a href="/images/<%=noticeBoardVO.getFile_name()%>" download="<%=noticeBoardVO.getFile_name()%>"></a></span>&ndash;%&gt;--%>
<%--            <span><a href="2.png" download="2.png"></a>첨부파일</span>--%>
<%--           <span>첨부 파일: <a href="/images/회원가입.png" download="회원가입.png"></a></span>--%>
            <%
            }
            %>

            <%=noticeBoardVO.getCrt_time()%>

        </div>
    </div>

    <div class="notice-content">
        <%=noticeBoardVO.getNtc_contents()%>
    </div>

    <div class="button-container">
        <a href="/member/list.do" class="list-button">목록보기</a>

<%--        <%--%>
<%--            if(loginUser.getMemCode().equals("admin")){--%>
<%--        %>--%>
<%--        <button type="button"  class="list-button" > <a href="<%=request.getContextPath() %>/member/update.do?ntc_board=<%=noticeBoardVO.getNtc_board()%>" id="update">수정</a></button>--%>
<%--        <button type="button" data-num="<%=noticeBoardVO.getNtc_board() %>" class="list-button" id="delete">삭제</button>--%>
<%--        <%--%>
<%--            }else{--%>
<%--                --%>
<%--            }--%>
<%--        %>--%>

        <%
            if (loginUser != null && "admin".equals(loginUser.getMemCode())) {
        %>
        <button type="button" class="list-button">
            <a href="<%=request.getContextPath()%>/member/update.do?ntc_board=<%=noticeBoardVO.getNtc_board()%>" id="update">수정</a>
        </button>
        <button type="button" data-num="<%=noticeBoardVO.getNtc_board()%>" class="list-button" id="delete">삭제</button>
        <%
            }
        %>

    </div>
</div>

</body>
</html>