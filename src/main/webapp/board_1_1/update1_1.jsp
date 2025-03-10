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
    <link rel="stylesheet" href="/css/1_1viewstyle.css">
<%
    Board1_1VO boardVO = (Board1_1VO) request.getAttribute("boardVO");
%>
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
            $('#send').on('click', function (){
                // 입력한 모든 값을 가져온다
                const formData = $("#wform").serializeJSON();


                $.ajax({
                    url : "<%=request.getContextPath()%>/member/update1_1.do",
                    contentType :"application/json; charset=utf-8",
                    type : "post",
                    data : JSON.stringify(formData),
                    success: function(response) {
                        console.log("답변 성공" + response)
                        location.href = "<%=request.getContextPath()%>/member/view1_1.do?board_id=<%=boardVO.getBoard_id()%>";

                    },
                    error: function(xhr, status, error) {
                        console.error("답변 생성 실패:", error);
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
        Reply1_1VO replyVO = (Reply1_1VO) request.getAttribute("replyVO");
    %>
</head>
<body>
<form id="wform">
    <div class="notice-board">
        <h1 class="board-title">1대1 문의사항</h1>
        <div class="divider"></div>

        <div class="notice-item">
            <div class="notice-header">]
                <input type="hidden" id="board_id" name="board_id" value="<%=boardVO.getBoard_id()%>">
                <div class="notice-title">제목 : <input type="text" id="ind_title" name="ind_title" value="<%=boardVO.getInd_title()%>"></div>
                <div class="notice-meta">
                    <div class="notice-date"><%=boardVO.getCrt_date()%></div>
                </div>
            </div>

            <div class="divider"></div>

            <div class="notice-content">
                <textarea class="form-control" id="ind_contents" name="ind_contents" cols="100" rows="30"> <%=boardVO.getInd_contents()%></textarea>
            </div>

            <%
                if(loginUser.getUserId().equals(boardVO.getUser_id())){
            %>
            <button type="button" id="send" class="button">수정</button>
            <%
                }
            %>
        </div>
    </div>
</form>

<%--<%--%>
<%--    if (loginUser.getMemCode().equals("admin") && replyVO == null){--%>
<%--%>--%>
<%--<form id="rform">--%>
<%--    <div class="admin-reply">--%>
<%--        <input type="hidden" id="board_id" name="board_id" value="<%=boardVO.getBoard_id()%>">--%>
<%--        <input type="hidden" id="user_id" name="user_id" value="<%=loginUser.getUserId()%>">--%>
<%--        <div class="admin-reply-header">--%>
<%--            <div class="admin-reply-title">관리자 답변</div>--%>
<%--            <div class="admin-reply-date">2025.02.25</div>--%>
<%--        </div>--%>
<%--        <div class="admin-reply-content">--%>
<%--            <textarea class="form-control" id="rpy_contents" name="rpy_contents" cols="100" rows="15"><%=replyVO != null ? replyVO.getRpy_contents() : ""%></textarea>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="button-container">--%>
<%--        <button type="button" id="send" class="button">등록</button>--%>
<%--    </div>--%>
<%--</form>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>

<a href="<%=request.getContextPath()%>/member/list1_1.do" class="button">목록보기</a>

</body>
</html>