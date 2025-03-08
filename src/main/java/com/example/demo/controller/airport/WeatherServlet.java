package com.example.demo.controller.airport;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

@WebServlet("/weather")
public class WeatherServlet extends HttpServlet {
    private static final String API_KEY = System.getenv("http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst\n");

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nx = request.getParameter("nx");
        String ny = request.getParameter("ny");

        if (nx == null || ny == null) {
            nx = "60";  // 서울 기본값
            ny = "127";
        }

        String baseDate = getCurrentDate();
        String baseTime = getCurrentTime();

        String apiUrl = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0" +
                "?serviceKey=" + API_KEY +
                "&numOfRows=60&pageNo=1&dataType=JSON" +
                "&base_date=" + baseDate +
                "&base_time=" + baseTime +
                "&nx=" + nx + "&ny=" + ny;

        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");

        int responseCode = connection.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            Scanner scanner = new Scanner(connection.getInputStream());
            String responseBody = scanner.useDelimiter("\\A").next();
            scanner.close();

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(responseBody);
            out.flush();
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print("{\"error\": \"날씨 정보를 가져오는데 실패했습니다.\"}");
            out.flush();
        }
    }

    private String getCurrentDate() {
        java.time.LocalDate now = java.time.LocalDate.now();
        return now.format(java.time.format.DateTimeFormatter.ofPattern("yyyyMMdd"));
    }

    private String getCurrentTime() {
        java.time.LocalTime now = java.time.LocalTime.now();
        int hour = now.getHour();
        int minute = now.getMinute();
        if (minute < 30) {
            hour = (hour - 1 + 24) % 24;  // 이전 시간으로 설정
        }
        return String.format("%02d30", hour);
    }
}