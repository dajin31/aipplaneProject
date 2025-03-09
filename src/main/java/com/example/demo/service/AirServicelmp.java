package com.example.demo.service;

import java.util.List;


import com.example.demo.dao.AirDAO;
import com.example.demo.dao.AirDaoImp;
import com.example.demo.vo.AirVO;

public class AirServicelmp implements AirService{
    private AirDAO dao;

    private static AirServicelmp service;

    private AirServicelmp() {
        dao = AirDaoImp.getInstance();
    }

    public static AirServicelmp getInstance() {
        if(service == null) service = new AirServicelmp();
        return service;

    }
    //환불순서1)마일리지 돌려주기
    public int updateUserMileage(AirVO airVO) {
        System.out.println("값:"+ airVO);
        return dao.updateUserMileage(airVO);
    }
    //환불순서2)예약정보 res_details테이블 삭제하기
    public int AirCancel1(AirVO airVO) {
        return dao.AirCancel1(airVO);
    }
    //환불순서3)예약정보 payment테이블 삭제하기
    public int AirCancel2(AirVO airVO) {
        return dao.AirCancel2(airVO);
    }
    //환불순서4)예약정보 reservation테이블 삭제하기
    public int AirCancel3(AirVO airVO) {
        return dao.AirCancel3(airVO);
    }

    //예약정보 목록
    public List<AirVO> getAirList(AirVO airVO) {
        return dao.getAirList(airVO);
    }

    //예약정보 상세
    public AirVO getAir(AirVO airVO) {
        return dao.getAir(airVO);
    }
}
