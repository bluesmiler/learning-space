package com.pm.personal.dao;

import java.util.List;

import com.pm.entity.Permission;

public interface PermissionDao {

	List<Permission> findAllByUserId(int userId);
	int deleteById(int perId);
	int save(Permission per);
	List<Permission> findAllByRoleId(int roleId);

	List<Permission> findAll();

	Permission findById(int perId);

	void updatePer(Permission per);
	

}
