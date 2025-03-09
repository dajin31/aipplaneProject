<%@ page import="com.example.demo.vo.UserVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Insert title here</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


  <style>
    h2 {
      margin-left : 20%;
    }

    body{margin-left : 20%;}

    #result{
      border : 1px dotted gray;
      padding : 10px;
      margin : 5px;
    }
    .main{margin: 0 auto; width: 1000px;}
  </style>


  <script>

    //비밀번호 유효성 검사
    function validatePassword(password) {
      const regex = /^(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
      return regex.test(password);
    }
    $(function(){

      // 비밀번호 입력 필드 이벤트 핸들러
      $("#new_pwd").on("change", function() {
        const password = $(this).val();
        if (!validatePassword(password)) {
          $("#password-error").text("비밀번호는 8자 이상, 특수문자 포함, 대소문자 혼합 필수입니다.");
        } else {
          $("#password-error").text("");
        }
      });

      //비밀번호 변경 버튼 클릭 이벤트
      $(document).on('click', '#send', function(){
        const currentPassword = $("#pwd").val();
        const newPassword = $("#new_pwd").val();
        const newrePassword = $("#newre_pwd").val();

        console.log("currentPassword : ", currentPassword);// 입력값 확인용
        console.log("newPassword : ", newPassword);// 입력값 확인용
        console.log("newrePassword : ", newrePassword);// 입력값 확인용

        if(currentPassword==="" || newPassword === "" || newrePassword === ""){//하나라도 입력 하지 않을 경우
          alert('빈칸을 입력하여주세요');
          return;
        }

        if (!validatePassword(newPassword)) {
          alert('비밀번호는 8자 이상, 특수문자 포함, 대소문자 혼합 필수입니다.');
          return;
        }

        if(newPassword !== newrePassword){
          alert('새 비밀번호화 새 비밀번호확인이 일치하지 않습니다.');
          return;
        }

        if(currentPassword=== newPassword){//기존과 새비밀번호가 같을 경우
          alert('기존비밀번호와 새 비밀번호가 같습니다.');
          return;
        }

        $.ajax({
          url: `<%= request.getContextPath() %>/user/userpassupdate.do`,
          type: 'post',
          data: JSON.stringify({"user_pw":currentPassword, "new_pw": newPassword}),
          contentType : 'application/json;charset=utf-8',
          //성공시
          success : function(data){
            if(data.result>0){
              alert('비밀번호가 변경되었습니다.');
              location.href="<%= request.getContextPath() %>/member/mypage.jsp"
            }else{
              alert('현재 비밀번호가 틀렸습니다.');
            }
          },
          error : function(xhr){
            alert("상태 : " + xhr.status)
          },
          dataType : 'json'
        });

      });




    });


  </script>

</head>

<body>
<br>
<br>
<div class="main">

  <h2>비밀번호 변경</h2>
  <br><br>

  <form class="form-horizontal"   onsubmit="return false;">

    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">기존 비밀번호</label>
      <div class="col-sm-3">
        <input type="password" name="mem_pass" class="form-control" id="pwd" placeholder="비밀번호 입력">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">새 비밀번호</label>
      <div class="col-sm-3">
        <input type="password" name="mem_pass" class="form-control" id="new_pwd" placeholder="비밀번호 입력(8자이상,숫자,영어 소문자, 특수문자[@$!%*?&] 포함 필수)" >
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">새 비밀번호 확인</label>
      <div class="col-sm-3">
        <input type="password" name="mem_pass" class="form-control" id="newre_pwd" placeholder="비밀번호 입력(8자이상,숫자,영어 소문자, 특수문자[@$!%*?&] 포함 필수)">
      </div>
    </div>

    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button id="send" type="button" class="btn btn-primary btn-lg">비밀번호 변경</button>
        <span id="joinspan"></span>
      </div>
    </div>
  </form>
</div>
</body>
</html>
