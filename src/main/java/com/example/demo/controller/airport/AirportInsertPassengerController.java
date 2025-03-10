package com.example.demo.controller.airport;

import com.example.demo.service.AirportService;
import com.example.demo.service.AirportServiceImpl;
import com.example.demo.vo.PassengerVO;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

@WebServlet("/reservation/insertPassenger")
public class AirportInsertPassengerController extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setCharacterEncoding("utf-8");
//        resp.setCharacterEncoding("utf-8");
//        resp.setContentType("application/json; charset=utf-8");
//
//        String formList = req.getParameter("formList");
//        System.out.println(formList);
//
//        Gson gson = new Gson();
//
//        PassengerVO passengerVO = new PassengerVO();
//
//        List<PassengerVO> arrayList = gson.fromJson(formList, new ArrayList<PassengerVO>() {
//        }.getClass());
//
//
//
//    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        StringBuilder json = new StringBuilder();
        BufferedReader reader = req.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            json.append(line);
        }

        String substring = json.toString().substring(1, json.length() - 1);
        String result = substring.replaceAll("\\\\","");

        System.out.println("result" + result);
        Gson gson = new Gson();
        List<PassengerVO> passengers = gson.fromJson(result, new TypeToken<List<PassengerVO>>() {}.getType());

        System.out.println("Received passengers: " + passengers);

        AirportService service = AirportServiceImpl.getInstance();

        int cnt = service.insertPassenger(passengers);


        if(cnt > 0) {
            System.out.println("성공");
        }else {
            System.out.println("실패");
        }

        resp.getWriter().write("Passengers inserted successfully.");

    }

}
