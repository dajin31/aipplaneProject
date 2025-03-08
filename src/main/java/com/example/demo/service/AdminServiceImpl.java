package com.example.demo.service;

import com.example.demo.dao.AdminDAOImpl;
import com.example.demo.dao.IAdminDAO;
import com.example.demo.vo.AdminPageVO;
import com.example.demo.vo.UserVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdminServiceImpl implements IAdminService {

	//dao 객체
	private IAdminDAO dao;

	//자신의 객체
	private static AdminServiceImpl service;

	//생성자 - dao객체 얻기
	private AdminServiceImpl() {
		dao = AdminDAOImpl.getInstance();
	}

	// 자신의 객체를 생성하고 리턴하는 메서드
	public static AdminServiceImpl getInstance() {
		if (service == null) service = new AdminServiceImpl();
		return service;
	}

	// 회원 삭제
	@Override
	public int deleteUser(String userId) {
		return dao.deleteUser(userId);
	}

	// 회원 정보 수정
	@Override
	public int updateUser(UserVO user) {
		return dao.updateUser(user);
	}

	// 회원 리스트 출력
	@Override
	public List<UserVO> selectById(Map<String, Object> map) {
		return dao.selectById(map);
	}

	// 회원 리스트 - paging 처리
	@Override
	public AdminPageVO pageInfo(int page, String stype, String sword) {

		// 전체 회원 수 구하기
		Map<String, Object> map = new HashMap<>();
		map.put("sword", sword);
		map.put("stype", stype);

		int count = this.totalCount(map);

		// 전체 페이지 수 구하기
		int totalPage = (int) Math.ceil((double) count / AdminPageVO.getPerList());
		if (totalPage == 0) totalPage = 1; //  최소 1페이지 표시
		if (page > totalPage) page = totalPage;

		// start, end 구하기
		int start = (page - 1) * AdminPageVO.getPerList() + 1;
		int end = start + AdminPageVO.getPerList() - 1;
		if (end > count) end = count;

		// 시작페이지 끝페이지
		int perPage = AdminPageVO.getPerPage();
		int startPage = ((page - 1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		if (endPage > totalPage) endPage = totalPage;

		AdminPageVO adminpageVo = new AdminPageVO();
		
		// 회원 수
		adminpageVo.setCount(count); 
		adminpageVo.setCurrentPage(page);
		adminpageVo.setStart(start);
		adminpageVo.setEnd(end);

		adminpageVo.setStartPage(startPage);
		adminpageVo.setEndPage(endPage);
		adminpageVo.setTotalPage(totalPage);

		return adminpageVo;
	}

	// 전체 회원 수
	@Override
	public int totalCount(Map<String, Object> map) {
		return dao.totalCount(map);
	}

	// admin 제외 회원 
	@Override
	public UserVO getUserById(String userId) {
		return dao.getUserById(userId);
	}

	@Override
	public List<UserVO> getAllUsers() {
		return dao.getAllUsers();
	}
}
