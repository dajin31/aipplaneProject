package com.example.demo.controller.airport;

import com.example.demo.service.AirPortServiceImpl;
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
import java.util.Map;

@WebServlet("/reservation/schedule.do")
public class AirRouteScheduleController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=utf-8");

        AirPortServiceImpl service = AirPortServiceImpl.getInstance();
        AirRouteScheduleVO airRouteScheduleVO = new AirRouteScheduleVO();
        String airCodeParam = req.getParameter("airCode");

        if (airCodeParam != null && !airCodeParam.isEmpty()) {
            try {
                airRouteScheduleVO.setAirCode(Integer.parseInt(airCodeParam));
                List<Map<String, Object>> scheduleList = service.findSchedulesByAirCode(airRouteScheduleVO);

                Gson gson = new Gson();
                String json = gson.toJson(scheduleList);
                PrintWriter out = resp.getWriter();
                out.print(json);
                out.flush();

            } catch (NumberFormatException e) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                resp.getWriter().print("{\"error\": \"올바르지 않은 항공기 코드입니다.\"}");
            } catch (Exception e) {
                resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                resp.getWriter().print("{\"error\": \"서버 내부 오류가 발생했습니다.\"}");
                e.printStackTrace(); // 서버 로그에 예외 정보 출력
            }
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().print("{\"error\": \"항공기 코드를 입력해주세요.\"}");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}