//package com.example.demo.dao;
//
//import com.example.demo.vo.UserVO;
//
//import java.util.List;
//import java.util.Map;
//
//public class AdminDAOImpl2 implements IAdminDAO {
//
//	// 싱글톤
//	private static AdminDAOImpl2 dao;
//
//	private AdminDAOImpl2() {};
//
//	// 자신의 객체를 생성하고 리턴하는 메서드
//	public static AdminDAOImpl2 getInstatnce() {
//		if(dao == null) dao = new AdminDAOImpl2();
//		return dao;
//	}
//
//	@Override
//	public int deleteUser(String userId) {
//		return 0;
//	}
//
//	@Override
//	public int updateUser(UserVO user) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public List<UserVO> selectById(Map<String, Object> map) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public int totalCount(Map<String, Object> map) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//
//}