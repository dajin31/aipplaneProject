package com.example.demo.controller.board;

import com.example.demo.service.BoardService;
import com.example.demo.service.BoardServiceImpl;

import com.example.demo.util.StreamData;
import com.example.demo.vo.Board1_1VO;

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

@WebServlet("/member/write1_1.do")
public class BoardWrite1_1 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        HttpSession session = req.getSession();
        UserVO loginUser = (UserVO) session.getAttribute("loginUser"); // 세션에서 로그인 사용자 정보 가져오기

        if (loginUser != null) {
            req.setAttribute("loginUser", loginUser); // 로그인 사용자 정보를 요청 속성에 추가
            System.out.println("member/write1_1.do userid = "+ loginUser.getUserId());
        }else{
            System.out.println("member/write1_1.do userid를 못 가져옴");
        }

        //요청시 전송데이타 받기  - writer, subject, mail, content, password
        String reqdata = StreamData.getJsonStream(req);

        //service객체 얻기
        BoardService service = BoardServiceImpl.getInstance();

        //역직렬화 - BoardVO객체로 변환
        Gson gson = new Gson();
        Board1_1VO boardVO = gson.fromJson(reqdata, Board1_1VO.class);
        boardVO.setUser_id(loginUser.getUserId());

        System.out.println("BoardWrite " + boardVO.getInd_title());
        System.out.println("BoardWrite " + boardVO.getInd_contents());
        System.out.println("BoardWrite " + boardVO.getUser_id());


        //service메소드호출하기 - 결과값 받기
        int res = service.insertBoard(boardVO); //성공시 1 실패시 0
        System.out.println("BoardWrite res: " + res);

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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserVO loginUser = (UserVO) session.getAttribute("loginUser"); // 세션에서 로그인 사용자 정보 가져오기

        if (loginUser != null) {
            req.setAttribute("loginUser", loginUser); // 로그인 사용자 정보를 요청 속성에 추가
            req.getRequestDispatcher("/board_1_1/write1_1.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/board_1_1/list1_1.jsp");
        }

    }
}
