package com.example.demo.controller.airport;

import com.example.demo.service.WeatherService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/weather")
public class WeatherServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");


        String nx = request.getParameter("nx");
        String ny = request.getParameter("ny");

        if (nx == null || ny == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\":\"nx, ny 값이 필요합니다.\"}");
            return;
        }

        String baseDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String baseTime = "0500"; // 기본 값 설정 (05:00 기준 데이터)

        try {
            JSONObject weatherData = WeatherService.getWeatherData(baseDate, baseTime, nx, ny);
            response.getWriter().write(weatherData.toString());
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"API 호출 실패: " + e.getMessage() + "\"}");
        }
    }
}