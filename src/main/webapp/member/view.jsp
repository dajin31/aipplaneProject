<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세</title>
    <link rel="stylesheet" href="viewstyle.css">
    <style>

    </style>
</head>
<body>

<div class="container">
    <div class="title">공지사항</div>
    <div class="divider"></div>

    <div class="info">
        <div>
            <span class="notice-title">공지사항 이상한 내용</span>
            <span class="category">공지사항 주제</span>
        </div>
        <div class="date">2025.02.16</div>
    </div>

    <div class="content-box">
        공지사항 내용입니다.<br><br>
        이것은 공지사항 내용입니다.<br><br>
        공지 사항 내용입니다. 이것은
    </div>

    <div class="button-box">
        <div class="left-buttons">
            <button class="btn">목록보기</button>
        </div>
        <div class="right-buttons">
            <button class="btn btn-danger">등록</button>
            <button class="btn btn-danger">삭제</button>
        </div>
    </div>
</div>

</body>
</html>
