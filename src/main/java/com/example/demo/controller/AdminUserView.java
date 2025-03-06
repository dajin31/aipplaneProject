package com.example.demo.controller;

import java.io.IOException;
import com.example.demo.service.AdminServiceImpl;
import com.example.demo.service.IAdminService;
import com.example.demo.vo.UserVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminUser/AdminUserView.do")
public class AdminUserView extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 사용자 ID 파라미터 받기
        String userId = request.getParameter("userId");

        // 서비스 객체 생성
        IAdminService adminService = AdminServiceImpl.getInstance();

        // 사용자 정보 조회
        UserVO user = adminService.getUserById(userId);

        // 조회된 사용자 정보를 request에 저장
        request.setAttribute("user", user);

        // JSP 페이지로 포워딩
        request.getRequestDispatcher("/admin/adminDetail.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}