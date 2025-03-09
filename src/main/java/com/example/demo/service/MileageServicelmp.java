package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import com.example.demo.dao.MileageDAO;
import com.example.demo.dao.MileageDaolmp;
import com.example.demo.vo.MileageVO;

public class MileageServicelmp implements MileageService{
    private MileageDAO dao;

    private static MileageServicelmp service;

    private MileageServicelmp() {
        dao = MileageDaolmp.getInstance();
    }

    public static MileageServicelmp getInstance() {
        if(service == null) service = new MileageServicelmp();
        return service;
    }

    @Override
    public List<MileageVO> getMileageUse(String userId, String startDate, String endDate) {

        MileageVO mileageVO = new MileageVO();

        mileageVO.setUser_id(userId);
        mileageVO.setStartDate(startDate);
        mileageVO.setEndDate(endDate);

        return dao.MileageUse(mileageVO);
    }

    @Override
    public List<MileageVO> getMileageAdd(String userId, String startDate, String endDate) {
        MileageVO mileageVO = new MileageVO();

        mileageVO.setUser_id(userId);
        mileageVO.setStartDate(startDate);
        mileageVO.setEndDate(endDate);

        return dao.MileageAdd(mileageVO);
    }

    @Override
    public List<MileageVO> getMileageHistroy(String userId, String startDate, String endDate) {
        MileageVO mileageVO = new MileageVO();

        mileageVO.setUser_id(userId);
        mileageVO.setStartDate(startDate);
        mileageVO.setEndDate(endDate);

        return dao.MileageHistroy(mileageVO);
    }

}
