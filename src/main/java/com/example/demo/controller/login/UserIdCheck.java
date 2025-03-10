package com.example.demo.controller.login;

import com.example.demo.service.UserService;
import com.example.demo.service.UserServiceImpl;
import com.example.demo.vo.UserVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/idCheck.do")
public class UserIdCheck extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");

        // 검사할 userId 받기
        String userId = request.getParameter("user_id");

        // 서비스 객체 생성
        UserService service = UserServiceImpl.getInstance();

        // db에서 처리한 결과 받기
        int count = service.userIdCount(userId);

        String jsonData = "";
        if (count > 0) {
            jsonData = "{\"result\" : \"이미 사용 중인 아이디입니다.\"}";
        } else {
            jsonData = """
                    { 
                    "result" : "사용 가능합니다."
                    }
                    """;
        }

        PrintWriter out = response.getWriter();
        out.write(jsonData);
        response.flushBuffer();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=UTF-8");

        // 요청 파라미터 읽기 (예: 사용자 입력)
        String userId = request.getParameter("userId");
        String userPw = request.getParameter("userPw");
        String userName = request.getParameter("userName");
        String userRegnum= request.getParameter("userRegnum");
        String userEmail = request.getParameter("userEmail");


        try {
            // userRegnum 유효성 검사 (6자리 숫자 검사)
            if (!userRegnum.matches("\\d{6}")) {
                response.getWriter().print("{ \"result\": \"fail\", \"message\": \"생년월일은 6자리 숫자여야 합니다.\" }");
                return;
            }

            // 회원가입 서비스 호출
            UserService service = UserServiceImpl.getInstance();
            UserVO newUser = new UserVO(userId, userPw, userName, userRegnum, userEmail);
            int result = service.insertUser(newUser);

            // JSON 응답 처리
            if (result > 0) {
                response.getWriter().print("{ \"result\": \"success\" }");
            } else {
                response.getWriter().print("{ \"result\": \"fail\" }");
            }
        } catch (NumberFormatException e) {
            response.getWriter().print("{ \"result\": \"fail\", \"message\": \"" + e.getMessage() + "\" }");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("{ \"result\": \"fail\", \"message\": \"" + e.getMessage() + "\" }");
        }
    }
}