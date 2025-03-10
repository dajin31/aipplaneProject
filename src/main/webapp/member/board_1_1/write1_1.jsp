<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.demo.vo.Notice_BoardVO" %>
<%@ page import="com.example.demo.vo.UserVO" %>
<%@ page import="com.example.demo.vo.Board1_1VO" %>
<%@ page import="java.util.jar.Attributes" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <script src="/js/jquery.serializejson.js"></script>
    <link rel="stylesheet" href="../../css/1_1viewstyle.css">

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

            $('#send').on('click', function (){
                // 입력한 모든 값을 가져온다
                const formData = $('#wform').serializeJSON();

                $.ajax({
                    url : "<%=request.getContextPath()%>/member/write1_1.do",
                    contentType :"application/json; charset=utf-8",
                    type : "post",
                    data : JSON.stringify(formData),
                    success: function(response) {
                        console.log("새 글 생성 성공" + response)
                        location.href = "/member/list1_1.do";
                    },
                    error: function(xhr, status, error) {
                        console.error("새 글 생성 실패:", error);
                        console.log(xhr);
                        try {
                            var errorData = JSON.parse(xhr.responseText);
                            alert("새 글 생성 실패: " + errorData.message);
                        } catch (e) {
                            alert("새 글 생성 실패. 서버 오류 발생.");
                        }
                    }
                })
            })

        })
    </script>
    <%
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
    %>
</head>
<body>


<header>
    <div class="header-container header-before-login">
        <div class="logo">
            <a href="index.jsp"><img src="/images/2.png" alt="로고"></a>
        </div>
        <nav class="nav">
            <ul class="nav-list">
                <li class="nav-item">
                    <a href="#">예약</a>
                    <ul class="dropdown-menu">
                        <li><a href="reservation.jsp">항공권 예매</a></li>
                        <li><a href="reservation.jsp">예약 취소</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#">마일리지</a>
                    <ul class="dropdown-menu">
                        <li><a href="mileage.jsp">마일리지샵</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#">공지사항</a>
                    <ul class="dropdown-menu">
                        <li><a href="notice.jsp">공지사항</a></li>
                        <li><a href="qna.jsp">1:1 문의</a></li>
                        <li><a href="faq.jsp">FAQ</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="auth">
            <a href="/user/userJoin.jsp" class="join-btn">회원가입</a>
            <a href="<%=request.getContextPath() %>/member/login.jsp" class="login-btn">로그인</a>
        </div>
    </div>
    <div class="header-container header-after-login hidden">
        <div class="logo">
            <a href="index.jsp"><img src="/images/2.png" alt="로고"></a>
        </div>
        <nav class="nav">
            <ul class="nav-list">
                <li class="nav-item">
                    <a href="#">예약</a>
                    <ul class="dropdown-menu">
                        <li><a href="reservation.jsp">항공권 예매</a></li>
                        <li><a href="reservation.jsp">예약 취소</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#">마일리지</a>
                    <ul class="dropdown-menu">
                        <li><a href="mileage.jsp">마일리지샵</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="#">공지사항</a>
                    <ul class="dropdown-menu">
                        <li><a href="notice.jsp">공지사항</a></li>
                        <li><a href="qna.jsp">1:1 문의</a></li>
                        <li><a href="faq.jsp">FAQ</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div class="user-info">
            <a href="<%=request.getContextPath()%>/user/logout.do" class="logout-btn">로그아웃</a>
            <a href="/user/mypage.jsp" class="mypage-btn">마이페이지</a>
            <span class="welcome-msg">${sessionScope.loginUser.userName}님 환영합니다.</span>
        </div>
    </div>
</header>

<form id="wform">
<div class="notice-board">
    <h1 class="board-title">문의글 작성</h1>
    <div class="divider"></div>

    <div class="notice-item">
        <div class="notice-header">
            <div class="notice-title">제목 : <input type="text" id="ind_title" name="ind_title"></div>
            <div class="notice-meta">
                <div class="notice-tag">문의 종류 : <select name="stype">
                    <option value="">예약</option>
                    <option value="">마일리지</option>
                    <option value="">변경/환불</option>
                    <option value="">예약/좌석배정</option>
                </select></div>
                <div class="notice-date">2025.02.24</div>
            </div>
        </div>

        <div class="divider"></div>

        <div class="notice-content">
            <textarea class="form-control" id="ind_contents" name="ind_contents" cols="100" rows="30">내용</textarea>
        </div>

        <div class="button-container">
            <button type="button" id="send" class="button">등록</button>
            <a href="/member/board_1_1/list1_1.jsp" class="button">목록보기</a>
        </div>
    </div>
</div>
</form>
</body>
</html>