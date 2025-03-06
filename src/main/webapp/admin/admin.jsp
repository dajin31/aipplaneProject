<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css">
	<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.serializejson.js"></script>
</head>
<body>
<div class="container">
	<h1>회원 관리</h1>

	<form action="<%=request.getContextPath()%>/AdminUser" method="get">
		<select name="stype">
			<option value="all" ${stype == 'all' ? 'selected' : ''}>전체</option>
			<option value="userName" ${stype == 'userName' ? 'selected' : ''}>이름</option>
			<option value="userId" ${stype == 'userId' ? 'selected' : ''}>아이디</option>
			<option value="userEmail" ${stype == 'userEmail' ? 'selected' : ''}>이메일</option>
			<option value="userPassNum" ${stype == 'userPassNum' ? 'selected' : ''}>여권번호</option>
		</select>
		<input type="text" name="sword" value="${sword}">
		<input type="submit" value="검색">
	</form>

	<table>
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>이메일</th>
			<th>여권번호</th>
			<th>회원 정보 수정</th>
			<th>예약 현황</th>
		</tr>
		<c:forEach var="user" items="${userList}">
			<tr>
				<td>${user.userName}</td>
				<td>${user.userId}</td>
				<td>${user.userEmail}</td>
				<td>${user.memCode}</td>
				<td><a href="#" onclick="openUserDetail('${user.userId}')">상세보기</a></td>
				<td><a href="#" onclick="openUserDetail('${user.userId}')">예약 건수(숫자)</a></td>
			</tr>
		</c:forEach>
	</table>

	<!-- 페이지네이션 -->
	<div class="pagination">
		<c:if test="${pageVO.startPage > 1}">
			<a href="<%=request.getContextPath()%>/AdminUser?page=${pageVO.startPage - 1}&stype=${stype}&sword=${sword}">이전</a>
		</c:if>

		<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}">
			<a href="<%=request.getContextPath()%>/AdminUser?page=${i}&stype=${stype}&sword=${sword}" ${pageVO.currentPage == i ? 'class="active"' : ''}>${i}</a>
		</c:forEach>

		<c:if test="${pageVO.endPage < pageVO.totalPage}">
			<a href="<%=request.getContextPath()%>/AdminUser?page=${pageVO.endPage + 1}&stype=${stype}&sword=${sword}">다음</a>
		</c:if>
	</div>
</div>

<script>
	function openUserDetail(userId) {
		window.open('<%=request.getContextPath()%>/AdminUser/AdminUserView.do?userId=' + userId, 'adminDetail', 'width=600,height=400');
	}
</script>
</body>
</html>