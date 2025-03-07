package com.example.demo.captcha;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/captcha/verifyNkey")
public class verifyNkey extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String clientId = "dxT1xYNxVD4uwtSsz8yM"; // 네이버 API 클라이언트 아이디
        String clientSecret = "ltqRaMh7QO"; // 네이버 API 클라이언트 시크릿

        String code = "1"; // 캡차 이미지 비교 시 1
        String key = request.getParameter("key"); // 캡차 키
        String value = request.getParameter("value"); // 사용자 입력값
        String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code + "&key=" + key + "&value=" + value; // 올바른 API URL

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL, requestHeaders);

        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(responseBody, JsonObject.class);
        JsonObject resultJson = new JsonObject();

        // 디버깅: API 응답 로그 출력
        System.out.println("네이버 캡차 API 응답: " + responseBody);

        if (jsonObject != null && jsonObject.get("result") != null) {
            boolean result = jsonObject.get("result").getAsBoolean();
            resultJson.addProperty("result", result);
        } else {
            // "result" 키가 없거나 jsonObject가 null인 경우 오류 처리
            resultJson.addProperty("result", false); // 또는 적절한 오류 처리
            System.err.println("네이버 캡차 API 응답에 'result' 키가 없습니다: " + responseBody);
        }

        response.setContentType("application/json; charset=UTF-8");
        response.getWriter().write(gson.toJson(resultJson));
    }

    private static String get(String apiUrl, Map<String, String> requestHeaders) {
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    private static HttpURLConnection connect(String apiUrl) {
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection) url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body) {
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}
