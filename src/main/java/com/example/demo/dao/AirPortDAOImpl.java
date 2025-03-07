package com.example.demo.dao;

import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.AirRouteScheduleVO;
import com.example.demo.vo.AirportProcessVO;
import com.example.demo.vo.AirportVO;
import com.example.demo.vo.PassengerVO;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class AirPortDAOImpl implements AirPortDAO {

    private static AirPortDAO dao;

    private AirPortDAOImpl() {

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