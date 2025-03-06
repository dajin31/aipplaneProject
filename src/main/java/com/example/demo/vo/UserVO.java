package com.example.demo.vo;

public class UserVO {
    private String userId;      // 회원 id
    private String userName;    // 회원 이름
    private String userPw;      // 회원 비밀번호
    private String userEmail;   // 회원 이메일
    private String userRegNum;     // 회원 주민번호
    private int userMileage;    // 회원 마일리지
    private String userPassNum; // 회원 여권번호
    private String memCode;     // 회원 등급 코드

    public UserVO() {
    }

    public UserVO(String userId, String userName, String userEmail) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
    }

    public UserVO(String userId, String userName, String userPw, String userEmail, String userRegNum, int userMileage, String userPassNum, String memCode) {
        this.userId = userId;
        this.userName = userName;
        this.userPw = userPw;
        this.userEmail = userEmail;
        this.userRegNum = userRegNum;
        this.userMileage = userMileage;
        this.userPassNum = userPassNum;
        this.memCode = memCode;
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

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserRegNum() {
        return userRegNum;
    }

    public void setUserRegNum(String userRegNum) {
        this.userRegNum = userRegNum;
    }

    public int getUserMileage() {
        return userMileage;
    }

    public void setUserMileage(int userMileage) {
        this.userMileage = userMileage;
    }

    public String getUserPassNum() {
        return userPassNum;
    }

    public void setUserPassNum(String userPassNum) {
        this.userPassNum = userPassNum;
    }

    public String getMemCode() {
        return memCode;
    }

    public void setMemCode(String memGrade) {
        this.memCode = memCode;
    }
}
