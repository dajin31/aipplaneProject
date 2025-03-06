package com.example.demo.vo;

public class AirportVO {
    private String aptCode;    // 공항 코드
    private String aptName; // 공항 명
    private String cntName; // 국가 명
    private String cntCategory;

    public AirportVO() {
    }

    public AirportVO(String aptCode, String aptName, String cntName, String cntCategory) {
        this.aptCode = aptCode;
        this.aptName = aptName;
        this.cntName = cntName;
        this.cntCategory = cntCategory;
    }

    public String getAptCode() {
        return aptCode;
    }

    public void setAptCode(String aptCode) {
        this.aptCode = aptCode;
    }

    public String getCntCategory() {
        return cntCategory;
    }

    public void setCntCategory(String cntCategory) {
        this.cntCategory = cntCategory;
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
