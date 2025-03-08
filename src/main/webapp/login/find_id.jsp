<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>아이디 찾기</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .container {
      background: #fff;
      padding: 50px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      width: 320px;
      text-align: center;
    }

    h1 {
      font-size: 1.5rem;
      margin-bottom: 20px;
      color: #333;
    }

    label {
      display: block;
      margin-top: 10px;
      font-weight: bold;
      text-align: left;
      font-size: 0.9rem;
      color: #555;
    }

    input {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 1rem;
    }

    input[type="submit"] {
      background-color: #007bff;
      color: white;
      border: none;
      cursor: pointer;
      margin-top: 15px;
      font-weight: bold;
    }

    input[type="submit"]:hover {
      background-color: #0056b3;
    }
  </style>

  <script>
    $(document).ready(function() {
      $("#findIdForm").submit(function(event) {
        event.preventDefault(); // 기본 제출 동작 방지

        // 입력 값 가져오기
        const userName = $("#user_name").val().trim();
        console.log("user_name:", user_name);
        const userRegnum = $("#user_regnum").val().trim();
        const userEmail = $("#user_email").val().trim();

        // 유효성 검사 (선택 사항)
        if (!userName || !userRegnum || !userEmail) {
          alert("모든 필드를 입력해주세요.");
          return;
        }

        // 서버에 데이터 전송
        $.ajax({
          url: "<%=request.getContextPath()%>/userFindId", // 서블릿 URL 수정
          type: "POST",
          contentType: "application/json",
          data: JSON.stringify({
            user_name: userName,
            user_regnum: userRegnum,
            user_email: userEmail
          }),
          success: function(response) {
            if (response.result === "success") {
              alert("아이디를 찾았습니다.");
              console.log("찾은 아이디:", response.userId);

              // 아이디를 결과 페이지로 넘기기 위해 쿼리 파라미터 추가
              location.href = "<%=request.getContextPath()%>/login/find_id_result.jsp?userId=" + encodeURIComponent(response.userId);
            } else {
              alert(response.message || "오류가 발생했습니다.");
            }
          },
          error: function(error) {
            console.error("서버 오류:", error); // 개발자 콘솔에 오류 객체 출력

            if (error.responseJSON && error.responseJSON.message) {
              alert("서버 오류: " + error.responseJSON.message); // 서버에서 보낸 오류 메시지 표시
            } else if (error.responseText) {
              alert("서버 오류: " + error.responseText); // 서버 응답 텍스트 표시
            } else {
              alert("서버 오류가 발생했습니다. 자세한 내용은 개발자 콘솔을 확인해주세요.");
            }
          }
        });
      });
    });
  </script>

</head>
<body>
<div class="container">
  <h1>아이디 찾기</h1>
  <form id="findIdForm">
    <label for="user_name">이름</label>
    <input type="text" id="user_name" name="user_name" required />

    <label for="user_regnum">생년월일</label>
    <input type="text" id="user_regnum" name="user_regnum" required />

    <label for="user_email">이메일</label>
    <input type="email" id="user_email" name="user_email" required />

    <input type="submit" value="아이디 찾기" />
  </form>
</div>
</body>
</html>