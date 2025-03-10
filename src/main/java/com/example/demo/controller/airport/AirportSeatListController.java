package com.example.demo.controller.airport;

import com.example.demo.service.SeatService;
import com.example.demo.service.SeatServiceImpl;
import com.example.demo.vo.SeatVO;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/reservation/seatListSelect")
public class AirportSeatListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        SeatService service = SeatServiceImpl.getInstance();

        List<SeatVO> vos = service.selectSeatList();

        Gson gson = new Gson();

        String json = gson.toJson(vos);

        resp.getWriter().write(json);

        resp.flushBuffer();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
