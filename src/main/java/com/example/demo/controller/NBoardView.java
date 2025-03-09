package com.example.demo.controller;

import com.example.demo.service.Notice_BoardService;
import com.example.demo.service.Notice_BoardServiceImpl;
import com.example.demo.vo.Notice_BoardVO;
import com.example.demo.vo.UserVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/member/view.do")
public class NBoardView extends HttpServlet {
    private static final long serialVersionUID = 1L;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");
        resp.setCharacterEncoding("utf-8");



        int res = Integer.parseInt(req.getParameter("ntc_board"));
        System.out.println("res="+res);

        Notice_BoardService notice_boardService = Notice_BoardServiceImpl.getInstance();
        Notice_BoardVO nboardVO = notice_boardService.getBoard(res);

        HttpSession session = req.getSession();
        UserVO loginUser = (UserVO) session.getAttribute("loginUser"); // 세션에서 로그인 사용자 정보 가져오기

        if (loginUser != null) {
            req.setAttribute("loginUser", loginUser); // 로그인 사용자 정보를 요청 속성에 추가
        }


        String relativePath = "/images/" + nboardVO.getFile_name();
        String absolutePath = req.getServletContext().getRealPath(relativePath);
        System.out.println("파일 실제 경로: " + absolutePath);


        String action = req.getParameter("action");
        if ("download".equals(action) && nboardVO.getFile_path() != null) {
            downloadFile(req, resp, nboardVO);
        }


            req.setAttribute("nboardVO", nboardVO);
        //req.getSession()// 세션은 유지되는 거에 쓸 때 사용, 일회용이 아니여서 다른 페이2지 가도 불러올 수 있음!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ex) 로그인 할 때 저장되는 user정보 같은거
        //req.getSession().setAttribute("boardVO", boardVO);


        req.getRequestDispatcher("/member/view.jsp").forward(req,resp);
    }

    private void downloadFile(HttpServletRequest req, HttpServletResponse resp, Notice_BoardVO nboardVO) throws IOException {
        String filePath = nboardVO.getFile_path();
        File downloadFile = new File(filePath);

        if (downloadFile.exists()) {
//            resp.setContentType("application/octet-stream");
//            resp.setContentLength((int) downloadFile.length());
//            resp.setHeader("Content-Disposition", "attachment; filename=\"" + nboardVO.getFile_name() + "\"");

            resp.setContentType("application/octet-stream");
            resp.setHeader("Content-Disposition", "attachment; filename=\"" + new String(nboardVO.getFile_name().getBytes("UTF-8"), "ISO-8859-1") + "\"");
            resp.setHeader("Content-Transfer-Encoding", "binary");
            resp.setContentLengthLong(downloadFile.length());

            try (FileInputStream inputStream = new FileInputStream(downloadFile);
                 OutputStream outputStream = resp.getOutputStream()) {

                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                outputStream.flush();


            }
        } else {
            resp.setContentType("text/html; charset=UTF-8");
            resp.getWriter().println("파일을 찾을 수 없습니다.");
        }
    }
}
