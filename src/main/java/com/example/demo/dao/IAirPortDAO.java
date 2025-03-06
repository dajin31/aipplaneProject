package com.example.demo.dao;

import com.example.demo.vo.*;

import java.util.List;

public interface IAirPortDAO {
    public List<AirportVO> selectCountyList(); //전체 나라이름 가져옴

    public List<AirportVO> selectCountryCategory(String cntCategory);//카테고리별 리스트 가져옴

    public List<AirRouteScheduleVO> selectScheduleList(AirRouteScheduleVO airRouteScheduleVO); //항공 스케쥴 가져오기

    public List<AirRouteScheduleVO> selectSceduleOne(String fltCode); //하나의 항공 스케쥴 가져오기

    public void processReservation(AirportProcessVO airportProcessVO); // 프루시저 호출

    public int insertPassenger(List<PassengerVO> passengers); //승객 테이블 insert

    public int rankDiscount(String userId); // 승객 DC
}
