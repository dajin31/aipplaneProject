package com.example.demo.controller.airport;

import com.example.demo.service.AirportService;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/reservation/selectDiscount")
public class AirportSelectDiscountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        AirportService service = AirportService.getInstance();

        String userId = req.getParameter("userId");

        Gson gson = new Gson();


        int cnt = service.rankDiscount(userId);

        String json = gson.toJson(cnt);

        resp.getWriter().write(json);

        resp.flushBuffer();


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
