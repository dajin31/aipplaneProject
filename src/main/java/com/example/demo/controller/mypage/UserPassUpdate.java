package com.example.demo.controller.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.demo.controller.mileage.StreamData;
import com.example.demo.service.IUsersService;
import com.example.demo.service.UsersService;
import com.example.demo.vo.UserVO;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/userpassupdate.do")
public class UserPassUpdate extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json; charset=utf-8");
		//로그인정보가져오기
		HttpSession session = req.getSession();
		//로그인정보 불러오기
		UserVO UserVo = (UserVO)session.getAttribute("loginUser");
		String user_id = UserVo.getUserId();
		System.out.println("UserUpdate->user_id : " + user_id);
		//요청 데이터
		String data = StreamData.dataChange(req);
		Gson gson =new Gson();

		UserVO userVO = gson.fromJson(data, UserVO.class);

		IUsersService service = UsersService.getInstance();

		userVO.setUserId(user_id);
		System.out.println("UserUpdate->user1 : " + userVO);
		int res = service.updatePassUser(userVO);

		String jsonData =
				"""
					 {
					    "result"  : %d
					 }
				""".formatted(res);

		PrintWriter out = resp.getWriter();
		out.write(jsonData);
		resp.flushBuffer();
	}
}
