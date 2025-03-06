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

    <%
        Notice_BoardVO noticeBoardVO = (Notice_BoardVO) request.getAttribute("nboardVO");
    %>
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
        $(function(){
            $('#send').on('click', function (){
                // 입력한 모든 값을 가져온다
                const formData = $('#wform').serializeJSON();
                console.log(formData)
                $.ajax({
                    url : "<%=request.getContextPath()%>/member/update.do",
                    contentType :"application/json; charset=utf-8",
                    type : "post",
                    data : JSON.stringify(formData),
                    success: function(response) {
                        if(response.result>0){
                            console.log("수정 성공" , response)
                            location.href = "/member/list.do";
                        }else{
                            console.error("수정 실패:");
                        }

                    },
                    error: function(xhr, status, error) {
                        console.error("수정 실패:", error);
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
        });
    </script>
</head>
<body>

<form id="wform">
<div class="container">
    <div class="notice-header">
        <input type="hidden" id="ntc_board" name="ntc_board" value="<%=noticeBoardVO.getNtc_board()%>">
        <div class="notice-title"><h4>공지사항 수정</h4> 제목 <input type="text" class="form-control" id="ntc_title" name="ntc_title"
                                                             value="<%=noticeBoardVO.getNtc_title()%>"></div>
        <div class="notice-info">
            <span class="category-label">카테고리?</span>
            <%=noticeBoardVO.getCrt_time()%>
        </div>
    </div>

    <div class="notice-content">내용<br>
        <textarea class="form-control" id="ntc_contents" name="ntc_contents" cols="100" rows="30"><%=noticeBoardVO.getNtc_contents()%></textarea>
    </div>

    <div class="button-container">
<%--       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="close">닫기</button>--%>
        <button type="button" class="btn btn-primary" id="send">저장</button>
    </div>
</div>
</form>

</body>
</html>