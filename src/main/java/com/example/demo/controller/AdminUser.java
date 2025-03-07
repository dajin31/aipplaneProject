package com.example.demo.controller;

import com.example.demo.service.AdminServiceImpl;
import com.example.demo.service.IAdminService;
import com.example.demo.vo.AdminPageVO;
import com.example.demo.vo.UserVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/AdminUser")
public class AdminUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// UserVO loginUser = (UserVO) session.getAttribute("loginUser");

		IAdminService adminService = AdminServiceImpl.getInstance();
		// IUserService userService = UserServiceImp.getInstance();

		// 페이징 처리
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// 검색 조건
		String stype = request.getParameter("stype");
		String sword = request.getParameter("sword");

		// 페이지 정보 계산
		AdminPageVO pageVO = adminService.pageInfo(page, stype, sword);

		// 검색 조건 맵 생성
		Map<String, Object> map = new HashMap<>();
		map.put("start", pageVO.getStart());
		map.put("end", pageVO.getEnd());
		map.put("stype", stype);
		map.put("sword", sword);

		// 회원 목록 조회
		List<UserVO> userList = adminService.selectById(map);

		// 요청 속성 설정
		request.setAttribute("userList", userList);
		request.setAttribute("pageVO", pageVO);
		request.setAttribute("stype", stype);
		request.setAttribute("sword", sword);

		// JSP로 포워딩
		request.getRequestDispatcher("/admin/admin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}