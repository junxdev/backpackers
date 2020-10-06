package com.bit.backpackers.member.model.entity;

import java.util.Date;

public class MemberVo {

	private String userId;
    private String userPw;
    private String userName;
    private String userEmail;
    private Date userJoinDate;
    private Date userLoginDate;
    private int grade;
    private String authkey;
    private int authstatus;
    
    public MemberVo() {
		// TODO Auto-generated constructor stub
	}

	public MemberVo(String userId, String userPw, String userName, String userEmail, Date userJoinDate,
			Date userLoginDate, int grade, String authkey, int authstatus) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userJoinDate = userJoinDate;
		this.userLoginDate = userLoginDate;
		this.grade = grade;
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

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((authkey == null) ? 0 : authkey.hashCode());
		result = prime * result + authstatus;
		result = prime * result + grade;
		result = prime * result + ((userEmail == null) ? 0 : userEmail.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result + ((userJoinDate == null) ? 0 : userJoinDate.hashCode());
		result = prime * result + ((userLoginDate == null) ? 0 : userLoginDate.hashCode());
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		result = prime * result + ((userPw == null) ? 0 : userPw.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberVo other = (MemberVo) obj;
		if (authkey == null) {
			if (other.authkey != null)
				return false;
		} else if (!authkey.equals(other.authkey))
			return false;
		if (authstatus != other.authstatus)
			return false;
		if (grade != other.grade)
			return false;
		if (userEmail == null) {
			if (other.userEmail != null)
				return false;
		} else if (!userEmail.equals(other.userEmail))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		if (userJoinDate == null) {
			if (other.userJoinDate != null)
				return false;
		} else if (!userJoinDate.equals(other.userJoinDate))
			return false;
		if (userLoginDate == null) {
			if (other.userLoginDate != null)
				return false;
		} else if (!userLoginDate.equals(other.userLoginDate))
			return false;
		if (userName == null) {
			if (other.userName != null)
				return false;
		} else if (!userName.equals(other.userName))
			return false;
		if (userPw == null) {
			if (other.userPw != null)
				return false;
		} else if (!userPw.equals(other.userPw))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MemberVo [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userEmail="
				+ userEmail + ", userJoinDate=" + userJoinDate + ", userLoginDate=" + userLoginDate + ", grade=" + grade
				+ ", authkey=" + authkey + ", authstatus=" + authstatus + "]";
	}
    
    

}