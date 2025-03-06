package com.example.demo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/testUser.do")
public class testController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId"); // 파라미터 받아옴
        String seatId = request.getParameter("seatId");

        // 받아온 파라미터 세션에 저장
        HttpSession session = request.getSession();
        session.setAttribute("userId", userId);
        session.setAttribute("seatCode", seatId);

        System.out.println("userId: " + userId);
        System.out.println("seatId: " + seatId);

        request.setAttribute("userId", userId);
        request.setAttribute("seatCode", seatId);

//        List<Object> result = service.getsdfsdfsdf(userId); // 결과값 : resvertionMap
        // List<testVO> result = service.getsdfsdfsf(userId)

//        System.out.println(test);
        // 1. 코드, 명, 가격
        // 2. 코드, 명, 가격
        // 3. 코드, 명, 가격
//        request.setAttribute("result", result);

        // test.jsp
//        List<reservationVO> resultList = session.getAttribute("result");
//        var str = '';
//        for(var i=0; i<resultList.length; i++) {
//            str += '<td>' + resultList[i].userId + '</td>';
//
//        }
//
//        $("#test").html(str);
//
//        <tr id="test">
//
//        </tr>

        request.getRequestDispatcher("/member/test2.jsp").forward(request, response);

    }
}
