package com.example.demo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.demo.service.FAQBoardServiceImpl;
import com.example.demo.service.IFAQBoardService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/FAQBoard/FAQBoardDelete.do")
public class FAQBoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");

		int num = Integer.parseInt(request.getParameter("num"));

		IFAQBoardService  service = FAQBoardServiceImpl.getInstance();

		int res = service.deleteFAQBoard(num);

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
