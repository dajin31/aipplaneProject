package com.example.demo.controller.airport;

import com.example.demo.service.AirportService;
import com.example.demo.service.AirportServiceImpl;
import com.example.demo.vo.AirCompletVO;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/reservation/selectAirCompletList")
public class AirCompletListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        String fltCode = req.getParameter("fltCode");
        String userId = req.getParameter("userId");
        String strings = req.getParameter("userName");

        String result = strings.replaceAll("\\\\", "");
        System.out.println(result);

        Gson gson = new Gson();
//        Type type = new TypeToken<List<Map<String, String>>>() {}.getType();
//        List<Map<String, String>> data = gson.fromJson(result, type);
//        List<String> userNames = data.stream().map(item -> item.get("userName")).collect(Collectors.toList());
//        System.out.println(userNames);
//
//        String userNameString = String.join("','", userNames);
//        userNameString = "'" + userNameString + "'"; // 따옴표 추가
//        System.out.println(userNameString);

        List<Map<String, String>> userNamesMapList = gson.fromJson(result, new TypeToken<List<Map<String, String>>>() {}.getType());
        List<String> userNamesList = new ArrayList<>();
        for (Map<String, String> userNameMap : userNamesMapList) {
            userNamesList.add(userNameMap.get("userName"));
        }


        AirportService service = AirportServiceImpl.getInstance();

        AirCompletVO airCompletVO = new AirCompletVO();

        airCompletVO.setFltCode(Integer.parseInt(fltCode));
        airCompletVO.setUserId(userId);
        airCompletVO.setUserNames(userNamesList);

        List<AirCompletVO> airCompletVOS = service.selectAirCompletList(airCompletVO);
        System.out.println(airCompletVOS);

        resp.getWriter().println(new Gson().toJson(airCompletVOS));
        resp.flushBuffer();

        System.out.println("?"+userNamesList);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
