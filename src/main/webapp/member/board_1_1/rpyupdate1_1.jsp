<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.demo.vo.Notice_BoardVO" %>
<%@ page import="com.example.demo.vo.UserVO" %>
<%@ page import="com.example.demo.vo.Board1_1VO" %>
<%@ page import="com.example.demo.vo.Reply1_1VO" %>
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

      $('#rpyupdatesend').on('click', function (){
        // 입력한 모든 값을 가져온다
        const formData = $("#uform").serializeJSON();
        const board_id = $("#board_id").val();
        $.ajax({
          url : "<%=request.getContextPath()%>/member/replyupdate.do",
          contentType :"application/json; charset=utf-8",
          type : "post",
          data : JSON.stringify(formData),
          success: function(response) {
            console.log("답변 성공" + response)
            location.href = "/member/view1_1.do?board_id="+board_id;
          },
          error: function(xhr, status, error) {
            console.error("답변 생성 실패:", error);
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
    Board1_1VO boardVO = (Board1_1VO) request.getAttribute("boardVO");
    UserVO loginUser = (UserVO) session.getAttribute("loginUser");
    Reply1_1VO replyVO = (Reply1_1VO) request.getAttribute("replyVO");
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

<div class="notice-board">
  <h1 class="board-title">1대1 문의사항</h1>
  <div class="divider"></div>

  <div class="notice-item">
    <div class="notice-header">
      <div class="notice-title"><%=boardVO.getInd_title()%></div>
      <div class="notice-meta">
        <div class="notice-tag">여행정보</div>
        <div class="notice-date"><%=boardVO.getCrt_date()%></div>
      </div>
    </div>

    <div class="divider"></div>

    <div class="notice-content">
      <%=boardVO.getInd_contents()%>
    </div>

<form id="uform">
    <div class="admin-reply">
      <div class="admin-reply-header">
        <div class="admin-reply-title">관리자 답변</div>
        <input type="hidden" id="board_id" name="board_id" value="<%=boardVO.getBoard_id()%>">
        <input type="hidden" id="user_id" name="user_id" value="<%=loginUser.getUserId()%>">
        <div class="admin-reply-date"><%=replyVO.getCrt_time()%></div>
      </div>
      <div class="admin-reply-content">
        <textarea class="form-control" id="rpy_contents" name="rpy_contents" cols="100=" rows="15"><%=replyVO.getRpy_contents()%></textarea>
      </div>
    </div>



    <div class="button-container">
      <button type="button" id="rpyupdatesend" class="button" >확인</button>

    </div>
</form>

    <a href="<%=request.getContextPath()%>/member/list1_1.do" class="button">목록보기</a>
  </div>
</div>
</body>
</html>