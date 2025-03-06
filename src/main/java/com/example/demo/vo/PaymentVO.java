package com.example.demo.vo;

public class PaymentVO {
    private int payCode;     // 결제 코드
    private int payAmount;      // 결제 금액
    private int reservation;  // 예약 코드
    private int paymentMethod;    // 결제수단 코드

    public PaymentVO() {
    }

    public PaymentVO(int payCode, int payAmount, int reservation, int paymentMethod) {
        this.payCode = payCode;
        this.payAmount = payAmount;
        this.reservation = reservation;
        this.paymentMethod = paymentMethod;
    }

    public int getPayCode() {
        return payCode;
    }

    public void setPayCode(int payCode) {
        this.payCode = payCode;
    }

    public int getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(int payAmount) {
        this.payAmount = payAmount;
    }

    public int getResCode() {
        return reservation;
    }

    public void setResCode(int reservation) {
        this.reservation = reservation;
    }

    public int getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(int paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
}
