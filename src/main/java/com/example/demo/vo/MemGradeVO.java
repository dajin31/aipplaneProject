package com.example.demo.vo;

public class MemGradeVO {
    private String memCode;
    private String memName;
    private int dcRate;
    private String userId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getMemCode() {
        return memCode;
    }

    public void setMemCode(String memCode) {
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
