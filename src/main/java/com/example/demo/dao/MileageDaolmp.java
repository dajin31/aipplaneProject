package com.example.demo.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.MileageVO;

public class MileageDaolmp implements MileageDAO{
    private static MileageDaolmp dao;

    private MileageDaolmp() {

    }

    public static MileageDaolmp getInstance() {
        if(dao == null) dao = new MileageDaolmp();
        return dao;
    }

    @Override
    public List<MileageVO> MileageUse(MileageVO mileageVO) {
        SqlSession session = MyBatisUtil.getSession();

        List<MileageVO> mileageVOList = new ArrayList<MileageVO>();

        try {
            mileageVOList = session.selectList("mileage.getMileageUse", mileageVO);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            session.close();
        }
        return mileageVOList;
    }

    //String userId, String startDate, String endDate
    @Override
    public List<MileageVO> MileageAdd(MileageVO mileageVO) {
        SqlSession session = MyBatisUtil.getSession();

        List<MileageVO> mileageVOList = new ArrayList<MileageVO>();

        try {
            mileageVOList = session.selectList("mileage.getMileageUse" /* 나중에 바꾸기 */, mileageVO);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            session.close();
        }
        return mileageVOList;
    }

    @Override
    public List<MileageVO> MileageHistroy(MileageVO mileageVO) {
        SqlSession session = MyBatisUtil.getSession();

        List<MileageVO> mileageVOList = new ArrayList<MileageVO>();

        try {
            mileageVOList = session.selectList("mileage.getMileageUse"/* 나중에 바꾸기 */, mileageVO);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            session.close();
        }
        return mileageVOList;
    }



}
