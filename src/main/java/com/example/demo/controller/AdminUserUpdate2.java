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
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/AdminUser/AdminUserUpdate2.do")
public class AdminUserUpdate2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		// 관리자 권한 확인
		HttpSession session = request.getSession();
		String memCode = (String) session.getAttribute("memCode");
		
        if (!"admin".equals(memCode)) {							// 관리자 권한 확인
            String jsonData = 
                """
                     {
                        "result": 0,
                        "message": "관리자 권한이 필요합니다."
                     }
                """;
            
            PrintWriter out = response.getWriter();
            out.write(jsonData);
            response.flushBuffer();
            return;
        }
		
		// 요청 데이터 파싱
		String data = StreamData.getJsonStream(request);
		Gson gson = new Gson();
		UserVO userVo = gson.fromJson(data, UserVO.class);
		
		// 서비스 객체 얻기
		IAdminService service = AdminServiceImpl.getInstance();
		
		// 서비스 메서드 호출 - 결과값 얻기
		int res = service.updateUser(userVo);
		
        String jsonData = 
                """
                     {
                        "result": %d,
                        "message": "%s"
                     }
                """.formatted(res, res > 0 ? "회원 정보 수정이 완료되었습니다." : "회원 정보 수정에 실패했습니다아아~~.");
            
            PrintWriter out = response.getWriter();
            out.write(jsonData);
            response.flushBuffer();
	}
}
