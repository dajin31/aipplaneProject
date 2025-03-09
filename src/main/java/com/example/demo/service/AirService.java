package com.example.demo.service;

import java.util.List;

import com.example.demo.vo.AirVO;

public interface AirService {
	//환불순서1)마일리지 돌려주기
	public int updateUserMileage(AirVO airVO);
	//환불순서2)예약정보 res_details테이블 삭제하기
	public int AirCancel1(AirVO airVO);
	//환불순서3)예약정보 payment테이블 삭제하기
	public int AirCancel2(AirVO airVO);
	//환불순서4)예약정보 reservation테이블 삭제하기
	public int AirCancel3(AirVO airVO);
	//예약 정보 목록
	public List<AirVO> getAirList(AirVO airVO);
	//예약 정보 상세
	public AirVO getAir(AirVO airVO);
}
