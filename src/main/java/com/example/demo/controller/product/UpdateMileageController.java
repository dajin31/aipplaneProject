package com.example.demo.controller.product;

import com.example.demo.service.UserService;
import com.example.demo.service.UserServiceImpl;
import com.example.demo.vo.UsersVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/milage/updateMile")
public class UpdateMileageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        UserService service = UserServiceImpl.getInstance();
        String userMileage = req.getParameter("userMileage");
        String userId = req.getParameter("userId");

        int mileage = Integer.parseInt(userMileage.replace(",",""));
        UsersVO usersVO = new UsersVO();
        usersVO.setUserId(userId);
        usersVO.setUserMileage(mileage);

        int cnt = service.updateMileage(usersVO);
        
        if (cnt > 0) {
            System.out.println("업데이트 성공");
        }else {
            System.out.println("업데이트 실패");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
