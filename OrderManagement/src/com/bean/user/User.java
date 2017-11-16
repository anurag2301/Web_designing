package com.bean.user;

public class User {
	private int userId;
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	private String userName;
	private String companyName;
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	private int role;		//0-SP		1-M		2-SP/M
	private int mId;
	private int sId;
	private String password;
	
	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}	

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getPassword() {
		return password;
	}

	public User() {

	}

	public User(int userId, String userName, String companyName, int role, int sId, int mId) {
		this.userId = userId;
		this.role = role;
		this.userName = userName;
		setsId(sId);
		setmId(mId);
		this.password = "password";
		this.companyName = companyName;
	}

}
