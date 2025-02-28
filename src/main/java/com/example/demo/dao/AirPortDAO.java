package com.example.demo.dao;

import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.AirRouteScheduleVO;
import com.example.demo.vo.AirportVO;
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
}
