package com.pm.entity.vo;

import com.pm.entity.CongPictuer;
import com.pm.entity.User;

import java.sql.Date;
import java.util.List;

/**
 * 套房
 */
public class Suite {
	//套房编码
	private Integer coding;

	private String congressHallHeadline;

	private Date congressHallTime;

	private String congressHallContent;

	private User user;

	private List<CongPictuer> congPictuerList;


	public String getCongressHallHeadline() {
		return congressHallHeadline;
	}

	public void setCongressHallHeadline(String congressHallHeadline) {
		this.congressHallHeadline = congressHallHeadline;
	}

	public Date getCongressHallTime() {
		return congressHallTime;
	}

	public void setCongressHallTime(Date congressHallTime) {
		this.congressHallTime = congressHallTime;
	}

	public String getCongressHallContent() {
		return congressHallContent;
	}

	public void setCongressHallContent(String congressHallContent) {
		this.congressHallContent = congressHallContent;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<CongPictuer> getCongPictuerList() {
		return congPictuerList;
	}

	public void setCongPictuerList(List<CongPictuer> congPictuerList) {
		this.congPictuerList = congPictuerList;
	}
}
