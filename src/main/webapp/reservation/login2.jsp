<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
</head>
<body>
<!--
요청URI : /webPro/LoginServlet
요청파라미터 : {username=admin,password=password}
요청방식 : post

** session.setAttribute("loginMember", username);
 -->
<%--<form action="/LoginServlet" method="post">--%>
<%--    <label for="username">아이디:</label>--%>
<%--    <input type="text" id="username" name="username" required placeholder="admin"/><br/>--%>
<%--    <label for="password">비밀번호(password):</label>--%>
<%--    <input type="password" id="password" name="password" required/><br/>--%>

<%--&lt;%&ndash;    <button type="submit">로그인</button>&ndash;%&gt;--%>
<%--</form>--%>

<div>
    <label for="username">아이디:</label>--%>
        <input type="text" id="username" name="username" required placeholder="admin"/><br/>
        <label for="password">비밀번호(password):</label>
        <input type="password" id="password" name="password" required/><br/>
    <button id="checkBtn">전송</button>
</div>

<script>

    document.getElementById("checkBtn").addEventListener('click',()=>{
        let id = document.getElementById("username").value;
        console.log(id);

        let pass = document.getElementById("password").value;
        console.log(pass)
        const url = '/LoginServlet?userId=' + id + "&userPw=" + pass;
        console.log(url)
        fetch(url)
            .then(resp => resp.json())
            .then(data=>{
                console.log(data)

            })
            .catch(err=>console.error(err))
    })



</script>
</body>
</html>