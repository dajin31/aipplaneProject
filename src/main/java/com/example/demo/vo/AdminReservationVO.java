package com.example.demo.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class AdminReservationVO {
    private String userId;          // 회원 아이디
    private String userName;        // 회원/승객 이름
    private int fltCode;            // 항공편 코드
    private String dptAptCode;      // 출발 공항 코드
    private String dptAptName;      // 출발 공항 이름
    private String arrAptCode;      // 도착 공항 코드
    private String arrAptName;      // 도착 공항 이름
    private int airCode;            // 항공기 코드
    private String airName;         // 항공기 이름
    private int passengerCount;     // 승객 수
    private Date dptDate;           // 출발 날짜
    private Date dptTime;           // 출발 시간
    private Date arrDate;           // 도착 날짜
    private Date arrTime;           // 도착 시간
    private String seatCode;        // 좌석 코드
    private String seatClass;       // 좌석 등급
    private String seatPosition;    // 좌석 위치
    private String passNum;         // 여권 번호
    private int pNum;               // 승객 번호

    public AdminReservationVO() {
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getFltCode() {
        return fltCode;
    }

    public void setFltCode(int fltCode) {
        this.fltCode = fltCode;
    }

    public String getDptAptCode() {
        return dptAptCode;
    }

    public void setDptAptCode(String dptAptCode) {
        this.dptAptCode = dptAptCode;
    }

    public String getDptAptName() {
        return dptAptName;
    }

    public void setDptAptName(String dptAptName) {
        this.dptAptName = dptAptName;
    }

    public String getArrAptCode() {
        return arrAptCode;
    }

    public void setArrAptCode(String arrAptCode) {
        this.arrAptCode = arrAptCode;
    }

    public String getArrAptName() {
        return arrAptName;
    }

    public void setArrAptName(String arrAptName) {
        this.arrAptName = arrAptName;
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

    public int getPassengerCount() {
        return passengerCount;
    }

    public void setPassengerCount(int passengerCount) {
        this.passengerCount = passengerCount;
    }

    public Date getDptDate() {
        return dptDate;
    }

    public void setDptDate(Date dptDate) {
        this.dptDate = dptDate;
    }

    public Date getDptTime() {
        return dptTime;
    }

    public void setDptTime(Date dptTime) {
        this.dptTime = dptTime;
    }

    public Date getArrDate() {
        return arrDate;
    }

    public void setArrDate(Date arrDate) {
        this.arrDate = arrDate;
    }

    public Date getArrTime() {
        return arrTime;
    }

    public void setArrTime(Date arrTime) {
        this.arrTime = arrTime;
    }

    public String getSeatCode() {
        return seatCode;
    }

    public void setSeatCode(String seatCode) {
        this.seatCode = seatCode;
    }

    public String getSeatClass() {
        return seatClass;
    }

    public void setSeatClass(String seatClass) {
        this.seatClass = seatClass;
    }

    public String getSeatPosition() {
        return seatPosition;
    }

    public void setSeatPosition(String seatPosition) {
        this.seatPosition = seatPosition;
    }

    public String getPassNum() {
        return passNum;
    }

    public void setPassNum(String passNum) {
        this.passNum = passNum;
    }

    public int getPNum() {
        return pNum;
    }

    public void setPNum(int pNum) {
        this.pNum = pNum;
    }

    // 출발 날짜와 시간을 포맷팅하여 반환
    public String getFormattedDptDateTime() {
        if (dptDate == null || dptTime == null) return "";
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
        return dateFormat.format(dptDate) + " " + timeFormat.format(dptTime);
    }

    // 도착 날짜와 시간을 포맷팅하여 반환
    public String getFormattedArrDateTime() {
        if (arrDate == null || arrTime == null) return "";
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
        return dateFormat.format(arrDate) + " " + timeFormat.format(arrTime);
    }

    // 출발 날짜만 포맷팅하여 반환 (yyyy-MM-dd)
    public String getFormattedDptDate() {
        if (dptDate == null) return "";
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(dptDate);
    }

    // 도착 날짜만 포맷팅하여 반환 (yyyy-MM-dd)
    public String getFormattedArrDate() {
        if (arrDate == null) return "";
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(arrDate);
    }
}

