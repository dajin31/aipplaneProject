package com.example.demo.vo;

public class PaymentMethodVO {
    private int payTypeCode;        // 결제수단 코드
    private String payTypeName;     // 결제수단 명

    public PaymentMethodVO() {
    }

    public PaymentMethodVO(int payTypeCode, String payTypeName) {
        this.payTypeCode = payTypeCode;
        this.payTypeName = payTypeName;
    }

    public int getPayTypeCode() {
        return payTypeCode;
    }

    public void setPayTypeCode(int payTypeCode) {
        this.payTypeCode = payTypeCode;
    }

    public String getPayTypeName() {
        return payTypeName;
    }

    public void setPayTypeName(String payTypeName) {
        this.payTypeName = payTypeName;
    }
}
