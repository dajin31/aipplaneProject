<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userId = request.getParameter("userId");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 결과</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 50%;
            margin: 100px auto;
            padding: 50px;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            border-radius: 10px;
        }
        .message {
            font-size: 18px;
            color: #333;
        }
        .id-result {
            font-size: 24px;
            font-weight: bold;
            color: #007bff;
            margin-top: 20px;
        }
        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 20px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">  <%-- ✅ container 추가 --%>
    <h1>아이디 찾기 결과</h1>
    <p class="message">찾은 아이디:</p>
    <p class="id-result"><%= userId != null ? userId : "아이디를 찾을 수 없습니다." %></p>
    <a href="<%=request.getContextPath()%>/user/login.jsp" class="btn">로그인 페이지로 돌아가기</a>
</div>
</body>
</html>
