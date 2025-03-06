package com.example.demo.dao;


import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.UserVO;
import org.apache.ibatis.session.SqlSession;

public class UserDAOImpl implements UserDAO {
    private static UserDAO dao;

    public UserDAOImpl() {

    }

    public static UserDAO getInstance() {
        if (dao == null) {
            dao = new UserDAOImpl();
        }
        return dao;
    }

    @Override
    public int selectUser(UserVO userVO) {
        SqlSession session = null;
        int cnt = 0;

        try {
            session = MyBatisUtil.getSession();
            cnt = session.selectOne("selectUser", userVO);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return cnt;
    }

    @Override
    public int selectMileage(String userId) {
        SqlSession session = null;
        int mileage = 0;

        try {
            session = MyBatisUtil.getSession();
            mileage = session.selectOne("selectMileage", userId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return mileage;
    }

    @Override
    public int updateMileage(UserVO userVO) {
        SqlSession session = null;
        int cnt = 0;

        try {
            session = MyBatisUtil.getSession();
            cnt = session.update("updateMileage", userVO);
            session.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return cnt;
    }
}
