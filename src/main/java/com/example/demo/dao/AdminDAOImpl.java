package com.example.demo.dao;

import com.example.demo.vo.UserVO;
import com.example.demo.util.MyBatisUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class AdminDAOImpl implements IAdminDAO {

	private static AdminDAOImpl dao;

	private AdminDAOImpl() {}

	public static AdminDAOImpl getInstance() {
		if(dao == null) dao = new AdminDAOImpl();
		return dao;
	}

	@Override
	public int deleteUser(String userId) {
		SqlSession session = MyBatisUtil.getSession();
		int result = session.delete("admin.deleteUser", userId);
		session.commit();
		session.close();
		return result;
	}

	@Override
	public int updateUser(UserVO user) {
		SqlSession session = MyBatisUtil.getSession();
		int result = session.update("admin.updateUser", user);
		session.commit();
		session.close();
		return result;
	}

	@Override
	public List<UserVO> selectById(Map<String, Object> map) {
		SqlSession session = MyBatisUtil.getSession();
		List<UserVO> list = session.selectList("admin.selectById", map);
		session.close();
		return list;
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		SqlSession session = MyBatisUtil.getSession();
		int count = session.selectOne("admin.totalCount", map);
		session.close();
		return count;
	}

	@Override
	public UserVO getUserById(String userId) {
		SqlSession session = MyBatisUtil.getSession();
		UserVO user = session.selectOne("admin.getUserById", userId);
		session.close();
		return user;
	}

	@Override
	public List<UserVO> getAllUsers() {
		SqlSession session = MyBatisUtil.getSession();
		List<UserVO> list = session.selectList("admin.getAllUser");
		session.close();
		return list;
	}
}