package com.bit.backpackers.model.entity;

public class MyPageVo {
	private int userNo;
	private String userId;
    private String userPw;
    private String userName;
    private String userEmail;
    private int userZipcode;
    private String userAddress1;
    private String userAddress2;
    
    public MyPageVo() {
	}
    
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
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
	public int getUserZipcode() {
		return userZipcode;
	}
	public void setUserZipcode(int userZipcode) {
		this.userZipcode = userZipcode;
	}
	public String getUserAddress1() {
		return userAddress1;
	}
	public void setUserAddress1(String userAddress1) {
		this.userAddress1 = userAddress1;
	}
	public String getUserAddress2() {
		return userAddress2;
	}
	public void setUserAddress2(String userAddress2) {
		this.userAddress2 = userAddress2;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((userAddress1 == null) ? 0 : userAddress1.hashCode());
		result = prime * result + ((userAddress2 == null) ? 0 : userAddress2.hashCode());
		result = prime * result + ((userEmail == null) ? 0 : userEmail.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		result = prime * result + userNo;
		result = prime * result + ((userPw == null) ? 0 : userPw.hashCode());
		result = prime * result + userZipcode;
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
		MyPageVo other = (MyPageVo) obj;
		if (userAddress1 == null) {
			if (other.userAddress1 != null)
				return false;
		} else if (!userAddress1.equals(other.userAddress1))
			return false;
		if (userAddress2 == null) {
			if (other.userAddress2 != null)
				return false;
		} else if (!userAddress2.equals(other.userAddress2))
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
		if (userName == null) {
			if (other.userName != null)
				return false;
		} else if (!userName.equals(other.userName))
			return false;
		if (userNo != other.userNo)
			return false;
		if (userPw == null) {
			if (other.userPw != null)
				return false;
		} else if (!userPw.equals(other.userPw))
			return false;
		if (userZipcode != other.userZipcode)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MyPageVo [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", userEmail=" + userEmail + ", userZipcode=" + userZipcode + ", userAddress1=" + userAddress1
				+ ", userAddress2=" + userAddress2 + "]";
	}

	public MyPageVo(int userNo, String userId, String userPw, String userName, String userEmail, int userZipcode,
			String userAddress1, String userAddress2) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userZipcode = userZipcode;
		this.userAddress1 = userAddress1;
		this.userAddress2 = userAddress2;
	}
    
}
