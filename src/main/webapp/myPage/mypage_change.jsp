<%@ page import="com.example.demo.vo.UserVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Insert title here</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<%
  UserVO userVo = (UserVO)session.getAttribute("UserVO");/*로그인 정보 불러오기*/
//         if(userVo==null){//로그인 안되었다면
//         	response.sendRedirect("/middle/member/login.jsp");
//         }
%>
<style>



  h2 {
    margin-left : 20%;

  }

  body{

    margin-left : 20%;

  }





  #result{
    border : 1px dotted gray;
    padding : 10px;
    margin : 5px;
  }

</style>


<script>
  $(function(){

    //회원정보 변경 버튼 클릭 이벤트
    $(document).on('click', '#send', function(){
      const enteredPassword = $("#pwd").val();
      const enteredEmail = $('#email').val();

      //enteredEmail :  te22@.com
      console.log("enteredPassword : ", enteredPassword);
      //enteredPassword :  1234
      console.log("enteredEmail : ", enteredEmail);

      if(enteredPassword===""){// 비밀번호 입력 하지 않을 경우
        alert('비밀번호를 입력하여주세요');
        return;
      }

      /* JSON오브젝트 -> String으로 serialize
      //	여기서는 네트워크에 데이터를 보낼 땐 Object가 안됨
      요청URI : /user/userupdate.do
      요청파라미터 : JSON String{"user_pw":"1234","user_email":"te22@.com"}
      요청방식 : post
      */
      $.ajax({
        url: `<%= request.getContextPath() %>/user/userupdate.do`,
        type: 'post',
        data: JSON.stringify({"user_pw":enteredPassword,"user_email":enteredEmail}),
        contentType : 'application/json;charset=utf-8',
        success : function(data){			// 성공했을 경우 마이페이지로 돌아간다.
          //update 성공 시 res : 1
          //update 실패 시 res : 0
          /*
          {
          "result"  : "1"
           }
          */

          if(data.result>0){
            alert('회원정보가 변경되었습니다.');
            location.href="<%= request.getContextPath() %>/member/mypage.jsp"
          }else{
            alert('비밀번호가 틀렸습니다.');
          }
        },
        error : function(xhr){
          alert("상태 : " + xhr.status)
        },
        dataType : 'json'
      });

    });


    // 탈퇴 버튼 클릭 이벤트
    $("#withdrawalBtn").on("click", function() {
      if (confirm('정말로 탈퇴하시겠습니까?')) {	// 사용자가 확인을 누르면 회원 탈퇴 처리 진행
        const enteredPassword = $("#pwd").val();
        console.log("enteredPassword : ", enteredPassword);

        if(enteredPassword===""){// 비밀번호 입력 하지 않을 경우
          alert('비밀번호를 입력하여주세요');
          return;
        }

        $.ajax({
          url : `<%=request.getContextPath()%>/user/userDelete.do`,
          type : 'POST',
          data: JSON.stringify({"user_pw":enteredPassword}),
          contentType : 'application/json;charset=utf-8',
          success: function(data){
            if(data.result>0){
              alert('탈퇴가 완료되었습니다.');
              location.href="login.jsp"
            }else{
              alert('비밀번호가 틀렸습니다.');
            }

          },
          error : function(xhr){
            alert("상태 : " + xhr.status)
          },
          dataType : 'json'
        });

      }
    });
  });




</script>

</head>

<body>
<br>
<br>
<h2>회원정보 변경</h2>
<br><br>
<div class="container" id="bodyz">
  <form class="form-horizontal"   onsubmit="return false;">

    <div class="form-group">
      <label class="control-label col-sm-2" for="id">아이디</label>
      <div class="col-sm-10">
        <span class="text-xl font-semibold"><%=userVo.getUserId()%></span>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="name">이름</label>
      <div class="col-sm-2">
        <div class="text-xl font-semibold"><%=userVo.getUserName()%></div>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="bir">생년월일</label>
      <div class="col-sm-2">
        <div class="text-xl font-semibold"><%=userVo.getUserRegnum()%></div>
      </div>
    </div>


    <div class="form-group">
      <label class="control-label col-sm-2" for="email">이메일</label>
      <div class="col-sm-2">
        <div class="row">
          <input type="text" name="mem_mail" class="form-control" id="email" value="<%=userVo.getUserEmail()%>">
        </div>
      </div>
    </div>




    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">변경, 탈퇴 시 비밀번호를<br> 입력하세요</label>
      <div class="col-sm-2">
        <input type="password" name="mem_pass" class="form-control" id="pwd" placeholder="비밀번호 입력">
      </div>
    </div>

    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button id="send" type="button" class="btn btn-primary btn-lg">회원정보 변경</button><br><br>
        <div class="col-sm-offset-2 col-sm-10">
          <button id="withdrawalBtn" class="text-sm underline">회원탈퇴</button>
          <span id="joinspan"></span>
        </div>
      </div>
  </form></div>
</body>
</html>
