package com.example.demo.controller.nboard;

import com.example.demo.service.Notice_BoardService;
import com.example.demo.service.Notice_BoardServiceImpl;
import com.example.demo.vo.Notice_BoardVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.*;
import java.util.UUID;

@WebServlet("/member/update.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class NBoardUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "uploads"; // 파일 저장 디렉토리

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { //화면 띄우기
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");
        resp.setCharacterEncoding("utf-8");

        int res = Integer.parseInt(req.getParameter("ntc_board"));
        System.out.println("update res="+res);

        Notice_BoardService notice_boardService = Notice_BoardServiceImpl.getInstance();
        Notice_BoardVO nboardVO = notice_boardService.getBoard(res);



        req.setAttribute("nboardVO", nboardVO);
        //req.getSession()// 세션은 유지되는 거에 쓸 때 사용, 일회용이 아니여서 다른 페이2지 가도 불러올 수 있음!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ex) 로그인 할 때 저장되는 user정보 같은거
        //req.getSession().setAttribute("boardVO", boardVO);

        req.getRequestDispatcher("/notice/update.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { // 수정사항 저장
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        // 폼 데이터 가져오기 (수정됨)
        int ntc_board = Integer.parseInt(req.getParameter("ntc_board"));
        String ntc_title = req.getParameter("ntc_title");
        String ntc_contents = req.getParameter("ntc_contents");

        String file_name = null;
        String file_path = null;
        long file_size = 0;

        try {
            // 파일 업로드 처리 (수정됨)
            Part filePart = req.getPart("file");
            if (filePart != null && filePart.getSize() > 0) {
                file_name = filePart.getSubmittedFileName();
                file_path = req.getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY + File.separator + UUID.randomUUID().toString() + "_" + file_name;
                file_size = filePart.getSize();

                File uploadedFile = new File(file_path);
                try (InputStream fileContent = filePart.getInputStream();
                     FileOutputStream outputStream = new FileOutputStream(uploadedFile)) {
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = fileContent.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Notice_BoardVO 객체 생성 및 데이터 설정 (수정됨)
        Notice_BoardVO nboardVO = new Notice_BoardVO();

        nboardVO.setNtc_board(ntc_board);
        nboardVO.setNtc_title(ntc_title);
        nboardVO.setNtc_contents(ntc_contents);
        nboardVO.setFile_name(file_name);
        nboardVO.setFile_path(file_path);
        nboardVO.setFile_size(file_size);


        //service객체 얻기
        Notice_BoardService service =  Notice_BoardServiceImpl.getInstance();

        //service메소드 호출 - 결과값 받기
        int res = service.updateBoard(nboardVO);
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
