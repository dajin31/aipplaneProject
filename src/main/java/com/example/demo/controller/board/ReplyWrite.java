package com.example.demo.controller.board;

import com.example.demo.service.BoardService;
import com.example.demo.service.BoardServiceImpl;
import com.example.demo.util.StreamData;
import com.example.demo.vo.Board1_1VO;
import com.example.demo.vo.Reply1_1VO;
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

@WebServlet("/member/replywrite.do")
public class ReplyWrite extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=utf-8");

        String reqdata = StreamData.getJsonStream(req);


        Gson gson = new Gson();
        Reply1_1VO replyVO = gson.fromJson(reqdata, Reply1_1VO.class);
        System.out.println(replyVO.toString());

        BoardService service = BoardServiceImpl.getInstance();

        int res = service.insertReply(replyVO);
        System.out.println("insert rep res:" +res);


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
