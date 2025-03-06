package com.example.demo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.demo.service.FAQBoardServiceImpl;
import com.example.demo.service.IFAQBoardService;
import com.example.demo.util.StreamData;
import com.example.demo.vo.FAQBoardVO;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/FAQBoard/FAQBoardUpdate.do")
public class FAQBoardUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		//요청시 데이터 - title, contents, category
		String data = StreamData.getJsonStream(request);
		Gson  gson = new Gson();

         FAQBoardVO faqbordVo = gson.fromJson(data, FAQBoardVO.class);
		
//         faqbordVo.setWip(request.getRemoteAddr());
		
		//service객체 얻기 
		IFAQBoardService  service = FAQBoardServiceImpl.getInstance();
		
		//service메소드 호출 - 결과값 얻기 
		int res = service.updateFAQBoard(faqbordVo);
		
		String jsonData = 
				"""
					 {
					    "result"  : %d
					 }
				""".formatted(res);
		    
			PrintWriter out = response.getWriter();
			out.write(jsonData);
			response.flushBuffer();
	}

}