package com.example.demo.vo;

public class SeatVO {
    private String seatCode;           // 좌석 코드
    private String seatPosition;    // 좌석 위치
    private String seatClass;    // 좌석 등급
    private String seatStatus;  // 좌석 상태
    private int airCode;    // 항공기 코드 (fk)

    public SeatVO() {
    }

    public SeatVO(String seatCode) {
        this.seatCode = seatCode;
    }

    public SeatVO(String seatCode, String seatPosition, String seatClass, String seatStatus, int airCode) {
        this.seatCode = seatCode;
        this.seatPosition = seatPosition;
        this.seatClass = seatClass;
        this.seatStatus = seatStatus;
        this.airCode = airCode;
    }

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

    public int getAircraft() {
        return airCode;
    }

    public void setAircraft(int airCode) {
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
