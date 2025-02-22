package com.example.demo.controller;

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(value = "/mileage/mileageShop/all")
public class ProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        ProductService service = ProductService.getInstance();

        Gson gson = new Gson();

        List<ProductVO> productList = service.selectAllProduct();


        int cnt = service.selectAllCnt();

        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("products", productList);
        responseMap.put("count", cnt);

        String json = gson.toJson(responseMap);

        PrintWriter out = resp.getWriter();
        out.write(json);

        resp.flushBuffer();


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
