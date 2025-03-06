package com.example.demo.dao;

import com.example.demo.vo.AircraftVO;

import java.util.List;

public interface AircraftDAO {
    AircraftVO getAircraftByCode(int airCode); // 항공기 코드로 조회
    List<AircraftVO> getAllAircrafts(); // 전체 항공기 조회

}
