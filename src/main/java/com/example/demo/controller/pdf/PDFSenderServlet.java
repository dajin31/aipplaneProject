package com.example.demo.controller.pdf;

import com.example.demo.util.MyBatisUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/PDFSenderServlet")
public class PDFSenderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        JSONObject jsonResponse = new JSONObject();

        try (SqlSession session = MyBatisUtil.getSession()) {
            Map<String, Object> params = new HashMap<>();
            params.put("userId", userId);

            Map<String, Object> user = session.selectOne("selectUserById", params);

            if (user != null) {
                String userName = (String) user.get("name");
                String email = (String) user.get("email");
                String fltCode = (String) user.get("flt_Code");
                String dptApt = (String) user.get("dpt_apt");
                String arrApt = (String) user.get("arr_apt");
                String dptDate = (String) user.get("dpt_date");
                String arrDate = (String) user.get("arr_date");

                // PDF 생성 (실제 구현에서는 iText 또는 Apache PDFBox 라이브러리를 사용)
                byte[] pdfContent = generatePDF(userName, fltCode, dptApt, arrApt, dptDate, arrDate);

                // 이메일 전송 (실제 구현에서는 JavaMail API를 사용)
                boolean emailSent = sendEmail(email, pdfContent);

                if (emailSent) {
                    jsonResponse.put("success", true);
                    jsonResponse.put("message", userName + "님의 이메일(" + email + ")로 PDF가 전송되었습니다.");
                } else {
                    jsonResponse.put("success", false);
                    jsonResponse.put("message", "PDF 전송에 실패했습니다.");
                }
            } else {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "사용자 정보를 찾을 수 없습니다.");
            }

        } catch (Exception e) {
            try {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "오류가 발생했습니다: " + e.getMessage());
            } catch (JSONException je) {
                throw new ServletException("JSON 오류", je);
            }
        }

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(jsonResponse.toString());
    }

    private byte[] generatePDF(String userName, String fltCode, String dptApt, String arrApt, String dptDate, String arrDate) {
        // PDF 생성 로직 구현
        // 이 예제에서는 간단한 문자열을 반환합니다.
        String pdfContent = "항공권 정보: " + userName + ", " + fltCode + ", " + dptApt + " to " + arrApt + ", " + dptDate + ", " + arrDate;
        return pdfContent.getBytes();
    }

    private boolean sendEmail(String email, byte[] pdfContent) {
        // 이메일 전송 로직 구현
        // 이 예제에서는 항상 true를 반환합니다.
        return true;
    }
}