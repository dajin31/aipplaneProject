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
        Notice_BoardVO noticeBoardVO = (Notice_BoardVO) request.getAttribute("nboardVO");
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
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
            box-shadow: 0 1px 3px rgba(0,0,0,0.3);
        }

        .notice-header {
            margin-top: 10px;
            margin-bottom: 30px;
            border-bottom: 1px solid #A4A4A4;
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

        $(document).ready(function() {
            // 세션에서 로그인 상태 확인
            const isLoggedIn = ${sessionScope.loginUser != null};
            const userName = "${sessionScope.loginUser.userName}";

            if (isLoggedIn) {
                $(".header-before-login").hide();
                $(".header-after-login").removeClass("hidden");
                $(".welcome-msg").text(userName + "님 환영합니다.");
            } else {
                $(".header-before-login").show();
                $(".header-after-login").addClass("hidden");
            }

            // 로그아웃 후 페이지 리로드
            $(".logout-btn").click(function(event) {
                event.preventDefault(); // 기본 링크 동작 방지
                if (confirm("로그아웃 하시겠습니까?")) {
                    location.href = "<%=request.getContextPath()%>/user/logout.do";
                }
            });
        });
        $(function (){

            $('#delete').click(function() {
                const ntc_board = $(this).data("num");
                console.log(ntc_board)
                alert(ntc_board + " 번 글을 삭제")
                $.ajax({
                    url  : `<%=request.getContextPath()%>/member/delete.do`,
                    type : 'post',
                    data : {"ntc_board" : ntc_board},
                    success : function(data){
                        if(data.result>0){
                            console.log(ntc_board + "번 게시글이 삭제되었습니다.");
                            location.href = "<%=request.getContextPath()%>/member/list.do";
                        }else{
                            console.log("게시글 삭제 오류~~")
                        }

                    },
                    error : function(xhr){
                        alert("상태 : " + xhr.status)
                    },
                    dataType : 'json'
                });
            });
        })
    </script>
</head>
<body>
<%

    if (loginUser != null && loginUser.getUserId() != null) {
        System.out.println("list" + loginUser.getUserId());
        System.out.println("list" + loginUser.getMemCode());
    } else {
        // loginUser가 null인 경우 처리 (예: 로그인 페이지로 리다이렉트)
        out.println("<script>console.log('loginUser is null');</script>"); // 콘솔 로그
    }
%>

<div class="container">
    <div class="notice-header">공지사항
        <div class="notice-title"><%=noticeBoardVO.getNtc_title()%></div>
        <div class="notice-info">
            <span class="category-label">카테고리?</span>
            <%=noticeBoardVO.getCrt_time()%>
        </div>
    </div>

    <div class="notice-content">
        <%=noticeBoardVO.getNtc_contents()%>
    </div>

    <div class="button-container">
        <a href="/member/list.do" class="list-button">목록보기</a>

<%--        <%--%>
<%--            if(loginUser.getMemCode().equals("admin")){--%>
<%--        %>--%>
<%--        <button type="button"  class="list-button" > <a href="<%=request.getContextPath() %>/member/update.do?ntc_board=<%=noticeBoardVO.getNtc_board()%>" id="update">수정</a></button>--%>
<%--        <button type="button" data-num="<%=noticeBoardVO.getNtc_board() %>" class="list-button" id="delete">삭제</button>--%>
<%--        <%--%>
<%--            }else{--%>
<%--                --%>
<%--            }--%>
<%--        %>--%>

        <%
            if (loginUser != null && "admin".equals(loginUser.getMemCode())) {
        %>
        <button type="button" class="list-button">
            <a href="<%=request.getContextPath()%>/member/update.do?ntc_board=<%=noticeBoardVO.getNtc_board()%>" id="update">수정</a>
        </button>
        <button type="button" data-num="<%=noticeBoardVO.getNtc_board()%>" class="list-button" id="delete">삭제</button>
        <%
            }
        %>

    </div>
</div>

</body>
</html>