package com.example.demo.service;

import com.example.demo.dao.IUserDAO;
import com.example.demo.dao.UserDaoImp;
import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserServiceImp implements IUserService {
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImp.class);
	private IUserDAO dao;
	private static UserServiceImp service;

	private UserServiceImp() {
		dao = UserDaoImp.getInstance();
	}

	public static UserServiceImp getInstance() {
		if (service == null) {
			service = new UserServiceImp();
		}
		return service;
	}

	@Override
	public int userIdCount(String userId) {
		try {
			return dao.userIdCount(userId);
		} catch (Exception e) {
			logger.error("userIdCount 실행 중 오류 발생", e);
			throw new RuntimeException("아이디 중복 확인 중 오류 발생", e);
		}
	}

	public int insertUser(UserVO user) {
		int result = 0;
		SqlSession session = MyBatisUtil.getSession();

		try {
			result = session.insert("user.insertUser", user);
			if (result > 0) {
				session.commit();
				logger.info("회원 가입 성공: " + user.getUserId());
			} else {
				session.rollback();
				logger.error("회원 가입 실패 - DB 삽입 실패: " + user.getUserId());
			}
		} catch (Exception e) {
			session.rollback();
			logger.error("회원 가입 오류: " + e.getMessage(), e);
			throw new RuntimeException("회원 가입 중 오류 발생", e);
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public UserVO getUser(String userId) {
		try {
			return dao.getUser(userId);
		} catch (Exception e) {
			logger.error("getUser 실행 중 오류 발생", e);
			throw new RuntimeException("회원 정보 조회 중 오류 발생", e);
		}
	}

	public UserVO login(String userId, String userPw) {
		try {
			UserVO user = dao.getUser(userId);
			if (user == null) {
				logger.warn("로그인 실패: 사용자 ID={} 없음", userId);
				return null;
			}

			logger.info("로그인 시도: 사용자 ID={}", userId);
			return user;

		} catch (Exception e) {
			logger.error("로그인 실패: 사용자 ID={}, 오류 메시지={}", userId, e.getMessage(), e);
			throw new RuntimeException("로그인 처리 중 오류 발생", e);
		}
	}

	@Override
	public UserVO getUserByIdRegnumEmail(String userId, String userRegnum, String userEmail) throws Exception {
		try {
			return dao.getUserByIdRegnumEmail(userId, userRegnum, userEmail);
		} catch (Exception e) {
			logger.error("getUserByIdRegnumEmail 실행 중 오류 발생", e);
			throw new RuntimeException("회원 정보 조회 중 오류 발생", e);
		}
	}

	@Override
	public void updateUserPassword(UserVO user) throws Exception {
		try {
			dao.updateUserPassword(user);
		} catch (Exception e) {
			logger.error("updateUserPassword 실행 중 오류 발생", e);
			throw new RuntimeException("비밀번호 업데이트 중 오류 발생", e);
		}
	}
}