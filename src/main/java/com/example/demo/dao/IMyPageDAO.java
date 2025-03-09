package com.example.demo.dao;

import com.example.demo.vo.MyReservationVO;

import java.util.List;

public interface IMyPageDAO {
    public List<MyReservationVO> selectMyReservation(String userId); //내 예약정보 가져옴

    public List<MyReservationVO> selectMyReservationDetail(String userId); //내예약 상세 가져옴
    
}
