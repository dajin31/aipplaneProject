package com.example.demo.dao;

import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.OrdersVO;
import com.example.demo.vo.UsersVO;
import org.apache.ibatis.session.SqlSession;

public class UsersDAO implements IUsersDAO{
    private static IUsersDAO dao;

    public UsersDAO() {

    }

    public static IUsersDAO getInstance() {
        if (dao == null) {
            dao = new UsersDAO();
        }
        return dao;
    }


    @Override
    public int selectUser(UsersVO usersVO) {
        SqlSession session = null;
        int cnt = 0;

        try{
            session = MyBatisUtil.getSession();
            cnt = session.selectOne("selectUser", usersVO);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(session != null){
                session.close();
            }
        }
        return cnt;
    }

    @Override
    public int selectMileage(String userId) {
        SqlSession session = null;
        int mile = 0;

        try{
            session = MyBatisUtil.getSession();
            mile = session.selectOne("selectMileage", userId);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(session != null){
                session.close();
            }
        }
        return mile;
    }

    @Override
    public int insertOrder(OrdersVO ordersVO) {
        SqlSession session = null;
        int cnt = 0;

        try {
            session = MyBatisUtil.getSession();
            cnt = session.insert("insertOrder", ordersVO);
            session.commit();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(session != null){
                session.close();
            }
        }
        return cnt;
    }

    @Override
    public int updateMileage(UsersVO usersVO) {
        SqlSession session = null;
        int cnt = 0;

        try {
            session = MyBatisUtil.getSession();
            cnt = session.update("updateMileage", usersVO);
            session.commit();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(session != null){
                session.close();
            }
        }
        return cnt;
    }
}
