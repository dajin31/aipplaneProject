package com.example.demo.service;

import com.example.demo.vo.UserVO;

public interface UserService {
    public int selectUser(UserVO userVO);       // 유저 있는지를 확인

    public int selectMileage(String userId);    // 마일리지 가져오기

    public int updateMileage(UserVO userVO);    // 유저 마일리지 업데이트
}