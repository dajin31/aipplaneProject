package com.example.demo.dao;


import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.SeatVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class SeatDAOImpl implements SeatDAO {
    private static SeatDAO dao;

    public SeatDAOImpl() {
    }

    public static SeatDAO getInstance() {
        if (dao == null) {
            dao = new SeatDAOImpl();
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
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return list;
    }
}
