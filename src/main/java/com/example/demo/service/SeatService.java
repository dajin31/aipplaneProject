package com.example.demo.service;

import com.example.demo.dao.ISeatDAO;
import com.example.demo.dao.SeatDAO;
import com.example.demo.vo.SeatVO;

import java.util.List;

public class SeatService implements ISeatService{
    private ISeatDAO dao;

    private static SeatService service;

    private SeatService() {
        dao = SeatDAO.getInstance();
    }

    public static SeatService getInstance() {
        if (service == null) {
            service = new SeatService();
        }
        return service;
    }
    @Override
    public List<SeatVO> selectSeatList() {
        return dao.selectSeatList();
    }
}
