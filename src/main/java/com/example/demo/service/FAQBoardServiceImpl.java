package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.demo.dao.FAQBoardDAOImpl;
import com.example.demo.dao.IFAQBoardDAO;
import com.example.demo.vo.FAQBoardVO;
import com.example.demo.vo.FAQPageVO;

public class FAQBoardServiceImpl implements IFAQBoardService {
	
	//dao 객체
	private IFAQBoardDAO dao;
	
	//자신의 객체
	private static FAQBoardServiceImpl service;
	
	//생성자 - dao객체 얻기
	private FAQBoardServiceImpl() {
		dao = FAQBoardDAOImpl.getInstance();
	}

	//자신의 객체를 생성하고 리턴하는 메소드 
	public static FAQBoardServiceImpl getInstance() {
        if(service == null) service = new FAQBoardServiceImpl();
        return service;
    }

	// 새 FAQ 작성
	@Override
	public int insertFAQBoard(FAQBoardVO faqBoardVo) {
		return dao.insertFAQBoard(faqBoardVo);
	}

	// 기존 FAQ 삭제
	@Override
	public int deleteFAQBoard(int faq_id) {
		return dao.deleteFAQBoard(faq_id);
	}
	
	// 기존 FAQ 수정
	@Override
	public int updateFAQBoard(FAQBoardVO faqBoardVo) {
		return dao.updateFAQBoard(faqBoardVo);
	}
	
	// 게시글 리스트 출력
	@Override
	public List<FAQBoardVO> selectByPage(Map<String, Object> map) {
		return dao.selectByPage(map);
	}

	// 게시글 리스트 - 페이지
	@Override
	public FAQPageVO pageInfo(int page, String stype, String sword) {
		
		// 전체 글 개수 구하기
		Map<String, Object> map = new HashMap<>();
		map.put("sword", sword);
		map.put("stype", stype);
		
		int count = this.totalCount(map);
		
		// 전체페이지 수 구하기
		int totalPage = (int)Math.ceil((double)count  /  FAQPageVO.getPerList());
		if(page > totalPage ) page = totalPage;
		
		//start, end 구하기  19 21-
		int start = (page-1) * FAQPageVO.getPerList() + 1;
		int end = start + FAQPageVO.getPerList() - 1;
		if(end > count) end = count;
		
		//시작페이지 끝페이지
		int perPage = FAQPageVO.getPerPage();
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage- 1; 
		if(endPage > totalPage)  endPage = totalPage;
		
		
		FAQPageVO  faqpageVo = new FAQPageVO();
		faqpageVo.setCurrentPage(page);
		faqpageVo.setStart(start);
		faqpageVo.setEnd(end);
		
		faqpageVo.setStartPage(startPage);
		faqpageVo.setEndPage(endPage);
		faqpageVo.setTotalPage(totalPage);
		
		return faqpageVo;
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		return dao.totalCount(map);
	}
	
}
