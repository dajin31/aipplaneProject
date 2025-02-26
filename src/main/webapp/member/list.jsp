<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.vo.Notice_BoardVO" %>
<%@ page import="com.example.demo.vo.PageVO" %>
<%@ page import="com.example.demo.controller.BoardList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공지사항</title>

  <meta charset="UTF-8">
  <meta name="view" content="width=device-width, inital-scale=1">
  <link rel="stylesheet" href="style.css">
  <script src="<%=request.getContextPath() %>/<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<%
  Notice_BoardVO noticeBoardVO = (Notice_BoardVO) session.getAttribute("getAdmin_id");
%>
  <script>
    $(function(){

      //페이지 번호 클릭 이벤트
      $(document).on('click', '.pageno', function (){
        $('#page').val(parseInt($(this).text()));
        $('#searchForm').submit();
      })

      //다음 버튼 클릭 이벤트
      $(document).on('click', '.#next', function (){
        $('#page').val(parseInt($('.pageno').last().text())+1);
        $('#searchForm').submit();
      })

      //이전 버튼 클릭 이벤트
      $(document).on('click', '.#prev', function (){
        $('#page').val(parseInt($('.pageno').first().text())-1);
        $('#searchForm').submit();
      })

      //검색 이벤트
      $(document).on('click', function (){
        $('#page').val(1);
        $('#searchForm').submit();
      })

      // 글쓰기 이벤트  - 모달창 띄우기
      $('write').on('click', function(){
        $('#wModal').modal('show');
      })


      $('#send').on('click', function(){
        const formData = $('wform').serializeJson();
        //-------------------------------------------
        fetch
      })
    })
</script>
</head>
<%
  // 컨트롤러에서 보내온 자료 받기a

  List<Notice_BoardVO> boardVOList = (List<Notice_BoardVO>) request.getAttribute("notice_boardListVO");
  PageVO pageVO = (PageVO) request.getAttribute("pageVO");
  String stype = (String) request.getParameter("type");
  stype = stype == null ? ""  : stype;

  String sword = (String)request.getParameter("sword");
  sword = sword == null ? "" : sword;

%>
<body>

<div class="container">
  <h2>공지사항</h2>
  <input type="text" class="search-box" placeholder="키워드 검색">
  <button type="button" id="search" class=""> 검색 </button>
  <%
    if(boardVOList == null || boardVOList.size() == 0){
  %>
  <div class="notice">
        조건에 맞는 글이 없습니다.
  </div>
  <%
    }else{
      for(Notice_BoardVO boardVO : boardVOList){
  %>
  <div class="notice">
    <div class="notice-title"><%=boardVO.getNtc_title()%></div>
    <div class="notice-details">
      <%=boardVO.getAdmin_id()%>> <span class="notice-date"><%=boardVO.getCrt_time()%></span>
    </div>
  </div>
<%
    }
  }
%>

  <div class="pagination">
    <tr>
      <td colspan="5">
        <div id="pagingArea" >
          <ul class="pagination">
            <%
              if(pageVO.getStartPage()>1){
            %>
            <li class="page-item"><a id="prev" class="page-link">이전</a> </li>
            <%
              }

              //페이지 번호 출력
              for(int i = pageVO.getStartPage(); i< pageVO.getEnd(); i++){
                if (i == pageVO.getCurrentPage()){
            %>
            <li class="page-item active"><a class="page-link pageno"><%=i%></a></li>
            <%
                }else{
            %>
            <li class="page-item"><a class="page-link pageno" ><%=i%></a> </li>
            <%
                }
              }

              if(pageVO.getEndPage()< pageVO.getTotalPage()){
            %>
            <li class="page-item"><a id="next" class="page-link">다음</a></li>
            <%
              }
            %>
          </ul>
        </div>
      </td>
    </tr>
  </div>
  <button class="register-btn">등록</button>
</div>


//공지사항 등록 시작
<div class="wnotice">
  <div class="container">
    <div class="title">공지사항</div>
    <div class="divider"></div>

    <div class="info">
      <div>
        <input type="text" class="notice-title" id="title">
        <span class="category">공지사항 주제</span>
      </div>
      <div class="date"><%=noticeBoardVO.getCrt_time()%></div>
    </div>

    <div class="content-box">
      <ttexarea></ttexarea>
    </div>

    <div class="button-box">
      <div class="list-buttons">
        <button class="btn" id="listview">목록보기</button>
      </div>
      <div class="right-buttons">
        <button class="update-button" id="send">등록</button>
        <button class="delete-button" id="close">삭제</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>
