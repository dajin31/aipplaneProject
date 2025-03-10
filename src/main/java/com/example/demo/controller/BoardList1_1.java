package com.example.demo.controller;

import com.example.demo.service.*;
import com.example.demo.vo.*;
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
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");

        if (loginUser != null) {
            req.setAttribute("loginUser", loginUser);
            System.out.println("list do loginUser :  " + loginUser);
        }

        int page = 1;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }

        String sword = req.getParameter("sword");
        sword = sword == null ? "" : sword;

        BoardService boardService = BoardServiceImpl.getInstance();

        // 1. 동적 쿼리를 위한 map 생성 및 user_id 조건 추가
        Map<String, Object> map = new HashMap<>();
        if (loginUser != null && !loginUser.getMemCode().equals("admin")) {
            map.put("user_id", loginUser.getUserId());
        }

        // 2. 페이지네이션 정보 생성 (map 전달)
        PageVO pageVO = boardService.pageInfo(page, sword, map);

        // 3. 페이지네이션에 필요한 start, end 값 map에 추가
        map.put("start", pageVO.getStart());
        map.put("end", pageVO.getEnd());
        map.put("sword", sword);

        // 4. selectByPage 쿼리 실행을 위한 user_id 조건 추가
        if (loginUser != null && !loginUser.getMemCode().equals("admin")) {
            map.put("user_id", loginUser.getUserId());
        }

        // 5. 모든 사용자에 대해서 user_id 추가
        if (loginUser != null) {
            map.put("user_id", loginUser.getUserId());
        }

        // 6. 페이지별 게시글 목록 조회
        List<Board1_1VO> boardList = boardService.selectByPage(map);

        // 7. 관리자 또는 사용자별 게시글 목록 필터링
        List<Board1_1VO> filteredBoardList = new ArrayList<>();
        List<Reply1_1VO> replyList = new ArrayList<>();

        if (loginUser != null) {
            for (Board1_1VO boardVO : boardList) {
                if (loginUser.getMemCode().equals("admin")) {
                    filteredBoardList.add(boardVO);
                    replyList.add(boardService.getReply(boardVO.getBoard_id()));
                } else if (boardVO.getUser_id().equals(loginUser.getUserId())) {
                    filteredBoardList.add(boardVO);
                    replyList.add(boardService.getReply(boardVO.getBoard_id()));
                }
            }
            boardList = filteredBoardList;
        }

        // 8. 요청 속성에 데이터 추가
        if (loginUser != null) {
            req.setAttribute("user_id", loginUser.getUserId());
        }
        req.setAttribute("replyList", replyList);
        req.setAttribute("boardList", boardList);
        req.setAttribute("pageVO", pageVO);
        req.setAttribute("sword", sword);

        // 9. JSP 페이지로 포워딩
        req.getRequestDispatcher("/member/board_1_1/list1_1.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}