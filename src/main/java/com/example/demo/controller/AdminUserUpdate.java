package com.example.demo.controller;

import com.example.demo.service.AdminServiceImpl;
import com.example.demo.service.IAdminService;
import com.example.demo.util.StreamData;
import com.example.demo.vo.UserVO;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AdminUser/AdminUserUpdate.do")
public class AdminUserUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");

		String data = StreamData.getJsonStream(request);
		Gson gson = new Gson();

		UserVO userVo = gson.fromJson(data, UserVO.class);

		IAdminService service = AdminServiceImpl.getInstance();

		int res = service.updateUser(userVo);

		String jsonData = "{\"result\" : " + res + "}";
		PrintWriter out = response.getWriter();
		out.write(jsonData);
		response.flushBuffer();
	}
}
