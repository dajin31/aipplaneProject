package com.example.demo.controller;

import com.example.demo.service.Notice_BoardService;
import com.example.demo.service.Notice_BoardServiceImpl;
import com.example.demo.vo.Notice_BoardVO;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/member/view.do")
public class BoardView extends HttpServlet {
    private static final long serialVersionUID = 1L;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");
        resp.setCharacterEncoding("utf-8");

        int res = Integer.parseInt(req.getParameter("ntc_board"));
        System.out.println("res="+res);

        Notice_BoardService notice_boardService = Notice_BoardServiceImpl.getInstance();
        Notice_BoardVO boardVO = notice_boardService.getBoard(res);


        System.out.println(boardVO.getNtc_contents());
        System.out.println(boardVO.getNtc_title());
        System.out.println(boardVO.getCrt_time());

        req.setAttribute("boardVO", boardVO);
        //req.getSession()// 세션은 유지되는 거에 쓸 때 사용, 일회용이 아니여서 다른 페이2지 가도 불러올 수 있음!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ex) 로그인 할 때 저장되는 user정보 같은거
        //req.getSession().setAttribute("boardVO", boardVO);

        req.getRequestDispatcher("/member/view.jsp").forward(req,resp);
    }
}
