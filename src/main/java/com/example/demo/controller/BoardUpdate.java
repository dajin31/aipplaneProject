package com.example.demo.controller;

import com.example.demo.service.Notice_BoardService;
import com.example.demo.service.Notice_BoardServiceImpl;
import com.example.demo.vo.Notice_BoardVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/member/update.do")
public class BoardUpdate  extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");


        Notice_BoardService notice_boardService = Notice_BoardServiceImpl.getInstance();

    }
}
