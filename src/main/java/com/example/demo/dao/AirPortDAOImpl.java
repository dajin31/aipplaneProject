package com.example.demo.dao;

import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.AirRouteScheduleVO;
import com.example.demo.vo.AirportVO;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class AirPortDAOImpl implements AirPortDAO {

    private static AirPortDAO dao;

    public AirPortDAOImpl() {
    }

    public static AirPortDAO getInstance() {
        if (dao == null) {
            dao = new AirPortDAOImpl();
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
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return list;
    }

    @Override
    public List<AirportVO> selectCountryCategory(AirportVO airportVO) { // 파라미터 타입 수정
        SqlSession session = null;
        List<AirportVO> list = new ArrayList<>();
        try {
            session = MyBatisUtil.getSession();
            list = session.selectList("selectCountryCategory", airportVO);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return list;
    }

    @Override
    public List<Map<String, Object>> findSchedulesByAirCode(AirRouteScheduleVO airRouteScheduleVO) {
        SqlSession session = null;
        List<Map<String, Object>> list = null;
        try {
            session = MyBatisUtil.getSession();
            System.out.println("airRouteScheduleVO="+airRouteScheduleVO);
            list = session.selectList("flight.selectFlightDetail", airRouteScheduleVO);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return list;
    }

    @Override
    public AirRouteScheduleVO findScheduleOne(AirRouteScheduleVO airRouteScheduleVO) { // 메서드 이름 수정 및 selectOne() 사용
        SqlSession session = null;
        AirRouteScheduleVO vo = null;
        try {
            session = MyBatisUtil.getSession();
            vo = session.selectOne("findScheduleOne", airRouteScheduleVO);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return vo;
    }
}