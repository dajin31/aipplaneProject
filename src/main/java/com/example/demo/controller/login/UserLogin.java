package com.example.demo.controller.login;

import com.example.demo.service.UserServiceImpl;
import com.example.demo.vo.UserVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/login.do")
public class UserLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LoggerFactory.getLogger(UserLogin.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");


        Gson gson = new Gson();

        try {
            // JSON 데이터 읽기
            BufferedReader reader = request.getReader();
            StringBuilder json = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                json.append(line);
            }

            // JSON 데이터 파싱
            JsonObject jsonObject = gson.fromJson(json.toString(), JsonObject.class);
            String userId = jsonObject.get("user_id").getAsString();
            String userPw = jsonObject.get("user_pw").getAsString(); // 평문 비밀번호

            UserServiceImpl service = UserServiceImpl.getInstance();
            UserVO user = service.login(userId, userPw); // 평문 비밀번호로 로그인

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("loginUser", user);

                // 응답 데이터에 사용자 이름 추가
                JsonObject resultJson = new JsonObject();
                resultJson.addProperty("result", "success");
                resultJson.addProperty("userName", user.getUserName()); // getUserName() 사용

                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write(gson.toJson(resultJson));
            } else {
                // 사용자 없음 또는 비밀번호 불일치
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.getWriter().write(gson.toJson(new ErrorResult("아이디 또는 비밀번호가 일치하지 않습니다.")));
            }
        } catch (NullPointerException | ClassCastException e) {
            logger.error("JSON 파싱 오류: ", e);
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write(gson.toJson(new ErrorResult("잘못된 요청입니다.")));
        } catch (IllegalArgumentException e) {
            logger.error("로그인 처리 중 오류 발생: ", e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write(gson.toJson(new ErrorResult("서버 내부 오류 발생")));
        } catch (Exception e) {
            // 다른 예외가 발생할 경우
            logger.error("예상치 못한 오류 발생: ", e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write(gson.toJson(new ErrorResult("서버 오류 발생")));
        }

    }

    private static class ErrorResult {
        private String message;
        public ErrorResult(String message) { this.message = message; }
    }
}

