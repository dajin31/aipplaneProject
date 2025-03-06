<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.demo.vo.Notice_BoardVO" %>
<%@ page import="com.example.demo.vo.UserVO" %>
<%@ page import="com.example.demo.vo.Board1_1VO" %>
<%@ page import="com.example.demo.vo.Reply1_1VO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <script src="/js/jquery.serializejson.js"></script>
    <style>
        /* 전체 공지사항 컨테이너 */
        .notice-board {

            max-width: 1000px;
            margin: 0 auto;
            font-family: 'Noto Sans KR', sans-serif;
            color: #333;
            line-height: 1.6;
        }

        /* 공지사항 제목 */
        .board-title {
            padding-top: 30px;
            font-size: 24px;
            /*//font-weight: bold;*/
            margin-bottom: 15px;
        }

        /* 구분선 */
        .divider {
            border-bottom: 1px solid #ddd;
            margin: 15px 0;
        }

        /* 공지 항목 */
        .notice-item {
            margin-bottom: 30px;
        }

        /* 공지 제목 영역 */
        .notice-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        /* 공지 제목 */
        .notice-title {
            font-size: 16px;
            font-weight: bold;
            color: #000;
            flex-grow: 1;
        }

        /* 공지 메타 정보 */
        .notice-meta {
            display: flex;
            align-items: center;
        }

        /* 여행정보 태그 */
        .notice-tag {
            background-color: #f8f8f8;
            padding: 3px 10px;
            border-radius: 4px;
            font-size: 13px;
            margin-right: 10px;
        }

        /* 날짜 정보 */
        .notice-date {
            color: #666;
            font-size: 14px;
        }

        /* 공지 내용 */
        .notice-content {
            margin-bottom: 20px;
            line-height: 1.8;
            border-bottom: 1px solid #ddd;
        }

        /* 공지 내용의 단락 */
        .notice-content p {

            margin-bottom: 15px;
        }

        /* 공지 내용의 리스트 */
        .notice-content ul {
            padding-left: 20px;
            margin-bottom: 15px;
        }

        .notice-content li {
            margin-bottom: 10px;
            position: relative;
            padding-left: 15px;
        }

        .notice-content li::before {
            content: "•";
            position: absolute;
            left: 0;
            color: #666;
        }

        /* 들여쓰기된 리스트 */
        .notice-content li li {
            margin-top: 8px;
            padding-left: 15px;
        }

        .notice-content li li::before {
            content: "-";
        }

        /* 관리자 답변 영역 */
        .admin-reply {
            padding-top: 50px;
            margin-top: 30px;
            margin-bottom: 30px;
        }

        /* 관리자 답변 헤더 */
        .admin-reply-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f0f0f0;
            padding: 10px 15px;
            border-radius: 4px 4px 0 0;
        }

        /* 관리자 답변 제목 */
        .admin-reply-title {
            font-weight: bold;
        }

        /* 관리자 답변 날짜 */
        .admin-reply-date {
            font-size: 14px;
            color: #666;
        }

        /* 관리자 답변 내용 */
        .admin-reply-content {
            border: 1px solid #ddd;
            border-top: none;
            padding: 20px;
            min-height: 100px;
            background-color: #fff;
            border-radius: 0 0 4px 4px;
        }

        /* 버튼 스타일 */
        .button {
            display: inline-block;
            padding: 8px 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 20px;
            color: #333;
            text-decoration: none;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.2s;
        }

        .button:hover {
            background-color: #f5f5f5;
        }

        /* 버튼 컨테이너 */
        .button-container {
            text-align: right;
            margin-top: 20px;
        }

        /* 강조 텍스트 */
        .highlight {
            color: #da291c; /* 대한항공 레드 컬러 */
            font-weight: bold;
        }

        /* 링크 스타일 */
        a {
            color: #0056b3;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
    <%
        Board1_1VO boardVO = (Board1_1VO) request.getAttribute("boardVO");
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
//        Reply1_1VO replyVO = (Reply1_1VO) request.getSession("replyVO");
    %>
</head>
<body>
<div class="notice-board">
    <h1 class="board-title">공지사항</h1>
    <div class="divider"></div>

    <div class="notice-item">
        <div class="notice-header">
            <div class="notice-title"><%=boardVO.getInd_title()%></div>
            <div class="notice-meta">
                <div class="notice-tag">여행정보</div>
                <div class="notice-date"><%=boardVO.getCrt_date()%></div>
            </div>
        </div>

        <div class="divider"></div>

        <div class="notice-content">
            <%=boardVO.getInd_contents()%>
        </div>

        <!-- 관리자 답변 영역 추가 -->
        <div class="admin-reply">
            <div class="admin-reply-header">
                <div class="admin-reply-title">관리자 답변 내용</div>
                <div class="admin-reply-date">2025.02.25</div>
            </div>
            <div class="admin-reply-content">
                <p>안녕하세요, 대한항공입니다.</p>
                <p>전자입국신고 관련하여 추가 정보를 안내해 드립니다.</p>
                <p>모바일 앱을 통한 신고도 가능하며, 앱스토어 또는 구글 플레이에서 'Korea e-Travel'을 검색하여 설치하실 수 있습니다.</p>
                <p>추가 문의사항이 있으시면 고객센터(1588-2001)로 연락 주시기 바랍니다.</p>
                <p>감사합니다.</p>
            </div>
        </div>

        <div class="button-container">
            <a href="#" class="button">목록보기</a>
        </div>
    </div>
</div>
</body>
</html>