package com.example.demo.vo;

import java.util.Objects;

public class UserVO {
	private String userName;    	// 회원 이름
	private String userId;      	// 회원 아이디
	private String userPw;      	// 회원 비밀번호
	private String userEmail;   	// 회원 이메일
	private String userRegNum;     	// 회원 주민번호
	private String userPassNum; 	// 회원 여권번호
	private int userMileage;    	// 회원 보유 마일리지
	private int userTotalMileage;   // 회원 총 마일리지
	private String memCode; 		// 회원 등급

	public UserVO() {
	}

	// 로그인용 생성자 (아이디와 비밀번호로 로그인 확인)
	public UserVO(String userId, String userPw) {
		this.userId = userId;
		this.userPw = userPw;
	}

	// userName, userRegNum, userEmail을 받는 생성자
	public UserVO(String userName, String userRegNum, String userEmail) {
		this.userName = userName;
		this.userRegNum = userRegNum;
		this.userEmail = userEmail;
	}

	// User 필드 생성자
	public UserVO(String userId, String userPw, String userName, String userEmail, String userRegNum,
				  int userMileage, String userPassNum, int userTotalMileage, String memCode) {
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userRegNum = userRegNum;
		this.userMileage = userMileage;
		this.userPassNum = userPassNum;
		this.userTotalMileage = userTotalMileage;
		this.memCode = memCode;
	}

	// Getter & Setter
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

	public void setMemCode(String memCode) {
		this.memCode = memCode;
	}

	public int getUserTotalMileage() {
		return userTotalMileage;
	}

	public void setUserTotalMileage(int userTotalMileage) {
		this.userTotalMileage = userTotalMileage;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		UserVO userVO = (UserVO) o;
		return userRegNum == userVO.userRegNum && Objects.equals(userId, userVO.userId) && Objects.equals(userPw, userVO.userPw) && Objects.equals(userName, userVO.userName) && Objects.equals(userEmail, userVO.userEmail);
	}

	@Override
	public int hashCode() {
		return Objects.hash(userId, userPw, userName, userRegNum, userEmail);
	}

	@Override
	public String toString() {
		return "UserVO{" +
				"userId='" + userId + '\'' +
				", userPw='" + userPw + '\'' +
				", userName='" + userName + '\'' +
				", userEmail='" + userEmail + '\'' +
				", userRegNum='" + userRegNum + '\'' +
				", userMileage=" + userMileage +
				", userPassNum='" + userPassNum + '\'' +
				", userTotalMileage=" + userTotalMileage +
				", memCode='" + memCode + '\'' +
				'}';
	}
}
