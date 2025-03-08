package com.example.demo.controller;//package com.example.demo.controller;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//
//import com.example.demo.service.AdminServiceImpl;
//import com.example.demo.service.IAdminService;
//import com.example.demo.util.StreamData;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//@WebServlet("/AdminUser/AdminUserDelete.do")
//public class AdminUserDelete extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("utf-8");
//        response.setCharacterEncoding("utf-8");
//        response.setContentType("application/json; charset=utf-8");
//
//        // 세션
//        HttpSession session = request.getSession();
//        String memCode = (String) session.getAttribute("memCode");
//
//        // 관리자 권한 확인
////        if (!"admin".equals(memCode)) {
////            String jsonData = "{\"result\": 0, \"message\": \"관리자 권한이 필요합니다.\"}";
////            PrintWriter out = response.getWriter();
////            out.write(jsonData);
////            response.flushBuffer();
////            return;
////        }
//
//        String data = StreamData.getJsonStream(request);
//        String userId = data.substring(data.indexOf(":") + 2, data.lastIndexOf("\""));
//
//        IAdminService service = AdminServiceImpl.getInstance();
//
//        int res = service.deleteUser(userId);
//
//        String jsonData = "{\"result\": " + res + ", \"message\": \"" + (res > 0 ? "회원 삭제가 완료되었습니다." : "회원 삭제에 실패했습니다.") + "\"}";
//
//        PrintWriter out = response.getWriter();
//        out.write(jsonData);
//        response.flushBuffer();
//    }
//}
