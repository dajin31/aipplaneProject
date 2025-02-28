package com.example.demo.controller.airport;

import com.example.demo.service.AirportService;
import com.example.demo.vo.AirRouteScheduleVO;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/reservation/detailSelectOne")
public class AirportDetailSelectController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        AirportService service = AirportService.getInstance();

        String fltCode = req.getParameter("fltCode");

        List<AirRouteScheduleVO> vos = service.selectSceduleOne(fltCode);

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
