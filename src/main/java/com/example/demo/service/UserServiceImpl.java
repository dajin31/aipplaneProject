package com.example.demo.service;

import com.example.demo.dao.UserDAO;
import com.example.demo.dao.UserDAOImpl;
import com.example.demo.vo.UserVO;

public class UserServiceImpl implements UserService {
    private UserDAO dao;

    private static UserServiceImpl userService;

    private UserServiceImpl() {
        dao = UserDAOImpl.getInstance();
    }

    public static UserServiceImpl getInstance() {
        if (userService == null) {
            userService = new UserServiceImpl();
        }
        return userService;
    }

    @Override
    public int selectUser(UserVO userVO) {
        return dao.selectUser(userVO);
    }

    @Override
    public int selectMileage(String userId) {
        return dao.selectMileage(userId);
    }

    @Override
    public int updateMileage(UserVO userVO) {
        return dao.updateMileage(userVO);
    }
}
