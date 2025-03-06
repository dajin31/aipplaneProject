package com.example.demo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.demo.service.AdminServiceImpl;
import com.example.demo.service.IAdminService;
import com.example.demo.util.StreamData;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/AdminUser/AdminUserDelete2.do")
public class AdminUserDelete2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
        // 관리자 권한 확인
        HttpSession session = request.getSession();
        String memCode = (String) session.getAttribute("memCode");
        
//        if (!"admin".equals(memCode)) {							//관리자 권한 확인
//            String jsonData = 
//                """
//                     {
//                        "result": 0,
//                        "message": "관리자 권한이 필요합니다."
//                     }
//                """;
//            
//            PrintWriter out = response.getWriter();
//            out.write(jsonData);
//            response.flushBuffer();
//            return;
//        }
        
        // 요청 데이터 파싱
        String data = StreamData.getJsonStream(request);
        String userId = data.substring(data.indexOf(":") + 2, data.lastIndexOf("\""));
        
        // 서비스 객체 얻기
        IAdminService service = AdminServiceImpl.getInstance();
        
        // 서비스 메서드 호출 - 결과값 얻기
        int res = service.deleteUser(userId);
        
        String jsonData = 
                """
                     {
                        "result": %d,
                        "message": "%s"
                     }
                """.formatted(res, res > 0 ? "회원 삭제가 완료되었습니다." : "회원 삭제에 실패했습니다.");
        
        PrintWriter out = response.getWriter();
        out.write(jsonData);
        response.flushBuffer();
    }

}

