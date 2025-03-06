package com.example.demo.service;

import com.example.demo.dao.SeatDAO;
import com.example.demo.dao.SeatDAOImpl;
import com.example.demo.vo.SeatVO;

import java.util.List;

public class SeatServiceImpl implements SeatService {
    private SeatDAO dao;

    private static SeatServiceImpl service;

    private SeatServiceImpl(){
        dao = SeatDAOImpl.getInstance();
    }

    public static SeatServiceImpl getInstance() {
        if (service == null) {
            service = new SeatServiceImpl();
        }
        return service;
    }

    @Override
    public List<SeatVO> selectSeatList() {
        return dao.selectSeatList();
    }
}
