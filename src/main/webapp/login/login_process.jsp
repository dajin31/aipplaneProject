<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.example.demo.service.UserServiceImpl" %>
<%@ page import="com.example.demo.vo.UserVO" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.google.gson.JsonObject" %>

<%
    try {
        // 요청에서 JSON 데이터 읽기
        BufferedReader reader = request.getReader();
        StringBuilder json = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            json.append(line);
        }

        // JSON 데이터 파싱
        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(json.toString(), JsonObject.class);
        String userId = jsonObject.get("user_id").getAsString();
        String userPw = jsonObject.get("user_pw").getAsString();  // 암호화된 비밀번호가 아닌 평문 비밀번호

        // Service 객체 생성
        UserServiceImpl service = UserServiceImpl.getInstance();
        UserVO user = service.login(userId, userPw); // login()를 사용하여 사용자 정보 가져오기

        // 비밀번호 비교
        JsonObject responseJson = new JsonObject();
        if (user != null) {
            // 로그인 성공: 세션에 회원 정보 저장
            session.setAttribute("loginUser", user);
            responseJson.addProperty("result", "success");
        } else {
            // 로그인 실패
            responseJson.addProperty("result", "fail");
            responseJson.addProperty("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
        }

        // JSON 응답 출력
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter writer = response.getWriter();
        writer.print(gson.toJson(responseJson));
        writer.flush();
        writer.close();

    } catch (Exception e) {
        // 예외 발생 시 JSON 응답
        JsonObject errorJson = new JsonObject();
        errorJson.addProperty("result", "error");
        errorJson.addProperty("message", "로그인 처리 중 오류가 발생했습니다.");
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter writer = response.getWriter();
        writer.print(new Gson().toJson(errorJson));
        writer.flush();
        writer.close();
        e.printStackTrace(); // 서버 로그에 예외 정보 출력
    }
%>
