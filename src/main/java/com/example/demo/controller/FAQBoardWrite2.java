//package com.example.demo.controller;
//
//import com.example.demo.service.FAQBoardServiceImpl;
//import com.example.demo.service.IFAQBoardService;
//import com.example.demo.util.StreamData;
//import com.example.demo.vo.FAQBoardVO;
//import com.example.demo.vo.UserVO;
//import com.google.gson.Gson;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//
//@WebServlet("/FAQBoard/FAQBoardWrite.do")
//public class FAQBoardWrite extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("utf-8");
//        response.setContentType("application/json; charset=utf-8");
//
//        System.out.println("FAQBoardWrite->시작");
//
//        String reqdata = StreamData.getJsonStream(request);
//
//        // FAQBoardWrite->reqdata : { "category": "reservation", "title": "ㅇ", "contents": "ㄴ"}
//        System.out.println("FAQBoardWrite->reqdata : " + reqdata);
//
//        // FAQBoardVO객체로 변환 (역직렬화)
//        Gson gson = new Gson();
//        FAQBoardVO vo = gson.fromJson(reqdata, FAQBoardVO.class);
//
//        // 세션에서 로그인 사용자 정보 가져오기
//        HttpSession session = request.getSession();
//        UserVO loginUser = (UserVO) session.getAttribute("loginUser");
//
//        // user_id 설정
//        if (loginUser != null) {
//            vo.setUser_id(loginUser.getUserId());
//        } else {
//            // 로그인되지 않은 경우 처리 (예: 오류 메시지 전송)
//            String jsonData = "{\"result\": 0, \"message\": \"로그인이 필요합니다.\"}";
//            PrintWriter out = response.getWriter();
//            out.write(jsonData);
//            response.flushBuffer();
//            return; // 메소드 종료
//        }
//
//        System.out.println("FAQBoardWrite->vo : " + vo);
//
//        // service객체 얻기
//        IFAQBoardService service = FAQBoardServiceImpl.getInstance();
//
//        // service메소드호출하기 - 결과값 받기
//        int res = service.insertFAQBoard(vo);
//
//        String jsonData = """
//                {
//                    "result": %d
//                }
//                """.formatted(res);
//
//        PrintWriter out = response.getWriter();
//        out.write(jsonData);
//        response.flushBuffer();
//    }
//}