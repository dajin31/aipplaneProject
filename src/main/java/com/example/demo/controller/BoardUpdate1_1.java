package com.example.demo.controller;

import com.example.demo.service.Notice_BoardService;
import com.example.demo.service.Notice_BoardServiceImpl;
import com.example.demo.util.StreamData;
import com.example.demo.vo.Notice_BoardVO;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/member/update1_1.do")
public class BoardUpdate1_1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { //화면 띄우기
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");
        resp.setCharacterEncoding("utf-8");

        int res = Integer.parseInt(req.getParameter("ntc_board"));
        System.out.println("update res="+res);

        Notice_BoardService notice_boardService = Notice_BoardServiceImpl.getInstance();
        Notice_BoardVO boardVO = notice_boardService.getBoard(res);



        req.setAttribute("boardVO", boardVO);
        //req.getSession()// 세션은 유지되는 거에 쓸 때 사용, 일회용이 아니여서 다른 페이2지 가도 불러올 수 있음!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ex) 로그인 할 때 저장되는 user정보 같은거
        //req.getSession().setAttribute("boardVO", boardVO);

        req.getRequestDispatcher("/member/update.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { // 수정사항 저장
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        //요청시 전송데이타 받기 - cont, renum - vo에 저장
        String reqdata = StreamData.getJsonStream(req);
        System.out.println("reqdata = "+reqdata);

        //역직렬화 - BoardVO객체로 변환
        Gson gson = new Gson();
        Notice_BoardVO boardVO = gson.fromJson(reqdata, Notice_BoardVO.class);

        //service객체 얻기
        Notice_BoardService service =  Notice_BoardServiceImpl.getInstance();

        //service메소드 호출 - 결과값 받기
        int res = service.updateBoard(boardVO);
        String jsonData =
                """
                     {
                        "result"  : %d
                     }
                """.formatted(res);

        PrintWriter out = resp.getWriter();
        out.write(jsonData);
        resp.flushBuffer();

    }
}
