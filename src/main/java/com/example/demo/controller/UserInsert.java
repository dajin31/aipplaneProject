package com.example.demo.controller;

import com.example.demo.service.UserServiceImp;
import com.example.demo.vo.UserVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/user/userInsert.do")
public class UserInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // JSON 데이터 파싱
            BufferedReader reader = request.getReader();
            StringBuilder json = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                json.append(line);
            }

            Gson gson = new Gson();
            JsonObject jsonObject = gson.fromJson(json.toString(), JsonObject.class);

            // 요청 파라미터 읽기
            String userId = jsonObject.get("userId").getAsString();
            String userPw = jsonObject.get("userPw").getAsString();
            String userName = jsonObject.get("userName").getAsString();
            String userRegnum = jsonObject.get("userRegnum").getAsString();
            String userEmail = jsonObject.get("userEmail").getAsString();

            // userRegnum 유효성 검사 (6자리 검사)
            if (String.valueOf(userRegnum).length() != 6) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().print("{ \"result\": \"fail\", \"message\": \"생년월일은 6자리 숫자여야 합니다.\" }");
                return;
            }

            // userPw 유효성 검사
            String passwordRegex = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*\\W).{1,14}$";
            if (!userPw.matches(passwordRegex)) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().print("{ \"result\": \"fail\", \"message\": \"비밀번호는 영문, 숫자, 특수문자를 각 1개 이상 포함하고, 14자 이하여야 합니다.\" }");
                return;
            }

            // 회원가입 서비스 호출
            UserServiceImp service = UserServiceImp.getInstance();
            UserVO newUser = new UserVO(userId, userPw, userName, userRegnum, userEmail);
            int result = service.insertUser(newUser);

            // JSON 응답 처리
            response.setContentType("application/json; charset=UTF-8");
            PrintWriter out = response.getWriter();
            if (result > 0) {
                response.setStatus(HttpServletResponse.SC_OK);
                out.print("{ \"result\": \"success\" }");
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{ \"result\": \"fail\", \"message\": \"회원가입 실패\" }");
            }

        } catch (JsonParseException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().print("{ \"result\": \"fail\", \"message\": \"잘못된 JSON 형식\" }");
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().print("{ \"result\": \"fail\", \"message\": \"서버 오류 발생\" }");
            e.printStackTrace();
        }
    }
}