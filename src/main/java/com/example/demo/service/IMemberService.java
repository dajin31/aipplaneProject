package com.example.demo.service;


import com.example.demo.vo.MemVO;

public interface IMemberService {
//	중복검사
	public int memberIdCount(String memId);
//	insert
	public int insertMember(MemVO memVO);
}
