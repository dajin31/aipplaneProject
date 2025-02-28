package com.example.demo.service;

import com.example.demo.vo.SeatVO;

import java.util.List;

public interface ISeatService {
    public List<SeatVO> selectSeatList(); //좌석의 모든 정보 가져오기
}
