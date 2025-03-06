package com.example.demo.vo;

import com.example.demo.enums.MemName;

public class MemGradeVO {
    private int memCode;    // 회원등급 코드
    private String memName;    // 회원등급 명
    private int dcRate;     // 차감율

    public MemGradeVO() {
    }

    public MemGradeVO(int memCode, String memName, int dcRate) {
        this.memCode = memCode;
        this.memName = memName;
        this.dcRate = dcRate;
    }

    public int getMemCode() {
        return memCode;
    }

    public void setMemCode(int memCode) {
        this.memCode = memCode;
    }

    public String getMemName() {
        return memName;
    }

    public void setMemName(String memName) {
        this.memName = memName;
    }

    public int getDcRate() {
        return dcRate;
    }

    public void setDcRate(int dcRate) {
        this.dcRate = dcRate;
    }
}
