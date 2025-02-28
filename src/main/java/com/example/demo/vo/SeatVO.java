package com.example.demo.vo;

public class SeatVO {
    private String seatCode;
    private String seatPosition;
    private String seatClass;
    private String seatStatus;
    private int airCode;

    public String getSeatCode() {
        return seatCode;
    }

    public void setSeatCode(String seatCode) {
        this.seatCode = seatCode;
    }

    public String getSeatPosition() {
        return seatPosition;
    }

    public void setSeatPosition(String seatPosition) {
        this.seatPosition = seatPosition;
    }

    public String getSeatClass() {
        return seatClass;
    }

    public void setSeatClass(String seatClass) {
        this.seatClass = seatClass;
    }

    public String getSeatStatus() {
        return seatStatus;
    }

    public void setSeatStatus(String seatStatus) {
        this.seatStatus = seatStatus;
    }

    public int getAirCode() {
        return airCode;
    }

    public void setAirCode(int airCode) {
        this.airCode = airCode;
    }

    @Override
    public String toString() {
        return "SeatVO{" +
                "seatCode='" + seatCode + '\'' +
                ", seatPosition='" + seatPosition + '\'' +
                ", seatClass='" + seatClass + '\'' +
                ", seatStatus='" + seatStatus + '\'' +
                ", airCode=" + airCode +
                '}';
    }
}
