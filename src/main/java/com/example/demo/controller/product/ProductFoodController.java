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

@WebServlet(value = "/mileage/mileageShop/food")
public class ProductFoodController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        ProductService service = ProductService.getInstance();

        Gson gson = new Gson();

        String category = req.getParameter("category");

        List<ProductVO> productList = service.selectFoodProduct();


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
