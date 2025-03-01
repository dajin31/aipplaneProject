package com.example.demo.dao;

import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.Notice_BoardVO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class Notice_BoardDaoImpl implements Notice_BoardDao {

    private static Notice_BoardDao dao;

    public Notice_BoardDaoImpl() {
    }

    public static Notice_BoardDao getInstance() {
        if(dao == null) {
            dao = new Notice_BoardDaoImpl();
        }
        return dao;
    }

    @Override
    public int insertBoard(Notice_BoardVO boardVO) {
        int res = 0;
        SqlSession session = MyBatisUtil.getSqlSession(); //

        try{
            res = session.insert("notice.insertBoard", boardVO);
        }finally{
            session.commit();
            session.close();
        }
        return res;
    }

    @Override
    public int updateBoard(Notice_BoardVO boardVO) {
        int res = 0;
        SqlSession session = MyBatisUtil.getSqlSession();

        try{
            res = session.insert("notice.updateBoard", boardVO);
        }finally{
            session.commit();
            session.close();
        }
        return res;
    }

    @Override
    public int deleteBoard(int ntc_board) {
        int res = 0;
        SqlSession session = MyBatisUtil.getSqlSession();

        try{
            res = session.insert("notice.deleteBoard", ntc_board);
        }finally{
            session.commit();
            session.close();
        }
        return res;
    }

    @Override
    public Notice_BoardVO getBoard(int ntc_board) {
        Notice_BoardVO boardVO = null;
        SqlSession session = MyBatisUtil.getSqlSession();

        try{
            boardVO = session.selectOne("notice.getBoard", ntc_board);
        }finally{
            session.commit();
            session.close();
        }
        return boardVO;
    }


    @Override
    public List<Notice_BoardVO> selectByPage(Map<String, Object> map) {
        List<Notice_BoardVO> list = null;
        SqlSession session = MyBatisUtil.getSqlSession();

        try{
            list = session.selectList("notice.selectByPage", map);
        }finally{
            session.commit();
            session.close();
        }
        return list;
    }

    @Override
    public int totalCount(Map<String, Object> map) {
        int res = 0;
        SqlSession  session = MyBatisUtil.getSqlSession();

        try {
            res = session.selectOne("notice.totalCount", map);
        } finally {
            session.commit();
            session.close();
        }
        return res;
    }
}
