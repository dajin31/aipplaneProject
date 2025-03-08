package com.example.demo.controller.airport;

import java.io.*;

import com.example.demo.service.AirPortServiceImpl;
import com.example.demo.vo.PassengerVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

@WebServlet("/ViewTicketServlet")
public class ViewTicketServlet extends HttpServlet {
    private SqlSessionFactory sqlSessionFactory;
    private AirPortServiceImpl airPortService; // AirPortServiceImpl 필드 추가

    @Override
    public void init() throws ServletException {
        try {
            String resource = "mybatis-config.xml";
            InputStream inputStream = Resources.getResourceAsStream(resource);
            this.sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//            this.airPortService = new AirPortServiceImpl(sqlSessionFactory); // AirPortServiceImpl 초기화
        } catch (IOException e) {
            throw new ServletException("Error initializing MyBatis", e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pNumStr = request.getParameter("pNum");
        int pNum;

        try {
            pNum = Integer.parseInt(pNumStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid pNum format");
            return;
        }

        try (SqlSession sqlSession = sqlSessionFactory.openSession()) {
            PassengerVO passenger = sqlSession.selectOne("TicketMapper.getPassengerTicketInfo", pNum);

            if (passenger != null) {
                // AirPortServiceImpl을 사용하여 공항 정보 가져오기
//                passenger.setDepartureAirport(airPortService.getAirportInfo(passenger.getDptAptCode()));
//                passenger.setArrivalAirport(airPortService.getAirportInfo(passenger.getArrAptCode()));

                request.setAttribute("passenger", passenger);
                request.getRequestDispatcher("/ticket.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Passenger ticket not found");
            }
        } catch (Exception e) {
            throw new ServletException("Error retrieving passenger ticket information", e);
        }
    }
}