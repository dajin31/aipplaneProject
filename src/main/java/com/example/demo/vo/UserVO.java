package com.example.demo.vo;

import java.util.Objects;

public class UserVO {
    private String userId;    // 회원 아이디
    private String userPw;    // 회원 비밀번호
    private String userName;  // 회원 이름
    private String userRegnum;   // 생년월일
    private String userEmail;  // 이메일

//

    private int user_mileage;
    private String user_passnum;
    private String mem_code;
    private String new_pw;
    private int user_totalmileage;

    public int getUser_mileage() {
        return user_mileage;
    }

    public void setUser_mileage(int user_mileage) {
        this.user_mileage = user_mileage;
    }

    public String getUser_passnum() {
        return user_passnum;
    }

    public void setUser_passnum(String user_passnum) {
        this.user_passnum = user_passnum;
    }

    public String getMem_code() {
        return mem_code;
    }

    public void setMem_code(String mem_code) {
        this.mem_code = mem_code;
    }

    public String getNew_pw() {
        return new_pw;
    }

    public void setNew_pw(String new_pw) {
        this.new_pw = new_pw;
    }

    public int getUser_totalmileage() {
        return user_totalmileage;
    }

    public void setUser_totalmileage(int user_totalmileage) {
        this.user_totalmileage = user_totalmileage;
    }

    public UserVO() {}

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


    // 모든 필드 초기화 생성자
    public UserVO(String userId, String userPw, String userName, String userRegnum, String userEmail) {
        this.userId = userId;
        this.userPw = userPw;
        this.userName = userName;
        this.userRegnum = userRegnum;
        this.userEmail = userEmail;
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
                ", userRegnum='" + userRegnum + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", user_mileage=" + user_mileage +
                ", user_passnum='" + user_passnum + '\'' +
                ", mem_code='" + mem_code + '\'' +
                ", new_pw='" + new_pw + '\'' +
                ", user_totalmileage=" + user_totalmileage +
                '}';
    }
}