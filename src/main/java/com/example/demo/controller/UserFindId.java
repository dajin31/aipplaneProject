package com.example.demo.controller;

import com.example.demo.service.IUserService;
import com.example.demo.service.UserServiceImp;
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

@WebServlet("/userFindId")
public class UserFindId extends HttpServlet {
    private final IUserService userService = UserServiceImp.getInstance();

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

            // JSON이 비어있으면 에러 반환
            if (json.toString().trim().isEmpty()) {
                jsonResponse.addProperty("result", "fail");
                jsonResponse.addProperty("message", "요청 데이터가 비어 있습니다.");
                sendResponse(response, jsonResponse, gson);
                return;
            }

            // JSON 파싱
            JsonObject jsonObject = gson.fromJson(json.toString(), JsonObject.class);

            // 필수 값 검증
            if (!jsonObject.has("user_name") || !jsonObject.has("user_regnum") || !jsonObject.has("user_email")) {
                jsonResponse.addProperty("result", "fail");
                jsonResponse.addProperty("message", "필수 입력값이 누락되었습니다.");
                sendResponse(response, jsonResponse, gson);
                return;
            }

            String userName = jsonObject.get("user_name").getAsString().trim();
            String userRegnum = jsonObject.get("user_regnum").getAsString().trim();
            String userEmail = jsonObject.get("user_email").getAsString().trim();

            // 사용자 정보 조회
            UserVO user = userService.getUserByNameRegnumEmail(userName, userRegnum, userEmail);

            if (user != null) {
                //아이디를 찾은 경우
                jsonResponse.addProperty("result", "success");
                jsonResponse.addProperty("userId", user.getUserId()); // 클라이언트에서 받을 수 있도록 JSON에 포함
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
        sendResponse(response, jsonResponse, gson);
    }

    private void sendResponse(HttpServletResponse response, JsonObject jsonResponse, Gson gson) throws IOException {
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(jsonResponse));
        out.flush();
    }
}
