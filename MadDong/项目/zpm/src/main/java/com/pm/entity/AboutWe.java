package com.pm.entity;

/**
 * @author tzj
 * 关于我们，小区信息的介绍
 */
public class AboutWe {
	private int id;
	/**
	 * 小区保安电话
	 */
	private String tel;
	/**
	 * 小区所属物业公司描述
	 */
	private String company;
	/**
	 * 小区信息描述
	 */
	private String introduction;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	@Override
	public String toString() {
		return "AboutWe [id=" + id + ", tel=" + tel + ", company=" + company + ", introduction=" + introduction + "]";
	}
	
}
