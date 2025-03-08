package com.example.demo.dao;

import com.example.demo.vo.UserVO;

public interface IUserDAO {
    int userIdCount(String userId);

    int insertUser(UserVO usersVO);

    UserVO login(String userId, String userPw);

    UserVO getUser(String userId);

    UserVO getUserByNameBirthEmail(String userName, String userRegNum, String userEmail);

    UserVO getUserByIdRegNumEmail(String userId, String userRegNum, String userEmail); // 추가

    void updateUserPassword(UserVO user); // 추가
}
