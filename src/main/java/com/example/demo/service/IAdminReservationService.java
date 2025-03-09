package com.example.demo.service;

import com.example.demo.vo.AdminReservationVO;

import java.util.List;
import java.util.Map;

public interface IAdminReservationService {

    // 회원의 예약 현황 조회
    List<AdminReservationVO> getUserReservations(String userId);

    // 예약 상세 정보 조회
    List<AdminReservationVO> getReservationPassengers(String userId, int fltCode);

    // 승객 정보 수정
    int updatePassenger(AdminReservationVO vo);

    // 승객 정보 삭제
    int deletePassenger(int pNum);

    // 좌석 등급 목록 조회
    List<Map<String, String>> getSeatClasses();

    // 좌석 위치 목록 조회
    List<Map<String, String>> getSeatPositions(String seatClass);

    // 특정 날짜의 출발 시간 목록 조회
    List<Map<String, Object>> getDepartureTimes(String dptDate, int fltCode);

    // 특정 출발 일시에 해당하는 도착 일시 조회
    Map<String, Object> getArrivalDateTime(String dptDate, String dptTime, int fltCode);

    // 특정 항공편의 빈 좌석 위치 목록 조회
    List<Map<String, String>> getAvailableSeatPositions(int fltCode, String seatClass);

    // 특정 항공편의 빈 좌석 위치 목록 조회 (현재 승객의 좌석도 포함)
    List<Map<String, String>> getAvailableSeatPositions(int fltCode, String seatClass, int pNum);
}

