package com.example.demo.service;

import java.util.List;
import java.util.Map;

import com.example.demo.vo.FAQBoardVO;
import com.example.demo.vo.FAQPageVO;

public interface IFAQBoardService {

	// 게시글 쓰기
	public int insertFAQBoard(FAQBoardVO faqBoardVo);
	
	// 게시글 삭제
	public int deleteFAQBoard(int num);
	
	// 게시글 수정
	public int updateFAQBoard(FAQBoardVO faqBoardVo);
	
	// 게시글 리스트 - 검색 포함 
	public List<FAQBoardVO>  selectByPage(Map<String, Object> map);
	
	//전체글 갯수 구하기
	public int totalCount(Map<String, Object> map) ;
	
	//페이지별 정보구하기 - 페이지 처리 를 위한 정보 -
	public FAQPageVO  pageInfo(int page, String stype, String sword);
	
}
