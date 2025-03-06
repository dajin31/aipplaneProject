package com.example.demo.dao;

import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.*;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.List;

public class AirPortDAO implements IAirPortDAO {
    private static IAirPortDAO dao;

    private AirPortDAO() {

    }

    public static IAirPortDAO getInstance() {
        if (dao == null) {
            dao = new AirPortDAO();
        }
        return dao;
    }
    @Override
    public List<AirportVO> selectCountyList() {
        SqlSession session = null;

        List<AirportVO> list = new ArrayList<>();

        try {
            session = MyBatisUtil.getSession();
            list = session.selectList("selectCountyList");
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(session !=null) session.close();
        }

        return list;
    }

    @Override
    public List<AirportVO> selectCountryCategory(String cntCategory) {
        SqlSession session = null;

        List<AirportVO> list = new ArrayList<>();

        try {
            session = MyBatisUtil.getSession();
            list = session.selectList("selectCountryCategory",cntCategory);
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(session !=null) session.close();
        }

        return list;
    }

    @Override
    public List<AirRouteScheduleVO> selectScheduleList(AirRouteScheduleVO airRouteScheduleVO) {
       SqlSession session = null;
       List<AirRouteScheduleVO> list = new ArrayList<>();
       try {
           session = MyBatisUtil.getSession();
           list = session.selectList("selectScheduleList",airRouteScheduleVO);
       }catch (Exception e) {
           e.printStackTrace();
       }finally {
           if(session !=null) session.close();
       }
        return list;
    }

    @Override
    public List<AirRouteScheduleVO> selectSceduleOne(String fltCode) {
        SqlSession session = null;
        List<AirRouteScheduleVO> list = new ArrayList<>();
        try {
            session = MyBatisUtil.getSession();
            list = session.selectList("selectSceduleOne",fltCode);
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(session !=null) session.close();
        }
        return list;
    }

    @Override
    public  void processReservation(AirportProcessVO airportProcessVO) {
        SqlSession session = null;
        try {
            session = MyBatisUtil.getSession();
            session.update("processReservation",airportProcessVO);
            session.commit();
        }catch (Exception e) {
            if (session != null) {
                session.rollback(); // 트랜잭션 롤백
            }
            e.printStackTrace();
        }finally {
            if(session !=null) session.close();
        }
    }

    @Override
    public int insertPassenger(List<PassengerVO> passengers) {
        SqlSession session = null;
        int count = 0;
        try {
            session = MyBatisUtil.getSession();
            count = session.insert("insertPassenger",passengers);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            session.commit();
            if(session!=null) session.close();
        }
        return count;
    }

    @Override
    public int rankDiscount(String userId) {
        SqlSession session = null;
        int count = 0;
        try {
            session = MyBatisUtil.getSession();
            count = session.selectOne("rankDiscount",userId);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(session!=null) session.close();
        }
        return count;
    }
}
