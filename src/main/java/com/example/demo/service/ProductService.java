package com.example.demo.service;

import com.example.demo.dao.IProductDAO;
import com.example.demo.dao.ProductDAO;
import com.example.demo.vo.ProductVO;

import java.util.List;

public class ProductService implements IProductService {
    private IProductDAO productDAO;

    private static ProductService productService;

    private ProductService() {
        productDAO = ProductDAO.getInstance();
    }

    public static ProductService getInstance() {
        if (productService == null) {
            productService = new ProductService();
        }
        return productService;
    }

    @Override
    public List<ProductVO> selectAllProduct() {
        return productDAO.selectAllProduct();
    }

    @Override
    public List<ProductVO> selectMakeupProduct() {
        return productDAO.selectMakeupProduct();
    }

    @Override
    public List<ProductVO> selectGroceryProduct() {
        return productDAO.selectGroceryProduct();
    }

    @Override
    public List<ProductVO> selectFoodProduct() {
        return productDAO.selectFoodProduct();
    }

    @Override
    public List<ProductVO> selectSearchList(String prodName) {
        return productDAO.selectSearchList(prodName);
    }


    @Override
    public int selectAllCnt() {
        return productDAO.selectAllCnt();
    }
}
