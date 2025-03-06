package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.FAQBoardVO;


public class FAQBoardDAOImpl implements IFAQBoardDAO {
    
    // 싱글톤
    private static FAQBoardDAOImpl dao;
    
    private FAQBoardDAOImpl() { }
    
    // 자신의 객체를 생성하고 리턴하는 메소드
    public static FAQBoardDAOImpl getInstance() {
        if(dao == null) dao = new FAQBoardDAOImpl();
        return dao;
    }

	@Override
	public int insertFAQBoard(FAQBoardVO faqBoardVo) {
		int res = 0;
		SqlSession  session = MyBatisUtil.getSession();
		
		try {
			res = session.insert("faqBoard.insertBoard", faqBoardVo);
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int deleteFAQBoard(int faq_id) {
		int res = 0;
		SqlSession session = MyBatisUtil.getSession();

		try {
			res = session.delete("faqBoard.deleteBoard", faq_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int updateFAQBoard(FAQBoardVO faqBoardVo) {
		int res = 0;
		SqlSession session = MyBatisUtil.getSession();

		try {
			res = session.update("faqBoard.updateBoard", faqBoardVo);
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public List<FAQBoardVO> selectByPage(Map<String, Object> map) {
		List<FAQBoardVO> list = null;
		SqlSession session = MyBatisUtil.getSession();

		try {
			list = session.selectList("faqBoard.selectByPage", map);
		} finally {
			session.commit();
			session.close();
		}
		return list;
	}
	
	@Override
	public int totalCount(Map<String, Object> map) {
		int res = 0;
		SqlSession session = MyBatisUtil.getSession();

		try {
			res = session.selectOne("faqBoard.totalCount", map);
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}
}