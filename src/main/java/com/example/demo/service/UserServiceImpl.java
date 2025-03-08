package com.example.demo.service;

import com.example.demo.dao.UserDAO;
import com.example.demo.dao.UserDAOImpl;
import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.OrdersVO;
import com.example.demo.vo.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserServiceImpl implements UserService {
    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
    private UserDAO dao;
    private static UserServiceImpl service;

    private UserServiceImpl() {
        dao = UserDAOImpl.getInstance();
    }

    public static UserServiceImpl getInstance() {
        if (service == null) {
            service = new UserServiceImpl();
        }
        return service;
    }

    @Override
    public int selectUser(UserVO usersVO) {
        return dao.selectUser(usersVO);
    }

    @Override
    public int selectMileage(String userId) {
        return dao.selectMileage(userId);
    }

    @Override
    public int insertOrder(OrdersVO ordersVO) {
        return dao.insertOrder(ordersVO);
    }

    @Override
    public int updateMileage(UserVO usersVO) {
        return dao.updateMileage(usersVO);
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
            // 비밀번호 검증 (예시: 평문 비교)
            if (!user.getUserPw().equals(userPw)) {
                logger.warn("로그인 실패: 사용자 ID={} 비밀번호 불일치", userId);
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

    @Override
    public UserVO getUserByNameRegnumEmail(String userName, String userRegnum, String userEmail) throws Exception {
        try {
            return dao.getUserByNameRegnumEmail(userName, userRegnum, userEmail);
        } catch (Exception e) {
            logger.error("getUserByNameRegnumEmail 실행 중 오류 발생", e);
            throw new RuntimeException("회원 정보 조회 중 오류 발생", e);
        }
    }

}