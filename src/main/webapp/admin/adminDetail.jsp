<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원 상세 정보</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminDetail.css">
  <script src="<%=request.getContextPath()%>/js/jquery-3.7.1.js"></script>
  <script src="<%=request.getContextPath()%>/js/jquery.serializejson.js"></script>
</head>
<body>
<div class="container">
  <h2>회원 상세 정보</h2>

  <form id="userDetailForm">
    <input type="hidden" id="userId" name="userId" value="${user.userId}">

    <div class="form-group readonly">
      <label>아이디: ${user.userId}</label>
    </div>

    <div class="form-group readonly">
      <label>이름: ${user.userName}</label>
    </div>

    <div class="form-group readonly">
      <label>생년월일: ${user.userRegNum}</label>
    </div>

    <div class="form-group">
      <label for="userPw">비밀번호:</label>
      <input type="text" id="userPw" name="userPw" value="${user.userPw}">
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
      <label for="userTotalMileage">총 마일리지:</label>
      <input type="number" id="userTotalMileage" name="userTotalMileage" value="${user.userTotalMileage}">
    </div>

    <div class="form-group">
      <label for="memCode">회원 등급:</label>
      <select id="memCode" name="memCode">
        <option value="diamond" ${user.memCode == 'diamond' ? 'selected' : ''}>DIAMOND</option>
        <option value="gold" ${user.memCode == 'gold' ? 'selected' : ''}>GOLD</option>
        <option value="silver" ${user.memCode == 'silver' ? 'selected' : ''}>SILVER</option>
      </select>
    </div>

    <div class="button-group">
      <button type="button" onclick="updateUser()">수정</button>
      <button type="button" onclick="deleteUser()" class="delete">삭제</button>
      <button type="button" onclick="window.close()" class="cancel">취소</button>
    </div>
  </form>
</div>

<script>
  // 팝업창 위치를 화면 가운데로 설정하고 크기 고정
  window.onload = function() {
    // 팝업창 크기 설정
    const width = 650;
    const height = 800;

    // 화면 중앙에 위치시키기
    const left = (window.screen.width - width) / 2;
    const top = (window.screen.height - height) / 2;

    // 창 위치 및 크기 조정
    window.resizeTo(width, height);
    window.moveTo(left, top);

    // 크기 조정 핸들러 제거 (크기 조정 자체를 막음)
    document.documentElement.style.overflow = 'hidden';
    document.body.style.overflow = 'hidden';
  };

  function updateUser() {
    if(confirm('회원 정보를 수정하시겠습니까?')) {
      var formData = $('#userDetailForm').serialize();
      console.log("전송 데이터:", formData); // 디버깅용 로그

      $.ajax({
        url: '<%=request.getContextPath()%>/AdminUser/AdminUserUpdate.do',
        type: 'POST',
        data: formData,
        success: function(response) {
          console.log("응답 데이터:", response); // 디버깅 로그
          if(response.result > 0) {
            alert('회원 정보가 수정되었습니다.');
            window.opener.location.reload();
            window.close();
          } else {
            alert('회원 정보 수정에 실패했습니다.');
          }
        },
        error: function(xhr, status, error) {
          console.error("에러 상세 정보:", xhr.responseText); // 디버깅
          alert('오류가 발생했습니다. ' + error);
        }
      });
    }
  }

  function deleteUser() {
    if(confirm('이 회원을 삭제하시겠습니까? 삭제 후 계정 복구가 불가합니다.')) {
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
        error: function(xhr, status, error) {
          alert('오류가 발생했습니다.' + error);
          console.error("Error details:", xhr.responseText);
        }
      });
    }
  }
</script>
</body>
</html>