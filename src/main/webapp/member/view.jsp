<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.demo.vo.Notice_BoardVO" %>
<%@ page import="com.example.demo.vo.UserVO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세</title>
    <link rel="stylesheet" href="viewstyle.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <%
        Notice_BoardVO noticeBoardVO = (Notice_BoardVO) request.getAttribute("boardVO");
    %>
    <script>

        $(function (){

        })
    </script>
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
<div id="wModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">공지사항</h5>
                </button>
            </div>
            <div class="modal-body">
                <form id="wfrom">
                    <div class="form-group">
                        <label for="title">공지사항 주제</label>
                        <div id="title"><%=noticeBoardVO.getNtc_title()%></div>
                    </div>
                    <div class="form-group">
                        <label for="content">내용</label>
                        <div id="content"><%=noticeBoardVO.getNtc_content()%></div>
                    </div>
                    <input type="hidden" name="crt_time" value="<%=noticeBoardVO.getMod_time()%>">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="close">닫기</button>
            </div>
        </div>
    </div>
</div>
<%
    }
%>


</body>
</html>
