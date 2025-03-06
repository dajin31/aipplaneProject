package com.example.demo.vo;

import java.util.Date;

public class ReservationVO {
    private int resCode;    // 예약 코드
    private int resDate;   // 예약 날짜
    private int totalPrice; // 총 가격
    private int ticketPrice;    // 티켓 가격
    private boolean resStatus;  // 예약 상태
    private String userId;      // 예약한 회원
    private String seatCode;

    public ReservationVO() {
    }

    public int getResCode() {
        return resCode;
    }

    public void setResCode(int resCode) {
        this.resCode = resCode;
    }

    public int getResDate() {
        return resDate;
    }

    public void setResDate(int resDate) {
        this.resDate = resDate;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(int ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public boolean isResStatus() {
        return resStatus;
    }

    public void setResStatus(boolean resStatus) {
        this.resStatus = resStatus;
    }

    public String getUser() {
        return userId;
    }

    public void setUser(String userId) {
        this.userId = userId;
    }

    public String getSeatCode() {
        return seatCode;
    }

    public void setSeatCode(String seatCode) {
        this.seatCode = seatCode;
    }
}
