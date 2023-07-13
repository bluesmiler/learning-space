package com.pm.entity;

import java.io.Serializable;

/**
 * @author chenxiang
 *user涉及权限问题，需要缓存，则序列化
 */
public class User implements Serializable { 
	
	private static final long serialVersionUID = 1L;
	
	private int userId;
	private String truename;
	private String password;
	private String nickname;
	private String phone;
	private String email;
	private String sex;

	private int commId;
	private int unitId;
	private Home home;
	private Role role;

	public int getUnitId() {
		return unitId;
	}

	public void setUnitId(int unitId) {
		this.unitId = unitId;
	}


	public int getCommId() {
		return commId;
	}

	public void setCommId(int commId) {
		this.commId = commId;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getTruename() {
		return truename;
	}
	public void setTruename(String truename) {
		this.truename = truename;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Home getHome() {
		return home;
	}
	public void setHome(Home home) {
		this.home = home;
	}
}
