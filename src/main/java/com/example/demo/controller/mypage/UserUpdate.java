package com.example.demo.controller.mypage;

import com.example.demo.controller.mileage.StreamData;
import com.example.demo.service.UserService;
import com.example.demo.service.UserServiceImpl;
import com.example.demo.vo.UserVO;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;


/*
//	여기서는 네트워크에 데이터를 보낼 땐 Object가 안됨
요청URI : /user/userupdate.do
요청파라미터 : JSON String{"password":"user_pw","user_email":"te22@.com"}
요청방식 : post
*/
@WebServlet("/user/userupdate.do")
public class UserUpdate extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json; charset=utf-8");

		//로그인한 user_id를 가져와야 함
		//					request객체에서 session객체를 꺼낼 수 있음
		HttpSession session = req.getSession();
		//로그인 정보 불러오기
		UserVO UserVo = (UserVO)session.getAttribute("loginUser");
		String user_id = UserVo.getUserId();
		System.out.println("UserUpdate->user_id : " + user_id);

		//요청시 데이터 mail, password, id?
		String data = StreamData.dataChange(req);//{"password":"1234","email":"te22@.com"}
		Gson gson =new Gson();

		//String{"user_pw":"1234","user_email":"te22@.com"}
		//userVO{user_pw=1234,user_email=te22@.com}
		UserVO userVO = gson.fromJson(data, UserVO.class);

		//service객체 얻기 
		//인터페이스		객체		구현클래스
		UserService service = UserServiceImpl.getInstance();

		//service메소드 호출 - 결과값 얻기 
		//[전]		userVO{user_id=null,user_pw=1234,user_name=null,user_email=te22@.com..}
		userVO.setUserId(user_id);
		//[후]		userVO{user_id=test,user_pw=1234,user_name=null,user_email=te22@.com..}
		int res = service.updateUser(userVO);
		//update 성공 시 res : 1
		//update 실패 시 res : 0
		System.out.println("UserUpdate->res : " + res);

		//이메일 변경 성공 시 session에 이메일 변경 내역을 반영
		//세션     의  이메일 정보	  사용자가 새롭게 변경할 이메일 주소
		UserVo.setUserEmail(userVO.getUserEmail());

		session.setAttribute("loginUser", UserVo);

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
