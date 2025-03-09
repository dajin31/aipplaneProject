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
    <link rel="stylesheet" href="../../css/1_1viewstyle.css">

    <%
        Board1_1VO boardVO = (Board1_1VO) request.getAttribute("boardVO");
    %>
    <script>

        $(document).ready(function() {

            $("#admin-rpy").click(function() {
                $(".admin-reply").slideDown(); // 답변 입력 창 보이기
                $(this).hide(); // 버튼 숨기기
            });


            $('#admin-rpy').click(function() {
                $('#rform').show(); // rform을 보이게 함
            });



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

            $(document).ready(function() {
                $("#admin-rpy").click(function() {
                    $(".admin-reply").slideDown(); // 답변 입력 창 보이기
                    $(this).hide(); // 버튼 숨기기
                });
            });
        });
        $(function (){

            $('#send').on('click', function (){
                // 입력한 모든 값을 가져온다
                const formData = $("#rform").serializeJSON();

                $.ajax({
                    url : "<%=request.getContextPath()%>/member/replywrite.do",
                    contentType :"application/json; charset=utf-8",
                    type : "post",
                    data : JSON.stringify(formData),
                    success: function(response) {
                        console.log("답변 성공" + response)
                        location.reload();
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

            $('#delete').click(function() {
                const board_id = $(this).data("board_id");
                console.log(board_id)
                alert(board_id + " 번 글을 삭제")
                $.ajax({
                    url  : "<%=request.getContextPath()%>/member/delete1_1.do",
                    type : "post",
                    data : {"board_id" : board_id},
                    success : function(data){
                        if(data.result>0){
                            console.log(board_id + "번 게시글이 삭제되었습니다.");
                            location.href = "<%=request.getContextPath()%>/member/list1_1.do?"
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


            $('#rpydelete').click(function() {
                const board_id = $(this).data("board_id");
                alert(board_id + " 답변 삭제")
                $.ajax({
                    url  : "<%=request.getContextPath()%>/member/replydelete.do",
                    type : "post",
                    data : {"board_id" : board_id},
                    success : function(data){
                        if(data.result>0){
                            console.log(board_id + "번 게시물 답변이 삭제되었습니다.");
                            location.href = "<%=request.getContextPath()%>/member/view1_1.do?board_id=<%=boardVO.getBoard_id()%>";
                        }else{
                            console.log("답변 삭제 오류~~")
                        }

                    },
                    error : function(xhr){
                        alert("상태 : " + xhr.status)
                    },
                    dataType : 'json'
                });
            });

        })

        $('#updatesend').on('click', function (){
            location.href = "<%=request.getContextPath()%>/member/view1_1.do?board_id=<%=boardVO.getBoard_id()%>";
        })


    </script>
    <%

        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
         Reply1_1VO replyVO = (Reply1_1VO) request.getAttribute("replyVO");
    %>
</head>
<body>
<div class="notice-board">
    <h1 class="board-title">1대1 문의사항</h1>
    <div class="divider"></div>

    <div class="notice-item">
        <div class="notice-header">
            <div class="notice-title"><%=boardVO.getInd_title()%></div>
            <div class="notice-meta">
                <div class="notice-date"><%=boardVO.getCrt_date()%></div>
            </div>
        </div>

        <div class="divider"></div>

        <div class="notice-content">
            <%=boardVO.getInd_contents()%>
        </div>

        <%
            if(loginUser.getUserId().equals(boardVO.getUser_id())){
        %>
        <div class="button-container">
        <button type="button" class="list-button">
            <a href="<%=request.getContextPath()%>/member/update1_1.do?board_id=<%=boardVO.getBoard_id()%>" id="update">수정</a>
        </button>

            <button type="button" id="delete" data-board_id="<%=boardVO.getBoard_id()%>">삭제</button>

        </div>
        <%
            }
        %>


        <%
            if (loginUser.getMemCode().equals("admin") && replyVO == null){
        %>

        <div class="button-container">
            <button type="button" id="admin-rpy">관리자 답변 등록</button>
        </div>

        <!-- 관리자 답변 영역 추가 -->
        <form id="rform">
        <div class="admin-reply">
            <input type="hidden" id="board_id" name="board_id" value="<%=boardVO.getBoard_id()%>">
            <input type="hidden" id="user_id" name="user_id" value="<%=loginUser.getUserId()%>">
            <div class="admin-reply-header">
                <div class="admin-reply-title">관리자 답변</div>
            </div>
            <div class="admin-reply-content">
                <textarea class="form-control" id="rpy_contents" name="rpy_contents" cols="100=" rows="15"></textarea>
            </div>

        <div class="button-container">
            <button type="button" id="send" class="button" >등록</button>
        </div>
        </div>
        </form>
        <%
            }
            if(replyVO != null){
        %>
        <div class="admin-reply">
            <div class="admin-reply-header">
                <div class="admin-reply-title">관리자 답변</div>
                <div class="admin-reply-date"><%=replyVO.getCrt_time()%></div>
            </div>
            <div class="admin-reply-content">
              <%=replyVO.getRpy_contents()%>
            </div>
        </div>

        <%
            }
        %>
        <%
            if (loginUser.getMemCode().equals("admin") && replyVO != null){
        %>
        <div class="button-container">
            <button type="button" id="updatesend" class="button" >
                <a href="<%=request.getContextPath()%>/member/replyupdate.do?board_id=<%=boardVO.getBoard_id()%>" id="updatebtn">답변 수정</a>
            </button>
        </div>
        <div class="button-container">
            <button type="button" id="rpydelete" class="button" data-board_id="<%=boardVO.getBoard_id()%>">답변 삭제</button>
        </div>
        <%
            }
        %>


        <a href="<%=request.getContextPath()%>/member/list1_1.do" class="button">목록보기</a>
    </div>
</div>
</body>
</html>