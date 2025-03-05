package com.example.demo.controller;

import com.example.demo.service.Notice_BoardService;
import com.example.demo.service.Notice_BoardServiceImpl;
import com.example.demo.service.IUserService;
import com.example.demo.service.UserServiceImp;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/member/list.do")
public class NBoardList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        UserVO loginUser = (UserVO) session.getAttribute("loginUser"); // 세션에서 로그인 사용자 정보 가져오기

        if (loginUser != null) {
            req.setAttribute("loginUser", loginUser); // 로그인 사용자 정보를 요청 속성에 추가
        }

        int page = 1;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }


        String sword = req.getParameter("sword");
        sword = sword == null ? "" : sword;

        Notice_BoardService notice_boardService = Notice_BoardServiceImpl.getInstance();
        IUserService userService = UserServiceImp.getInstance();


        PageVO pageVO = notice_boardService.pageInfo(page, sword);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start", pageVO.getStart());
        map.put("end", pageVO.getEnd());
        map.put("sword", sword);


        List<Notice_BoardVO> boardList = notice_boardService.selectByPage(map);

        for (Notice_BoardVO boardVO : boardList) {
            String userid = String.valueOf(userService.getUser(boardVO.getUser_id()));
            boardVO.setUser_id(userid);
        }
        System.out.println(boardList);

        req.setAttribute("boardList", boardList);
        req.setAttribute("pageVO", pageVO);
        req.setAttribute("sword", sword);

        req.getRequestDispatcher("/member/list.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
