package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import com.example.demo.vo.MileageVO;

public interface MileageDAO {

	//map{user_id=test,startDate=2025-03-01,endDate=2025-03-30}
	public List<MileageVO> MileageUse(MileageVO mileageVO);

	public List<MileageVO> MileageAdd(MileageVO mileageVO);

	public List<MileageVO> MileageHistroy(MileageVO mileageVO);
}
