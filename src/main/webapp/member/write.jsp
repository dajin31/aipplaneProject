<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.demo.vo.Notice_BoardVO" %>
<%@ page import="com.example.demo.vo.UserVO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>공지사항</title>
  <%--    //<link rel="stylesheet" href="viewstyle.css">--%>
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
  <script src="/js/jquery.serializejson.js"></script>


  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
      margin: 0;
      padding: 20px;
      background-color: #f5f5f5;
      line-height: 1.6;
    }

    .container {
      max-width: 1000px;
      margin: 0 auto;
      background-color: #fff;
      padding: 40px;
      border-radius: 8px;
      box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    }

    .notice-header {
      margin-bottom: 30px;
      border-bottom: 1px solid #eee;
      padding-bottom: 20px;
    }

    .notice-title {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .notice-info {
      display: flex;
      justify-content: flex-end;
      color: #666;
      font-size: 14px;
    }

    .notice-content {
      margin-bottom: 40px;
      min-height: 200px;
    }

    .notice-content ul {
      padding-left: 20px;
      margin: 10px 0;
    }

    .notice-content li {
      margin-bottom: 8px;
    }

    .button-container {
      display: flex;
      justify-content: center;
      margin-top: 30px;
    }

    .list-button {
      padding: 8px 24px;
      background-color: #fff;
      border: 1px solid #0064de;
      color: #0064de;
      border-radius: 4px;
      cursor: pointer;
      font-size: 14px;
      text-decoration: none;
    }

    .list-button:hover {
      background-color: #f8f9fa;
    }

    .category-label {
      display: inline-block;
      padding: 4px 8px;
      background-color: #f8f9fa;
      color: #0064de;
      border-radius: 4px;
      font-size: 14px;
      margin-right: 10px;
    }

    .bullet-point {
      color: #0064de;
      margin-right: 5px;
    }
  </style>
  <script>
    $(function (){

      $('#send').on('click', function (){
        // 입력한 모든 값을 가져온다
        const formData = $('#wform').serializeJSON();

        $.ajax({
          url : "<%=request.getContextPath()%>/member/write.do",
          contentType :"application/json; charset=utf-8",
          type : "post",
          data : JSON.stringify(formData),
          success: function(response) {
            console.log("새 글 생성 성공" + response)
            location.href = "/member/list.do";
          },
          error: function(xhr, status, error) {
            console.error("새 글 생성 실패:", error);
            console.log(xhr);
            try {
              var errorData = JSON.parse(xhr.responseText);
              alert("새 글 생성 실패: " + errorData.message);
            } catch (e) {
              alert("새 글 생성 실패. 서버 오류 발생.");
            }
          }
        })
      })


      <%--$('#send').on('click', function (){--%>
      <%--  const formData = new FormData();--%>

      <%--  formData.append('ntc_title', $('#ntc_title').val());--%>
      <%--  formData.append('ntc_contents', $('#ntc_contents').val());--%>

      <%--  const fileInput = $('input[name="file_origin_name"]')[0];--%>

      <%--  if (fileInput.files.length > 0) {--%>
      <%--    const file = fileInput.files[0];--%>

      <%--    formData.append('file_name', );--%>
      <%--    formData.append('original_file_name', file.name); // 파일 원래 이름--%>
      <%--    formData.append('file_size', file.size); // 파일 크기--%>

      <%--  }--%>
      <%--  $.ajax({--%>
      <%--    url : "<%=request.getContextPath()%>/member/write.do",--%>
      <%--    contentType :"application/json; charset=utf-8",--%>
      <%--    type : "post",--%>
      <%--    data : JSON.stringify(formData),--%>
      <%--    success: function(response) {--%>
      <%--      console.log("새 글 생성 성공" + response)--%>
      <%--      location.href = "/member/list.do";--%>
      <%--    },--%>
      <%--    error: function(xhr, status, error) {--%>
      <%--      console.error("새 글 생성 실패:", error);--%>
      <%--      console.log(xhr);--%>
      <%--      try {--%>
      <%--        var errorData = JSON.parse(xhr.responseText);--%>
      <%--        alert("새 글 생성 실패: " + errorData.message);--%>
      <%--      } catch (e) {--%>
      <%--        alert("새 글 생성 실패. 서버 오류 발생.");--%>
      <%--      }--%>
      <%--    }--%>
      <%--  })--%>
      <%--})--%>


    })
  </script>
</head>
<body>

<form id="wform" enctype="multipart/form-data">
  <div class="container">
    <div class="notice-header">
      <div class="notice-title"><h3>공지사항 등록</h3>제목  <input type="text" class="form-control" id="ntc_title" name="ntc_title"></div>
      <div class="notice-info">
<%--        <span class="category-label"><input type="file" name="file_origin_name">파일 이름 : <input type="text" id="file_name" name="file_name"> </span>--%>
      </div>
    </div>

    <div class="notice-content">내용<br>
      <textarea class="form-control" id="ntc_contents" name="ntc_contents" cols="100" rows="30"></textarea>
    </div>

    <div class="button-container">
      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="close">닫기</button>
      <button type="button" class="btn btn-primary" id="send">등록</button>
    </div>
  </div>

</form>
</body>
</html>