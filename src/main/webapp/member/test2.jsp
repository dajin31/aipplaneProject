<%@ page import="com.example.demo.vo.UserVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    HttpSession session2 = request.getSession();
    String userId = (String) session2.getAttribute("userId");
    String seatId = (String) session2.getAttribute("seatCode");

    List<String> test = session2.getAttribute("result");
    console.log("test : ", test);
    // test : name : 김예찬, userId : 123, pw : 123
    // test[0].name, test.userId, test.pw

    var str = '';
    for(var i=0; i<test.length; i++) {
            str += "<tr>";
            str +=      "<td>" + test[i].userId + "</td>";
            str += "</tr>";
    }

    str :
    <tr>
        <td>a001</td>
    </tr>
    <tr>
        <td>a001</td>
    </tr>
    <tr>
        <td>a001</td>
    </tr>
    <tr>
        <td>a001</td>
    </tr>


    $("#test").html(str);

%>
<!DOCTYPE html>
<html>
<head>
    <title>예약 목록</title>
    <style>
        table { border-collapse: collapse; width: 80%; margin: 20px auto; }
        th, td { border: 1px solid black; padding: 10px; text-align: center; }
    </style>,ㅡ ㅡ
</head>
<body>
    <p id="test">사용자 ID : <%= userId %></p>
    <p>좌석 번호 : <%= seatId %></p>
<p><%= test.name %></p>

<table>
    <thead>
    </thead>
    <tbody id="resv_tbl1">
//        <tr>
//            <td>a001</td>
//        </tr>
//        <tr>
//            <td>a001</td>
//        </tr>
//        <tr>
//            <td>a001</td>
//        </tr>
//        <tr>
//            <td>a001</td>
//        </tr>
    </tbody>
</table>
</body>
</html>
