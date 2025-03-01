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
    <%
        Notice_BoardVO noticeBoardVO = (Notice_BoardVO) request.getAttribute("boardVO");
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
</head>
<body>

<!-- 공지사항 상세보기 -->
<%
    if(noticeBoardVO==null){

%>

<div>게시글을 찾을 수 없습니다.</div>
<%
}else {

%>
<div class="container">
    <div class="notice-header">
        <div class="notice-title"><%=noticeBoardVO.getNtc_title()%></div>
        <div class="notice-info">
            <span class="category-label">카테고리?</span>
            <%=noticeBoardVO.getMod_time()%>
        </div>
    </div>

    <div class="notice-content">
        <%=noticeBoardVO.getNtc_content()%>
    </div>

    <div class="button-container">
        <a href="/member/list.do" class="list-button">목록보기</a>
    </div>
</div>
<%
    }
%>
</body>
</html>