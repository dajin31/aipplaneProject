package com.example.demo.vo;

public class AirportVO {
    private String aptCode;
    private String aptName;
    private String cntName;
    private String cntCategory;

    public String getCntCategory() {
        return cntCategory;
    }

    public void setCntCategory(String cntCategory) {
        this.cntCategory = cntCategory;
    }

    public String getAptCode() {
        return aptCode;
    }

    public void setAptCode(String aptCode) {
        this.aptCode = aptCode;
    }

    public String getAptName() {
        return aptName;
    }

    public void setAptName(String aptName) {
        this.aptName = aptName;
    }

    public String getCntName() {
        return cntName;
    }

    public void setCntName(String cntName) {
        this.cntName = cntName;
    }

    @Override
    public String toString() {
        return "AirportVO{" +
                "aptCode='" + aptCode + '\'' +
                ", aptName='" + aptName + '\'' +
                ", cntName='" + cntName + '\'' +
                ", cntCategory='" + cntCategory + '\'' +
                '}';
    }
}
