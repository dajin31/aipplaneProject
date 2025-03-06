package com.example.demo.controller;

import com.example.demo.service.BoardService;
import com.example.demo.service.BoardServiceImpl;
import com.example.demo.service.Notice_BoardService;
import com.example.demo.service.Notice_BoardServiceImpl;
import com.example.demo.util.StreamData;
import com.example.demo.vo.Board1_1VO;
import com.example.demo.vo.Notice_BoardVO;
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

@WebServlet("/member/view1_1.do")
public class BoardView1_1 extends HttpServlet {
    private static final long serialVersionUID = 1L;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");
        resp.setCharacterEncoding("utf-8");



        int res = Integer.parseInt(req.getParameter("board_id"));
        System.out.println("res="+res);

        BoardService boardService = BoardServiceImpl.getInstance();
        Board1_1VO boardVO = boardService.getBoard(res);

        HttpSession session = req.getSession();
        UserVO loginUser = (UserVO) session.getAttribute("loginUser"); // 세션에서 로그인 사용자 정보 가져오기

        if (loginUser != null) {
            req.setAttribute("loginUser", loginUser); // 로그인 사용자 정보를 요청 속성에 추가
        }



        req.setAttribute("boardVO", boardVO);
        //req.getSession()// 세션은 유지되는 거에 쓸 때 사용, 일회용이 아니여서 다른 페이2지 가도 불러올 수 있음!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ex) 로그인 할 때 저장되는 user정보 같은거
        //req.getSession().setAttribute("boardVO", boardVO);


        req.getRequestDispatcher("/member/board_1_1/view1_1.jsp").forward(req,resp);
    }
}
