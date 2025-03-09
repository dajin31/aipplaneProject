<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.controller.NBoardList" %>
<%@ page import="com.example.demo.vo.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>1:1 문의</title>
  <link rel="stylesheet" href="../../css/1_1liststyle.css">
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
  <%
    UserVO loginUser = (UserVO) session.getAttribute("loginUser");
  %>
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
    $(function() {

      // 페이지 번호 클릭 이벤트
      $(document).on('click', '.pageno', function() {
        $('#page').val(parseInt($(this).text()));
        $('#searchForm').submit();
      });

      // 다음 페이지 클릭 이벤트
      $('#next').click(function() {
        $('#page').val(parseInt($('.pageno').last().text()) + 1);
        $('#searchForm').submit();
      });

      // 이전 페이지 클릭 이벤트
      $('#prev').click(function() {
        $('#page').val(parseInt($('.pageno').first().text()) - 1);
        $('#searchForm').submit();
      });

      // 검색 버튼 클릭 이벤트
      $('#search').click(function() {
        $('#page').val(1);
        $('#searchForm').submit();
      });

      // 문의등록 버튼 클릭 이벤트
      $('#write').click(function() {
        <%
          if(loginUser == null){
        %>
        alert("로그인을 해주세요");
        <%
          }else {
        %>
        location.href = "/member/write1_1.do";
        <%
          }
        %>
      });
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







<%
  // 컨트롤러에서 보내온 자료 받기
  List<Board1_1VO> boardVOList = (List<Board1_1VO>) request.getAttribute("boardList");
  List<Reply1_1VO> replyVOList = (List<Reply1_1VO>) request.getAttribute("replyList");
  PageVO pageVO = (PageVO) request.getAttribute("pageVO");

  String sword = (String) request.getAttribute("sword");
  String user_id = (String) request.getAttribute("user_id");
  sword = sword == null ? "" : sword;
%>



<div class="container">
  <h1>1:1 문의</h1>

  <!-- 검색 영역 -->
  <div class="search-box">
    <div class="search-header">
      <div class="search-title">1:1 문의 검색</div>
      <div class="search-keyword">키워드 검색</div>
    </div>
    <form action="<%=request.getContextPath() %>/member/list1_1.do" method="get" class="search-form" id="searchForm">
      <input type="hidden" id="page" name="page" value="<%=(pageVO != null) ? pageVO.getCurrentPage() : 1 %>">
      <input type="text" name="sword" id="sword" class="search-input" placeholder="검색어를 입력하세요" value="<%=sword%>">
      <button type="button" class="search-button" id="search" onclick="search()">검색</button>
    </form>
  </div>

  <!-- 공지사항 목록 -->


  <%
      if (boardVOList == null || boardVOList.isEmpty() || loginUser == null) {
//    if (loginUser==null)
  %>
  <div class="notice-item" style="justify-content: center; >
          <span>등록된 문의가 없습니다.</span>
          </div>
    <%
        } else {
             for (int i = 0; i < boardVOList.size(); i++) { // 인덱스 추가
               Board1_1VO boardVO = boardVOList.get(i);
                Reply1_1VO replyVO = replyVOList.get(i);//
                if (replyVO != null) { // replyVO가 null이 아닌 경우에만 getBoard_id() 호출
          System.out.println("답변 아이딩????????????????" + replyVO.getBoard_id());
        }
    %>

          <div class="notice-list">

  <div class="notice-item">
    <a href="<%=request.getContextPath() %>/member/view1_1.do?board_id=<%=boardVO.getBoard_id()%>">
      <div class="notice-item-content"><span class="notice-title"><%=boardVO.getInd_title()%></span>
      <span class="notice-date"><%=boardVO.getCrt_date()%></span>
      <% if (replyVO == null) { %>
      <span class="notice-replyst">답변 전</span>
      <% } else { %>
      <span class="notice-replyst">답변 완료</span>
      <% }
      }
      %>
      </div>
    </a>
  </div>
</div>
<%
  }
%>
<!-- 페이지네이션 -->



<div class="pagination">
  <%
    if  (loginUser != null && boardVOList != null && !boardVOList.isEmpty() && pageVO != null) { // pageVO가 null이 아닌 경우에만 처리
      if (pageVO.getStartPage() > 1) {
  %>
  <button type="button" class="page-arrow" id="prev">이전</button>
  <%
    }

    // 페이지 번호 출력
    for (int i = pageVO.getStartPage(); i <= pageVO.getEndPage(); i++) {
      if (i == pageVO.getCurrentPage()) {
  %>
  <button type="button" class="page-button active pageno"><%=i%></button>
  <%
  } else {
  %>
  <button type="button" class="page-button pageno"><%=i%></button>
  <%
      }
    }

    if (pageVO.getEndPage() < pageVO.getTotalPage()) {
  %>
  <button type="button" class="page-arrow" id="next">다음</button>
  <%
      }
    }
  %>
</div>



<button class="register-btn" id="write">문의 등록</button>



</body>
</html>