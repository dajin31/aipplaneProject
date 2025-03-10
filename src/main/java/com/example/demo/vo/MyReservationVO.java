package com.example.demo.vo;

public class MyReservationVO {
    private int fltCode;
    private String userId;
    private String userName;
    private String seatCode;
    private String dptDate;
    private String arrDate;
    private String dptTime;
    private String arrTime;
    private int fltTime;
    private String startCountry;
    private String endCountry;
    private int ticketPrice;
    private String resDate;
    private int resCode;
    private String dptCntName;
    private String arrCntName;

    public int getFltCode() {
        return fltCode;
    }

    public void setFltCode(int fltCode) {
        this.fltCode = fltCode;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSeatCode() {
        return seatCode;
    }

    public void setSeatCode(String seatCode) {
        this.seatCode = seatCode;
    }

    public String getDptDate() {
        return dptDate;
    }

    public void setDptDate(String dptDate) {
        this.dptDate = dptDate;
    }

    public String getArrDate() {
        return arrDate;
    }

    public void setArrDate(String arrDate) {
        this.arrDate = arrDate;
    }

    public String getDptTime() {
        return dptTime;
    }

    public void setDptTime(String dptTime) {
        this.dptTime = dptTime;
    }

    public String getArrTime() {
        return arrTime;
    }

    public void setArrTime(String arrTime) {
        this.arrTime = arrTime;
    }

    public int getFltTime() {
        return fltTime;
    }

    public void setFltTime(int fltTime) {
        this.fltTime = fltTime;
    }

    public String getStartCountry() {
        return startCountry;
    }

    public void setStartCountry(String startCountry) {
        this.startCountry = startCountry;
    }

    public String getEndCountry() {
        return endCountry;
    }

    public void setEndCountry(String endCountry) {
        this.endCountry = endCountry;
    }

    public int getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(int ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public String getResDate() {
        return resDate;
    }

    public void setResDate(String resDate) {
        this.resDate = resDate;
    }

    public int getResCode() {
        return resCode;
    }

    public void setResCode(int resCode) {
        this.resCode = resCode;
    }

    public String getDptCntName() {
        return dptCntName;
    }

    public void setDptCntName(String dptCntName) {
        this.dptCntName = dptCntName;
    }

    public String getArrCntName() {
        return arrCntName;
    }

    public void setArrCntName(String arrCntName) {
        this.arrCntName = arrCntName;
    }

    @Override
    public String toString() {
        return "MyReservationVO{" +
                "fltCode=" + fltCode +
                ", userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", seatCode='" + seatCode + '\'' +
                ", dptDate='" + dptDate + '\'' +
                ", arrDate='" + arrDate + '\'' +
                ", dptTime='" + dptTime + '\'' +
                ", arrTime='" + arrTime + '\'' +
                ", fltTime=" + fltTime +
                ", startCountry='" + startCountry + '\'' +
                ", endCountry='" + endCountry + '\'' +
                ", ticketPrice=" + ticketPrice +
                ", resDate='" + resDate + '\'' +
                ", resCode=" + resCode +
                ", dptCntName='" + dptCntName + '\'' +
                ", arrCntName='" + arrCntName + '\'' +
                '}';
    }
}
