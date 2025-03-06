<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.vo.PageVO"%>
<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/board.css">
	
	<script src="<%=request.getContextPath() %>/js/jquery-3.7.1.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<script src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js"></script>

<%
//세션 로그인 값 
MemberVO loginMemberVo = (MemberVO)session.getAttribute("loginMember");

%>
<script>

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
	})
	
	// 글쓰기 이벤트- 모달창 띄우기
	$('#write').on('click', function(){
<%
	if(loginMemberVo==null){
%>
		alert("로그인 하세요");
<%		
	}else{
%>
		$('#wModal').modal('show');
		$('#wModal #writer').val("<%=loginMemberVo.getMem_id()%>");
<%		
	}
%>		

	})
		
	// 글쓰기 모달창에서 데이타 입력후 전송버튼 클릭이벤트
	$('#send').on('click', function(){
		// 입력한 모든 값을 가져온다 
		const formData = $('#wform').serializeJSON();
		//-----------------------------------------------
		fetch(`<%=request.getContextPath()%>/board/boardWrite.do`, {
			method: 'POST',
			headers: {
			   'Content-Type': 'application/json;charset=utf-8' 
			},
			body: JSON.stringify(formData)
		})
		.then(response => { 
	 	   
			if (response.ok) {
			   	return response.json()
			}else {
				throw new Error(`${response.status} ${response.statusText}`);
			}
		 })
		 .then(data => {
			console.log("data", data)
			if(data.result>0){
				alert("새글이 추가되었습니다.");
				location.reload();
			}else{
				alet("새글 추가 오류~~")
			}

		 })
		 .catch(error => {
			  console.log(error)
		  });
		//-----------------------------------------------
		/*
		$.ajax({
			url : `<%=request.getContextPath()%>/board/boardWrite.do`,
			  type : 'post',
			  contentType : 'application/json;charset=utf-8',
			  data : JSON.stringify(fdata), 
			  success : function(data){
				  	//alert(data.result);
					if(data.result>0){
						alert("새글이 추가되었습니다.");
						location.reload();
					}else{
						alet("새글 추가 오류~~")
					}
			  },
			  error : function(xhr){
				  alert("상태 : " + xhr.status + ", " + xhr.statusText);
			  },
			  dataType : 'json'
		})
		*/
		//-----------------------------------------------------	
		
		//모달창  닫기
		$('#wModal').modal("hide");
		//모달창에 입력 값을 지우기
		$('.txt').val("");
		
	}) // 글쓰기 모달창 전송버튼 이벤트 처리 끝...
	
	
	// 게시글 보기
	$(document).on('click', '.boardRow', function(){
		const num = $(this).data("num");
		$("#viewNum").val(num);
		$("#viewForm").submit();
	});
	
	// --------------------------------------------
	
});
</script>

<style>
label {
	font-weight: bold;
}
</style>
</head>

<%
	// 컨트롤러에서 보내온 자료 받기
	List<BoardVO> boardList = (List<BoardVO>)request.getAttribute("boardList");
	PageVO pageVo = (PageVO)request.getAttribute("pageVo");
	String stype = (String)request.getAttribute("stype");
	stype = stype == null ? "" : stype;
	
	String sword = (String)request.getAttribute("sword");
	sword = sword == null ? "" : sword;
	
%>

<body>
<br><br>

<h3 style="text-align:center;">게 시 판 연 습</h3>

<jsp:include page="/WEB-INF/view/member/loginProcess.jsp" />

<nav class="navbar navbar-expand-sm navbar-dark bg-info bg-opacity-25">
	<div class="container-fluid">
		<input type="button" id="write" class="controlBtn btn btn-primary"  value="새글쓰기">
		
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse">
		    <ul class="navbar-nav me-auto">
				<li class="nav-item">&nbsp;</li>
		    </ul>
		    <form class="d-flex" id="searchForm" action="<%=request.getContextPath() %>/board/boardList.do">
		    	<input type="hidden" id="page" name="page" value="<%=pageVo.getCurrentPage() %>">
			    <select class="form-select mx-2" name="stype" id="stype">
					<option value="">전체</option>
					<option value="writer" <%=stype.equals("writer") ? "selected" : "" %>>작성자</option>
					<option value="subject" <%=stype.equals("subject") ? "selected" : "" %>>제목</option>
					<option value="content" <%=stype.equals("content") ? "selected" : "" %>>내용</option>
				</select>
				<input class="form-control mx-2" type="text" name="sword" id="sword" placeholder="Search" value="<%=sword%>">
				<button type="button" id="search" class="btn btn-success mx-2"> 검 색 </button>
			</form>
	  	</div>
	</div>
</nav>

<!-- 리스트 PageVO의 perList 개수만큼 출력 -->
<div id="result"  class="ms-5 me-5">
	<table class="table table-striped">
	<thead class="table-dark">
	   	<tr>
	   		<th>번호</th><th>제목</th><th>작성자</th><th>조회수</th>
		</tr>
	</thead>
	<tbody>
<%
	if(boardList==null || boardList.size()==0){
%>
		<tr>
			<td colspan="4" style="text-align:center;">조건에 맞는 글이 없음.</td>
		</tr>
<%		
	}else {
		for(BoardVO boardVo : boardList){
%>
		<tr data-num="<%=boardVo.getNum() %>" class="boardRow">
			<td><%=boardVo.getNum() %></td>
			<td><%=boardVo.getSubject() %></td>
			<td><%=boardVo.getWriter() %></td>
			<td><%=boardVo.getHit() %></td>
		</tr>
<%	   
		}  // for문 끝...
	} // else문 끝...
%>
	</tbody>
   
	<tfoot>
		<tr>
			<td colspan="4">
				<div id="pagingArea" class="d-flex justify-content-center">
				<!-- .............................. -->
			
					<ul class="pagination">  
		
			<%
			// 이전
			if(pageVo.getStartPage()>1){
			%>
						<li class="page-item"><a id="prev" class="page-link">이전</a></li>
			<%	
			}  // if문 끝
			
			// 페이지 번호 출력
			for(int i=pageVo.getStartPage(); i<=pageVo.getEndPage(); i++){
				if(i==pageVo.getCurrentPage()){		// 현재 페이지 
				%>
						<li class="page-item active"><a class="page-link pageno"><%=i %></a></li>
				<%		
				}else{								// 현재 이외의 페이지
				%>
						<li class="page-item"><a class="page-link pageno"><%=i %></a></li>
				<%	
				}
			
			}	// for문 끝..
			
			// 다음
			if(pageVo.getEndPage() < pageVo.getTotalPage()){
			%>
						<li class="page-item"><a id="next" class="page-link">다음</a></li>
			<%	
			}	// if문 끝...
			%>	
					</ul>
				
			<!-- .............................. -->	
				</div>
			</td>
		</tr>
	</tfoot>
	</table>
   
</div>
	
<br>
<!-- 게시글 View 폼 시작 -->
<form action="<%=request.getContextPath()%>/board/boardView.do" method="post" id="viewForm">
	<input type="hidden" name="flag" value="ok">
	<input type="hidden" name="num" id="viewNum">
</form>

<!-- 게시글 View 폼 끝 -->

  
<!------- 글쓰기  Modal 시작  ------- -->
<div class="modal" id="wModal">
	<div class="modal-dialog">
		<div class="modal-content">
		
			<!-- Modal Header -->
			<div class="modal-header bg-warning">
				<h4 class="modal-title">게시글 작성하기</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			
			<!-- Modal body -->
			<div class="modal-body">
			 
				<form name="wfrom" id="wform">
					<label for="writer">이름</label>
					<input type="text" class="form-control txt" id="writer" name="writer" readonly> <br> 
					
					<label for="subject">제목</label>
					<input type="text" class="form-control txt" id="subject" name="subject"> <br> 
					
					<label for="mail">메일</label>
					<input type="text"  class="form-control txt" id="mail" name="mail"> <br> 
					
					<label for="password">비밀번호</label>
					<input type="password"  class="form-control txt" id="password" name="password"> <br> 
					
					<label for="content">내용</label>
					<textarea rows="5" cols="40"  class="form-control txt" id="content"  name="content"></textarea>
					<br>
					<br>
					<div class="d-grid gap-2 col-6 mx-auto">
						<input type="button" class="btn btn-primary" value=" 전 송 " id="send">
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
<!------- 글쓰기  Modal 끝 ------- -->
     
</body>
</html>
