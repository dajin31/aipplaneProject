package com.example.demo.vo;

import java.util.Date;

public class ServiceVO {
    private int serviceCode;    // 서비스 코드
    private int purDate;       // 서비스 구입 일시
    private int purPrice;       // 서비스 구입 총액
    private int resCode;  // 예약 코드

    public ServiceVO() {
    }

    public ServiceVO(int serviceCode, int purDate, int purPrice, int resCode) {
        this.serviceCode = serviceCode;
        this.purDate = purDate;
        this.purPrice = purPrice;
        this.resCode = resCode;
    }

    public int getServiceCode() {
        return serviceCode;
    }

    public void setServiceCode(int serviceCode) {
        this.serviceCode = serviceCode;
    }

    public int getPurDate() {
        return purDate;
    }

    public void setPurDate(int purDate) {
        this.purDate = purDate;
    }

    public int getPurPrice() {
        return purPrice;
    }

    public void setPurPrice(int purPrice) {
        this.purPrice = purPrice;
    }

    public int getResCode() {
        return resCode;
    }

    public void setResCode(int resCode) {
        this.resCode = resCode;
    }
}
