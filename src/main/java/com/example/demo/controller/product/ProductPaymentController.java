package com.example.demo.controller.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/mileage/paymentMileage")
public class ProductPaymentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String totalPrice = req.getParameter("totalPrice");
        String prodId = req.getParameter("prodId");
        String cnt = req.getParameter("cnt");

        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();

        out.println("<html><body>");
        out.println("<h2>결제 페이지로 이동 중입니다...</h2>");
        out.println("<p>결제 금액: " + totalPrice + "원</p>");
        out.println("<script type='text/javascript'>");
        out.println("window.location.href='/mileage/mileagePaymentPage.jsp?totalPrice=" + totalPrice + "&prodId=" + prodId+"&cnt=" + cnt +"';");
        out.println("</script>");
        out.println("</body></html>");
    }
}
