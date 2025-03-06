package com.example.demo.dao;

import com.example.demo.vo.UserVO;

public interface IUserDAO {
	int userIdCount(String userId);

	int insertUser(UserVO userVO);

	UserVO login(String userId, String userPw);

	UserVO getUser(String userId);

	UserVO getUserByIdRegnumEmail(String userId, String userRegnum, String userEmail);// 추가

	UserVO getUserByNameRegnumEmail(String userName, String userRegnum, String userEmail);

	void updateUserPassword(UserVO user); // 추가
}
