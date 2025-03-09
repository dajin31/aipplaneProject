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

@WebServlet("/member/replyupdate.do")
public class ReplyUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { //화면 띄우기
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");
        resp.setCharacterEncoding("utf-8");


        int res = Integer.parseInt(req.getParameter("board_id"));
        System.out.println("res="+res);

        BoardService boardService = BoardServiceImpl.getInstance();
        Board1_1VO boardVO = boardService.getBoard((int)res);

        HttpSession session = req.getSession();

        UserVO loginUser = (UserVO) session.getAttribute("loginUser"); // 세션에서 로그인 사용자 정보 가져오기

        if (loginUser != null) {
            req.setAttribute("loginUser", loginUser); // 로그인 사용자 정보를 요청 속성에 추가
        }

        Reply1_1VO replyVO = boardService.getReply((int)res);


        req.setAttribute("replyVO", replyVO);
        req.setAttribute("boardVO", boardVO);


        req.getRequestDispatcher("/member/board_1_1/rpyupdate1_1.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { // 수정사항 저장
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        //요청시 전송데이타 받기 - cont, renum - vo에 저장
        String reqdata = StreamData.getJsonStream(req); //board_id
        System.out.println("reqdata = " +reqdata);

        //역직렬화 - BoardVO객체로 변환
        Gson gson = new Gson();
        Reply1_1VO replyVO = gson.fromJson(reqdata, Reply1_1VO.class);

        //service객체 얻기
        BoardService service = BoardServiceImpl.getInstance();

        //service메소드 호출 - 결과값 받기
        int res = service.updateReply(replyVO);
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
