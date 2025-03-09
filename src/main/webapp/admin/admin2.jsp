<%@page import="java.util.Map"%>
<%@page import="com.example.demo.vo.AdminPageVO"%>
<%@page import="com.example.demo.vo.UserVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>관리자 페이지 - 회원 관리</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">
  <script src="<%=request.getContextPath()%>/js/jquery-3.7.1.js"></script>
  <script src="<%=request.getContextPath()%>/js/jquery.serializejson.js"></script>
</head>
<body>
<% %>
<div class="container">
  <h1>회원 관리</h1>

  <div class="search-container">
    <form id="searchForm" action="<%=request.getContextPath()%>/AdminUsers" method="get">
      <select name="stype" id="stype">
        <option value="all" <%= "all".equals(request.getAttribute("stype")) ? "selected" : "" %>>전체</option>
        <option value="userId" <%= "userId".equals(request.getAttribute("stype")) ? "selected" : "" %>>아이디</option>
        <option value="userName" <%= "userName".equals(request.getAttribute("stype")) ? "selected" : "" %>>이름</option>
        <option value="userRegNum" <%= "userRegNum".equals(request.getAttribute("stype")) ? "selected" : "" %>>생년월일</option>
        <option value="userEmail" <%= "userEmail".equals(request.getAttribute("stype")) ? "selected" : "" %>>이메일</option>
        <option value="userPassNum" <%= "userPassNum".equals(request.getAttribute("stype")) ? "selected" : "" %>>여권번호</option>
      </select>
      <input type="text" name="sword" id="sword" value="<%= request.getAttribute("sword") != null ? request.getAttribute("sword") : "" %>">
      <button type="submit" id="search-btn">검색</button>
    </form>
  </div>

  <div class="user-count">
    전체 회원 수: <span id="totalCount"><%= request.getAttribute("totalCount") %></span>명
  </div>

  <table class="user-table">
    <thead>
    <tr>
      <th>아이디</th>
      <th>이름</th>
      <th>이메일</th>
      <th>생년월일</th>
      <th>마일리지</th>
      <th>여권번호</th>
      <th>회원등급</th>
      <th>총 마일리지</th>
      <th>관리</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<UserVO> userList =
              (List<UserVO>)request.getAttribute("list");

      if(userList != null && !userList.isEmpty()) {
        for(UserVO user : userList) {
    %>
    <tr>
      <td><%= user.getUserId() %></td>
      <td><%= user.getUserName() %></td>
      <td><%= user.getUserEmail() %></td>
      <td><%= user.getUserRegnum() %></td>
      <td><%= user.getUserMileage() %></td>
      <td><%= user.getUserPassNum() %></td>
      <td><%= user.getMemCode() %></td>
      <td><%= user.getUserTotalMileage() %></td>
      <td>
        <button class="edit-btn" data-id="<%= user.getUserId() %>">수정</button>
        <button class="delete-btn" data-id="<%= user.getUserId() %>">삭제</button>
      </td>
    </tr>
    <%
      }
    } else {
    %>
    <tr>
      <td colspan="9">회원 정보가 없습니다.</td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>

  <div class="pagination">
    <%
      AdminPageVO pageVo =
              (AdminPageVO)request.getAttribute("pageVo");

      if(pageVo != null) {
        if(pageVo.getStartPage() > 1) {
    %>
    <a href="<%=request.getContextPath()%>/AdminUsers?page=<%= pageVo.getStartPage() - 1 %>&stype=<%= request.getAttribute("stype") %>&sword=<%= request.getAttribute("sword") %>">&lt;</a>
    <%
      }

      for(int i = pageVo.getStartPage(); i <= pageVo.getEndPage(); i++) {
        if(i == pageVo.getCurrentPage()) {
    %>
    <span class="current"><%= i %></span>
    <%
    } else {
    %>
    <a href="<%=request.getContextPath()%>/AdminUsers?page=<%= i %>&stype=<%= request.getAttribute("stype") %>&sword=<%= request.getAttribute("sword") %>"><%= i %></a>
    <%
        }
      }

      if(pageVo.getEndPage() < pageVo.getTotalPage()) {
    %>
    <a href="<%=request.getContextPath()%>/AdminUsers?page=<%= pageVo.getEndPage() + 1 %>&stype=<%= request.getAttribute("stype") %>&sword=<%= request.getAttribute("sword") %>">&gt;</a>
    <%
        }
      }
    %>
  </div>
</div>

<!-- 회원 정보 수정 모달 -->
<div id="editModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>회원 정보 수정</h2>
    <form id="editForm">
      <div class="form-group">
        <label for="userId">아이디</label>
        <input type="text" id="userId" name="userId" readonly>
      </div>
      <div class="form-group">
        <label for="userName">이름</label>
        <input type="text" id="userName" name="userName" readonly>
      </div>
      <div class="form-group">
        <label for="userPw">비밀번호</label>
        <input type="password" id="userPw" name="userPw">
      </div>
      <div class="form-group">
        <label for="userEmail">이메일</label>
        <input type="email" id="userEmail" name="userEmail">
      </div>
      <div class="form-group">
        <label for="userRegNum">생년월일</label>
        <input type="text" id="userRegNum" name="userRegNum" readonly>
      </div>
      <div class="form-group">
        <label for="userMileage">마일리지</label>
        <input type="number" id="userMileage" name="userMileage">
      </div>
      <div class="form-group">
        <label for="userPassNum">여권번호</label>
        <input type="text" id="userPassNum" name="userPassNum">
      </div>
      <div class="form-group">
        <label for="memCode">회원등급</label>
        <select id="memCode" name="memCode">
          <%
            List<Map<String, Object>> gradeList =
                    (List<Map<String, Object>>)request.getAttribute("gradeList");

            if(gradeList != null) {
              for(Map<String, Object> grade : gradeList) {
          %>
          <option value="<%= grade.get("MEM_CODE") %>"><%= grade.get("MEM_NAME") %></option>
          <%
              }
            }
          %>
        </select>
      </div>
      <div class="form-group">
        <label for="userTotalmileage">총 마일리지</label>
        <input type="number" id="userTotalmileage" name="userTotalmileage" readonly>
      </div>
      <button type="submit" id="saveBtn">저장</button>
    </form>
  </div>
</div>

<script>
  $(function() {
    // 검색 기능
    $("#searchForm").on("submit", function() {
      if($("#sword").val().trim() === "" && $("#stype").val() !== "all") {
        alert("검색어를 입력해주세요.");
        $("#sword").focus();
        return false;
      }
      return true;
    });

    // 엔터키 검색 처리
    $("#sword").on("keypress", function(e) {
      if(e.which === 13) {
        $("#searchForm").submit();
        return false;
      }
    });

    // 회원 정보 수정 모달 열기
    $(".edit-btn").on("click", function() {
      var userId = $(this).data("id");

      // AJAX로 회원 정보 가져오기
      $.ajax({
        url: "<%=request.getContextPath()%>/AdminUsers",
        type: "get",
        data: { userId: userId },
        success: function(user) {
          // 폼에 회원 정보 채우기
          $("#userId").val(user.userId);
          $("#userName").val(user.userName);
          $("#userPw").val(user.userPw);
          $("#userEmail").val(user.userEmail);
          $("#userRegNum").val(user.userRegNum);
          $("#userMileage").val(user.userMileage);
          $("#userPassNum").val(user.userPassNum);
          $("#memCode").val(user.memCode);
          $("#userTotalmileage").val(user.userTotalmileage);

          // 모달 열기
          $("#editModal").css("display", "block");
        },
        error: function(xhr) {
          alert("회원 정보를 불러오는데 실패했습니다.");
        }
      });
    });

    // 모달 닫기
    $(".close").on("click", function() {
      $("#editModal").css("display", "none");
    });

    // 회원 정보 수정 저장
    $("#editForm").on("submit", function(e) {
      e.preventDefault();

      var userData = {
        userId: $("#userId").val(),
        userPw: $("#userPw").val(),
        userEmail: $("#userEmail").val(),
        userMileage: $("#userMileage").val(),
        userPassNum: $("#userPassNum").val(),
        memCode: $("#memCode").val()
      };

      $.ajax({
        url: "<%=request.getContextPath()%>/AdminUsers/AdminUsersUpdate.do",
        type: "post",
        data: JSON.stringify(userData),
        contentType: "application/json",
        success: function(res) {
          if(res.result > 0) {
            alert(res.message);
            $("#editModal").css("display", "none");
            location.reload();
          } else {
            alert(res.message);
          }
        },
        error: function(xhr) {
          alert("회원 정보 수정에 실패했습니다.");
        }
      });
    });

    // 회원 삭제
    $(".delete-btn").on("click", function() {
      if(confirm("정말 삭제하시겠습니까?")) {
        var userId = $(this).data("id");

        $.ajax({
          url: "<%=request.getContextPath()%>/AdminUsers/AdminUsersDelete.do",
          type: "get",
          data: JSON.stringify({ userId: userId }),
          contentType: "application/json",
          success: function(res) {
            if(res.result > 0) {
              alert(res.message);
              location.reload();
            } else {
              alert(res.message);
            }
          },
          error: function(xhr) {
            alert("회원 삭제에 실패했습니다.");
          }
        });
      }
    });

    // 모달 외부 클릭 시 닫기
    $(window).on("click", function(e) {
      if($(e.target).is("#editModal")) {
        $("#editModal").css("display", "none");
      }
    });
  });
</script>
</body>
</html>