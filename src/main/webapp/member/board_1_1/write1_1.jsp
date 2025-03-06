<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.demo.vo.Notice_BoardVO" %>
<%@ page import="com.example.demo.vo.UserVO" %>
<%@ page import="com.example.demo.vo.Board1_1VO" %>
<%@ page import="java.util.jar.Attributes" %>
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
    <script>
        $(function (){

            $('#send').on('click', function (){
                // 입력한 모든 값을 가져온다
                const formData = $('#wform').serializeJSON();

                $.ajax({
                    url : "<%=request.getContextPath()%>/member/write1_1.do",
                    contentType :"application/json; charset=utf-8",
                    type : "post",
                    data : JSON.stringify(formData),
                    success: function(response) {
                        console.log("새 글 생성 성공" + response)
                        location.href = "/member/list1_1.do";
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

        })
    </script>
    <%
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
    %>
</head>
<body>
<form id="wform">
<div class="notice-board">
    <h1 class="board-title">문의글 작성</h1>
    <div class="divider"></div>

    <div class="notice-item">
        <div class="notice-header">
            <div class="notice-title">제목 : <input type="text" id="ind_title" name="ind_title"></div>
            <div class="notice-meta">
                <div class="notice-tag">문의 종류 : <select name="stype">
                    <option value="">예약</option>
                    <option value="">마일리지</option>
                    <option value="">변경/환불</option>
                    <option value="">예약/좌석배정</option>
                </select></div>
                <div class="notice-date">2025.02.24</div>
            </div>
        </div>

        <div class="divider"></div>

        <div class="notice-content">
            <textarea class="form-control" id="ind_contents" name="ind_contents" cols="100" rows="30">내용</textarea>
        </div>

        <div class="button-container">
            <button type="button" id="send" class="button">등록</button>
            <a href="/member/board_1_1/list1_1.jsp" class="button">목록보기</a>
        </div>
    </div>
</div>
</form>
</body>
</html>