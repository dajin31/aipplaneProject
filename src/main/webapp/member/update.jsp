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
    <script src="/js/jquery.serializejson.js"></script>
    <link rel="stylesheet" href="../css/viewstyle.css">
    <%
        Notice_BoardVO noticeBoardVO = (Notice_BoardVO) request.getAttribute("nboardVO");
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
        $(function(){
            $('#send').on('click', function (){
                // 입력한 모든 값을 가져온다
                const formData = new FormData($('#wform')[0]); // FormData 객체 생성

                $.ajax({
                    url : "<%=request.getContextPath()%>/member/write.do",
                    type : "post",
                    data : formData,
                    contentType: false, // multipart/form-data를 사용
                    processData : false,
                    success: function(response) {
                        if(response.result>0){
                            console.log("수정 성공" , response)
                            location.href = "/member/list.do";
                        }else{
                            console.error("수정 실패:");
                        }

                    },
                    error: function(xhr, status, error) {
                        console.error("수정 실패:", error);
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
        });
    </script>
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
            <a href="/user/login.jsp" class="login-btn">로그인</a>
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
<form id="wform" enctype="multipart/form-data">
<div class="container">
    <div class="notice-header">
        <input type="hidden" id="ntc_board" name="ntc_board" value="<%=noticeBoardVO.getNtc_board()%>">
        <div class="notice-title"><h4>공지사항 수정</h4> 제목 <input type="text" class="form-control" id="ntc_title" name="ntc_title"
                                                             value="<%=noticeBoardVO.getNtc_title()%>"></div>
        <div class="notice-info">
            <input type="file" name="file">
            <%=noticeBoardVO.getCrt_time()%>
        </div>
    </div>

    <div class="notice-content">내용<br>
        <textarea class="form-control" id="ntc_contents" name="ntc_contents" cols="100" rows="30"><%=noticeBoardVO.getNtc_contents()%></textarea>
    </div>

    <div class="button-container">
<%--       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="close">닫기</button>--%>
        <button type="button" class="btn btn-primary" id="send">저장</button>
    </div>
</div>
</form>

</body>
</html>