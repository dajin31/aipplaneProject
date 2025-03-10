package com.example.demo.dao;

import com.example.demo.vo.OrdersVO;
import com.example.demo.vo.UserVO;
import com.example.demo.vo.UsersVO;

public interface UserDAO {
    public int selectUser(UsersVO usersVO); //유저 있는지 확인
    public int selectMileage(String userId); // 마일리지 가져오기
    public int insertOrder(OrdersVO ordersVO); // 주문 테이블 insert
    public int updateMileage(UsersVO usersVO); // 유저 마일리지 업데이트

    //
    int userIdCount(String userId);

    int insertUser(UserVO userVO);

    UserVO login(String userId, String userPw);

    UserVO getUser(String userId);

    UserVO getUserByIdRegnumEmail(String userId, String userRegnum, String userEmail);// 추가

    UserVO getUserByNameRegnumEmail(String userName, String userRegnum, String userEmail);

    void updateUserPassword(UserVO user); // 추가


    //    마이페이지
    public UserVO getmyUser(String userId);

    public int updatePassUser(UserVO userVO);

    public int updateUser(UserVO userVO);
}
