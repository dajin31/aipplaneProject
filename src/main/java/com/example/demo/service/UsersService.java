package com.example.demo.service;

import com.example.demo.dao.IUsersDAO;
import com.example.demo.dao.UsersDAO;
import com.example.demo.vo.OrdersVO;
import com.example.demo.vo.UsersVO;

public class UsersService implements IUsersService {
    private IUsersDAO dao;

    private static UsersService usersService;

    private UsersService() {
        dao = UsersDAO.getInstance();
    }

    public static UsersService getInstance() {
        if (usersService == null) {
            usersService = new UsersService();
        }
        return usersService;
    }
    @Override
    public int selectUser(UsersVO usersVO) {
        return dao.selectUser(usersVO);
    }

    @Override
    public int selectMileage(String userId) {
        return dao.selectMileage(userId);
    }

    @Override
    public int insertOrder(OrdersVO ordersVO) {
        return dao.insertOrder(ordersVO);
    }

    @Override
    public int updateMileage(UsersVO usersVO) {
        return dao.updateMileage(usersVO);
    }
}
