package com.example.demo.controller.airport;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/reservation/AirportLoginCheckPopup")
public class AirportLoginCheckController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();

        String classvalue = req.getParameter("classvalue");
        String passengerValue = req.getParameter("passengerValue");
        String start = req.getParameter("start");
        String end = req.getParameter("end");
        String departDate = req.getParameter("departDate");
        String returnDate = req.getParameter("returnDate");
        String selectedList = req.getParameter("selectedList");
        String fltCode = req.getParameter("fltCode");
        String totalPrice = req.getParameter("totalPrice");

        req.setAttribute("classvalue", classvalue);
        req.setAttribute("passengerValue", passengerValue);
        req.setAttribute("start", start);
        req.setAttribute("end", end);
        req.setAttribute("departDate", departDate);
        req.setAttribute("returnDate", returnDate);
        req.setAttribute("selectedList", selectedList);
        req.setAttribute("fltCode", fltCode);
        req.setAttribute("totalPrice", totalPrice);


        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/reservation/AirportLoginCheckPopup.jsp");
        requestDispatcher.forward(req,resp);


    }
}
