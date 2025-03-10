package com.example.demo.controller.login;

import com.example.demo.service.EmailService;
import com.example.demo.service.UserService;
import com.example.demo.service.UserServiceImpl;
import com.example.demo.vo.UserVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/userFindPw")
public class UserFindPw extends HttpServlet {
    private UserService userService = UserServiceImpl.getInstance();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");

        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();

        try {
            // 요청 데이터 읽기
            BufferedReader reader = request.getReader();
            StringBuilder json = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                json.append(line);
            }

            // JSON 파싱
            JsonObject jsonObject = gson.fromJson(json.toString(), JsonObject.class);
            String userId = jsonObject.get("user_id").getAsString();
            String userRegnum = jsonObject.get("user_regnum").getAsString();
            String userEmail = jsonObject.get("user_email").getAsString();

            // 사용자 정보 조회
            UserVO user = userService.getUserByIdRegnumEmail(userId, userRegnum, userEmail);

            if (user != null) {
                // 임시 비밀번호 생성 및 이메일 전송
                String tempPassword = EmailService.sendTemporaryPassword(userEmail); // EmailService 사용

                // DB 업데이트 (평문 저장)
                user.setUserPw(tempPassword);
                userService.updateUserPassword(user);

                jsonResponse.addProperty("result", "success");
                jsonResponse.addProperty("message", "임시 비밀번호를 이메일로 전송했습니다.");
            } else {
                jsonResponse.addProperty("result", "fail");
                jsonResponse.addProperty("message", "입력하신 정보와 일치하는 사용자를 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            jsonResponse.addProperty("result", "error");
            jsonResponse.addProperty("message", "오류가 발생했습니다: " + e.getMessage());
            e.printStackTrace(); // 로깅
        }

        // 응답 전송
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(jsonResponse));
        out.flush();
    }
}
