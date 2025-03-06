package com.example.demo.dao;

import com.example.demo.vo.PaymentVO;
import com.example.demo.vo.ReservationVO;

public interface PaymentDAO {
    boolean processPayment(int resCode, int amount);       // 결제 처리
    boolean refundPayment(int resCode);     // 특정 예약번호로 결제 정보 조회

}
