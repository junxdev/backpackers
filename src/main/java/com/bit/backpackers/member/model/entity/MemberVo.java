package com.bit.backpackers.member.model.entity;

import java.util.Date;

public class MemberVo {

	private String userId;
    private String userPw;
    private String userName;
    private String userEmail;
    private Date userJoinDate;
    private Date userLoginDate;
    private String userSignature;
    private String userImg;
    private int userPoint;
    private String authkey;
    private int authstatus;
    
    public MemberVo() {
		// TODO Auto-generated constructor stub
	}

	public MemberVo(String userId, String userPw, String userName, String userEmail, Date userJoinDate,
			Date userLoginDate, String userSignature, String userImg, int userPoint, String authkey, int authstatus) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userJoinDate = userJoinDate;
		this.userLoginDate = userLoginDate;
		this.userSignature = userSignature;
		this.userImg = userImg;
		this.userPoint = userPoint;
		this.authkey = authkey;
		this.authstatus = authstatus;
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

	public Date getUserJoinDate() {
		return userJoinDate;
	}

	public void setUserJoinDate(Date userJoinDate) {
		this.userJoinDate = userJoinDate;
	}

	public Date getUserLoginDate() {
		return userLoginDate;
	}

	public void setUserLoginDate(Date userLoginDate) {
		this.userLoginDate = userLoginDate;
	}

	public String getUserSignature() {
		return userSignature;
	}

	public void setUserSignature(String userSignature) {
		this.userSignature = userSignature;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public int getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}

	public String getAuthkey() {
		return authkey;
	}

	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}

	public int getAuthstatus() {
		return authstatus;
	}

	public void setAuthstatus(int authstatus) {
		this.authstatus = authstatus;
	}

	@Override
	public String toString() {
		return "MemberVo [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userEmail="
				+ userEmail + ", userJoinDate=" + userJoinDate + ", userLoginDate=" + userLoginDate + ", userSignature="
				+ userSignature + ", userImg=" + userImg + ", userPoint=" + userPoint + ", authkey=" + authkey
				+ ", authstatus=" + authstatus + "]";
	}
    
    

}