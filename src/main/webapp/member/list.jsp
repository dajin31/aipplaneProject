<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.vo.Notice_BoardVO" %>
<%@ page import="com.example.demo.vo.PageVO" %>
<%@ page import="com.example.demo.controller.BoardList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공지사항</title>
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
      background-color: #f9f9f9;
      margin: 0;
      padding: 0;
    }
    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
    }
    h1 {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 30px;
    }
    .search-box {
      background-color: #fff;
      border: 1px solid #e0e0e0;
      border-radius: 8px;
      padding: 24px;
      margin-bottom: 30px;
    }
    .search-header {
      display: flex;
      align-items: center;
    }
    .search-title {
      font-weight: 500;
      margin-right: 30px;
    }
    .search-keyword {
      color: #999;
      font-size: 14px;
    }
    .search-form {
      display: flex;
      margin-top: 16px;
    }
    .search-input {
      flex: 1;
      border: none;
      border-bottom: 2px solid #0064de;
      padding: 8px 0;
      outline: none;
    }
    .search-button {
      margin-left: 16px;
      padding: 8px 24px;
      background-color: #fff;
      border: 1px solid #ccc;
      border-radius: 4px;
      cursor: pointer;
    }
    .search-button:hover {
      background-color: #f5f5f5;
    }
    .notice-list {
      border-top: 1px solid #ccc;
    }
    .notice-item {
      display: flex;
      align-items: center;
      padding: 16px 0;
      border-bottom: 1px solid #eee;
      cursor: pointer;
    }
    .notice-item:hover {
      background-color: #f5f5f5;
    }
    .notice-new {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 20px;
      height: 20px;
      background-color: #e60012;
      color: white;
      font-size: 12px;
      font-weight: bold;
      border-radius: 50%;
      margin-right: 8px;
    }
    .notice-title {
      flex: 1;
      font-weight: 500;
    }
    .notice-category {
      padding: 0 8px;
      font-size: 14px;
    }
    .category-usage {
      color: #0064de;
    }
    .category-etc {
      color: #008000;
    }
    .category-fuel {
      color: #8a2be2;
    }
    .category-skypass {
      color: #ff8c00;
    }
    .category-partner {
      color: #008080;
    }
    .notice-date {
      margin-left: 16px;
      font-size: 14px;
      color: #777;
    }
    .pagination {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-top: 30px;
    }
    .page-button {
      width: 32px;
      height: 32px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 2px;
      border: none;
      background: none;
      cursor: pointer;
      border-radius: 4px;
    }
    .page-button:hover {
      background-color: #f0f0f0;
    }
    .page-button.active {
      color: #0064de;
      font-weight: bold;
    }
    .page-arrow {
      padding: 8px;
      cursor: pointer;
      border: none;
      background: none;
      border-radius: 4px;
    }
    .page-arrow:hover {
      background-color: #f0f0f0;
    }
    .highlighted {
      background-color: #f9f9f9;
    }
  </style>
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
  <%
    Notice_BoardVO noticeBoardVO = (Notice_BoardVO) session.getAttribute("user");
  %>
  <script>
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

      // // 공지사항 등록 버튼 클릭 이벤트
      // $('#write').click(function() {
      //   location.href = "write.jsp";
      // });
    });
    <%--function listclick(){--%>
    <%--    const num = $(this).data("num");--%>
    <%--    $.ajax({--%>
    <%--        url: "<%=request.getContextPath()%>/member/view.do",--%>
    <%--        contentType: "application/json; charset=utf-8",--%>
    <%--        type: "get",--%>
    <%--        data: "ntc_board="+num,--%>
    <%--        success: function(data){--%>
    <%--            console.log("성공")--%>
    <%--            console.log(data)--%>
    <%--            //location.href ="<%=request.getContextPath()%>/member/view.do?ntc_board=" + num;--%>
    <%--        },--%>
    <%--        error : function (data){--%>
    <%--            console.log("실패")--%>
    <%--            console.log(data)--%>
    <%--        }--%>
    <%--    })--%>
    <%--}--%>
    <%--$(function() {--%>


    <%--    $(document).on('click','#notice-list-click', function (){--%>
    <%--        const num = $(this).data("num");--%>
    <%--        $.ajax({--%>
    <%--            url: "<%=request.getContextPath()%>/member/view.do",--%>
    <%--            contentType: "application/json; charset=utf-8",--%>
    <%--            type: "get",--%>
    <%--            data: "ntc_board="+num,--%>
    <%--            success: function(data){--%>
    <%--                console.log("성공")--%>
    <%--                console.log(data)--%>
    <%--                //location.href ="<%=request.getContextPath()%>/member/view.do?ntc_board=" + num;--%>
    <%--            },--%>
    <%--            error : function (data){--%>
    <%--                console.log("실패")--%>
    <%--                console.log(data)--%>
    <%--            }--%>
    <%--        })--%>

    <%--    })--%>



    <%--    // 글쓰기 이벤트 - 새 창 띄우기--%>
    <%--    $('#write').on('click', function() {--%>
    <%--        location.href="write.jsp"--%>
    <%--    });--%>

    <%--});--%>
  </script>
</head>
<body>
<%
  // 컨트롤러에서 보내온 자료 받기
  List<Notice_BoardVO> boardVOList = (List<Notice_BoardVO>) request.getAttribute("boardList");
  PageVO pageVO = (PageVO) request.getAttribute("pageVO");

  String sword = (String) request.getAttribute("sword");
  sword = sword == null ? "" : sword;
%>
<div class="container">
  <h1>공지사항</h1>

  <!-- 검색 영역 -->
  <div class="search-box">
    <div class="search-header">
      <div class="search-title">공지사항 검색</div>
      <div class="search-keyword">키워드 검색</div>
    </div>
    <form action="<%=request.getContextPath() %>/member/list.do" method="get" class="search-form" id="searchForm">
      <input type="hidden" id="page" name="page" value="<%=(pageVO != null) ? pageVO.getCurrentPage() : 1 %>">
      <input type="text" name="sword" id="sword" class="search-input" placeholder="검색어를 입력하세요" value="<%=sword%>">
      <button type="button" class="search-button" id="search" onclick="search()">검색</button>
    </form>
  </div>

  <!-- 공지사항 목록 -->
  <%
    if (boardVOList == null || boardVOList.size() == 0) {
  %>
  <div class="notice-item" style="justify-content: center; >
          <span>등록된 공지사항이 없습니다.</span>
          </div>
    <%
        } else {
            for (Notice_BoardVO boardVO : boardVOList) {
    %>
          <div class="notice-list">

  <div class="notice-item">
    <a href="<%=request.getContextPath() %>/member/view.do?ntc_board=<%=boardVO.getNtc_board()%>">
      <span class="notice-title"><%=boardVO.getNtc_title()%></span>
      <span class="notice-date"><%=boardVO.getCrt_time()%></span>
    </a>
  </div>
</div>
<%
    }
  }
%>
<!-- 페이지네이션 -->
<div class="pagination">
  <%
    if (pageVO != null) { // pageVO가 null이 아닌 경우에만 처리
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

<%
  if (noticeBoardVO != null && noticeBoardVO.getUser() != null && "admin".equals(noticeBoardVO.getUser().getMem_code())) {
%>
<button class="register-btn" id="write">공지사항 등록</button>
<%
  }
%>
</div>

<%--  <%--%>
<%--      if(noticeBoardVO!=null){//로그인 안하면 null이므로 null이 아닐때만 실행--%>
<%--        if(noticeBoardVO.getUser().getMem_code().equals("admin")){--%>
<%--  %>--%>
<%--  <button class="register-btn" id="write">등록</button>--%>
<%--  <%--%>
<%--        }//inner if--%>
<%--      }//outer if--%>
<%--    }--%>
<%--  %>--%>

<button class="register-btn" id="write">공지사항 등록</button>

</div>

</body>
</html>