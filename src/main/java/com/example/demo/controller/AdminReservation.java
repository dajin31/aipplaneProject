package com.example.demo.controller;

import com.example.demo.service.AdminReservationServiceImpl;
import com.example.demo.service.AdminServiceImpl;
import com.example.demo.service.IAdminReservationService;
import com.example.demo.service.IAdminService;
import com.example.demo.vo.AdminReservationVO;
import com.example.demo.vo.UserVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/AdminUser/AdminReservation")
public class AdminReservation extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 서비스 객체 생성
        IAdminService adminService = AdminServiceImpl.getInstance();
        IAdminReservationService reservationService = AdminReservationServiceImpl.getInstance();

        // 요청 파라미터에서 회원 ID 가져오기
        String userId = request.getParameter("userId");

        if (userId != null && !userId.isEmpty()) {
            // 회원 정보 조회
            UserVO user = adminService.getUserById(userId);
            request.setAttribute("user", user);

            // 회원의 예약 현황 조회
            List<AdminReservationVO> reservations = reservationService.getUserReservations(userId);
            request.setAttribute("reservations", reservations);
        } else {
            request.setAttribute("errorMessage", "유효하지 않은 회원 ID입니다.");
        }

        // JSP로 포워딩
        request.getRequestDispatcher("/admin/adminReservation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

