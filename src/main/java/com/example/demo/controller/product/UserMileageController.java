package com.example.demo.controller.product;

import com.example.demo.service.UserServiceImpl;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/mileage/userMileage")
public class UserMileageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        UserServiceImpl service = UserServiceImpl.getInstance();

        String userId = req.getParameter("userId");

        int param = service.selectMileage(userId);

        Gson gson = new Gson();

        String json = gson.toJson(param);

        PrintWriter out = resp.getWriter();
        out.write(json);

        resp.flushBuffer();


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

}
