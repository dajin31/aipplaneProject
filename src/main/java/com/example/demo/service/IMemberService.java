package com.example.demo.service;


import com.example.demo.vo.MemVO;
import com.example.demo.vo.UsersVO;

public interface IMemberService {
//	중복검사
	public int memberIdCount(String memId);
//	insert
	public int insertMember(MemVO memVO);

///  로그인하기
	public int getLoginUser(UsersVO usersVO);
}
