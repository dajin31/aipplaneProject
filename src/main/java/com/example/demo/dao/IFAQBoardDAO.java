package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import com.example.demo.vo.FAQBoardVO;

public interface IFAQBoardDAO {

	// 게시글 쓰기
	public int insertFAQBoard(FAQBoardVO faqBoardVo);
	
	// 게시글 삭제
	public int deleteFAQBoard(int num);
	
	// 게시글 수정
	public int updateFAQBoard(FAQBoardVO faqBoardVo);
	
	// 게시글 리스트 - 검색 포함 
	public List<FAQBoardVO> selectByPage(Map<String, Object> map);
	
	//전체 게시글 갯수 구하기
	public int totalCount(Map<String, Object> map) ;
	
}
