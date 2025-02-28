package com.example.demo.controller.airport;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/reservation/openCountryList")
public class CountryListOpenController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();

        String type = req.getParameter("type");

        out.println("<html><body>");
        out.println("<h2>나라 리스트를 업데이트 중 입니다...</h2>");
        out.println("<script type='text/javascript'>");
        out.println("window.location.href='/reservation/countryList.jsp?type="+ type+"'");
        out.println("</script>");
        out.println("</body></html>");
    }
}
