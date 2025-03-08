//package com.example.demo.controller;
//
//import com.example.demo.service.FAQBoardServiceImpl;
//import com.example.demo.service.IFAQBoardService;
//import com.example.demo.util.StreamData;
//import com.example.demo.vo.FAQBoardVO;
//import com.google.gson.Gson;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//
//
//@WebServlet("/FAQBoard/FAQBoardWrite.do")
//public class FAQBoardWrite2 extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//		request.setCharacterEncoding("UTF-8");
//		response.setCharacterEncoding("utf-8");
//		response.setContentType("application/json; charset=utf-8");
//
//		System.out.println("FAQBoardWrite->시작");
//
//		String reqdata = StreamData.getJsonStream(request);
//
//		//FAQBoardWrite->reqdata : {  "category": "reservation",  "title": "ㅇ",  "contents": "ㄴ"}
//		System.out.println("FAQBoardWrite->reqdata : " + reqdata);
//
//		//FAQBoardVO객체로 변환 (역직렬화)
//		Gson gson = new Gson();
//		FAQBoardVO vo = gson.fromJson(reqdata, FAQBoardVO.class);
//
//		System.out.println("FAQBoardWrite->vo : " + vo);
//
//		//service객체 얻기
//		IFAQBoardService service = FAQBoardServiceImpl.getInstance();
//
//		//service메소드호출하기 - 결과값 받기
//		int res = service.insertFAQBoard(vo);
//
//		String jsonData =
//				"""
//                     {
//                        "result"  : %d
//                     }
//                """.formatted(res);
//
//		PrintWriter out = response.getWriter();
//		out.write(jsonData);
//		response.flushBuffer();
//	}
//
//}