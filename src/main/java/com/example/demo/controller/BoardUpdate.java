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

@WebServlet("/member/update.do")
public class BoardUpdate  extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

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

        //요청시 전송데이타 받기  - writer, subject, mail, content, password
        String reqdata = StreamData.getJsonStream(req);

        //service객체 얻기
        Notice_BoardService service = Notice_BoardServiceImpl.getInstance();


        //역직렬화 - BoardVO객체로 변환
        Gson gson = new Gson();
        Notice_BoardVO boardVO = gson.fromJson(reqdata, Notice_BoardVO.class);


        //service메소드호출하기 - 결과값 받기
        int res = service.updateBoard(boardVO); //성공시 1 실패시 0


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
