package com.example.demo.vo;

public class AirportProcessVO {
    private int resCode;
    private int fltCode;
    private int ticketPrice;
    private String seatCode;
    private String resDate;
    private int totalPrice;
    private int resStatus;
    private String userId;
    private String seatPosition;
    private String seatStatus;
    private int userMileage;

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

    public String getResDate() {
        return resDate;
    }

    public void setResDate(String resDate) {
        this.resDate = resDate;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getResStatus() {
        return resStatus;
    }

    public void setResStatus(int resStatus) {
        this.resStatus = resStatus;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getSeatPosition() {
        return seatPosition;
    }

    public void setSeatPosition(String seatPosition) {
        this.seatPosition = seatPosition;
    }

    public String getSeatStatus() {
        return seatStatus;
    }

    public void setSeatStatus(String seatStatus) {
        this.seatStatus = seatStatus;
    }

    public int getUserMileage() {
        return userMileage;
    }

    public void setUserMileage(int userMileage) {
        this.userMileage = userMileage;
    }

    @Override
    public String toString() {
        return "AirportProcessVO{" +
                "resCode=" + resCode +
                ", fltCode=" + fltCode +
                ", ticketPrice=" + ticketPrice +
                ", seatCode='" + seatCode + '\'' +
                ", resDate='" + resDate + '\'' +
                ", totalPrice=" + totalPrice +
                ", resStatus=" + resStatus +
                ", userId='" + userId + '\'' +
                ", seatPosition='" + seatPosition + '\'' +
                ", seatStatus='" + seatStatus + '\'' +
                ", userMileage=" + userMileage +
                '}';
    }
}
