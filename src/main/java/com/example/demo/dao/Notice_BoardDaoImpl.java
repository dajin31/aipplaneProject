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
    public int insertBoard(Notice_BoardVO nboardVO) {
        int res = 0;
        SqlSession session = MyBatisUtil.getSession();

        try{
            System.out.println("Dao insert title : "+ nboardVO.getNtc_title());
            res = session.insert("notice.insertBoard", nboardVO);
            System.out.println(nboardVO.getNtc_title());
            System.out.println(res);
        }finally{
            session.commit();
            session.close();
        }
        return res;
    }

    @Override
    public int updateBoard(Notice_BoardVO nboardVO) {
        int res = 0;
        SqlSession session = MyBatisUtil.getSession();

        try{
            res = session.update("notice.updateBoard", nboardVO);
        }finally{
            session.commit();
            session.close();
        }
        return res;
    }

    @Override
    public int deleteBoard(int ntc_board) {
        int res = 0;
        SqlSession session = MyBatisUtil.getSession();

        try{
            res = session.delete("notice.deleteBoard", ntc_board);
            System.out.println("Dao res = " + res);
        }finally{
            session.commit();
            session.close();
        }
        return res;
    }

    @Override
    public Notice_BoardVO getBoard(int ntc_board) {
        Notice_BoardVO nboardVO = null;
        SqlSession session = MyBatisUtil.getSession();

        try{
            nboardVO = session.selectOne("notice.getBoard", ntc_board);
            System.out.println(nboardVO);
        }finally{
            session.commit();
            session.close();
        }
        return nboardVO;
    }


    @Override
    public List<Notice_BoardVO> selectByPage(Map<String, Object> map) {
        List<Notice_BoardVO> list = null;
        SqlSession session = MyBatisUtil.getSession();

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
        SqlSession  session = MyBatisUtil.getSession();

        try {
            res = session.selectOne("notice.totalCount", map);
        } finally {
            session.commit();
            session.close();
        }
        return res;
    }
}
