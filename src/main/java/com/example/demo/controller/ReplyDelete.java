package com.example.demo.controller;

import com.example.demo.service.BoardService;
import com.example.demo.service.BoardServiceImpl;
import com.example.demo.vo.Reply1_1VO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/member/replydelete.do")
public class ReplyDelete extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");

        //게시글 아이디 가져옴
        int id = Integer.parseInt(req.getParameter("board_id")); //jsp랑 이름 맞추기
        System.out.println("delete id:" + id);


        BoardService boardService = BoardServiceImpl.getInstance();
        //서비스에서 id삭제
        Reply1_1VO replyVO = boardService.getReply(id);

        int replyid = replyVO.getReply_id();

        int res = boardService.deleteReply(replyid);


        String jsonData =
                """
                        {
                            "result"  : %d
                        }
                        """.formatted(res); //문자열에 직접 formatted() 메서드를 호출해 인수를 전달한다.


        PrintWriter out = resp.getWriter(); // 출력스트림을 가져와서
        out.println(jsonData); //클라이언트에게 보냄
        resp.flushBuffer(); // 응답 버퍼를 비우고 데이터 전송
    }
}
