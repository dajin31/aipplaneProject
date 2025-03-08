package com.example.demo.vo;

import java.util.Objects;

public class UserVO {
    private String userId;
    private String userPw;
    private String userName;
    private String userEmail;
    private String userRegnum;
    private int userMileage;
    private int userTotalMileage;
    private String userPassNum;
    private String memCode;

    public UserVO() {
    }

    public UserVO(String userId, String userPw, String userName, String userEmail, String userRegnum, int userMileage, int userTotalMileage, String userPassNum, String memCode) {
        this.userId = userId;
        this.userPw = userPw;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userRegnum = userRegnum;
        this.userMileage = userMileage;
        this.userTotalMileage = userTotalMileage;
        this.userPassNum = userPassNum;
        this.memCode = memCode;
    }

    public UserVO(String userId, String userPw, String userName, String userEmail, String userRegnum) {
        this.userId = userId;
        this.userPw = userPw;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userRegnum = userRegnum;
    }

    // 로그인용 생성자 (아이디와 비밀번호로 로그인 확인)
    public UserVO(String userId, String userPw) {
        this.userId = userId;
        this.userPw = userPw;
    }

    // 아이디 찾기 용 팩토리 메서드
    public static UserVO createUserVOForFindId(String userName, String userRegnum, String userEmail) {
        UserVO userVO = new UserVO();
        userVO.userName = userName;
        userVO.userRegnum = userRegnum;
        userVO.userEmail = userEmail;
        return userVO;
    }

    // 비밀번호 찾기 용 팩토리 메서드
    public static UserVO createUserVOForFindPassword(String userId, String userRegnum, String userEmail) {
        UserVO userVO = new UserVO();
        userVO.userId = userId;
        userVO.userRegnum = userRegnum;
        userVO.userEmail = userEmail;
        return userVO;
    }


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

    public int getUserTotalMileage() {
        return userTotalMileage;
    }

    public void setUserTotalMileage(int userTotalMileage) {
        this.userTotalMileage = userTotalMileage;
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

    public void setMemCode(String memCode) {
        this.memCode = memCode;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserVO userVO = (UserVO) o;
        return userRegnum == userVO.userRegnum && Objects.equals(userId, userVO.userId) && Objects.equals(userPw, userVO.userPw) && Objects.equals(userName, userVO.userName) && Objects.equals(userEmail, userVO.userEmail);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, userPw, userName, userRegnum, userEmail);
    }

    @Override
    public String toString() {
        return "UserVO{" +
                "userId='" + userId + '\'' +
                ", userPw='" + userPw + '\'' +
                ", userName='" + userName + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userRegnum='" + userRegnum + '\'' +
                ", userMileage=" + userMileage +
                ", userTotalMileage=" + userTotalMileage +
                ", userPassNum='" + userPassNum + '\'' +
                ", memCode='" + memCode + '\'' +
                '}';
    }
}
