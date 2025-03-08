package com.example.demo.controller.airport;

import com.example.demo.service.AirportServiceImpl;
import com.example.demo.vo.AirportProcessVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/reservation/processReservation")
public class AirportProcessReservationController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        String seatCode = req.getParameter("seatCode");
        int totalPrice = Integer.parseInt(req.getParameter("totalPrice"));
        String userId = req.getParameter("userId");
        int fltCode = Integer.parseInt(req.getParameter("fltCode"));
        int userMileage = Integer.parseInt(req.getParameter("userMileage"));

        AirportProcessVO airportProcessVO = new AirportProcessVO();
        airportProcessVO.setSeatCode(seatCode);
        airportProcessVO.setTotalPrice(totalPrice);
        airportProcessVO.setUserId(userId);
        airportProcessVO.setFltCode(fltCode);
        airportProcessVO.setUserMileage(userMileage);


        AirportServiceImpl service = AirportServiceImpl.getInstance();



        try {
            service.processReservation(airportProcessVO);
            resp.getWriter().write("{\"result\": \"success\"}"); // 성공 응답
        } catch (Exception e) {
            resp.getWriter().write("{\"result\": \"fail\", \"message\": \"" + e.getMessage() + "\"}"); // 실패 응답
            e.printStackTrace();
        } finally {
            resp.flushBuffer();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
