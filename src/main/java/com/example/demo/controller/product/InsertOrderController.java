package com.example.demo.controller.product;

import com.example.demo.service.UsersService;
import com.example.demo.vo.OrdersVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/mileage/insertOrder")
public class InsertOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        UsersService service = UsersService.getInstance();
//         #{orderAmt} 주문금액, #{userId} 회원아이디, #{prodId} 상품아이디 ,#{orderQty} 수량
        String orderAmtParam = req.getParameter("orderAmt");
        String userId = req.getParameter("userId");
        String prodId = req.getParameter("prodId");
        int orderQty = Integer.parseInt(req.getParameter("orderQty"));

        int orderAmt = Integer.parseInt(orderAmtParam.replace(",", ""));

        OrdersVO vo = new OrdersVO();
        vo.setOrderAmt(orderAmt);
        vo.setUserId(userId);
        vo.setProdId(prodId);
        vo.setOrderQty(orderQty);

        int cnt = service.insertOrder(vo);

        if(cnt > 0) {
            System.out.println("성공");
        }else {
            System.out.println("실패");
        }

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
