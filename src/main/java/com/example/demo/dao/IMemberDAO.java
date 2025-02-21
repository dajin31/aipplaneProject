package com.example.demo.dao;


import com.example.demo.vo.MemVO;

public interface IMemberDAO {
//	중복검사
	public int memberIdCount(String memId);
//	insert
	public int insertMember(MemVO memVO);
}
