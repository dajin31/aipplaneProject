package com.example.demo.vo;

public class AirRouteScheduleVO {
    private int fltCode;
    private String dptDate;
    private String arrDate;
    private String dptTime;
    private String arrTime;
    private int fltTime;
    private int airCode;
    private String dptAptCode;
    private String arrAptCode;
    private String dptCntName;
    private String arrCntName;
    private String aptName;
    private String airName;

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

    public String getAptName() {
        return aptName;
    }

    public void setAptName(String aptName) {
        this.aptName = aptName;
    }

    public String getAirName() {
        return airName;
    }

    public void setAirName(String airName) {
        this.airName = airName;
    }

    public int getFltCode() {
        return fltCode;
    }

    public void setFltCode(int fltCode) {
        this.fltCode = fltCode;
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

    public int getAirCode() {
        return airCode;
    }

    public void setAirCode(int airCode) {
        this.airCode = airCode;
    }

    public String getDptAptCode() {
        return dptAptCode;
    }

    public void setDptAptCode(String dptAptCode) {
        this.dptAptCode = dptAptCode;
    }

    public String getArrAptCode() {
        return arrAptCode;
    }

    public void setArrAptCode(String arrAptCode) {
        this.arrAptCode = arrAptCode;
    }

    @Override
    public String toString() {
        return "AirRouteScheduleVO{" +
                "fltCode=" + fltCode +
                ", dptDate='" + dptDate + '\'' +
                ", arrDate='" + arrDate + '\'' +
                ", dptTime='" + dptTime + '\'' +
                ", arrTime='" + arrTime + '\'' +
                ", fltTime=" + fltTime +
                ", airCode=" + airCode +
                ", dptAptCode='" + dptAptCode + '\'' +
                ", arrAptCode='" + arrAptCode + '\'' +
                ", dptCntName='" + dptCntName + '\'' +
                ", arrCntName='" + arrCntName + '\'' +
                ", aptName='" + aptName + '\'' +
                ", airName='" + airName + '\'' +
                '}';
    }
}
