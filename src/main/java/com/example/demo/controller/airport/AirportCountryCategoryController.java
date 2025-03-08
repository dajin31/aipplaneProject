package com.example.demo.controller.airport;

import com.example.demo.service.AirportServiceImpl;
import com.example.demo.vo.AirportVO;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/reservation/categoryList")
public class AirportCountryCategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        AirportServiceImpl service = AirportServiceImpl.getInstance();

        String cntCategory = req.getParameter("cntCategory");

        List<AirportVO> airportVOS = service.selectCountryCategory(cntCategory);

        Gson gson = new Gson();

        String json = gson.toJson(airportVOS);

        PrintWriter out = resp.getWriter();
        out.write(json);

        resp.flushBuffer();

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
