package com.example.demo.service;

import com.example.demo.vo.UserVO;

public interface IUserService {
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

	void updateUserPassword(UserVO user) throws Exception;
}
