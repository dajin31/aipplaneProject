package com.example.demo.controller.nboard;

import com.example.demo.service.Notice_BoardService;
import com.example.demo.service.Notice_BoardServiceImpl;
import com.example.demo.service.UserServiceImpl;
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

//        String adr = (String) req.getAttribute("/member/list.do");

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
        UserServiceImpl userService = UserServiceImpl.getInstance();


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

        // 최신 공지사항 3개 가져오기
        List<Notice_BoardVO> recentNotices = notice_boardService.getRecentNotices(3); // 최신 3개 공지사항

        for (Notice_BoardVO notice : recentNotices) {
            String userid = String.valueOf(userService.getUser(notice.getUser_id()));
            notice.setUser_id(userid);
        }

        req.setAttribute("boardList", boardList);
        req.setAttribute("pageVO", pageVO);
        req.setAttribute("sword", sword);

        req.getRequestDispatcher("/nboard/list.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
