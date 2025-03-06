<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.vo.ReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/board.css">
	<title>Insert title here</title>
	
	
	<script src="<%=request.getContextPath() %>/js/jquery-3.7.1.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js"></script>

	<style type="text/css">
	th {
		text-align : center;
	}
	
	.p4 {
		display : none;
	}
	</style>
<%
	//세션 로그인 값 
	MemberVO loginMemberVo = (MemberVO)session.getAttribute("loginMember");

	// 게시글 정보
	BoardVO boardVo = (BoardVO)request.getAttribute("boardVo");
	// 댓글 목록
	List<ReplyVO> replyList = (List<ReplyVO>)request.getAttribute("replyList");
	
%>
	<script>
<%
	if(loginMemberVo==null){
%>
		alert("로그인 후 사용하세요...");
		location.href = "<%=request.getContextPath()%>/board/boardList.do";
<%		
	}
%>
	
	$(function(){
		
		//---------------------------------------  
		// 페이지번호 클릭 이벤트 
		$(document).on('click', '.pageno', function(){
			$("#page").val( parseInt($(this).text()));
			$("#searchForm").submit();
		}) ;  
			
		// 다음 버튼 클릭 이벤트 
		$(document).on('click', '#next', function(event){
			$("#page").val( parseInt($('.pageno').last().text()) + 1);
			$("#searchForm").submit();
		});
			
		// 이전 버튼 클릭 이벤트
		$(document).on('click', '#prev', function(){
			$("#page").val( parseInt($('.pageno').first().text()) - 1);
			$("#searchForm").submit();
		});
			 
		// 검색 이벤트 
		$('#search').on('click', function(){
			$("#page").val(1);
			$("#searchForm").submit();
		});
		// 검색 이벤트 
		$('#list').on('click', function(){
			$("#page").val(1);
			$("#searchForm").submit();
		});
		
		// 게시글 삭제 버튼 
		$("#deleteBtn").on("click", function(){
			const num = $(this).data("num");
			alert(num + " 번 글을 삭제")
			$.ajax({
				url  :  `<%=request.getContextPath()%>/board/boardDelete.do`,
				type : 'get',
				data : {"num" : num},
				success : function(data){
					if(data.result>0){
						alert(num + "번 게시글이 삭제되었습니다.");
						location.href = "<%=request.getContextPath()%>/board/boardList.do";
					}else{
						alet("게시글 삭제 오류~~")
					}
					
				},
				error : function(xhr){
				alert("상태 : " + xhr.status)
				},
				dataType : 'json'
			});
			
		});
		
		// 게시글 수정 버튼 
		$("#updateBtn").on("click", function(){
// 			const num = $(this).data("num");
// 			alert(num + " 번 글을 수정")
			
			//수정 모달창 띄우기 
			$('#uModal').modal('show');
		});
		
		// 게시글 수정 모달 창의 '전송'버튼
		$('#usend').on('click', function(){
		
			const formData = $('#uform').serializeJSON();
			console.log(formData);
			
			//서버로 보내기  - board.js의 script함수 호출
			//Db 수정 완료후  -success의 콜백에서 fdata의 내용으로 화면을 변경한다
			 
			$.ajax({ 
				url :   `<%=request.getContextPath()%>/board/boardUpdate.do`,
				type : 'post',
				data : JSON.stringify(formData),
				contentType : 'application/json;charset=utf-8',
				success : function(data){
					if(data.result>0){
						alert("게시글 수정이 완료되었습니다.");
						location.href= "<%=request.getContextPath()%>/board/boardView.do?num=" + formData.num;
					}else{
						alet("게시글 수정 오류~~")
					}
				},
				error : function(xhr){
					alert("상태 : " + xhr.status)
				},
				dataType : 'json'
				
			});
			
			//입력된 내용 지우기 
			$('#uform .txt').val("");
			
			//모달창 닫기 
			$('#uModal').modal('hide'); 
		});
		
		//=========================================================================
		// 댓글 등록 버튼
		$("#replyWriteBtn").on("click", function(){
			//댓글저장을 위해 입력한 내용, 게시글번호bonum, 이름 
		<%
			String memId = "";
			if(loginMemberVo==null){
		%>
				alert("로그인 후 사용하세요...");
				location.href = "<%=request.getContextPath()%>/board/boardList.do";
		<%		
			}else{
				memId = loginMemberVo.getMem_id();
			}
		%>
			
			const num = $(this).data("num");
			const reply = {
				bonum : num,
				cont : $("#replyCont").val(),
				mem_id : "<%=memId%>"
			};
			
			$.ajax({
				url : `<%=request.getContextPath()%>/board/replyWrite.do`,
				type : 'post',
				data : JSON.stringify(reply),
				contentType : 'application/json;charset=utf-8',
				success : function(data){
					if(data.result>0){
						location.href= "<%=request.getContextPath()%>/board/boardView.do?num=" + num;
					}else{
						alet("댓글 쓰기 오류~~")
					}
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				},
				dataType : 'json'
			});
		});
		
		// 댓글 삭제 버튼
		$(document).on('click', '.reDeleteBtn', function(){
			const renum = $(this).data("renum");
			const num = $(this).data("num");
			
			$.ajax({
				url  :  `<%=request.getContextPath()%>/board/replyDelete.do`,
				type : 'post',
				data : "renum=" + renum,
				success : function(data){
					if(data.result>0){
						location.href= "<%=request.getContextPath()%>/board/boardView.do?num=" + num;
					}else{
						alet("댓글 삭제 오류~~")
					}
				},
				error : function(xhr){
					alert("상태 : " + xhr.status)
				},
				dataType : 'json'
			})
		});
		
		
		// 댓글 수정 버튼
		$(document).on('click', '.reModifyBtn', function(){
			const renum = $(this).data("renum");
			const num = $(this).data("num");
			
			// 댓글 수정 폼이 열려있으면 우선 닫고 작업한다.
			if($('#modifyform').css('display') != "none"){
	    		replyReset();   
	    	}
	    	 
			//버튼을 기준으로 .p3을 찾는다
	    	vp3 = $(this).parents('.reply-body').find('.p3') 
	   	
			//원래 내용을 가져온다  - 댓글 수정폼에서 취소 버튼 클릭시에 
			//원래대로 돌아오게 하기 위해서 보관하고 있어야 한다 - 요 내용을 다시 .p3에 출력 -  필요
	         modifycont = vp3.html().trim();
	    	
	    	console.log('modifycont====', modifycont);
	    	
	    	////////////-----------------------------////////////
	    	//원래내용의 <br>태그를 \n으로 변경- modifyform (수정폼)의 textarea에 출력 
	    	mcont = modifycont.replace(/<br>/g, "\n")
	    	$('#modifyform textarea').val(mcont);
	    	
	    	//수정폼을 body에서 p3으로 이동 
	    	vp3.empty().append($('#modifyform'));
	    	
	    	$('#modifySendBtn').attr("data-renum", renum);
	    	$('#modifySendBtn').attr("data-num", num);
	    	
	    	//수정폼을 보이기 
	    	$('#modifyform').show();
		});
		
		// 댓글 수정폼의 확인 버튼 
		$("#modifySendBtn").on("click", function(){
			const renum = $(this).attr("data-renum");
			const num = $(this).attr("data-num");
			const reCont = $("#modifyCont").val()
			
			const reply = {
					renum : renum,
					cont : reCont
				};
			console.log("reply", reply);
			
			$.ajax({
				url  :  `<%=request.getContextPath()%>/board/replyUpdate.do`,
				type : 'post',
				data : JSON.stringify(reply),
				contentType : 'application/json;charset=utf-8',
				success : function(data){
					$('#modifySendBtn').removeAttr("data-renum");
			    	$('#modifySendBtn').removeAttr("data-num");
					if(data.result>0){
						location.href= "<%=request.getContextPath()%>/board/boardView.do?num=" + num;
					}else{
						alet("댓글 쓰기 오류~~")
					}
				},
				error : function(xhr){
					alert("상태 : " + xhr.status)
				},
				dataType : 'json'
			})
		});
		
		// 댓글 수정폼의 취소 버튼
		$("#resetBtn").on("click", function(){
			replyReset();
		});
		
		
	});   // $(function()) 끝...
	
	// 열려있는 수정폼을 닫아 주는 함수
	const replyReset = function(){
		//수정폼을 기준으로 .p3을 찾는다 
		vp3 = $('#modifyform').parent();
		
		//수정폼을 body로 이동 - 안보이게 설정 
		$('body').append($('#modifyform'));
		$('#modifyform').hide();
		
		//원래내용 - 댓글수정버튼 클릭시점의 내용-  modifycont을 p3으로 다시 출력 
		$(vp3).html(modifycont);
	}

</script>
</head>


<body>
<br><br>

<h3 style="text-align:center;">게 시 판 연 습</h3>

<jsp:include page="/WEB-INF/view/member/loginProcess.jsp" />

<nav class="navbar navbar-expand-sm navbar-dark bg-info bg-opacity-25">
	<div class="container-fluid">
		<input type="button" id="list" class="controlBtn btn btn-primary"  value="리스트 보기">
		
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="mynavbar">
		    <ul class="navbar-nav me-auto">
				<li class="nav-item">&nbsp;</li>
		    </ul>
		    <form class="d-flex" id="searchForm" action="<%=request.getContextPath() %>/board/boardList.do">
		    	<input type="hidden" id="page" name="page" value="1">
			    <select class="form-select mx-2" name="stype" id="stype">
					<option value="">전체</option>
					<option value="writer" >작성자</option>
					<option value="subject">제목</option>
					<option value="content">내용</option>
				</select>
				<input class="form-control mx-2" type="text" name="sword" id="sword" placeholder="Search" value="">
				<button type="button" id="search" class="btn btn-success mx-2"> 검 색 </button>
			</form>
	  	</div>
	</div>
</nav>
<div id="result"  class="ms-5 me-5">
<%
	if(boardVo==null){
%>
	<script> history.go(-1); </script>
<%		
	}else {
		
%>
	<table class="table table-striped">
	<tbody>
	   	<tr>
	   		<th class="table-dark">번 호</th><td><%=boardVo.getNum() %></td>
		</tr>
	   	<tr>
	   		<th class="table-dark">제 목</th><td><%=boardVo.getSubject() %></td>
		</tr>
	   	<tr>
	   		<th class="table-dark">작성자</th><td><%=boardVo.getMemVo().getMem_name() %></td>
		</tr>
	   	<tr>
	   		<th class="table-dark">조회수</th><td><%=boardVo.getHit() %></td>
		</tr>
	   	<tr>
	   		<th class="table-dark">날 짜</th><td><%=boardVo.getWdate() %></td>
		</tr>
	   	<tr>
	   		<th class="table-dark">E-Mail</th><td><%=boardVo.getMail() %></td>
		</tr>
	   	<tr>
	   		<th class="table-dark" style="vertical-align: middle;">내 용</th>
	   		<td><%=boardVo.getContent().replaceAll("(\r\n|\r|\n)", "<br>") %></td>
		</tr>
<%
	//로그인한 회원과 게시글 쓴 회원이 같으면 버튼 출력
	if(loginMemberVo!=null && boardVo.getWriter().equals(loginMemberVo.getMem_id())){
%>
	   	<tr>
	   		<td colspan="2" style="text-align:center;">
	   			<input type="button" data-num="<%=boardVo.getNum() %>" id="deleteBtn" value="삭제">
				<input type="button" data-num="<%=boardVo.getNum() %>" id="updateBtn" value="수정">
	   		</td>
		</tr>
<%		
	}
%>
	   	<tr>
	   		<td colspan="2" style="text-align:center;">
				<textarea rows="" cols="25" id="replyCont"></textarea>
				<input type="button" data-num="<%=boardVo.getNum() %>" id="replyWriteBtn" value="등록">
	   		</td>
		</tr>
		
		
		
<%	   
	} // else문 끝...
%>
	</tbody>
 	</table>
 	<hr color="red">
 <%
 	if(replyList!=null && replyList.size()>0){
%>
	<div class="container mt-3">
<%
		for(ReplyVO replyVo : replyList){
%>
		<div class="reply-body">
			<div class="p12">  
				<p class="p1">
					작성자 : <span id="rwr"><%=replyVo.getMemVo().getMem_name() %></span>&nbsp;&nbsp;&nbsp; 
					날짜 : <span id="rda"><%=replyVo.getRedate() %></span>&nbsp;&nbsp;&nbsp;
				</p>
				<p class="p2">
<%
			// 로그인한 회원과 댓글 쓴 회원이 같으면 버튼 출력
			if(loginMemberVo!=null && replyVo.getMem_id().equals(loginMemberVo.getMem_id())){
%>
					<input type="button" data-renum="<%=replyVo.getRenum() %>" data-num="<%=replyVo.getBonum() %>" class="reDeleteBtn" value="댓글삭제">
					<input type="button" data-renum="<%=replyVo.getRenum() %>" data-num="<%=replyVo.getBonum() %>" class="reModifyBtn" value="댓글수정">

<%		
			}  // if문 끝...
%>
				</p>
			</div>
			<p class="p3">
				<%=replyVo.getCont().replaceAll("(\r\n|\r|\n)", "<br>") %>
			</p>
	 	</div>
<%			
		}	// for문 끝...
%>	
	 	
 	</div>
 	<br><br>
<% 		
 	}	// if문 끝...
 %>
 	
</div>

<!-- 댓글 수정폼 시작 -->
<div id="modifyform">
	<textarea rows="5" cols="50" id="modifyCont"></textarea>
	<input type="button" value="확인" id="modifySendBtn">
	<input type="button" value="취소" id="resetBtn">
</div>
<!-- 댓글 수정폼 끝 -->

<!----- 글 수정  The Modal    ----->
<div class="modal" id="uModal">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<!-- Modal Header -->
			<div class="modal-header bg-warning">
				<h4 class="modal-title">게시글 수정하기</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			   
			<!-- Modal body -->
			<div class="modal-body">
			 
				<form name="ufrom" id="uform">
					<input type="hidden" id="unum" name="num" value="<%=boardVo.getNum() %>">
					
					<label for="writer">이름</label>
					<input type="text" class="form-control txt" id="uwriter" name="writer"  value="<%=boardVo.getWriter() %>"  readonly> <br> 
					
					<label for="subject">제목</label>
					<input type="text" class="form-control txt" id="usubject" name="subject" value="<%=boardVo.getSubject() %>" > <br> 
					
					<label for="mail">메일</label>
					<input type="text"  class="form-control txt" id="umail" name="mail" value="<%=boardVo.getMail() %>" > <br> 
					
					<label for="password">비밀번호</label>
					<input type="password"  class="form-control txt" id="upassword" name="password"> <br> 
					
					<label for="content">내용</label>
					<textarea rows="5" cols="40"  class="form-control txt" id="ucontent"  name="content"><%=boardVo.getContent() %></textarea>
					<br>
					<br>
					<div class="d-grid gap-2 col-6 mx-auto">
						<input type="button" class="btn btn-primary" value=" 전 송 " id="usend">
					</div>
				</form>
			 
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			</div>
		
		</div>
	</div>
</div>
<!----- 글 수정  The Modal 끝...    ----->

</body>
</html>