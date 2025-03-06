package com.example.demo.dao;

import com.example.demo.vo.UserVO;

import java.util.List;
import java.util.Map;

public interface IAdminDAO {

	// 회원 삭제
    public int deleteUser(String userId);
	
	// 회원 정보 수정
    public int updateUser(UserVO user);
	
	// 회원 리스트 - 검색
	public List<UserVO> selectById (Map<String, Object> map);
	
	// 전체 회원 수
	public int totalCount(Map<String, Object> map);

	// 상세 회원 정보?
	public UserVO getUserById(String userId);
	
}
