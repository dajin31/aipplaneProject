package com.example.demo.controller.product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/mileage/goOrdersList")
public class OrdersListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");

        if (userId == null || userId.isEmpty()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "잘못된 접근 입니다.");
            return;
        }

        req.setAttribute("userId", userId);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/mileage/orderDetail.jsp");
        requestDispatcher.forward(req, resp);
    }
}
