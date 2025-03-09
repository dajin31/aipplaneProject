package com.example.demo.dao;

import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.AdminReservationVO;
import org.apache.ibatis.session.SqlSession;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AdminReservationDAOImpl implements IAdminReservationDAO {

    private static AdminReservationDAOImpl dao;

    private AdminReservationDAOImpl() {}

    public static AdminReservationDAOImpl getInstance() {
        if (dao == null) dao = new AdminReservationDAOImpl();
        return dao;
    }

    @Override
    public List<AdminReservationVO> getUserReservations(String userId) {
        SqlSession session = MyBatisUtil.getSession();
        List<AdminReservationVO> list = session.selectList("adminReservation.getUserReservations", userId);
        session.close();
        return list;
    }

    @Override
    public List<AdminReservationVO> getReservationPassengers(String userId, int fltCode) {
        SqlSession session = MyBatisUtil.getSession();
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("userId", userId);
        paramMap.put("fltCode", fltCode);
        List<AdminReservationVO> list = session.selectList("adminReservation.getReservationPassengers", paramMap);
        session.close();
        return list;
    }

    @Override
    public int updatePassenger(AdminReservationVO vo) {
        SqlSession session = MyBatisUtil.getSession();
        int result = session.update("adminReservation.updatePassenger", vo);
        if (result > 0) {
            session.commit();
        }
        session.close();
        return result;
    }

    @Override
    public int deletePassenger(int pNum) {
        SqlSession session = MyBatisUtil.getSession();
        int result = session.delete("adminReservation.deletePassenger", pNum);
        if (result > 0) {
            session.commit();
        }
        session.close();
        return result;
    }

    @Override
    public List<Map<String, String>> getSeatClasses() {
        SqlSession session = MyBatisUtil.getSession();
        List<Map<String, String>> list = session.selectList("adminReservation.getSeatClasses");
        session.close();
        return list;
    }

    @Override
    public List<Map<String, String>> getSeatPositions(String seatClass) {
        SqlSession session = MyBatisUtil.getSession();
        List<Map<String, String>> list = session.selectList("adminReservation.getSeatPositions", seatClass);
        session.close();
        return list;
    }

    @Override
    public List<Map<String, Object>> getDepartureTimes(String dptDate, int fltCode) {
        SqlSession session = MyBatisUtil.getSession();
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("dptDate", dptDate);
        paramMap.put("fltCode", fltCode);
        List<Map<String, Object>> list = session.selectList("adminReservation.getDepartureTimes", paramMap);
        session.close();
        return list;
    }

    @Override
    public Map<String, Object> getArrivalDateTime(String dptDate, String dptTime, int fltCode) {
        SqlSession session = MyBatisUtil.getSession();
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("dptDate", dptDate);
        paramMap.put("dptTime", dptTime);
        paramMap.put("fltCode", fltCode);
        Map<String, Object> result = session.selectOne("adminReservation.getArrivalDateTime", paramMap);
        session.close();
        return result;
    }

    @Override
    public List<Map<String, String>> getAvailableSeatPositions(int fltCode, String seatClass) {
        SqlSession session = MyBatisUtil.getSession();
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("fltCode", fltCode);
        paramMap.put("seatClass", seatClass);
        List<Map<String, String>> list = session.selectList("adminReservation.getAvailableSeatPositions", paramMap);
        session.close();
        return list;
    }

    @Override
    public List<Map<String, String>> getAvailableSeatPositionsWithPassenger(Map<String, Object> paramMap) {
        SqlSession session = MyBatisUtil.getSession();
        List<Map<String, String>> list = session.selectList("adminReservation.getAvailableSeatPositions", paramMap);
        session.close();
        return list;
    }
}

