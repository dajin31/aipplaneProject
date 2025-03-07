package com.example.demo.service;

import com.example.demo.dao.AirPortDAO;
import com.example.demo.dao.AirPortDAOImpl;
import com.example.demo.vo.AirRouteScheduleVO;
import com.example.demo.vo.AirportVO;

import java.util.List;
import java.util.Map;

public class AirPortServiceImpl implements AirPortService {
    private AirPortDAO dao;

    private static AirPortServiceImpl service = new AirPortServiceImpl();

    private AirPortServiceImpl() {
        dao = AirPortDAOImpl.getInstance();
    }

    public static AirPortServiceImpl getInstance() {
        if (service == null) {
            service = new AirPortServiceImpl();
        }
        return service;
    }

    @Override
    public List<AirportVO> selectCountryList() {
        return dao.selectCountyList();
    }

    @Override
    public List<AirportVO> selectCountryCategory(String cntCategory) {
        return dao.selectCountryCategory(cntCategory);
    }


    @Override
    public List<Map<String, Object>>  findSchedulesByAirCode(AirRouteScheduleVO airRouteScheduleVO) {
        return dao.findSchedulesByAirCode(airRouteScheduleVO);
    }
    @Override
    public AirRouteScheduleVO findScheduleOne(AirRouteScheduleVO airRouteScheduleVO) {
        return dao.findScheduleOne(airRouteScheduleVO);
    }
}
