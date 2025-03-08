package com.example.demo.controller;

import com.example.demo.service.AdminServiceImpl;
import com.example.demo.service.IAdminService;
import com.example.demo.vo.UserVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/AdminUser/AdminReservation")
public class AdminReservation extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        // UserVO loginUser = (UserVO) session.getAttribute("loginUser");

        IAdminService adminService = AdminServiceImpl.getInstance();
        // IUserService userService = UserServiceImp.getInstance();

        String userId = request.getParameter("userId");
        UserVO user = adminService.getUserById(userId);


        request.setAttribute("user", user);
        // JSP로 포워딩
        request.getRequestDispatcher("/admin/adminReservation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);
    }
}
