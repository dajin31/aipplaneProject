package com.example.demo.controller.airport;

import java.io.IOException;

import com.example.demo.controller.mileage.StreamData;
import com.example.demo.service.AirService;
import com.example.demo.service.AirServicelmp;
import com.example.demo.vo.AirVO;
import com.example.demo.vo.UserVO;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/aircancel.do")
public class AirCancel extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        /*
         * HttpSession session = req.getSession(); //로그인 정보 불러오기 UserVO loginUserVo =
         * (UserVO)session.getAttribute("loginUser"); String user_id =
         * loginUserVo.getUser_id(); System.out.println("UserUpdate->user_id : " +
         * user_id);
         *
         * 회원이 예약한 코드 가져와야되는데? AirVO loginUserVo =
         * (UserVO)session.getAttribute("loginUser"); String user_id =
         * loginUserVo.getUser_id(); System.out.println("UserUpdate->user_id : " +
         * user_id);
         */
        String data = StreamData.dataChange(req);
        Gson gson = new Gson();

        AirVO airVO = gson.fromJson(data, AirVO.class);

        AirService service = AirServicelmp.getInstance();

        // 환불 순서 1) 마일리지 돌려주기
        int mileageResult = service.updateUserMileage(airVO);
        System.out.println("마일리지 환불 결과: " + mileageResult);

        // 환불 순서 2) 예약 정보 res_details 테이블 삭제하기
        int resDetailsResult = service.AirCancel1(airVO);
        System.out.println("res_details 삭제 결과: " + resDetailsResult);

        // 환불 순서 3) 예약 정보 payment 테이블 삭제하기
        int paymentResult = service.AirCancel2(airVO);
        System.out.println("payment 삭제 결과: " + paymentResult);

        // 환불 순서 4) 예약 정보 reservation 테이블 삭제하기
        int reservationResult = service.AirCancel3(airVO);
        System.out.println("reservation 삭제 결과: " + reservationResult);

        // 모든 작업이 성공했는지 확인하고 응답
        if (mileageResult > 0 && resDetailsResult > 0 && paymentResult > 0 && reservationResult > 0) {
            resp.getWriter().write("{\"result\": \"success\"}");
        } else {
            resp.getWriter().write("{\"result\": \"fail\"}");
        }

    }

}

