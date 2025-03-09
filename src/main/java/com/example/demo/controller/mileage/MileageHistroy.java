package com.example.demo.controller.mileage;

import java.io.IOException;
import java.util.List;


import com.example.demo.service.MileageService;
import com.example.demo.service.MileageServicelmp;
import com.example.demo.vo.MileageVO;
import com.example.demo.vo.UserVO;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/mileagehistory.do")
public class MileageHistroy extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("application/json; charset=utf-8");

		HttpSession session = req.getSession();
		//로그인 정보 불러오기
		UserVO UserVo = (UserVO)session.getAttribute("loginUser");
		String user_id = UserVo.getUserId();
		System.out.println("UserUpdate->user_id : " + user_id);

		String data = StreamData.dataChange(req);//{"gbValue":"0 or 1 or 2"}
		Gson gson =new Gson();

		System.out.println("id:"+user_id);
		// 파싱?
		java.util.Map<String, String> dataMap = gson.fromJson(data, java.util.Map.class);
		String gbValue = dataMap.get("gu_val");
		String startDate = dataMap.get("startDate");
		String endDate = dataMap.get("endDate");
		System.out.println("gbValue:"+ gbValue);
		System.out.println("끝날짜:"+ endDate);
		System.out.println("시작날짜:"+ startDate);

		//service객체 얻기
		MileageService service = MileageServicelmp.getInstance();
		List<MileageVO> res=null;

		if(gbValue != null) {
			switch (gbValue) {
				case "0":
					//전체 내역 조회
					res = service.getMileageHistroy(user_id, startDate, endDate);
					break;
				case "1"://적립 조회
					res= service.getMileageAdd(user_id, startDate, endDate);
					break;
				case "2"://차감 조회
					res= service.getMileageUse(user_id, startDate, endDate);
					break;
			}
		}System.out.println("최종 " +res);
		resp.getWriter().write(gson.toJson(res));

	}
}