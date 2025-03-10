package com.example.demo.controller.mypage;

import com.example.demo.service.UserService;
import com.example.demo.service.UserServiceImpl;
import com.example.demo.vo.UserVO;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/myPage/selectUserMe")
public class MypageSelectUserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        String userId = req.getParameter("userId");

        UserService service = UserServiceImpl.getInstance();

        UserVO userVO = service.getmyUser(userId);

        Gson gson = new Gson();

        String json = gson.toJson(userVO);

        resp.getWriter().write(json);

        resp.flushBuffer();
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
