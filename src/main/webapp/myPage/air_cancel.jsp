<%@ page import="com.example.demo.vo.AirVO" %>
<%@ page import="com.example.demo.vo.UserVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <meta charset="UTF-8">
  <title>결제 상세</title>

</head>
<%
  UserVO userVo = (UserVO)session.getAttribute("loginUser");/*로그인 정보 불러오기*/
  /*  AirVO airVo = (AirVO)session.getAttribute("Air"); */
  //         if(userVo==null){//로그인 안되었다면
//         	response.sendRedirect("/middle/member/login.jsp");
//         }
%>
console.log(userVo);
<style>
  body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
    margin: 0;
    padding: 20px;
    background-color: #f8f9fa;
  }

  .payment-container {
    max-width: 400px;
    margin: 0 auto;
    background: white;
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
  }

  .payment-row {
    display: flex;
    justify-content: space-between;
    padding: 8px 0;
    color: #333;
  }

  .payment-title {
    font-size: 16px;
    color: #2b7de1;
    font-weight: 500;
    margin-bottom: 10px;
  }

  .amount {
    font-weight: 500;
  }

  .negative {
    color: #dc3545;
  }

  .button-container {
    display: flex;
    gap: 10px;
    margin-top: 20px;
  }

  .btn {
    flex: 1;
    padding: 15px 0;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
    font-weight: 500;
  }

  .btn-cancel {
    background-color: white;
    border: 1px solid #dee2e6;
    color: #333;
  }

  .btn-next {
    background-color: #0c2b6c;
    color: white;
  }
</style>
<script >

  $(function() {
    $(document).on('click', '#cancelBtn', function() {
      if (confirm('정말로 취소하시겠습니까?')) {

        const userId = "<%=userVo.getUserId()%>";
        console.log("userId : ", userId);

        // const resCode = "<퍼센트 코딩 - airVo 에서 가지고 와야함>"
        console.log("resCode : ", resCode);

        // 확인 버튼 클릭 시 실행할 코드
        $.ajax({
          url:`<%= request.getContextPath() %>/user/aircancel.do`, // 실제 서버 엔드포인트로 변경
          method: 'POST',
          data: JSON.stringify({"res_code":resCode, "user_id": userId}), // 예약 ID 전달 (실제 ID로 변경)
          contentType : 'application/json;charset=utf-8',
          success: function(data) {
            if (data.result=== 'success') {
              alert('예약이 성공적으로 취소되었습니다.');
              // 취소 성공 후 마이페이지로 이동
              location.href="<%= request.getContextPath() %>/member/mypage.jsp" // 예시: 페이지 새로고침
            } else {
              alert('예약 취소에 실패했습니다. 다시 시도해주세요.');
            }
          },
          error: function() {
            alert('서버 오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
          }
        });
      }
    });
  });
</script>
</head>
<body>
<div class="payment-container">
  <div class="payment-title">
    환불 예정 금액 ⌃
  </div>



  <div class="payment-row">
    <span>결제 금액</span>
    <span class="amount">20,000 원</span>
  </div>

  <div class="payment-row">
    <span>사용 마일리지</span>
    <span class="amount"><%=userVo.getUserId()%></span>
  </div>

  <div class="button-container">
    <button type="button" class="btn btn-next">이전</button>
    <button type="button" id="cancelBtn" class="btn btn-cancel">예약 취소</button>
  </div>
</div>

<%-- 서버 측 로직은 여기에 추가할 수 있습니다 --%>
<%
  // 결제 정보를 처리하는 로직을 여기에 구현할 수 있습니다
  // String paymentAmount = request.getParameter("amount");
  // 결제 처리 로직...
%>
</body>
</html>