package com.example.demo.controller;

import com.example.demo.service.Notice_BoardService;
import com.example.demo.service.Notice_BoardServiceImpl;
import com.example.demo.vo.Notice_BoardVO;
import com.example.demo.vo.PageVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        int page = 1;
        if(req.getParameter("page") != null){
            page = Integer.parseInt(req.getParameter("page"));
        }

        String stype = req.getParameter("type");
        stype = stype == null ? ""  : stype;

        String sword = req.getParameter("sword");
        sword = sword == null ? "" : sword;

        Notice_BoardService notice_boardService = Notice_BoardServiceImpl.getInstance();




        PageVO pageVO = notice_boardService.pageInfo(page, stype, sword);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start", pageVO.getStart());
        map.put("end", pageVO.getEnd());
        map.put("stype", stype);
        map.put("sword", sword);



        req.setAttribute("pageVO", pageVO);
        req.setAttribute("stype", stype);
        req.setAttribute("sword", sword);

        req.getRequestDispatcher("board/boardList.jsp").forward(req, resp);

    }
}
