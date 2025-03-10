package com.example.demo.vo;

public class UsersVO {
    private String userId;
    private String userPw;
    private String userName;
    private String userEmail;
    private String userRegnum;
    private int userMileage;
    private String userPassnum;
    private String memCode;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserRegnum() {
        return userRegnum;
    }

    public void setUserRegnum(String userRegnum) {
        this.userRegnum = userRegnum;
    }

    public int getUserMileage() {
        return userMileage;
    }

    public void setUserMileage(int userMileage) {
        this.userMileage = userMileage;
    }

    public String getUserPassnum() {
        return userPassnum;
    }

    public void setUserPassnum(String userPassnum) {
        this.userPassnum = userPassnum;
    }

    public String getMemCode() {
        return memCode;
    }

    public void setMemCode(String memCode) {
        this.memCode = memCode;
    }

    @Override
    public String toString() {
        return "UsersVO{" +
                "userId='" + userId + '\'' +
                ", userPw='" + userPw + '\'' +
                ", userName='" + userName + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userRegnum='" + userRegnum + '\'' +
                ", userMileage=" + userMileage +
                ", userPassnum='" + userPassnum + '\'' +
                ", memCode='" + memCode + '\'' +
                '}';
    }
}
