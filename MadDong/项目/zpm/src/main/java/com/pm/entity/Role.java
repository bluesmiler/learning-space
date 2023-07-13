package com.pm.entity;

import java.util.List;

public class Role {
	private int roleId;
	private String roleName;
	private List<Permission> perList;


	public List<Permission> getPerList() {
		return perList;
	}

	public void setPerList(List<Permission> perList) {
		this.perList = perList;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	
	
}
