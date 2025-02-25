package com.example.demo.dao;

import com.example.demo.vo.OrdersVO;
import com.example.demo.vo.ProductVO;

import java.util.List;

public interface IProductDAO {
    public List<ProductVO> selectAllProduct(); //전체 리스트
    public List<ProductVO> selectMakeupProduct(); //화장품 리스트
    public List<ProductVO> selectGroceryProduct(); //잡화 리스트
    public List<ProductVO> selectFoodProduct(); //식품 리스트
    public List<ProductVO> selectSearchList(String prodName); // 검색 리스트
    public List<ProductVO> selectDetailList(String prodId); // 상세검색 리스트
    public int selectAllCnt(); //전체 상품 개수
    public List<OrdersVO> selectUserOrders(String userId);
}
