package com.example.demo.controller.airport; // 프로젝트의 패키지 구조에 맞게 수정하세요

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import com.example.demo.service.AirPortService;
import com.example.demo.service.AirPortServiceImpl;
import com.example.demo.vo.AirRouteScheduleVO;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/reservation/detailSelectOne")
public class DetailSelectOneServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String fltCode = request.getParameter("fltCode");

        PrintWriter out = response.getWriter();

        if (fltCode == null || fltCode.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print("{\"error\": \"fltCode parameter is missing or empty\"}");
            return;
        }
        AirRouteScheduleVO airRouteScheduleVO = new AirRouteScheduleVO();
        airRouteScheduleVO.setFltCode(Integer.parseInt(fltCode));
        AirPortService service = AirPortServiceImpl.getInstance();
        List<Map<String, Object>> flightInfo = service.findSchedulesByAirCode(airRouteScheduleVO);

//        try (SqlSession sqlSession = MyBatisUtil.getSession()) {
//            // MyBatis mapper 메서드 호출
//            List<Map<String, Object>> flightInfo = sqlSession.selectList("META-INF.FlightMapper.selectFlightDetail", fltCode);
/*
            JSONArray jsonArray = new JSONArray();
            for (Map<String, Object> flight : flightInfo) {
                JSONObject jsonObject = new JSONObject(flight);
                jsonArray.put(jsonObject);
            }

 */
            Gson gson = new Gson();
            String json = gson.toJson(flightInfo);
            out.print(json);
            out.flush();
//        } catch (Exception e) {
//            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//            out.print("{\"error\": \"An error occurred while fetching flight details\"}");
//            e.printStackTrace();
//        } finally {
//            out.flush();
//        }
    }
}