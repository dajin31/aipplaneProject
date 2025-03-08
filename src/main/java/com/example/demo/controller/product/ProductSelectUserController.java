package com.example.demo.controller.product;

import com.example.demo.service.UserServiceImpl;
import com.example.demo.vo.UserVO;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/mileage/mileagePaymentPage/searchUser")
public class ProductSelectUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        UserServiceImpl service = UserServiceImpl.getInstance();

        Gson gson = new Gson();

        String userId = req.getParameter("userId");
        String userPw = req.getParameter("userPw");
        UserVO usersVO = new UserVO();
        usersVO.setUserId(userId);
        usersVO.setUserPw(userPw);

        int cnt = service.selectUser(usersVO);
        System.out.println(cnt);
        if (cnt > 0) {
            System.out.println("성공");
        }else {
            System.out.println("실패");
        }

        String json = gson.toJson(cnt);

        PrintWriter out = resp.getWriter();

        out.write(json);

        resp.flushBuffer();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
