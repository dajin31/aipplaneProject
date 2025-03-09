package com.example.demo.dao;

import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.AirportVO;
import com.example.demo.vo.MyReservationVO;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.List;

public class MyPageDAO implements IMyPageDAO{

    private static IMyPageDAO dao;

    private MyPageDAO(){

    }

    public static IMyPageDAO getInstance(){
        if(dao == null){
            dao = new MyPageDAO();
        }
        return dao;
    }

    @Override
    public List<MyReservationVO> selectMyReservation(String userId) {
        SqlSession session = null;

        List<MyReservationVO> list = new ArrayList<>();

        try {
            session = MyBatisUtil.getSession();
            list = session.selectList("selectMyReservation",userId);
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(session !=null) session.close();
        }

        return list;
    }

    @Override
    public List<MyReservationVO> selectMyReservationDetail(String userId) {
        SqlSession session = null;

        List<MyReservationVO> list = new ArrayList<>();

        try {
            session = MyBatisUtil.getSession();
            list = session.selectList("selectMyReservationDetail",userId);
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            if(session !=null) session.close();
        }

        return list;
    }
}
