<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원 상세 정보</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminDetail.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <script src="<%=request.getContextPath()%>/js/jquery-3.7.1.js"></script>
  <script src="<%=request.getContextPath()%>/js/jquery.serializejson.js"></script>
</head>
<body>
<div class="container">
  <h2>회원 상세 정보</h2>
  <form id="userDetailForm">
    <input type="hidden" id="userId" name="userId" value="${user.userId}">

    <div class="form-group">
      <label>아이디: ${user.userId}</label>
    </div>
    <div class="form-group">
      <label>이름: ${user.userName}</label>
    </div>
    <div class="form-group">
      <label>생년월일: ${user.userRegNum}</label>
    </div>
    <div class="form-group">
      <label for="userPw">비밀번호:</label>
      <input type="password" id="userPw" name="userPw" value="${user.userPw}">
    </div>
    <div class="form-group">
      <label for="userEmail">이메일:</label>
      <input type="email" id="userEmail" name="userEmail" value="${user.userEmail}">
    </div>
    <div class="form-group">
      <label for="userMileage">보유 마일리지:</label>
      <input type="number" id="userMileage" name="userMileage" value="${user.userMileage}">
    </div>
    <div class="form-group">
      <label for="userPassNum">여권번호:</label>
      <input type="text" id="userPassNum" name="userPassNum" value="${user.userPassNum}">
    </div>
    <div class="form-group">
      <label for="userTotalmileage">총 마일리지:</label>
      <input type="number" id="userTotalmileage" name="userTotalmileage" value="${user.userTotalmileage}">
    </div>
    <div class="form-group">
      <label for="memCode">회원 등급:</label>
      <select id="memCode" name="memCode">
        <option value="DIAMOND" ${user.memCode == 'DIAMOND' ? 'selected' : ''}>DIAMOND</option>
        <option value="GOLD" ${user.memCode == 'GOLD' ? 'selected' : ''}>GOLD</option>
        <option value="SILVER" ${user.memCode == 'SILVER' ? 'selected' : ''}>SILVER</option>
      </select>
    </div>

    <button type="button" onclick="updateUser()">수정</button>
    <button type="button" onclick="deleteUser()">삭제</button>
  </form>
</div>

<script>
  function updateUser() {
    var formData = $('#userDetailForm').serialize();
    $.ajax({
      url: '<%=request.getContextPath()%>/AdminUser/AdminUserUpdate.do',
      type: 'POST',
      data: formData,
      success: function(response) {
        if(response.result > 0) {
          alert('회원 정보가 수정되었습니다.');
          window.opener.location.reload();
          window.close();
        } else {
          alert('회원 정보 수정에 실패했습니다.');
        }
      },
      error: function() {
        alert('서버 오류가 발생했습니다.');
      }
    });
  }

  function deleteUser() {
    if(confirm('이 회원을 삭제하시겠습니까?')) {
      $.ajax({
        url: '<%=request.getContextPath()%>/AdminUser/AdminUserDelete.do',
        type: 'POST',
        data: { userId: $('#userId').val() },
        success: function(response) {
          if(response.result > 0) {
            alert('회원이 삭제되었습니다.');
            window.opener.location.reload();
            window.close();
          } else {
            alert('회원 삭제에 실패했습니다.');
          }
        },
        error: function() {
          alert('서버 오류가 발생했습니다.');
        }
      });
    }
  }
</script>
</body>
</html>