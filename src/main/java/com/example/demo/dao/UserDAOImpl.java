package com.example.demo.dao;

import com.example.demo.util.MyBatisUtil;
import com.example.demo.vo.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

public class UserDAOImpl implements UserDAO {
    private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);
    private static UserDAOImpl dao;
    private static final String PROPERTIES_PATH = "config/db.properties";
    private String url;
    private String user;
    private String password;
    private String driver;

    private UserDAOImpl() {
        loadDbProperties();
    }

    private void loadDbProperties() {
        Properties properties = new Properties();
        try (FileInputStream fis = new FileInputStream(PROPERTIES_PATH)) {
            properties.load(fis);
            driver = properties.getProperty("driver");
            url = properties.getProperty("url");
            user = properties.getProperty("username");
            password = properties.getProperty("password");
        } catch (IOException e) {
            logger.error("db.properties 파일 로딩 오류: {}", e.getMessage(), PROPERTIES_PATH);
        }
    }

    public static UserDAOImpl getInstance() {
        if (dao == null) dao = new UserDAOImpl();
        return dao;
    }

    @Override
    public int userIdCount(String userId) {
        SqlSession session = null;
        int count = 0;
        try {
            session = MyBatisUtil.getSession();
            count = session.selectOne("user.userIdCount", userId);
        } catch (Exception e) {
            logger.error("userIdCount 오류: {}", e.getMessage());
            throw new RuntimeException("아이디 개수 조회 중 오류 발생", e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return count;
    }

    @Override
    public int insertUser(UserVO userVO) {
        SqlSession session = null;
        int count = 0;
        try {
            session = MyBatisUtil.getSession();
            count = session.insert("user.insertUser", userVO);
            session.commit();
        } catch (Exception e) {
            if (session != null) {
                session.rollback();
            }
            logger.error("insertUser 오류: {}", e.getMessage());
            throw new RuntimeException("회원 가입 중 오류 발생", e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return count;
    }

    @Override
    public UserVO login(String userId, String userPw) {
        SqlSession session = MyBatisUtil.getSession();
        UserVO user = null;
        try {
            Map<String, String> paramMap = new HashMap<>();
            paramMap.put("user_id", userId);
            paramMap.put("user_pw", userPw);
            user = session.selectOne("user.login", paramMap);  // MyBatis에 정의된 login 호출
        } catch (Exception e) {
            logger.error("로그인 오류 발생", e);
        } finally {
            session.close();
        }
        return user;
    }

    @Override
    public UserVO getUser(String userId) {
        SqlSession session = null;
        UserVO user = null;
        try {
            session = MyBatisUtil.getSession();
            logger.info("getUser() 호출 - 입력된 ID: {}", userId);

            user = session.selectOne("user.getUser", userId);

            if (user == null) {
                logger.warn("getUser() 결과: 사용자를 찾을 수 없음 (null 반환)");
            } else {
                logger.info("getUser() 결과: {}", user);
            }

        } catch (Exception e) {
            logger.error("getUser 오류: {}", e.getMessage());
            throw new RuntimeException("회원 정보 조회 중 오류 발생", e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return user;
    }

    @Override
    public UserVO getUserByIdRegnumEmail(String userId, String userRegnum, String userEmail) {
        SqlSession session = null;
        UserVO user = null;
        try {
            session = MyBatisUtil.getSession();
            user = session.selectOne("user.getUserByIdRegnumEmail", UserVO.createUserVOForFindPassword(userId, userRegnum, userEmail));
        } catch (Exception e) {
            logger.error("getUserByIdRegnumEmail 오류: {}", e.getMessage());
            throw new RuntimeException("회원 정보 조회 중 오류 발생", e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return user;
    }

    @Override
    public void updateUserPassword(UserVO user) {
        SqlSession session = null;
        try {
            session = MyBatisUtil.getSession();
            session.update("user.updateUserPassword", user);
            session.commit();
        } catch (Exception e) {
            if (session != null) {
                session.rollback();
            }
            logger.error("updateUserPassword 오류: {}", e.getMessage());
            throw new RuntimeException("비밀번호 업데이트 중 오류 발생", e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }

    @Override
    public UserVO getUserByNameRegnumEmail(String userName, String userRegnum, String userEmail) {
        SqlSession session = null;
        UserVO user = null;
        try {
            session = MyBatisUtil.getSession();

            List<UserVO> userList = session.selectList("user.getUserByNameRegnumEmail", UserVO.createUserVOForFindId(userName, userRegnum, userEmail)); // 수정: selectList 사용 및 팩토리 메서드 사용

            if (userList != null && !userList.isEmpty()) {
                user = userList.get(0); // 첫 번째 결과 사용
                logger.info("getUserByNameRegnumEmail 결과: {}", user);
            } else {
                logger.debug("getUserByNameRegnumEmail 결과: 사용자를 찾을 수 없음 (null 반환)"); // 수정: debug 레벨
            }

        } catch (Exception e) {
            logger.error("getUserByNameRegnumEmail 오류: {}", e.getMessage());
            throw new RuntimeException("회원 정보 조회 중 오류 발생", e);
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return user;
    }
}