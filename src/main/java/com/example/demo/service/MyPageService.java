package com.example.demo.service;

import com.example.demo.dao.IMyPageDAO;
import com.example.demo.dao.MyPageDAO;
import com.example.demo.vo.MyReservationVO;

import java.util.List;

public class MyPageService implements IMyPageService{

    private IMyPageDAO dao;

    private static MyPageService service;

    private MyPageService() {
        dao = MyPageDAO.getInstance();
    }

    public static MyPageService getInstance() {
        if (service == null) {
            service = new MyPageService();
        }
        return service;
    }

    @Override
    public List<MyReservationVO> selectMyReservation(String userId) {
        return dao.selectMyReservation(userId);
    }

    @Override
    public List<MyReservationVO> selectMyReservationDetail(String userId) {
        return dao.selectMyReservationDetail(userId);
    }
}
