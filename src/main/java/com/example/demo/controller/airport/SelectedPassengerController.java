package com.example.demo.controller.airport;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/reservation/seletedPassenger")
public class SelectedPassengerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();

        out.println("<html><body>");
        out.println("<h2>탑승석을 조회중 입니다...</h2>");
        out.println("<script type='text/javascript'>");
        out.println("window.location.href='/reservation/passenger.jsp'");
        out.println("</script>");
        out.println("</body></html>");
    }
}
