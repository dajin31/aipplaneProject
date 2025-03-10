<%@ page import="com.example.demo.vo.UserVO" %>
<%@ page import="com.example.demo.vo.AdminPageVO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <style>
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

    .logout-btn, .mypage-btn, .admin-button {
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
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 관리 | Soon Airline</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">
  <script src="<%=request.getContextPath()%>/js/jquery-3.7.1.js"></script>
  <script src="<%=request.getContextPath()%>/js/jquery.serializejson.js"></script>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
</script>
<body>
<header>
  <div class="header-container header-before-login">
    <div class="logo">
      <a href="/mainPage/mainPage.jsp"><img src="/images/2.png" alt="로고"></a>
    </div>
    <nav class="nav">
      <ul class="nav-list">
        <li class="nav-item">
          <a href="/reservation/reservation-airport.jsp">예약</a>
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
          <a href="/reservation/reservation-airport.jsp">예약</a>
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
<div class="container">
  <h1>회원 관리</h1>
  <form action="<%=request.getContextPath()%>/AdminUser" method="get" id="searchForm">
    <select name="stype" id="stype">
      <option value="all" ${stype == 'all' ? 'selected' : ''}>전체</option>
      <option value="userId" ${stype == 'userId' ? 'selected' : ''}>아이디</option>
      <option value="userName" ${stype == 'userName' ? 'selected' : ''}>이름</option>
      <option value="userEmail" ${stype == 'userEmail' ? 'selected' : ''}>이메일</option>
      <option value="userPassNum" ${stype == 'userPassNum' ? 'selected' : ''}>여권번호</option>
    </select>
    <input type="text" name="sword" id="sword" value="${sword}" placeholder="검색어를 입력하세요">
    <input type="submit" value="검색" id="searchBtn">
  </form>

  <%
    AdminPageVO pageVO = (AdminPageVO)request.getAttribute("pageVO");
    if(pageVO != null) {
  %>
  <div class="count-info">
    <% if (pageVO.getCount() > 0) { %>
    <b><%=pageVO.getCount()%></b>명의 회원이 조회되었습니다.
    <% } else { %>
  </div>
  <%
      }
    }
  %>

  <table>
    <thead>
    <tr>
      <th>이름</th>
      <th>아이디</th>
      <th>이메일</th>
      <th>여권번호</th>
      <th>회원 정보 수정</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<UserVO> userList = (List<UserVO>)request.getAttribute("userList");
      if(userList != null && !userList.isEmpty()) {
        for(UserVO user : userList) {
          if(user != null) {
            System.out.println(userList);
    %>
    <tr>
      <td><%=user.getUserName()%></td>
      <td><%=user.getUserId()%></td>
      <td><%=user.getUserEmail()%></td>
      <td><%=user.getUserPassNum() != null ? user.getUserPassNum() : ""%></td>
      <td><a href="javascript:void(0);" onclick="openUserDetail('<%=user.getUserId()%>')" class="detail-link">상세보기</a></td>
    </tr>
    <%
        }
      }
    } else {
    %>
    <tr>
      <td colspan="6" class="no-data">검색 결과가 없습니다.</td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>

  <div class="pagination">
    <%
      if(pageVO != null) {
        if(pageVO.getStartPage() > 1) {
    %>
    <a href="<%=request.getContextPath()%>/AdminUser?page=<%=pageVO.getStartPage() - 1%>&stype=${stype}&sword=${sword}">&laquo; 이전</a>
    <%
      }
      for(int i = pageVO.getStartPage(); i <= pageVO.getEndPage(); i++) {
    %>
    <a href="<%=request.getContextPath()%>/AdminUser?page=<%=i%>&stype=${stype}&sword=${sword}" <%=pageVO.getCurrentPage() == i ? "class='active'" : ""%>><%=i%></a>
    <%
      }
      if(pageVO.getEndPage() < pageVO.getTotalPage()) {
    %>
    <a href="<%=request.getContextPath()%>/AdminUser?page=<%=pageVO.getEndPage() + 1%>&stype=${stype}&sword=${sword}">다음 &raquo;</a>
    <%
        }
      }
    %>
  </div>
</div>

<script>
  function openUserDetail(userId) {
    // 팝업창 열기
    window.open(
            '<%=request.getContextPath()%>/AdminUser/AdminUserView.do?userId=' + userId,
            'userDetail',
            'width=800,height=1100,resizable=no,scrollbars=yes'
    );
  }


  // 검색 폼 제출 시 페이지 번호 초기화
  $(document).ready(function() {
    $('#searchForm').on('submit', function(e) {
      // 검색 시 페이지를 1로 초기화
      const form = $(this);
      if (!form.find('input[name="page"]').length) {
        $('<input>').attr({
          type: 'hidden',
          name: 'page',
          value: '1'
        }).appendTo(form);
      } else {
        form.find('input[name="page"]').val('1');
      }
    });

    // 상세보기 링크 스타일 유지
    $('.detail-link').on('click', function(e) {
      $(this).css('color', 'blue');
    });
  });
</script>
</body>
</html>

