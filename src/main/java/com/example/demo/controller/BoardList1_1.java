package com.example.demo.controller;

import com.example.demo.service.*;
import com.example.demo.vo.Board1_1VO;
import com.example.demo.vo.Notice_BoardVO;
import com.example.demo.vo.PageVO;
import com.example.demo.vo.UserVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/member/list1_1.do")
public class BoardList1_1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        UserVO loginUser = (UserVO) session.getAttribute("loginUser"); // 세션에서 로그인 사용자 정보 가져오기

        if (loginUser != null) {
            req.setAttribute("loginUser", loginUser); // 로그인 사용자 정보를 요청 속성에 추가
            System.out.println("list do loginUser :  " +loginUser);
        }

        int page = 1;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }


        String sword = req.getParameter("sword");
        sword = sword == null ? "" : sword;

        BoardService boardService = BoardServiceImpl.getInstance();


        PageVO pageVO = boardService.pageInfo(page, sword);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start", pageVO.getStart());
        map.put("end", pageVO.getEnd());
        map.put("sword", sword);


        List<Board1_1VO> boardList = boardService.selectByPage(map);
        List<Board1_1VO> filteredBoardList = new ArrayList<>();



        if (loginUser != null) {
            for (Board1_1VO boardVO : boardList) {
                if (boardVO.getUser_id().equals(loginUser.getUserId())) {
                    filteredBoardList.add(boardVO);
                    System.out.println("list do : " +boardVO);
                }
            }
            boardList = filteredBoardList;
        }


        req.setAttribute("boardList", boardList);
        req.setAttribute("pageVO", pageVO);
        req.setAttribute("sword", sword);

        req.getRequestDispatcher("/member/board_1_1/list1_1.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
