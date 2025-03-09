package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.AirVO;

public class AirDaoImp implements AirDAO{

    private static AirDaoImp dao;

    private AirDaoImp() {

    }

    public static AirDaoImp getInstance() {
        if(dao == null) dao = new AirDaoImp();
        return dao;
    }

    //환불순서1)마일리지 돌려주기
    public int updateUserMileage(AirVO airVO) {
        SqlSession session = null;
        int res = 0;

        try {
            session = MyBatisUtil.getSession();
            res = session.update("air.updateUserMileage",airVO);
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            session.commit();
            session.close();
        }System.out.println("res값"+ res);
        return res;
    }

    //환불순서2)예약정보 res_details테이블 삭제하기
    public int AirCancel1(AirVO airVO) {
        SqlSession session = null;
        int res = 0;

        try {
            session = MyBatisUtil.getSession();
            res = session.delete("air.getAirCancel1",airVO);
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            session.commit();
            session.close();
        }
        return res;
    }
    //환불순서3)예약정보 payment테이블 삭제하기
    public int AirCancel2(AirVO airVO) {
        SqlSession session = null;
        int res = 0;

        try {
            session = MyBatisUtil.getSession();
            res = session.delete("air.getAirCancel2",airVO);
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            session.commit();
            session.close();
        }
        return res;
    }
    //환불순서4)예약정보 reservation테이블 삭제하기
    public int AirCancel3(AirVO airVO) {
        SqlSession session = null;
        int res = 0;

        try {
            session = MyBatisUtil.getSession();
            res = session.delete("air.getAirCancel3",airVO);
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            session.commit();
            session.close();
        }
        return res;
    }

    //예약정보 목록
    public List<AirVO> getAirList(AirVO airVO) {
        SqlSession session = MyBatisUtil.getSession();
        List<AirVO> getairVOList = null;

        try {
            session = MyBatisUtil.getSession();
            getairVOList = session.selectList("air.getResCodeList",airVO);
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            session.close();
        }
        return getairVOList;
    }

    //예약정보 상세
    public AirVO getAir(AirVO airVO) {
        SqlSession session = MyBatisUtil.getSession();
        AirVO getairVO1 = null;

        try {
            session = MyBatisUtil.getSession();
            getairVO1 = session.selectOne("air.getResCode",airVO);
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            session.close();
        }
        return getairVO1;
    }

}
