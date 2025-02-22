package com.example.demo.dao;

import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.ProductVO;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements IProductDAO {
    private static IProductDAO dao;

    private ProductDAO() {

    }

    public static IProductDAO getInstance() {
        if (dao == null) {
            dao = new ProductDAO();
        }
        return dao;
    }

    @Override
    public List<ProductVO> selectAllProduct() {
        SqlSession session = null;

        List<ProductVO> list = new ArrayList<>();

        try {
            session = MyBatisUtil.getSession();
            list = session.selectList("selectAllProduct");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
           if(session !=null) session.close();
        }
        return list;
    }

    @Override
    public List<ProductVO> selectMakeupProduct() {
        SqlSession session = null;

        List<ProductVO> list = new ArrayList<>();

        try {
            session = MyBatisUtil.getSession();
            list = session.selectList("selectMakeupProduct");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(session !=null) session.close();
        }
        return list;
    }

    @Override
    public List<ProductVO> selectGroceryProduct() {
        SqlSession session = null;

        List<ProductVO> list = new ArrayList<>();

        try {
            session = MyBatisUtil.getSession();
            list = session.selectList("selectGroceryProduct");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(session !=null) session.close();
        }
        return list;
    }

    @Override
    public List<ProductVO> selectFoodProduct() {
        SqlSession session = null;

        List<ProductVO> list = new ArrayList<>();

        try {
            session = MyBatisUtil.getSession();
            list = session.selectList("selectFoodProduct");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(session !=null) session.close();
        }
        return list;
    }

    @Override
    public List<ProductVO> selectSearchList(String prodName) {
        SqlSession session = null;

        List<ProductVO> list = new ArrayList<>();

        try {
            session = MyBatisUtil.getSession();
            list = session.selectList("selectSearchList",prodName);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(session !=null) session.close();
        }
        return list;
    }


    @Override
    public int selectAllCnt() {
        SqlSession session = null;

        int cnt = 0;

        try {
            session = MyBatisUtil.getSession();
            cnt = session.selectOne("selectAllCnt");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(session !=null) session.close();
        }
        return cnt;
    }
}
