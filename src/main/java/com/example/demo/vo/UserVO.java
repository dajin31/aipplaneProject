package com.example.demo.vo;

import java.util.Objects;

public class UserVO {
    private String userId;    // 회원 아이디
    private String userPw;    // 회원 비밀번호
    private String userName;  // 회원 이름
    private String userRegnum;   // 생년월일
    private String userEmail;  // 이메일
    private String userHp;    // 전화번호

    public UserVO() {}

    // 로그인용 생성자 (아이디와 비밀번호로 로그인 확인)
    public UserVO(String userId, String userPw) {
        this.userId = userId;
        this.userPw = userPw;
    }

    // userName, userRegnum, userEmail을 받는 생성자
    public UserVO(String userName, String userRegnum, String userEmail) {
        this.userName = userName;
        this.userRegnum = userRegnum;
        this.userEmail = userEmail;
    }

    // userName, userRegnum, userEmail, userHp를 받는 생성자
    public UserVO(String userName, String userRegnum, String userEmail, String userHp) {
        this.userName = userName;
        this.userRegnum = userRegnum;
        this.userEmail = userEmail;
        this.userHp = userHp;
    }

    // 모든 필드를 받는 생성자
    public UserVO(String userId, String userPw, String userName, String userRegnum, String userEmail, String userHp) {
        this.userId = userId;
        this.userPw = userPw;
        this.userName = userName;
        this.userRegnum = userRegnum;
        this.userEmail = userEmail;
        this.userHp = userHp;
    }

    // Getter & Setter
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getUserPw() { return userPw; }
    public void setUserPw(String userPw) { this.userPw = userPw; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getUserRegnum() { return userRegnum; }
    public void setUserRegnum(String userRegnum) { this.userRegnum = userRegnum; }

    public String getUserEmail() { return userEmail; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }

    public String getUserHp() { return userHp; }
    public void setUserHp(String userHp) { this.userHp = userHp; }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserVO userVO = (UserVO) o;
        return userRegnum == userVO.userRegnum && Objects.equals(userId, userVO.userId) && Objects.equals(userPw, userVO.userPw) && Objects.equals(userName, userVO.userName) && Objects.equals(userEmail, userVO.userEmail) && Objects.equals(userHp, userVO.userHp);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, userPw, userName, userRegnum, userEmail, userHp);
    }

    @Override
    public String toString() {
        return "UserVO{" +
                "userId='" + userId + '\'' +
                ", userPw='" + userPw + '\'' +
                ", userName='" + userName + '\'' +
                ", userRegnum=" + userRegnum +
                ", userEmail='" + userEmail + '\'' +
                ", userHp='" + userHp + '\'' +
                '}';
    }
}