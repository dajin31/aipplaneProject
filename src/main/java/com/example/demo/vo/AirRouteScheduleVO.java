package com.example.demo.vo;

import java.util.Date;

public class AirRouteScheduleVO {
    private int fltCode;        // 항공편 코드 (pk)
    private Date dptDate;       // 출발 날짜
    private Date arrDate;       // 도착 날짜
    private Date dptTime;       // 출발 시간
    private Date arrTime;       // 도착 시간
    private int fltTime;        // 비행 소요 시간
    private int airCode;        // 항공기 코드 (fk)
    private String dptAptCode;     // 출발 공항 코드 (fk)
    private String arrAptCode;     // 도착 공항 코드 (fk)
    private String dptCntName;        // 도착 국가 명
    private String arrCntName;        // 출발 국가 명
    private String aptName;           // 공항 명
    private String airName;           // 

    public AirRouteScheduleVO() {
    }


    public AirRouteScheduleVO(int fltCode, Date dptDate, Date arrDate, Date dptTime, Date arrTime, int fltTime, int airCode, String dptAptCode, String arrAptCode, String dptCntName, String arrCntName, String aptName, String airName) {
        this.fltCode = fltCode;
        this.dptDate = dptDate;
        this.arrDate = arrDate;
        this.dptTime = dptTime;
        this.arrTime = arrTime;
        this.fltTime = fltTime;
        this.airCode = airCode;
        this.dptAptCode = dptAptCode;
        this.arrAptCode = arrAptCode;
        this.dptCntName = dptCntName;
        this.arrCntName = arrCntName;
        this.aptName = aptName;
        this.airName = airName;
    }

    public int getFltCode() {
        return fltCode;
    }

    public void setFltCode(int fltCode) {
        this.fltCode = fltCode;
    }

    public Date getDptDate() {
        return dptDate;
    }

    public void setDptDate(Date dptDate) {
        this.dptDate = dptDate;
    }

    public Date getArrDate() {
        return arrDate;
    }

    public void setArrDate(Date arrDate) {
        this.arrDate = arrDate;
    }

    public Date getDptTime() {
        return dptTime;
    }

    public void setDptTime(Date dptTime) {
        this.dptTime = dptTime;
    }

    public Date getArrTime() {
        return arrTime;
    }

    public void setArrTime(Date arrTime) {
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

    @Override
    public String toString() {
        return "AirRouteScheduleVO{" +
                "fltCode=" + fltCode +
                ", dptDate=" + dptDate +
                ", arrDate=" + arrDate +
                ", dptTime=" + dptTime +
                ", arrTime=" + arrTime +
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
