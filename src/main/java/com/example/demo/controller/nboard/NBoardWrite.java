package com.example.demo.controller.nboard;

import com.example.demo.service.Notice_BoardService;
import com.example.demo.service.Notice_BoardServiceImpl;
import com.example.demo.vo.Notice_BoardVO;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.UUID;

@WebServlet("/member/write.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class NBoardWrite extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "uploads"; // 파일 저장 디렉토리

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        // 폼 데이터 가져오기 (수정됨)
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
        Notice_BoardVO boardVO = new Notice_BoardVO();
        boardVO.setNtc_title(ntc_title);
        boardVO.setNtc_contents(ntc_contents);
        boardVO.setFile_name(file_name);
        boardVO.setFile_path(file_path);
        boardVO.setFile_size(file_size);

        // 서비스 호출 및 결과 처리 (수정됨)
        Notice_BoardService service = Notice_BoardServiceImpl.getInstance();
        int res = service.insertBoard(boardVO);

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