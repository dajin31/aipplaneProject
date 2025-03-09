<%@page import="com.example.demo.vo.MemGradeVO"%>
<%@page import="com.example.demo.vo.FAQBoardVO"%>
<%@page import="com.example.demo.vo.FAQPageVO"%>
<%@page import="com.example.demo.vo.UserVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>자주 묻는 질문 | Soon Airline</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/faqBoard.css">
  <script src="<%=request.getContextPath()%>/js/jquery-3.7.1.js"></script>
</head>
<body>
<%
  // 로그인 세션 정보 가져오기
  UserVO loginUser = (UserVO) session.getAttribute("loginUser");

  // FAQ 데이터 가져오기
  List<FAQBoardVO> faqList = (List<FAQBoardVO>) request.getAttribute("faqList");
  FAQPageVO faqpageVO = (FAQPageVO) request.getAttribute("faqpageVO");
  int totalCount = (int) request.getAttribute("totalCount");
  String stype = (String) request.getAttribute("stype");
  stype = stype == null ? "" : stype;
  String sword = (String) request.getAttribute("sword");
  sword = sword == null ? "" : sword;
  String currentCategory = (String) request.getAttribute("category");
  currentCategory = currentCategory == null ? "all" : currentCategory;

  boolean isAdmin = loginUser != null && loginUser.getMemCode().equals("admin");
%>

<button type="button" id="login" name="login">
  <a href="<%=request.getContextPath() %>/login/login.jsp">로그인</a>
</button>

<!-- 헤더 -->
<header class="header">
  <div class="top-header">
    <nav class="top-nav">
      <a href="/login/userJoin.jsp">회원가입</a>
      <a href="<%=request.getContextPath()%>/login/login.jsp">로그인</a>
    </nav>
  </div>
  <div class="main-header">
    <a href="#" class="logo">Soon Airline</a>
    <nav class="main-nav">
      <a href="/reservation/reservation-airport.jsp">예약</a>
      <a href="/mileage/mileageShop.jsp">마일리지</a>
      <a href="<%=request.getContextPath()%>/member/list.do">공지사항</a>
    </nav>
  </div>
</header>

<%if (isAdmin) {%>
<div class="container">
  <div class="admin-controls">
    <button onclick="showAddModal()" class="admin-button">
      <i class="fas fa-plus"></i> 새 FAQ 작성
    </button>
  </div>
  <% }%>
  <div class="faq-header">
    <h1>자주 묻는 질문</h1>
    <div class="search-container">
      <form action="FAQBoard" method="get">
        <input type="hidden" name="category" value="<%= currentCategory %>">
        <div class="search-box">
          <input type="text" name="sword" placeholder="검색어를 입력하세요" value="<%= sword %>">
        </div>
        <button type="submit" class="search-button">
          <i class="fas fa-search"></i>
        </button>
      </form>
    </div>
  </div>

  <!-- 카테고리 추가 -->
  <div class="category-tabs">
    <a href="FAQBoard?category=all" class="category-tab <%= currentCategory.equals("all") ? "active" : "" %>">전체</a>
    <a href="FAQBoard?category=reservation" class="category-tab <%= currentCategory.equals("reservation") ? "active" : "" %>">예약</a>
    <a href="FAQBoard?category=mileage" class="category-tab <%= currentCategory.equals("mileage") ? "active" : "" %>">마일리지</a>
    <a href="FAQBoard?category=baggage" class="category-tab <%= currentCategory.equals("baggage") ? "active" : "" %>">수하물</a>
    <a href="FAQBoard?category=service" class="category-tab <%= currentCategory.equals("service") ? "active" : "" %>">기타 서비스</a>
    <a href="FAQBoard?category=refund" class="category-tab <%= currentCategory.equals("refund") ? "active" : "" %>">환불</a>
    <a href="FAQBoard?category=reservationChange" class="category-tab <%= currentCategory.equals("reservationChange") ? "active" : "" %>">예약변경</a>
    <a href="FAQBoard?category=redeemMileage" class="category-tab <%= currentCategory.equals("redeemMileage") ? "active" : "" %>">마일리지 사용</a>
    <a href="FAQBoard?category=checkIn" class="category-tab <%= currentCategory.equals("checkIn") ? "active" : "" %>">체크인</a>
    <a href="FAQBoard?category=home" class="category-tab <%= currentCategory.equals("home") ? "active" : "" %>">귀환</a>
  </div>

  <div class="faq-list">
    <div class="title-count">
      <%
        String categoryDisplayName = "";
        if (currentCategory.equals("all")) categoryDisplayName = "전체";
        else if (currentCategory.equals("reservation")) categoryDisplayName = "예약";
        else if (currentCategory.equals("mileage")) categoryDisplayName = "마일리지";
        else if (currentCategory.equals("baggage")) categoryDisplayName = "수하물";
        else if (currentCategory.equals("service")) categoryDisplayName = "기타 서비스";
        else if (currentCategory.equals("refund")) categoryDisplayName = "환불";
        else if (currentCategory.equals("reservationChange")) categoryDisplayName = "예약변경";
        else if (currentCategory.equals("redeemMileage")) categoryDisplayName = "마일리지 사용";
        else if (currentCategory.equals("checkIn")) categoryDisplayName = "체크인";
        else if (currentCategory.equals("home")) categoryDisplayName = "귀환";
      %>
      <% if (!sword.isEmpty()) { %>
      검색 : <%= sword %> (<%= totalCount %>)
      <% } else { %>
      <%= categoryDisplayName %> (<%= totalCount %>)
      <% } %>
    </div>
    <%
      if(faqList != null && !faqList.isEmpty()){
        for(FAQBoardVO faq : faqList) {
    %>
    <div class="faq-item" data-category="<%= faq.getFaq_category() %>">
      <div class="faq-title">
        <%= faq.getFaq_title() %>
        <span class="toggle">﹀</span>
      </div>
      <div class="faq-contents">
        <pre><%= faq.getFaq_contents() %></pre>
        <div class="edit-buttons">
          <% if (isAdmin) { %>
          <button type="button" onclick="showEditModal(this)" class="edit-button"
                  data-id="<%= faq.getFaq_id() %>"
                  data-category="<%= faq.getFaq_category() %>"
                  data-title="<%= faq.getFaq_title() %>"
                  data-contents="<%= faq.getFaq_contents() %>">수정
          </button>
          <button type="button" onclick="deleteFaq(<%= faq.getFaq_id() %>)" class="delete-button">삭제</button>
          <%} %>
        </div>
      </div>
    </div>
    <%
      }
    } else {
    %>
    <div class="no-results">검색 결과가 없습니다.</div>
    <%
      }
    %>
  </div>
</div>

<!-- 페이지네이션 -->
<div class="pagination">
  <%
    // 항목이 있는 경우에만 페이지네이션
    if (totalCount > 0) {
      // 현재 카테고리,검색에 대한 총 페이지 계산
      int itemsPerPage = FAQPageVO.getPerList();
      // 실제 총 페이지 수
      int totalPages = (int) Math.ceil((double) totalCount / itemsPerPage);

      if (faqpageVO.getStartPage() > FAQPageVO.getPerPage()) {
  %>
  <a href="FAQBoard?page=<%= faqpageVO.getStartPage() - FAQPageVO.getPerPage() %>&category=<%= currentCategory %>&sword=<%= sword %>">이전</a>
  <% } %>

  <%
    // 실제 총 페이지 번호 표시
    for (int i = faqpageVO.getStartPage(); i <= Math.min(faqpageVO.getEndPage(), totalPages); i++) {
  %>
  <a href="FAQBoard?page=<%= i %>&category=<%= currentCategory %>&sword=<%= sword %>" <%= faqpageVO.getCurrentPage() == i ? "class='active'" : "" %>><%= i %></a>
  <% } %>

  <% if (faqpageVO.getEndPage() < totalPages) { %>
  <a href="FAQBoard?page=<%= faqpageVO.getEndPage() + 1 %>&category=<%= currentCategory %>&sword=<%= sword %>">다음</a>
  <% } %>
  <% } %>
</div>

<!-- FAQ 추가/수정 모달 -->
<div id="faqModal" class="modal">
  <div class="modal-content">
    <span class="close-modal" onclick="closeModal()">&times;</span>
    <h2 id="modalTitle">FAQ 추가</h2>
    <form id="faqForm" onsubmit="handleSubmit(event)">
      <input type="hidden" id="faqId" name="faqId">
      <div class="form-group">
        <label for="category">카테고리</label>
        <select id="category" name="category" required>
          <option value="reservation">예약</option>
          <option value="mileage">마일리지</option>
          <option value="baggage">수하물</option>
          <option value="service">기타 서비스</option>
          <option value="refund">환불</option>
          <option value="reservationChange">예약변경</option>
          <option value="redeemMileage">마일리지 사용</option>
          <option value="checkIn">체크인</option>
          <option value="home">귀환</option>
        </select>
      </div>
      <div class="form-group">
        <label for="title">질문</label>
        <input type="text" id="title" name="title" required>
      </div>
      <div class="form-group">
        <label for="contents">답변</label>
        <textarea id="contents" name="contents" rows="4" required></textarea>
      </div>
      <button type="submit" class="admin-button" id="submitButton">수정 완료</button>
    </form>
  </div>
</div>

<script>
  // FAQ 아코디언 기능
  document.querySelectorAll('.faq-title').forEach(title => {
    title.addEventListener('click', () => {
      const contents = title.nextElementSibling;
      const toggle = title.querySelector('.toggle');

      contents.classList.toggle('show');
      toggle.textContent = contents.classList.contains('show') ? '︿' : '﹀';
    });
  });

  // 모달 관련 함수들
  function showAddModal() {
    document.getElementById('modalTitle').textContent = 'FAQ 추가';
    document.getElementById('faqForm').reset();
    document.getElementById('faqId').value = '';
    document.getElementById('submitButton').textContent = '추가';
    document.getElementById('faqModal').style.display = 'block';
  }

  // 수정 모달
  function showEditModal(button) {
    document.getElementById('modalTitle').textContent = 'FAQ 수정';
    document.getElementById('faqId').value = button.dataset.id;
    document.getElementById('category').value = button.dataset.category;
    document.getElementById('title').value = button.dataset.title;
    document.getElementById('contents').value = button.dataset.contents;
    document.getElementById('submitButton').textContent = '수정';
    document.getElementById('faqModal').style.display = 'block';
  }

  // 모달창 닫기
  function closeModal() {
    document.getElementById('faqModal').style.display = 'none';
  }

  // 서버로 데이터 전송
  function handleSubmit(event) {
    event.preventDefault();

    let faqId = document.getElementById('faqId').value;
    const category = document.getElementById('category').value;
    const title = document.getElementById('title').value;
    const contents = document.getElementById('contents').value;

    const url = faqId ? '<%=request.getContextPath()%>/FAQBoard/FAQBoardUpdate.do'
            : '<%=request.getContextPath()%>/FAQBoard/FAQBoardWrite.do';
    faqId = faqId ? faqId : 0;

    // JSON 데이터 생성
    const faqData = {
      "faq_id": faqId,
      "faq_category": category,
      "faq_title": title,
      "faq_contents": contents
    };

    // 서버로 데이터 전송2
    fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(faqData)
    })
            .then(response => response.json())
            .then(data => {
              if(data.result > 0) {
                alert('FAQ가 성공적으로 ' + (faqId ? '수정' : '추가') + '되었습니다.');
                location.reload();
              } else {
                alert('FAQ ' + (faqId ? '수정' : '추가') + '에 실패했습니다.');
              }
            })
            .catch(error => {
              console.error('Error:', error);
              alert('오류가 발생했습니다.');
            });
  }

  // FAQ 삭제
  function deleteFaq(id) {
    if(confirm('이 FAQ를 삭제하시겠습니까?')) {
      fetch('<%=request.getContextPath()%>/FAQBoard/FAQBoardDelete.do?num=' + id, {
        method: 'GET'
      })
              .then(response => response.json())
              .then(data => {
                if(data.result > 0) {
                  alert('FAQ가 성공적으로 삭제되었습니다.');
                  location.reload();
                } else {
                  alert('FAQ 삭제에 실패했습니다.');
                }
              })
              .catch(error => {
                console.error('Error:', error);
                alert('오류가 발생했습니다.');
              });
    }
  }

  // 모달창 외부 클릭시 닫기
  window.onclick = function(event) {
    if (event.target == document.getElementById('faqModal')) {
      closeModal();
    }
  }
</script>
</body>
</html>

