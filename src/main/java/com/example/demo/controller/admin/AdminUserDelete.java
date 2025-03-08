package com.example.demo.controller.admin;

import com.example.demo.service.AdminServiceImpl;
import com.example.demo.service.IAdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AdminUser/AdminUserDelete.do")
public class AdminUserDelete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        HttpSession session = request.getSession();
        // UserVO loginUser = (UserVO) session.getAttribute("loginUser");

        IAdminService adminService = AdminServiceImpl.getInstance();
        // IUserService userService = UserServiceImp.getInstance();

        String userId = request.getParameter("userId");
        int result = adminService.deleteUser(userId);

        PrintWriter out = response.getWriter();
        out.print("{\"result\":" + result + "}");
        out.flush();
    }
}