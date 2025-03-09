package com.example.demo.service;

import java.util.List;

import com.example.demo.vo.MileageVO;

public interface MileageService {
	//마일리지 사용내역
	public List<MileageVO> getMileageUse(String userId, String startDate, String endDate);

	//마일리지 사용적립
	public List<MileageVO> getMileageAdd(String userId, String startDate, String endDate);

	//마일리지 전체내역
	public List<MileageVO> getMileageHistroy(String userId, String startDate, String endDate);

}
