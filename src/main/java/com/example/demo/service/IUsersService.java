package com.example.demo.service;

import com.example.demo.vo.OrdersVO;
import com.example.demo.vo.UsersVO;

public interface IUsersService {
    public int selectUser(UsersVO usersVO); //유저 있는지 확인
    public int selectMileage(String userId); // 마일리지 가져오기
    public int insertOrder(OrdersVO ordersVO); // 주문 테이블 insert
    public int updateMileage(UsersVO usersVO); // 유저 마일리지 업데이트
}
