package com.example.demo.vo;

public class ResDetailVO {
    private int resCode;                    // 예약 코드
    private int fltCode;                    // 항공편 코드
    private int ticketPrice;                // 티켓 가격
    private String seatCode;                // 좌석 코드

    public ResDetailVO() {
    }

    public ResDetailVO(int resCode, int fltCode, int ticketPrice, String seatCode) {
        this.resCode = resCode;
        this.fltCode = fltCode;
        this.ticketPrice = ticketPrice;
        this.seatCode = seatCode;
    }

    public int getResCode() {
        return resCode;
    }

    public void setResCode(int resCode) {
        this.resCode = resCode;
    }

    public int getFltCode() {
        return fltCode;
    }

    public void setFltCode(int fltCode) {
        this.fltCode = fltCode;
    }

    public int getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(int ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public String getSeatCode() {
        return seatCode;
    }

    public void setSeatCode(String seatCode) {
        this.seatCode = seatCode;
    }
}
