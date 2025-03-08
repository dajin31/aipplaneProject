package com.example.demo.vo;

public class MemGradeVO {
    private String memCode;    // 회원등급 코드
    private int dcRate;     // 차감율

    public MemGradeVO() {
    }

    public MemGradeVO(String memCode, int dcRate) {
        this.memCode = memCode;
        this.dcRate = dcRate;
    }

    public String getMemCode() {
        return memCode;
    }

    public void setMemCode(String memCode) {
        this.memCode = memCode;
    }

    public int getDcRate() {
        return dcRate;
    }

    public void setDcRate(int dcRate) {
        this.dcRate = dcRate;
    }

    @Override
    public String toString() {
        return "MemGradeVO{" +
                "memCode='" + memCode + '\'' +
                ", dcRate=" + dcRate +
                '}';
    }
}
