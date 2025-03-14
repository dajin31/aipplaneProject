package com.example.demo.controller.product;

import com.example.demo.service.ProductService;
import com.example.demo.vo.ProductVO;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(value = "/mileage/mileageShop/search")
public class ProductSearchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        ProductService service = ProductService.getInstance();

        String prodName = req.getParameter("prodName");
        System.out.println(prodName);
        Gson gson = new Gson();

        List<ProductVO> productList = service.selectSearchList(prodName);


        String json = gson.toJson(productList);

        PrintWriter out = resp.getWriter();
        out.write(json);

        resp.flushBuffer();




    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
