package com.example.demo.controller;

import com.example.demo.service.IUserService;
import com.example.demo.service.UserServiceImp;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import com.example.demo.service.AdminServiceImpl;
import com.example.demo.service.IAdminService;
import com.example.demo.vo.UserVO;
import com.example.demo.vo.AdminPageVO;

@WebServlet("/AdminUser")
public class AdminUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IAdminService adminService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");

		IAdminService adminService = AdminServiceImpl.getInstance();
		IUserService userService = UserServiceImp.getInstance();

//		if (loginUser == null || !loginUser.getMemCode().equals("admin")) {
//			response.sendRedirect(request.getContextPath() + "/user/login.jsp");			// 관리자 인증 필요 없을듯
//			return;
//		}

		String stype = request.getParameter("stype");
		String sword = request.getParameter("sword");
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("stype", stype);
		paramMap.put("sword", sword);

		AdminPageVO pageVO = adminService.pageInfo(page, stype, sword);
		List<UserVO> userList = adminService.selectById(paramMap);

		request.setAttribute("pageVO", pageVO);
		request.setAttribute("userList", userList);
		request.setAttribute("stype", stype);
		request.setAttribute("sword", sword);

		request.getRequestDispatcher("/admin/admin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
