package com.example.demo.vo;

public class PassengerVO {
    private int pNum;
    private String userId;
    private String userName;
    private int fltCode;
    private String passNum;
    private int regNum;
    private String seatCode;

    public int getpNum() {
        return pNum;
    }

    public void setpNum(int pNum) {
        this.pNum = pNum;
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

    public int getFltCode() {
        return fltCode;
    }

    public void setFltCode(int fltCode) {
        this.fltCode = fltCode;
    }

    public String getPassNum() {
        return passNum;
    }

    public void setPassNum(String passNum) {
        this.passNum = passNum;
    }

    public int getRegNum() {
        return regNum;
    }

    public void setRegNum(int regNum) {
        this.regNum = regNum;
    }

    public String getSeatCode() {
        return seatCode;
    }

    public void setSeatCode(String seatCode) {
        this.seatCode = seatCode;
    }

    @Override
    public String toString() {
        return "PassengerVO{" +
                "pNum=" + pNum +
                ", userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", fltCode=" + fltCode +
                ", passNum='" + passNum + '\'' +
                ", regNum=" + regNum +
                ", seatCode='" + seatCode + '\'' +
                '}';
    }
}
