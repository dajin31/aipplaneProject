package com.example.demo.service;

import com.example.demo.vo.OrdersVO;
import com.example.demo.vo.UserVO;
import com.example.demo.vo.UsersVO;

public interface UserService {
    public int selectUser(UsersVO usersVO); //유저 있는지 확인
    public int selectMileage(String userId); // 마일리지 가져오기
    public int insertOrder(OrdersVO ordersVO); // 주문 테이블 insert
    public int updateMileage(UsersVO usersVO); // 유저 마일리지 업데이트

    //
    // 중복검사
    public int userIdCount(String userId);

    // insert
    public int insertUser(UserVO user);

    // 회원 정보 조회
    UserVO getUser(String userId);

    // 로그인
    UserVO login(String userId, String userPw);

    // 비밀번호 찾기
    UserVO getUserByIdRegnumEmail(String userId, String userRegnum, String userEmail) throws Exception;

    // 아이디 찾기
    UserVO getUserByNameRegnumEmail(String userName, String userRegnum, String userEmail) throws Exception;

    void updateUserPassword(UserVO user) throws Exception;

    public UserVO getmyUser(String userId);

    public int updatePassUser(UserVO userVO);

    public int updateUser(UserVO userVO);
}
