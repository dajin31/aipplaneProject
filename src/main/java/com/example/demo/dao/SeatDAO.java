package com.example.demo.dao;

import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.SeatVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class SeatDAO implements ISeatDAO{
    private static ISeatDAO dao;

    private SeatDAO(){

    }

    public static ISeatDAO getInstance(){
        if(dao == null){
            dao = new SeatDAO();
        }
        return dao;
    }
    @Override
    public List<SeatVO> selectSeatList() {
        SqlSession session = null;

        List<SeatVO> list = null;

        try {
            session = MyBatisUtil.getSession();
            list = session.selectList("selectSeatList");
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(session != null){
                session.close();
            }
        }
        return list;
    }
}
