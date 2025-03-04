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

@WebServlet("/member/write.do")
public class BoardWrite extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        //요청시 전송데이타 받기  - writer, subject, mail, content, password
        String reqdata = StreamData.getJsonStream(req);

        //service객체 얻기
        Notice_BoardService service = Notice_BoardServiceImpl.getInstance();


        //역직렬화 - BoardVO객체로 변환
        Gson gson = new Gson();
        Notice_BoardVO boardVO = gson.fromJson(reqdata, Notice_BoardVO.class);
        System.out.println("BoardWrite " + boardVO.getNtc_title());
        System.out.println("BoardWrite " + boardVO.getNtc_contents());


        //service메소드호출하기 - 결과값 받기
        int res = service.insertBoard(boardVO); //성공시 1 실패시 0
        System.out.println("BoardWrite " + res);

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
