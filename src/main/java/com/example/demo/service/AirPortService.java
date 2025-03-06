package com.example.demo.service;

import com.example.demo.vo.AirRouteScheduleVO;
import com.example.demo.vo.AirportVO;

import java.util.List;
import java.util.Map;

public interface AirPortService {
    public List<AirportVO> selectCountryList();     // 전체 나라이름 가져옴
    public List<AirportVO> selectCountryCategory(String cntCategory);   // 카테고리별 리스트 가져옴
    public List<Map<String, Object>>  findSchedulesByAirCode(AirRouteScheduleVO airRouteScheduleVO);  // 항공 스케쥴 가져오기
    public AirRouteScheduleVO findScheduleOne(AirRouteScheduleVO airRouteScheduleVO);      // 하나의 항공 스케쥴 가져오기
}
