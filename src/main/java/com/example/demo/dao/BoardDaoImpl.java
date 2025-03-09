package com.example.demo.dao;

import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.Board1_1VO;
import com.example.demo.vo.Reply1_1VO;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class BoardDaoImpl implements BoardDao {
    private static BoardDao dao;

    public BoardDaoImpl() {
    }

    public static BoardDao getInstance() {
        if(dao == null) {
            dao = new BoardDaoImpl();
        }
        return dao;
    }

    @Override
    public int insertBoard(Board1_1VO boardVO) {
        int res = 0;
        SqlSession session = MyBatisUtil.getSession();

        try {
            res = session.insert("board1_1.insertBoard", boardVO);
            System.out.println("dao insert res : " + res);
        } finally {
            session.commit();
            session.close();
        }
        return res;
    }

    @Override
    public int deleteBoard(int board_id) {
        int res = 0;
        SqlSession session = MyBatisUtil.getSession();

        try {
            res = session.delete("board1_1.deleteBoard", board_id);
            System.out.println("dao delete res : " + res);
        } finally {
            session.commit();
            session.close();
        }
        return res;
    }

    @Override
    public Board1_1VO getBoard(int board_id) {
        Board1_1VO boardVO = null;
//        int res = 0;
        SqlSession session = MyBatisUtil.getSession();

        try {
            return session.selectOne("board1_1.getBoard", board_id);
        } finally {
            session.commit();
            session.close();
        }

    }

    @Override
    public int updateBoard(Board1_1VO boardVO) {
        int res = 0;
        SqlSession  session = MyBatisUtil.getSession();

        try {
            res = session.update("board1_1.updateBoard", boardVO);
            System.out.println("update res : " + res);
        } finally {
            session.commit();
            session.close();
        }
        return res;
    }

    
    @Override
    public List<Board1_1VO> selectByPage(Map<String, Object> map) {
        List<Board1_1VO> boardVOList = null;
        SqlSession session = MyBatisUtil.getSession();

        try {
            boardVOList = session.selectList("board1_1.selectByPage", map);
        }finally {
            session.commit();
            session.close();
        }
        return boardVOList;
    }

    @Override
    public int totalCount(Map<String, Object> map) {
        int res = 0;
        SqlSession session = MyBatisUtil.getSession();

        try{
            res = session.selectOne("board1_1.totalCount", map);
        }finally {
            session.commit();
            session.close();
        }
        return res;
    }

    @Override
    public Reply1_1VO getReply(int board_id) {
        Reply1_1VO replyVO = null;

        SqlSession session = MyBatisUtil.getSession();

        try {
            replyVO = session.selectOne("board1_1.getReply", board_id);
        } finally {
            session.commit();
            session.close();
        }
        return replyVO;
    }

    //-------------------------------------------------------------------------------------------------

    @Override
    public int insertReply(Reply1_1VO replyVO) {
        int res = 0;
        SqlSession session = MyBatisUtil.getSession();

        try{
            res = session.insert("board1_1.insertReply", replyVO);
        }finally {
            session.commit();
            session.close();
        }
        return res;
    }

    @Override
    public int deleteReply(int reply_id) {
        int res = 0;
        SqlSession session = MyBatisUtil.getSession();

        try{
            res = session.delete("board1_1.deleteReply", reply_id);
        }finally {
            session.commit();
            session.close();
        }
        return res;
    }

    @Override
    public int updateReply(Reply1_1VO reply11VO) {
        int res = 0;
        SqlSession session = MyBatisUtil.getSession();
        try{
            res = session.update("board1_1.updateReply", reply11VO);
        }finally {
            session.commit();
            session.close();
        }
        return res;
    }
}
