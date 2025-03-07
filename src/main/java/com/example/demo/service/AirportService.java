package com.example.demo.service;

import com.example.demo.dao.AirPortDAO;
import com.example.demo.dao.IAirPortDAO;
import com.example.demo.vo.*;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class AirportService implements IAirportService {
    private IAirPortDAO dao;

    private static AirportService service;

    private AirportService() {
        dao = AirPortDAO.getInstance();
    }

    public static AirportService getInstance() {
        if (service == null) {
            service = new AirportService();
        }
        return service;

    }

    @Override
    public List<AirportVO> selectCountyList() {
        return dao.selectCountyList();
    }

    @Override
    public List<AirportVO> selectCountryCategory(String cntCategory) {
        return dao.selectCountryCategory(cntCategory);
    }

    @Override
    public List<AirRouteScheduleVO> selectScheduleList(AirRouteScheduleVO airRouteScheduleVO) {
        return dao.selectScheduleList(airRouteScheduleVO);
    }

    @Override
    public List<AirRouteScheduleVO> selectSceduleOne(String fltCode) {
        return dao.selectSceduleOne(fltCode);
    }

    @Override
    public void processReservation(AirportProcessVO airportProcessVO) {
        dao.processReservation(airportProcessVO);
    }

    @Override
    public int insertPassenger(List<PassengerVO> passengers) {
        return dao.insertPassenger(passengers);
    }

    @Override
    public int rankDiscount(String userId) {
        return dao.rankDiscount(userId);
    }

    @Override
    public List<AirCompletVO> selectAirCompletList(AirCompletVO airCompletVO) {
        return dao.selectAirCompletList(airCompletVO);
    }

    @Override
    public List<Map<String, Object>> findSchedulesByAirCode(AirRouteScheduleVO airRouteScheduleVO) {
        return dao.findSchedulesByAirCode(airRouteScheduleVO);
    }

    @Override
    public AirRouteScheduleVO findScheduleOne(AirRouteScheduleVO airRouteScheduleVO) {
        return dao.findScheduleOne(airRouteScheduleVO);
    }

}
