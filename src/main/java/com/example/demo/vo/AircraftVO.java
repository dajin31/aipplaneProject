package com.example.demo.vo;

public class AircraftVO {
    private int airCode;    // 항공기 코드
    private String airName; // 항공기 기종명
    private String airClass; // 항공기 분류

    public AircraftVO() {
    }

    public AircraftVO(int airCode, String airName, String airClass) {
        this.airCode = airCode;
        this.airName = airName;
        this.airClass = airClass;
    }

    public AircraftVO(int airCode) {
    }

    public int getAirCode() {
        return airCode;
    }

    public void setAirCode(int airCode) {
        this.airCode = airCode;
    }

    public String getAirName() {
        return airName;
    }

    public void setAirName(String airName) {
        this.airName = airName;
    }

    public String getAirClass() {
        return airClass;
    }

    public void setAirClass(String airClass) {
        this.airClass = airClass;
    }
}
